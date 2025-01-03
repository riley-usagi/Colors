import SwiftUI

/// Аспект отвечающий за цвет левого экрана
@Observable class LeftColorAspect: Observer {
  private(set) var value: Color = .clear
  
  static let shared: LeftColorAspect = .init()
  
  private init() {
    observeEvent(.left) {
      self.value = Color.randomColor()
    }
    
    observeEvent(.all) {
      self.value = Color.randomColor()
    }
  }
}
