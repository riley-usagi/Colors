import SwiftUI

/// Аспект отвечающий за цвет центрального экрана
@Observable class CenterColorAspect: Observer {
  var value: Color = .clear
  
  static let shared: CenterColorAspect = .init()
  
  private init() {
    observeEvent(.all) {
      self.value = Color.randomColor()
    }
  }
}
