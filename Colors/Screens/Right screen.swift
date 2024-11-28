import SwiftUI

/// Правый экран
struct RightScreen: View {
  var body: some View {
    ZStack {
      Color.green.opacity(0.2)
      RightColorAspect.shared.value
      
      VStack {
        Text("Right")
          .shadow(radius: 1)
          .font(.largeTitle)
          .foregroundColor(
            RightColorAspect.shared.value != .clear ? .white : .black
          )
          .padding()
        
        Button {
          EventAspect.shared.value = .right
        } label: {
          Text("Change Right")
            .foregroundColor(.white)
            .font(.title)
        }
        .buttonStyle(BorderedButtonStyle())
      }
    }
    .ignoresSafeArea()
  }
}
