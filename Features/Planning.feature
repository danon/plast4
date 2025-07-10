Feature: Planning
  In order to assign workers to projects for each week
  A planner
  Creates and manages weekly plannings

  Scenario: Planner creates the first planning
    When today is "2025-07-10"
    And the planner opens the planning board
    Then the system suggests creating a planning starting on "2025-07-14"
    And the planning name is "Week of 2025-07-14"

  Scenario: Planner creates a new planning for a given week
    When a new planning is created starting on "2025-07-21"
    Then all projects with dates intersecting "2025-07-21" to "2025-07-25" are included
    And each included project has a segment matching that intersection

  Scenario: Planner assigns a worker for all days in planning
    Given a planning for "2025-07-21" to "2025-07-25" exists
    And a worker "Alice" exists
    And a project "Library" exists from "2025-07-01" to "2025-08-01"
    When the planner assigns "Alice" to "Library" for all days in the planning
    Then "Alice" is fully booked in that planning

  Scenario: Planner assigns a worker for fewer days
    Given a planning for "2025-07-21" to "2025-07-25" exists
    And a worker "Bob" exists
    And a project "Mall" exists from "2025-07-15" to "2025-08-15"
    When the planner assigns "Bob" to "Mall" for "2025-07-21" and "2025-07-22"
    Then "Bob" is underbooked in that planning

  Scenario: Planner attempts invalid assignment
    Given a planning for "2025-07-21" to "2025-07-25" exists
    And a worker "Carla" exists
    And a project "Depot" exists from "2025-07-24" to "2025-07-26"
    When the planner assigns "Carla" to "Depot" on "2025-07-23"
    Then the assignment is rejected

  Scenario: Planner overbooks a worker
    Given a planning for "2025-07-21" to "2025-07-25" exists
    And a worker "Daniel" is assigned to "Tunnel" on "2025-07-22"
    When the planner assigns "Daniel" to "Overpass" on "2025-07-22"
    Then "Daniel" is overbooked in the planning
    And the conflicting assignments on "2025-07-22" are listed

  Scenario: Planner extends project segment to include weekend
    Given a planning for "2025-07-21" to "2025-07-25" exists
    And a project "Bridge" is included in the planning
    When the planner extends the segment of "Bridge" to include Saturday and Sunday
    Then the segment for "Bridge" includes "2025-07-26" and "2025-07-27"

  Scenario: Planner copies plans from previous planning
    Given a planning for "2025-07-14" to "2025-07-18" exists
    And a project "Station" was included
    And a worker "Ella" was assigned to "Station" on "2025-07-17" and "2025-07-18"
    When a new planning for "2025-07-21" to "2025-07-25" is created
    Then assignments for "Ella" are copied to matching dates within the segment of "Station"

  Scenario: Planner removes a plan
    Given a planning for "2025-07-21" to "2025-07-25" exists
    And a worker "Frank" is assigned to "Arena" on "2025-07-24"
    When the planner removes Frank’s assignment on "2025-07-24"
    Then Frank is not assigned to any project on "2025-07-24"

  Scenario: Planner counts workers per badge for a project
    Given a planning for "2025-07-21" to "2025-07-25" exists
    And workers with badges "welder", "mason", and "banana" are assigned to "Harbor"
    When the planner checks assignments for "Harbor"
    Then the number of workers per badge is listed for that project
