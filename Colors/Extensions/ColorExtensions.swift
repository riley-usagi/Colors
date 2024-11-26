import SwiftUI

extension Color {
  
  /// Случайный цвет
  /// - Returns: Возвращает случайный Color
  static func randomColor() -> Color {
    let red   = CGFloat.random(in: 0...1)
    let green = CGFloat.random(in: 0...1)
    let blue  = CGFloat.random(in: 0...1)
    return Color(uiColor: UIColor(red: red, green: green, blue: blue, alpha: 1.0))
  }
}
