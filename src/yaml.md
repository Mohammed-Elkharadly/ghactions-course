GitHub Actions is an automation platform built into GitHub.
Here are its core concepts, organized from the outermost layer inward:

1. Workflow
The top-level automation unit. Defined in a YAML file
(.github/workflows/*.yml), it describes an automated 
process that runs in response to events.

2. Event
What triggers a workflow. Examples:

    push, pull_request
    schedule (cron)
    workflow_dispatch (manual trigger)
    release, issue_comment

3. Job
A set of steps that execute on the same runner. 
Jobs run in parallel by default, but you can define 
dependencies with needs.

4. Step
An individual task within a job. Each step is either:

    A shell command you write
    An Action you reference (reusable unit)

5. Action
A reusable, shareable automation component. You reference them from:

    The GitHub Marketplace (e.g., actions/checkout@v4)
    Your own repository
    A public repo

6. Runner
The virtual machine or container that executes your jobs. 
GitHub provides hosted runners (Ubuntu, Windows, macOS), 
or you can use self-hosted runners.



Workflow (triggered by Event)
    ├── Job 1 (runs on Runner)
    │     ├── Step 1: Action (e.g., checkout code)
    │     └── Step 2: Run command (e.g., npm test)
    └── Job 2 (depends on Job 1)
          ├── Step 1: Action
          └── Step 2: Run command


name: CI

on: [push]                    # Event

jobs:
  build:                      # Job
    runs-on: ubuntu-latest    # Runner
    
    steps:
      - uses: actions/checkout@v4   # Action
      
      - name: Install dependencies  # Step name
        run: npm install            # Shell command
      
      - name: Run tests
        run: npm test


Key Design Principles

    Event-driven: Workflows react to GitHub platform events
    Composable: Complex workflows are built from small, reusable Actions
    Isolated: Each job runs in a fresh environment
    Declarative: You describe what should happen, not how to orchestrate it



| Philosophy          | Syntax Element                 | What It Says                           |
| ------------------- | ------------------------------ | -------------------------------------- |
| **Event-driven**    | `on:`                          | "React to the platform"                |
| **Composable**      | `uses:`                        | "Reuse, don't rewrite"                 |
| **Declarative**     | `runs-on`, `strategy`, `needs` | "Describe topology"                    |
| **Imperative**      | `run:`                         | "Do exact commands"                    |
| **Convention**      | Omitted defaults               | "Don't make me configure the obvious"  |
| **Platform-native** | `${{ github.event }}`          | "CI knows the PR/issue/commit context" |
| **Parallel**        | `jobs:` + `needs:`             | "Run independently unless linked"      |
| **Co-versioned**    | `.github/workflows/*.yml`      | "CI is part of the codebase"           |
