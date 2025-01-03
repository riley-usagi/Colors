import SwiftUI

/// Аспект отвечающий за цвет правого экрана
@Observable class RightColorAspect: Observer {
  private(set) var value: Color = .clear
  
  static let shared: RightColorAspect = .init()
  
  private init() {
    observeEvent(.right) {
      self.value = Color.randomColor()
    }
    
    observeEvent(.all) {
      self.value = Color.randomColor()
    }
  }
}
