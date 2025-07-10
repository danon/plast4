Feature: Worker
  In order to plan workers
  An assistant
  Creates a worker with a team name and a badge

  Scenario: Assistant creates a worker
    When a new worker is created
    Then the worker is added to the list of workers

  Scenario: Assistant updates a worker
    Given a worker "Mark" in team "Blue" exists in the application
    When an assistant updates his name to "Steve" and team to "Red"
    Then a worker "Mark" does not exist in the application
    And a worker "Steve" exists in the application
    And a worker "Steve" is in team "Red"
