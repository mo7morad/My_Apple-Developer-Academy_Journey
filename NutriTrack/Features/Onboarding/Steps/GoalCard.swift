import SwiftUI

struct GoalCard: View {
    let title: String
    let subtitle: String
    let systemImage: String
    let color: Color
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(systemName: systemImage)
                    .font(.title2)
                    .foregroundStyle(color)
                    .frame(width: 36)

                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.headline)
                        // TODO: replace with DesignSystem token
                        .foregroundStyle(.primary)
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(color)
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    // TODO: replace with DesignSystem token
                    .fill(isSelected ? color.opacity(0.12) : Color(.secondarySystemBackground))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(isSelected ? color : .clear, lineWidth: 2)
                    )
            )
        }
        .buttonStyle(.plain)
    }
}
