import SwiftUI

/// Аспект отвечающий за цвет левого экрана
@Observable class LeftColorAspect: Listener {
  var value: Color = .clear
  
  static let shared: LeftColorAspect = .init()
  
  private init() {
    observeEvents(events: [.left, .all]) {
      self.value = Color.randomColor()
    }
  }
}
