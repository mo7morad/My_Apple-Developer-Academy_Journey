import SwiftUI


struct MacrosBar: View {
    
    var barHeight: CGFloat = 140
    var barWidth: CGFloat = 70
    var barRadius: CGFloat = 50
    var barBorderWidth: CGFloat = 10
    
    var progress: [CGFloat] = [0.9, 0.4, 0.3, 0.5]
    
    var body: some View {
        
        HStack{
            Text("Nutrition Overview")
                .padding(.horizontal, 32)
                .font(.system(size: 26) .bold())
            Spacer()
        }
        
        HStack(spacing: 23) {
            
            VStack(spacing:5){
                ZStack(){
                    Rectangle()
                        .fill(Color(hex: "E6E6E6"))
                        .frame(width: barWidth, height: barHeight)
                        .cornerRadius(barRadius)
                    
                    Rectangle()
                        .fill(
                            LinearGradient(
                                        colors: [Color(hex: "F0B6B6"), Color(hex: "F07B7B")],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                            )
                        .frame(width: barWidth, height: barHeight * progress[0])
                        .offset(y: (barHeight - (barHeight-barBorderWidth) * progress[0])/2)
                        .mask(
                            Rectangle()
                                .frame(width: barWidth-barBorderWidth, height: (barHeight-barBorderWidth))
                                .cornerRadius(barRadius)
                        )
                        
                    
//                    Rectangle()
//                        .fill(
//                            LinearGradient(
//                                        colors: [Color(hex: "F0B6B6"), Color(hex: "F07B7B")],
//                                        startPoint: .top,
//                                        endPoint: .bottom
//                                    )
//                            )
//                        .frame(width: barWidth-barBorderWidth, height: (barHeight-barBorderWidth) * CGFloat(progress[0]))
//                        .cornerRadius(barRadius)
//                        .offset(y: -20)
                    
                }
                Text("Protein")
                    .font(.system(size: 14))
                Text("90")
                    .font(.system(size: 14))
                Text("120gr")
                    .font(.system(size: 14))
            }
            
            VStack(spacing: 5){
                ZStack {
                    Rectangle()
                        .fill(Color(hex: "E6E6E6"))
                        .frame(width: barWidth, height: barHeight)
                        .cornerRadius(barRadius)
                    Rectangle()
                        .fill(
                            LinearGradient(
                                        colors: [Color(hex: "FFE1B2"), Color(hex: "FFB87A")],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                            )
                        .frame(width: barWidth-barBorderWidth, height: barHeight-barBorderWidth)
                        .cornerRadius(barRadius)
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(Color(hex: "BD6205"))
                        .font(.system(size: 25) .bold())
                }
                Text("Protein")
                    .font(.system(size: 14))
                Text("90")
                    .font(.system(size: 14))
                Text("120gr")
                    .font(.system(size: 14))
            }
            
            
            VStack(spacing: 5){
                ZStack {
                    Rectangle()
                        .fill(Color(hex: "E6E6E6"))
                        .frame(width: barWidth, height: barHeight)
                        .cornerRadius(barRadius)
                    Rectangle()
                        .fill(
                            LinearGradient(
                                        colors: [Color(hex: "CFE0C6"), Color(hex: "95CC81")],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                            )
                        .frame(width: barWidth-barBorderWidth, height: barHeight-barBorderWidth)
                        .cornerRadius(barRadius)
                }
                
                Text("Fiber")
                    .font(.system(size: 14))
                Text("50")
                    .font(.system(size: 14))
                Text("120gr")
                    .font(.system(size: 14))
                
            }
            
            VStack(spacing: 5){
                ZStack {
                    Rectangle()
                        .fill(Color(hex: "E6E6E6"))
                        .frame(width: barWidth, height: barHeight)
                        .cornerRadius(barRadius)
                    Rectangle()
                        .fill(
                            LinearGradient(
                                        colors: [Color(hex: "D9D9D9"), Color(hex: "878787")],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                            )
                        .frame(width: barWidth-barBorderWidth, height: barHeight-barBorderWidth)
                        .cornerRadius(barRadius)
                }
                
                Text("Carbs")
                    .font(.system(size: 14))
                Text("200")
                    .font(.system(size: 14))
                Text("200gr")
                    .font(.system(size: 14))
            }
            
            
        }
    }
}

#Preview {
    MacrosBar()
}
