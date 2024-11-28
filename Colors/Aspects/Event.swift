import Observation

/// Аспект отвечающий за все события в приложении
@Observable class EventAspect: Listener {
  var value: Event = .initial
  
  static let shared: EventAspect = .init()
  
  private init() {}
}
