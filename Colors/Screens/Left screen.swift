import SwiftUI

/// Левый экран
struct LeftScreen: View {
  
  var body: some View {
    ZStack {
      LeftColorAspect.shared.value
      
      VStack {
        Text("Left").font(.largeTitle)
          .foregroundColor(LeftColorAspect.shared.value != .clear ? .white : .black)
        
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
