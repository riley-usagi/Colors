import SwiftUI

@main struct ColorsApp: App {
  enum TabItem: Equatable {
    case left, center, right
  }
  
  @State var selectedTab: TabItem = .center
  
  var body: some Scene {
    WindowGroup {
      
      TabView(selection: $selectedTab) {
        LeftScreen()
          .tag(TabItem.left)
        
        CenterScreen()
          .tag(TabItem.center)
        
        RightScreen()
          .tag(TabItem.right)
      }
      
      .ignoresSafeArea()
      
      .tabViewStyle(PageTabViewStyle())
    }
  }
}
