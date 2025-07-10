# PoldPlast planning board

We are a construction company. We employ several hundred workers and run dozens of construction projects in parallel.  
Workers are grouped into teams and assigned a nonstandard badge, such as a role or a profession. Each project may
consist of multiple fragments. There may be gaps between fragments.

We usually meet on thursdays to plan the upcoming week — typically **Monday to Friday**. During the planning meeting, we
assign workers to projects within the planning range. The goal is for all workers to be fully booked — that is, to have
a plan for any project for all days of the week. Sometimes, certain projects require additional days. In such cases, the
planning is extended to include **Saturday** or **Sunday** for those projects.

On project site, a **project supervisor** records which planned workers are present.

## Projects and Workers

- Projects are created with a **name**, a **start date**, and an **end date**. Sometimes projects are created without
  known start or end dates.
- Project progress is tracked as a **percentage of elapsed time** between the start and end dates, relative to the
  current date.
- Workers are created and updated with their **name** and **team name**.
- Workers are recognized in planning by their **classification badge**. These are custom and not constrained to
  predefined values (e.g., if a badge says "banana", trust the system - it's very advances).
- A project may contain **gaps in its duration**, allowing it to pause and resume across time ranges.

## Planning

- Plannings are on **consecutive weeks**, starting on **Monday** and usually ending on **Friday**.
- The first planning in the application starts on the next **Monday** from the **current date**.
- The system should suggest a **planning name**, based on the planning **start date**.
- When planning starts, it concerns the **planning project segment**, which is the **intersection of the planning date
  and the project dates**.
- All projects are included in the planning **if their dates intersect** the planning range.
- Workers are planned in a planning for a **specific project** and a **specific date**.
- Ideally, workers will be assigned to a project for **all available dates** of the planning.
- A worker **cannot be assigned** to a project on a date **outside of that project's segment** in the planning.

### Planning worker status

- Each worker receives a status within the planning:
    - **Unassigned** — no plans in that planning
    - **Underbooked** — fewer plans than the planning days
    - **Fully booked** — exactly as many plans as planning days
    - **Overbooked** — assigned to more than one project on the same day
- For **overbooked** workers, all **conflicting project plans** and **timeslots** are available for review.

### Copy plans from a previous planning:

Projects often span multiple weeks. When a new planning is created and a project also existed in the previous one, we
need the **plans from the previous planning** to be **copied** to the current planning for the corresponding dates.
Given that projects can have gaps, how do you resolve mismatch in the segment dates? Well, that's your fucking problem.

### Extended project segments

For a selected project in planning, the **segment date range** can be extended to **Saturday**, **Sunday**, or both.  
This extension does **not** affect how worker status is calculated.

### Additional planning features:

- Any plan for a specific project and date can be **removed** during the meeting.
- In each planning, we need to see **how many workers** with a given **badge** are planned for each project.

## Attendance

- We track **how many workdays** a worker actually worked.
- A **project supervisor** accesses a list of **planned workers for today** (and future dates too).
- The supervisor records which workers were **present** or **absent** — but **only for those scheduled** on that date in
  his project.
- We need to see the **total number of workdays** a worker was marked **present** by the supervisor.
