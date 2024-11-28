import SwiftUI

/// Центральный экран
struct CenterScreen: View {
  var body: some View {
    ZStack {
      
      Color.teal.opacity(0.2)
      CenterColorAspect.shared.value
      
      VStack {
        Text("Center")
          .shadow(radius: 1)
          .font(.largeTitle)
          .foregroundColor(.white)
          .padding()
        
        Button {
          EventAspect.shared.value = .left
        } label: {
          Text("Change left")
            .foregroundColor(.white)
            .font(.title)
        }
        .buttonStyle(BorderedButtonStyle())
        
        Button {
          EventAspect.shared.value = .all
        } label: {
          Text("Change all")
            .foregroundColor(.white)
            .font(.title)
        }
        .buttonStyle(BorderedButtonStyle())
        
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
