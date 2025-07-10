Feature: Worker badge
  In order to for a planner to recognize a worker by his features
  An assistant
  Assigns a badge to a worker

  Scenario: Assistant assigns a badge
    Given a worker exists in the application
    When an assistant assigns badge "Welder" to a worker
    Then a worker has a badge "Welder"
    
  Scenario: Planner recognizes workers by his feature
    When a worker with a badge "Welder" is planned
    Then the project segment contains a worker with a badge "Welder"
