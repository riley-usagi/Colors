import SwiftUI

/// Правый экран
struct RightScreen: View {
  var body: some View {
    ZStack {
      RightColorAspect.shared.value
      
      VStack {
        Text("Right").font(.largeTitle)
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
