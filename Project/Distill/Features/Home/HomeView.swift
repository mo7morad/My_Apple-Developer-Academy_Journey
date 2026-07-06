import SwiftUI
import PhotosUI

struct HomeView: View {

    // MARK: - State

    @State private var showPhotoPicker = false
    @State private var selectedPhotoItem: PhotosPickerItem?

    var body: some View {

        NavigationStack {
            
            VStack {
                
                // MARK: - Header
                
                Button("Start Painting") {
                    showPhotoPicker = true
                }
                .font(.title3.weight(.medium))
                .buttonStyle(.borderedProminent)
                .tint(.primary)
                .foregroundStyle(Color(uiColor: .systemBackground))
                .controlSize(.large)
                
                Spacer()
                
                Divider()
                
                // MARK: - Painting Grid
                
            }
            .navigationTitle("Distill")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Select") {
                        
                    }
                }
                
                ToolbarSpacer(.fixed, placement: .topBarTrailing)
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "translate")
                    }
                    .accessibilityLabel("Translate")
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "info.circle")
                    }
                    .accessibilityLabel("About Distill")
                }
            }
            .photosPicker(
                isPresented: $showPhotoPicker,
                selection: $selectedPhotoItem,
                matching: .images
            )
            .photosPickerDisabledCapabilities(.collectionNavigation)
            
            
            // MARK: - Extracting the dominant colors.
            
            .onChange(of: selectedPhotoItem) { _, newItem in
                guard let newItem else { return }
                
                Task {
                    // Loading and casting the PhotoPicker into Image so we can resize it.
                    if let data = try? await newItem.loadTransferable(type: Data.self),
                       let originalImage = UIImage(data: data) {
                        
                        print("Original size: \(originalImage.size)")
                        
                        // Image resizing
                        let targetSize = CGSize(width: 100, height: 100)
                        if let resizedImage = originalImage.resize(to: targetSize) {
                            print("Resized image: \(resizedImage.size)")
                            
                            // NEXT STEP: Extracting Colors.
                        }
                        
                    } else {
                        print("Failed to load selected photo")
                    }
                    
                    selectedPhotoItem = nil
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
