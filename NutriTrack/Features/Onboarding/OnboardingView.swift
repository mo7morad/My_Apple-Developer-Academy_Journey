import SwiftUI

// OnboardingView is the root of the onboarding flow.
// It owns the ViewModel and coordinates between steps.
//
// Key concept — @State private var viewModel = OnboardingViewModel():
// With @Observable, you create a ViewModel as a plain @State property.
// SwiftUI tracks which properties the view reads and re-renders only when those change.
// No @StateObject, no @ObservedObject — that's the older ObservableObject pattern.
struct OnboardingView: View {

    // The closure called when onboarding completes — the parent (NutriTrackApp)
    // provides this to switch the root view to DashboardView.
    let onComplete: () -> Void

    @State private var viewModel = OnboardingViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Step progress indicator
                StepProgressBar(currentStep: viewModel.currentStep)
                    .padding(.horizontal, 20)
                    .padding(.top, 12)
                    .padding(.bottom, 4)

                // Conditional rendering on the step enum.
                // This is the idiomatic SwiftUI way to show/hide views based on state —
                // no NavigationLink, no sheet, just a switch.
                Group {
                    switch viewModel.currentStep {
                    case .personalInfo:
                        PersonalInfoStepView(viewModel: viewModel)
                            .transition(.asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading)
                            ))

                    case .goalSelection:
                        GoalSelectionStepView(viewModel: viewModel)
                            .transition(.asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading)
                            ))

                    case .summary:
                        SummaryStepView(viewModel: viewModel)
                            .transition(.asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading)
                            ))
                    }
                }
                // animation(_:value:) animates the view swap whenever currentStep changes.
                .animation(.easeInOut(duration: 0.3), value: viewModel.currentStep)
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
        // onChange watches isComplete and calls onComplete() as soon as the ViewModel
        // finishes saving. The parent then swaps the root view to Dashboard.
        .onChange(of: viewModel.isComplete) { _, isComplete in
            if isComplete { onComplete() }
        }
    }

    private var navigationTitle: String {
        switch viewModel.currentStep {
        case .personalInfo:  return "About You"
        case .goalSelection: return "Your Goal"
        case .summary:       return "Your Plan"
        }
    }
}

#Preview {
    OnboardingView(onComplete: {})
}
