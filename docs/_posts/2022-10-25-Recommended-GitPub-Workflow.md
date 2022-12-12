---

title: Recommended GitPub Workflow
author: StartAutomating
sourceURL: https://github.com/StartAutomating/GitPub/issues/53
tag: How To
---
GitPub is super easy to set up, even if you don't know too much about GitHub workflows or github actions.

Why's that?  Because GitPub includes a template for a workflow to run GitPub, and you can use this with a module called [PSDevOps](https://psdevops.start-automating.com) to generate a workflow.

To do this, you'll need to install two modules:  GitPub and PSDevOps:

~~~PowerShell
Install-Module PSDevOps, GitPub -Scope CurrentUser -Force
~~~

Next, create a directory for your workflows, if one does not exist:
~~~PowerShell
if (-not (Test-Path ".\.github\workflows")) {
    New-Item -ItemType Directory -Path ".\.github\workflows"
}
~~~

Then, run these three lines to generate your workflow, simply pop these three lines into a PowerShell script:

~~~PowerShell
Import-Module PSDevOps, GitPub          # Import our modules
Import-BuildStep -ModuleName GitPub # Import the buildsteps from GitPub
New-GitHubWorkflow -On Issue, Demand -Job RunGitPub -Name "GitPub" -OutputPath .\.github\workflows\GitPub.yml # Create a GitHub workflow
~~~

Then, add your file to the repository.

The workflow will start to run when it is checked into main.  Once it is running, anytime an issue changes, GitPub will run.  Anytime a post is created or changed, or a new release happens, GitPub will create a branch with the changes.

