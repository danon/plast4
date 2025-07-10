## Acceptance Criteria

### Projects

#### Create project with name and optional dates
- **When** the user creates a project named "Tower A" with a start and end date
- **Then** a project named "Tower A" exists in the system with a start and end date

- **When** the user creates a project named "Tower B" without start and end dates
- **Then** a project named "Tower B" exists in the system with no start or end date

#### Add project fragments
- **Given** a project named "Tower A" exists
- **When** the user adds a fragment from 2025-07-01 to 2025-07-10
- **Then** the fragment is listed for "Tower A" with the specified dates

#### Calculate project progress
- **Given** a project with start date 2025-07-01 and end date 2025-07-31 exists
- **And** the current date is 2025-07-11
- **When** the user requests the project progress
- **Then** the progress is calculated as 10 / 30 = 33.33%

- **Given** a project with start date 2025-07-01 and no end date exists
- **When** the user requests the project progress
- **Then** no progress is returned

### Planning

#### Determine planning start date
- **Given** no planning exists
- **When** the user creates a new planning on 2025-07-10 (Thursday)
- **Then** the planning start date is set to 2025-07-14 (next Monday)

- **Given** a planning already exists for 2025-07-14 to 2025-07-18
- **When** the user creates a new planning
- **Then** the planning start date is 2025-07-21

#### Set or override planning name
- **When** the user creates planning for start date 2025-07-14 and does not enter a name
- **Then** the name is set to "Week of 2025-07-14"

- **When** the user creates planning and sets the name to "Mid-July Planning"
- **Then** the planning name is "Mid-July Planning"

#### Include overlapping project fragments
- **Given** a fragment for "Tower A" runs from 2025-07-11 to 2025-07-17
- **When** a planning is created for 2025-07-14 to 2025-07-18
- **Then** the fragment is included for dates 2025-07-14 to 2025-07-17

#### Validate worker assignment within fragment range
- **Given** a fragment runs from 2025-07-01 to 2025-07-10
- **When** a user assigns a worker to that project on 2025-07-11
- **Then** the system blocks the assignment and shows an error

- **Given** a fragment runs from 2025-07-01 to 2025-07-10
- **When** a user assigns a worker on 2025-07-05
- **Then** the assignment appears in the planning

#### Determine worker booking status

##### Unassigned
- **Given** a planning from 2025-07-14 to 2025-07-18 exists
- **When** a worker has no assignments during that range
- **Then** their status is **Unassigned**

##### Underbooked
- **Given** a planning from 2025-07-14 to 2025-07-18 exists
- **When** a worker is assigned on 2 days
- **Then** their status is **Underbooked**

##### Fully booked
- **Given** a planning from 2025-07-14 to 2025-07-18 exists
- **When** a worker is assigned to one project per day
- **Then** their status is **Fully booked**

##### Overbooked
- **Given** a planning from 2025-07-14 to 2025-07-18 exists
- **When** a worker is assigned to two projects on the same day
- **Then** their status is **Overbooked**
- **And** both assignments for 2025-07-15 are displayed alongside their projects

#### Edit or remove assignments
- **Given** a worker is assigned to a project on 2025-07-15
- **When** the user removes the assignment
- **Then** the assignment is nog longer in the planning

#### Inherit assignments from previous planning
- **Given** a planning exists with worker assignments
- **When** the new planning is created, that includes the same project
- **Then** the worker assignments are copied to the new planning

#### Group worker counts by badge
- **Given** workers are assigned to a project with statuses "welder", "electrician"
- **When** the user views the project summary
- **Then** the summary includes the counts per status: 3 for "welder" and 2 for "electrician"

#### Extend planning to weekend
- **Given** a planning covers 2025-07-14 to 2025-07-18
- **When** the user enables Saturday and Sunday for a project
- **Then** the planning UI includes 2025-07-19 and 2025-07-20 for that project

- **Given** the worker was planned for monday to friday
- **When** a planning is extended to sunday
- **Then** the worker is marked as **Fully assigned**

### Attendance

#### View attendance for relevant dates
- **Given** today is 2025-07-15 and it is within a planning
- **When** the user opens the attendance view
- **Then** the attendance list for 2025-07-15 is shown

#### Save attendance for scheduled workers
- **Given** a worker is scheduled on 2025-07-15
- **When** the supervisor marks them as present
- **Then** the system saves the attendance for 2025-07-15

#### Reject attendance for unscheduled workers
- **Given** a worker is not scheduled on 2025-07-15
- **When** the supervisor tries to mark them present
- **Then** the system shows an error and does not save attendance

#### Aggregate worked days
- **Given** a worker was scheduled and marked present on 2025-07-15, 2025-07-16, and 2025-07-17
- **When** the user views the worker’s summary
- **Then** the summary indicates the worker has 3 worked days
