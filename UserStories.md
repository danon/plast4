# User stories

## Assistant

1. Assistant creates a project
    - Acceptance: A project exists with the specified name, code, and dates.
2. Assistant updates project dates
    - Acceptance: The project has updated start and/or end dates.
3. Assistant creates a worker
    - Acceptance: A worker exists with the specified name and, if provided, team.
4. Assistant updates worker name or team
    - Acceptance: The worker has an updated name and team name.
5. Assistant assigns a classification badge to a worker
    - Acceptance: The worker has the specified classification badge.
6. Assistant updates a project with a gap
    - Acceptance: The project includes a gap for the specified dates.

## Planner

1. Planner creates a planning
    - Acceptance: A planning exists with a Monday start date, according to planning rules.
2. Planner inspects planning projects
    - Acceptance: The system provides information about projects in the planning, including their segments and gaps.
3. Planner wants most of the plans from a previous planning in the new planning.
    - Acceptance: Given a previous planning with a plan, then plan is present in the new planning.
4. Planner plans a worker for a project segment
    - Acceptance: A plan exists for the worker for the specified project segment and dates.
5. Planner checks worker status
    - Acceptance: Worker status is determined for each worker in the planning.
6. Planner inspects overbooked worker projects
    - Acceptance: A list of projects is provided for each overbooked worker.
7. Planner removes a planned worker from an overbooked project
    - Acceptance: The plan is not present and the worker is not overbooked.
8. Planner extends a project segment to the weekend
    - Acceptance: The project segment includes Saturday and/or Sunday.
9. Planner plans a worker for an extended (weekend) timeslot
    - Acceptance: A plan exists for the worker for the weekend.
    - Acceptance: Planning a worker for Saturday or Sunday does not influence worker status.
10. Planner checks the number of planned workers with a classification badge in a project
    - Acceptance: The system provides the number of planned workers with the specified badge for each project.
11. Planner attempts to plan a worker outside a project segment
    - Acceptance: The plan is not present.
12. Planner inspects the project progress.
    - Acceptance: The project progress is a percentage of elapsed days based on the current date.

## Supervisor

1. Supervisor inspects today’s attendance
    - Acceptance: The system provides planned workers for today.
2. Supervisor marks a worker as present or absent
    - Acceptance: Attendance status is present for the worker for today.
3. Supervisor inspects attendance lists for future dates
    - Acceptance: A list of future attendance days is provided, with planned workers listed for each day.

## Accountant

1. Accountant checks total worker workdays
    - Acceptance: The system provides total workdays for each worker based on planning data.
