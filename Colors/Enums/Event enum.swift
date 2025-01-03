import Foundation

enum Event {
  case initial, left, right, all
  
  func matches(_ other: Event) -> Bool {
    let mirrorSelf = Mirror(reflecting: self)
    let mirrorOther = Mirror(reflecting: other)
    
    // Если у self и other нет ассоциативных значений, сравниваем через ==
    if mirrorSelf.children.isEmpty && mirrorOther.children.isEmpty {
      return self == other
    }
    
    // Если у self и other есть ассоциативные значения, сравниваем через Mirror
    if let selfChild = mirrorSelf.children.first,
       let otherChild = mirrorOther.children.first {
      return selfChild.label == otherChild.label
    }
    
    // Во всех остальных случаях возвращаем false
    return false
  }
}
