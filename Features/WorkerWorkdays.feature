Feature: Worker workdays
  In order to count worker workdays
  A supervisor
  Marks workers present or absent in the project site

  Scenario: Worker did not work
    When a new worker is created
    Then the worker workdays amount is 0

  Scenario: Supervisor can access the attendance list
    Given a supervisor has a project
    When a worker is planned for the project for today
    Then the attendance list contains an attendance day for today
    And the attendance day for today contains the worker
    
  Scenario: Supervisor marks a worker present
    Given a worker is in attendance day for today
    When a supervisor marks the worker as present
    Then the worker workdays amount is 1
    
  Scenario: Supervisor marks a worker absent
    Given a worker is in attendance day for today
    When a supervisor marks the worker as absent
    Then the worker workdays amount is 0
