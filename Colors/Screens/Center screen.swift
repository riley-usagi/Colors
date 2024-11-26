import SwiftUI

/// Центральный экран
struct CenterScreen: View {
  var body: some View {
    ZStack {
      
      CenterColorAspect.shared.value
      
      VStack {
        Text("Center").font(.largeTitle).foregroundColor(.white).padding()
        
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
