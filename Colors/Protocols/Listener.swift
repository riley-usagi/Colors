import Foundation
import Observation

protocol Listener {
  /// Фильтр для приходящих событий в Аспект
  /// - Parameters:
  ///   - events: Список событий, на которе должен реагировать Аспект
  ///   - action: Действие, которое Аспект должен выполнять со своим значением value
  func observeEvents(
    events: [EventAspect.EventEnum], perform action: @escaping () -> Void
  )
}

// Базовая реализация для фильтра событий
extension Listener {
  func observeEvents(events: [EventAspect.EventEnum], perform action: @escaping () -> Void) {
    
    withObservationTracking {
      UUID().uuidString
    } didChange: {
      if events.contains(EventAspect.shared.value) {
        action()
      }
    } apply: {
      _ = EventAspect.shared.value
    }
  }
  
  /// Возможность слушать изменения observable-событий более одного раза
  /// - Parameters:
  ///   - token: Токен статуса
  ///   - didChange: Замыкание при изменении наблюдаемого параметра
  ///   - apply: Замыкание для отслеживания конкретного параметра
  func withObservationTracking(
    token: @escaping () -> String,
    didChange: @escaping @Sendable () -> Void,
    apply: @escaping () -> Void
  ) {
    Observation.withObservationTracking(apply) {
      guard token() != "" else { return }
      RunLoop.current.perform {
        didChange()
        withObservationTracking {
          token()
        } didChange: {
          didChange()
        } apply: {
          apply()
        }
      }
    }
  }
}
