import Foundation
import Observation

// Протокол Observer
protocol Observer {
  func observeEvent(
    _ event: Event,
    perform action: @escaping () -> Void
  )
  
  func observeEvent<T>(
    _ event: Event,
    perform action: @escaping (T) -> Void
  )
}

// Расширение для Observer
extension Observer {
  // Метод для наблюдения за событиями без ассоциативных значений
  func observeEvent(
    _ event: Event,
    perform action: @escaping () -> Void
  ) {
    withObservationTracking(
      token: { UUID().uuidString },
      willChange: nil,
      didChange: {
        let currentEvent = EventAspect.shared.value
        
        // Используем matches для сравнения событий
        if event.matches(currentEvent) {
          action()
        }
      },
      apply: {
        _ = EventAspect.shared.value
      }
    )
  }
  
  // Метод для наблюдения за событиями с ассоциативными значениями
  func observeEvent<T>(
    _ event: Event,
    perform action: @escaping (T) -> Void
  ) {
    withObservationTracking(
      token: { UUID().uuidString },
      willChange: nil,
      didChange: {
        let currentEvent = EventAspect.shared.value
        
        // Используем matches для сравнения событий
        if event.matches(currentEvent) {
          // Используем Mirror для извлечения ассоциативного значения
          let mirror = Mirror(reflecting: currentEvent)
          if let associatedValue = mirror.children.first?.value as? T {
            action(associatedValue)
          }
        }
      },
      apply: {
        _ = EventAspect.shared.value
      }
    )
  }
  
  // Вспомогательный метод для отслеживания изменений
  func withObservationTracking(
    token: @escaping () -> String,
    willChange: (@Sendable () -> Void)? = nil,
    didChange: @escaping @Sendable () -> Void,
    apply: @escaping () -> Void
  ) {
    Observation.withObservationTracking(apply) {
      guard token() != "" else { return }
      
      willChange?()
      
      RunLoop.current.perform {
        didChange()
        
        withObservationTracking(
          token: token,
          didChange: didChange,
          apply: apply
        )
      }
    }
  }
}
