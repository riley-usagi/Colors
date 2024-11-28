import SwiftUI

/// Левый экран
struct LeftScreen: View {
  
  var body: some View {
    ZStack {
      Color.yellow.opacity(0.2)
      LeftColorAspect.shared.value
      
      VStack {
        Text("Left")
          .shadow(radius: 1)
          .font(.largeTitle)
          .foregroundColor(
            LeftColorAspect.shared.value != .clear ? .white : .black
          )
        
        Button {
          EventAspect.shared.value = .left
        } label: {
          Text("Change Left")
            .foregroundColor(.white)
            .font(.title)
        }
        .buttonStyle(BorderedButtonStyle())
      }
    }
    .ignoresSafeArea()
  }
}
