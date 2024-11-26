import Observation

/// Аспект отвечающий за все события в приложении
@Observable class EventAspect: Listener {
  enum EventEnum {
    case initial, left, right, all
  }
  
  var value: EventEnum = .initial
  
  static let shared: EventAspect = .init()
  
  private init() {}
}
