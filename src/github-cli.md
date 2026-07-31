========================================================================
                GITHUB CLI COMMANDS AND FLAGS REFERENCE
========================================================================

COMMAND STRUCTURE
-----------------------------------------------------------------------
gh <command> <subcommand> [flags]

Part            Description                       Example
------          -------------                     -------
Command         Object to interact with           issue, pr, repo
Subcommand      Action to take                    create, list, view
Flags           Modifiers                         --web, --state, --title
Values          Arguments                         numbers, owner/repo


========================================================================
CORE COMMANDS
========================================================================

AUTHENTICATION
-----------------------------------------------------------------------
gh auth login            Authenticate with GitHub
gh auth status           Check authentication status
gh auth switch           Switch between GitHub accounts

REPOSITORIES
-----------------------------------------------------------------------
gh repo create           Create a new repository
gh repo clone OWNER/REPO Clone a repository
gh repo view OWNER/REPO  View repository description and README
gh repo list             List repositories for a user/organization
gh repo edit OWNER/REPO  Edit repository settings
gh repo delete OWNER/REPO Delete a repository
gh repo fork             Create a fork of a repository
gh repo rename           Rename a repository

ISSUES
-----------------------------------------------------------------------
gh issue list            List open issues
gh issue create          Create a new issue
gh issue view NUMBER     View a specific issue
gh issue edit NUMBER     Edit an issue
gh issue status          Show issue status relative to you
gh issue close NUMBER    Close an issue
gh issue reopen NUMBER   Reopen a closed issue

PULL REQUESTS
-----------------------------------------------------------------------
gh pr list               List open pull requests
gh pr create             Create a pull request
gh pr view NUMBER        View a specific PR
gh pr checkout NUMBER    Check out a PR locally
gh pr merge NUMBER       Merge a pull request
gh pr status             Show PR status relative to you
gh pr diff NUMBER        View PR diff
gh pr close NUMBER       Close a PR
gh pr reopen NUMBER      Reopen a closed PR
gh pr ready NUMBER       Mark a draft PR as ready for review
gh pr review             Add a review to a PR

RELEASES
-----------------------------------------------------------------------
gh release create TAG    Create a new release
gh release list          List releases
gh release view TAG      View a specific release
gh release delete TAG    Delete a release
gh release upload        Upload assets to a release
gh release download      Download release assets

GITHUB ACTIONS
-----------------------------------------------------------------------
gh workflow list         List available workflows
gh workflow run          Run a workflow
gh workflow view         View a specific workflow
gh run list              View workflow runs
gh run view              View a specific run
gh run watch             Watch a workflow run
gh run rerun             Rerun a workflow run
gh cache list            List GitHub Actions caches
gh cache delete          Delete a cache

ADDITIONAL COMMANDS
-----------------------------------------------------------------------
gh gist list             List gists
gh gist create           Create a gist
gh gist view             View a gist
gh gist edit             Edit a gist
gh gist clone            Clone a gist

gh codespace create      Create a codespace
gh codespace list        List codespaces
gh codespace ssh         SSH into a codespace
gh codespace delete      Delete a codespace
gh codespace view        View details of a codespace

gh project list          List projects
gh project create        Create a project
gh project view          View a project
gh project edit          Edit a project
gh project delete        Delete a project

gh label list            List labels
gh label create          Create a label
gh label edit            Edit a label
gh label delete          Delete a label

gh secret list           List secrets
gh secret set            Set a secret
gh secret delete         Delete a secret

gh search repos          Search repositories
gh search issues         Search issues
gh search prs            Search pull requests
gh search code           Search code
gh search commits        Search commits

gh api PATH              Make authenticated GitHub API requests
gh alias set ALIAS CMD   Create a command shortcut
gh alias list            List all aliases
gh config set KEY VALUE  Set configuration
gh config get KEY        Get configuration
gh config list           List configuration
gh status                View relevant issues and PRs
gh browse                Open the repository in browser
gh extension install     Install an extension
gh extension list        List extensions
gh extension upgrade     Upgrade extensions
gh completion            Generate shell completion scripts
gh help                  Show helpful command suggestions


========================================================================
COMMON FLAGS
========================================================================

Flag                        Description
------                      -----------
--help                      Show help for a command
--version                   Show gh version
--web                       Open in browser
--state <state>             Filter by state (open, closed, merged, all)
--assignee <username>       Filter by assignee (use @me for yourself)
--author <username>         Filter by author
--label <label>             Filter by label
--title <title>             Set title
--body <content>            Set body content
--draft                     Create as draft
--repo OWNER/REPO           Specify repository
--limit <number>            Limit results
--clone                     Clone after creation
--shell                     Use shell interpreter for aliases
--yes                       Skip confirmation prompts
--file <path>               Read from file
--editor                    Open in text editor
--head <branch>             Head branch for PR
--base <branch>             Base branch for PR
--branch <branch>           Branch name
--message <message>         Commit/PR message
--tag <tagname>             Tag name for release
--target <branch>           Target branch for release
--assets <files>            Assets to upload with release
--notes <text>              Release notes
--draft                     Create draft release
--prerelease                Mark release as pre-release
--latest                    Mark release as latest
--interactive               Interactive mode
--recurse-submodules        Include submodules
--depth <number>            Clone depth
--filter <filter>           Filter output with jq
--template <template>       Format output with template
--json <fields>             Output as JSON with specified fields
--jq <query>                Query JSON output with jq
--url <url>                 API endpoint URL
--method <method>           HTTP method for API requests
--raw-field <key=value>     Add raw field to API request
--field <key=value>         Add field to API request
--hostname <host>           GitHub Enterprise hostname
--version                   Show version
--location <location>       Location for codespace
--machine <type>            Machine type for codespace
--idle-timeout <minutes>    Idle timeout for codespace
--retention-period <days>   Retention period for codespace


========================================================================
FLAG SHORTHANDS
========================================================================

Short   Long Equivalent    Description
-----   ----------------   -----------
-h      --help             Show help
-v      --version          Show version
-w      --web              Open in browser
-s      --state            Filter by state
-a      --assignee         Filter by assignee
-l      --label            Filter by label
-b      --body             Set body content
-t      --title            Set title
-c      --clone            Clone after creation
-y      --yes              Skip confirmations
-r      --repo             Specify repository
-n      --limit            Limit results
-f      --file             Read from file
-e      --editor           Open in text editor
-m      --message          Message
-d      --draft            Create as draft
-p      --prerelease       Mark as pre-release
-i      --interactive      Interactive mode


========================================================================
ALIASES
========================================================================

COMMAND                             DESCRIPTION
-------                             -----------
gh alias set <alias> <expansion>    Create an alias
gh alias set --shell                Create alias using shell interpreter
gh alias list                       List all aliases
gh alias delete <alias>             Delete an alias

EXAMPLE:
gh alias set pv "pr view"
gh alias set --shell igrep 'gh issue list --label="$1" | grep "$2"'


========================================================================
EXIT CODES
========================================================================

Code    Meaning
-----   -------
0       Successful execution
1       Error occurred
2       Command canceled
4       Authentication required


========================================================================
HELP AND DOCUMENTATION
========================================================================

METHOD                          DESCRIPTION
------                          -----------
gh                              Show all top-level commands
gh COMMAND                      Show subcommands for a command
gh COMMAND --help              Show detailed help for a command
gh help                        Get helpful command suggestions


========================================================================
COMMON USAGE EXAMPLES
========================================================================

AUTHENTICATION:
gh auth login
gh auth status

REPOSITORIES:
gh repo create my-repo --public --clone
gh repo clone octocat/Hello-World
gh repo view octocat/Hello-World --web

ISSUES:
gh issue list --assignee @me
gh issue create --title "Bug fix" --body "Description here" --label bug
gh issue view 123

PULL REQUESTS:
gh pr list --state open
gh pr create --base main --head feature-branch --title "New feature"
gh pr view 456 --web
gh pr merge 456 --merge

RELEASES:
gh release create v1.0.0 --title "Version 1.0" --notes "Release notes"
gh release list

ACTIONS:
gh workflow list
gh workflow run build.yml
gh run list --limit 5

GENERAL:
gh browse
gh status
gh search repos "github-cli"
gh api /repos/octocat/Hello-World
gh alias set co "pr checkout"