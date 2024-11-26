import SwiftUI

/// Аспект отвечающий за цвет правого экрана
@Observable class RightColorAspect: Listener {
  var value: Color = .clear
  
  static let shared: RightColorAspect = .init()
  
  private init() {
    observeEvents(events: [.right, .all]) {
      self.value = Color.randomColor()
    }
  }
}
