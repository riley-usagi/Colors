import Observation

/// Аспект отвечающий за все события в приложении
@Observable class EventAspect: Observer {
  var value: Event = .initial
  
  static let shared: EventAspect = .init()
  
  private init() {}
}
