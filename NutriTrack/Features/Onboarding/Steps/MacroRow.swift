import SwiftUI

// A single row displaying one macro nutrient (label, value, unit) with a color indicator.
struct MacroRow: View {
    let label: String
    let value: Int
    let unit: String
    let color: Color

    var body: some View {
        HStack {
            Circle()
                .fill(color.opacity(0.2))
                .frame(width: 10, height: 10)
                .overlay(Circle().fill(color).padding(2))

            Text(label)
                .font(.body)

            Spacer()

            Text("\(value) \(unit)")
                .font(.body).bold()
                // TODO: replace with DesignSystem token
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 10)
                // TODO: replace with DesignSystem token
                .fill(Color(.secondarySystemBackground))
        )
    }
}
