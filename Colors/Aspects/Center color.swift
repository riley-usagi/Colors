import SwiftUI

/// Аспект отвечающий за цвет центрального экрана
@Observable class CenterColorAspect: Listener {
  var value: Color = .clear
  
  static let shared: CenterColorAspect = .init()
  
  private init() {
    observeEvents([.all]) {
      self.value = Color.randomColor()
    }
  }
}
