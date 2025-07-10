We are a construction company. We employ several hundred workers and run dozens of construction projects in parallel.
Workers are grouped into teams and assigned a nonstandard status, such as a role or profession. Each project may
consist of multiple fragments. A fragment has a start and end date. There may be gaps between fragments, after which the
project continues.

We usually meet on Thursdays to plan the upcoming week — typically Monday to Friday. During the session, workers are
assigned to projects within the planning range. The goal is for all workers to be fully booked. Sometimes, certain
projects require additional days. In such cases, the planning is extended to include Saturday or Sunday.

To track how many days each worker has worked, a supervisor (who is not a worker) records which scheduled workers are  
present on-site.

We need a system to support the following workflows:

# Projects and Workers

- Workers can be created and edited. Both name and team name are required.
- Projects can be created with a name. Start and end dates are optional. A project may consist of multiple fragments,
  allowing it to pause and resume across time ranges.
- Each project calculates its progress as a percentage of elapsed time between the start and end dates, relative to the
  current date.
- Each worker may have a nonstandard status - typically used to indicate a role or classification. These act as custom
  badges and are not constrained to predefined values. If a badge says "banana", trust the system - it's very advanced.

# Planning

- The system determines the start date of the planning. If no plannings exist, the start date is the next Monday.
  Otherwise, the next unplanned full week is used.
- The planning name can be set by the user. The system proposes a default name based on the planning start date.
- When a new planning is created, it includes all project fragments that overlap with the planning range.
    - Example: If a fragment runs from the previous Friday to Wednesday, and the planning covers Monday to Friday, the
      fragment is included from Monday to Wednesday.
- A worker may only be assigned to a project on dates that fall within one of its fragments. Assigning a worker to a
  project fragment that has ended is bold. And illegal.
    - Example: If a fragment ends on Wednesday and the planning covers Monday to Friday, the worker may not be assigned
      to that project on Thursday or Friday.
- Each worker receives a status within the context of that planning:
    - **Unassigned** — no assignments during the planning.
    - **Underbooked** — assigned on fewer than all planning days.
    - **Fully booked** — assigned to exactly one project on each planning day.
    - **Overbooked** — assigned to more than one project on the same day.
- For overbooked workers, all conflicting project assignments and timeslots are available for review.
- Assignments are editable. Any assignment for a specific project and date can be removed.
- When a new planning is created and a previous planning exists:
    - If both contain the same fragment, or fragments from the same project,
    - Then all worker assignments from the previous planning (related to that project) are copied into the new planning.
    - After creation, plannings are independent. Changes made to one do not affect the other.
- In each planning, worker counts per nonstandard status are grouped and associated with each project.
- For a selected project in the planning, the segment date range can be extended to Saturday, Sunday, or both. This
  extension does not affect how worker booking status is calculated.

# Attendance

- The attendance list is available for the current date, if there are plans for that date. Upcoming dates are also
  included.
- The supervisor records which workers were present or absent — but only for those scheduled on that date.
- Attendance data is aggregated per worker. For each worker, the system calculates the total number of days worked. Only
  days that were both planned and confirmed as present are included in this count.
