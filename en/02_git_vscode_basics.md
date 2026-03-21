# Git And VS Code Foundations
This document introduces the candidate to the VS Code and Git basics needed for safe work in the KomITi repo.
The goal is not for the candidate to become a Git or VS Code expert in 2 hours, but to avoid beginner mistakes and understand exactly what they are doing when opening a workspace, finding files, changing code, saving, committing and pushing code.

## Contents

1\) VS Code basics you need to know<br>
&nbsp;&nbsp;&nbsp;&nbsp;Explorer<br>
&nbsp;&nbsp;&nbsp;&nbsp;Workspace is the VS Code context you work in; it can contain one folder or multiple folders<br>
&nbsp;&nbsp;&nbsp;&nbsp;Search, Explorer, Source Control and Terminal are the 4 panels you must distinguish<br>
&nbsp;&nbsp;&nbsp;&nbsp;What a VS Code beginner must adopt immediately<br>
2\) Git basics you need to know<br>
3.1\) Local and remote branch<br>
4\) What the letters in VS Code Explorer mean<br>
5\) Explorer is not the same as Source Control panel<br>
5.1\) What the bottom-left corner in VS Code means: Git status indicator<br>
6\) Save is not the same as commit<br>
7\) Basic local workflow<br>
&nbsp;&nbsp;&nbsp;&nbsp;Step 1: get the latest `main`<br>
&nbsp;&nbsp;&nbsp;&nbsp;Step 2: create a new feature branch from `main`<br>
&nbsp;&nbsp;&nbsp;&nbsp;Step 3: make local changes<br>
&nbsp;&nbsp;&nbsp;&nbsp;Step 4: stage and commit<br>
&nbsp;&nbsp;&nbsp;&nbsp;Step 5: push to GitHub<br>
&nbsp;&nbsp;&nbsp;&nbsp;Step 6: promotion to `staging`<br>
&nbsp;&nbsp;&nbsp;&nbsp;Step 7: promotion to `main`<br>
&nbsp;&nbsp;&nbsp;&nbsp;Step 8: return to your feature branch if you continue working<br>
8\) Most common beginner mistakes<br>
9\) Key concepts and Minimum commands you need to know<br>
10\) How this looks in KomITi<br>
11\) Self-check<br>
12\) What to read next<br>
99\) Task on the komiti_academy project for the candidate

## 1) VS Code basics you need to know

### Explorer
- `Explorer` is the left panel in VS Code where you see folders and files.
- In Explorer you preview a file with a single click (its name will be in italics), and you open a file with a double click.
- In Explorer you see files, directories, but only one workspace.

### Workspace is the VS Code context you work in; it can contain one folder or multiple folders
- If you do `Open Folder` in VS Code, you will open one folder as your working workspace and automatically one unnamed Workspace.
- If you do `Add Folder to Workspace` in an already open workspace, you get a `multi-root workspace`, i.e. a workspace with multiple top-level root directories.
- `workspace` is not just a visual concept in VS Code, but a context boundary for search, file reading, terminal and agent work.
- Can you have multiple workspaces at the same time: Yes, you can, but not in a single VS Code window.
- Practical rule: if you want clear context separation, fewer mistakes and less confusion about commands, it is often safer to have two windows than one cluttered multi-root workspace.

### Search, Explorer, Source Control and Terminal are the 4 panels you must distinguish
- `Explorer` = folder and file structure.
- `Search` = text search across files.
- `Source Control` = Git state, staged and unstaged changes.
- `Terminal` = where you type commands like `git`, `docker compose` and `rg`.

### What a VS Code beginner must adopt immediately
- know which workspace you are working in,
- know which root directory you are currently in,
- distinguish Explorer from Source Control panel,
- not create files in the wrong root,
- know that `save` in the editor is not the same as `commit` in Git.

## 2) Git basics you need to know
- `Git` and `GitHub` are not the same: `Git` is a version control system, and `GitHub` is a platform where the remote repo lives.
- VS Code Explorer and Source Control mostly show you the Git state of the local workspace.
- In the KomITi workflow we currently use, the typical flow is: `feature` -> `staging` -> `main`.
- `clone` and `fork` are not the same: `clone` is a local copy of a repo on your computer, and `fork` is your personal remote copy of someone else's repo on GitHub.
- `fork` is most commonly used when you don't have write access to the original repo, so you make changes in your own GitHub fork and then send a `Pull Request` to the original repo.
- Practically: if you work in your own or team-accessible repo, you usually need `clone`; if you work on someone else's GitHub repo without direct write access, then you first need `fork`, and only then `clone` that fork.
- `DevOps` is a broader way of working and collaborating between the development and operations sides, with the goal of delivering and maintaining software faster, more securely and more stably.
- `CI/CD` is a narrower, practical part of that: a set of automated pipelines and steps that build, test and deliver code.
- `DevOps` and `CI/CD` emerged as a response to a slow, manual and separated way of building, testing and releasing software, where development and operations long worked as separate worlds, and they did not originate from a single author but gradually evolved in the software industry through agile, automation and DevOps practices.
- The difference is that `DevOps` is more of a culture, operating model and work discipline, while `CI/CD` is a concrete mechanism and tooling flow that implements that discipline. Practically: `DevOps` tells you how a team should work and what it wants to achieve, while `CI/CD` serves to automatically verify and move those changes from commit to deployment.

## 3.1) Local and remote branch
```text
REMOTE   [origin/feature]         [origin/staging]             [origin/main]
			  ^                           |                          |
			  | git push                  | git pull                 | git pull
			  |                           v                          v
LOKALNO  [feature] ----git merge----> [staging] ----git merge----> [main]
			  ^                                                        |
			  |                                                        |
			  +------- git checkout -b feature iz local main ----------+
								(a local main je prethodno
								osvježen iz origin/main)
```

Imagine that a Git repo is one folder with multiple papers, and each branch is one separate paper in that folder. The same branch can exist in two places: locally, on your computer and remote, on GitHub.

Important: Git **does not create a separate directory on disk for each branch**. You have one single folder (e.g. `C:\dev\KomITi\komiti_academy`), and Git changes the contents of that same folder when you switch from branch to branch. When you run `git checkout main`, Git replaces the files in that folder with the state of the `main` branch from the local `.git/` database. When you run `git checkout 2026-03-12-features`, Git replaces the files in the same folder with the state of that feature branch. Therefore:
- `checkout` does not download anything from GitHub — it only overwrites files on disk from the local `.git/` database where Git stores all states of all branches, compressed,
- files that differ Git **overwrites**, files that exist only on the old branch Git **deletes**, and files that exist only on the new branch Git **creates**,
- that is why it is so important to know which branch you are on before you delete or change something — because you are working in the only copy of the folder on disk,
- in the paper analogy: you do not have separate folders for each paper — you have one folder and Git always puts in it the paper you are currently working on; the other papers are "hidden" in `.git/` and waiting for you to call them.

What is the `.git/` database actually? It is not an SQL database nor plain text — it is a folder-based object store, i.e. a structure of folders and compressed files that Git maintains in the hidden `.git/` folder inside your repo. When you run `git init` or `git clone`, Git creates that folder and stores literally everything in it: every commit, every version of every file, every branch. The structure looks roughly like this:
```text
.git/
├── objects/      ← all snapshots (commits, files, trees) — compressed
├── refs/         ← "pointers" (branches, tags) — text files
├── HEAD          ← text file that says which branch you are on
├── config        ← repo settings (remote URL etc.)
├── index         ← staging area
└── ...
```
- `objects/` = every file, every commit and every directory structure you ever committed exists here as a compressed blob object; Git addresses them via SHA-1 hashes (that long string of letters and numbers),
- `refs/` = branches and tags; e.g. the file `refs/heads/main` contains only one line — the hash of the commit that `main` currently points to,
- `HEAD` = a text file that says which branch you are on; open it and you will see something like `ref: refs/heads/main`,
- `index` = the staging area; this is where Git remembers what you staged for the next commit.

Practical consequence: when you run `git checkout main`, Git looks at `refs/heads/main`, finds the hash of the last commit, extracts the compressed versions of files from `objects/` and overwrites them in your working folder. That is why `checkout` does not download anything from GitHub — everything is already there, on your disk, in the `.git/` folder.

If you want to see the contents of a file from another branch without changing your working folder, there is the command `git show <branch>:<path>`, e.g. `git show main:README.md` — Git will extract that version of the file from `.git/objects/` and display it in the terminal, without overwriting anything on disk.

- Creating a local feature branch (`git checkout -b 2026-03-12-features`):
	In real work you first stand on the main paper with the command `git checkout main`, refresh it with the command `git pull origin main`, and then create your working paper with the command `git checkout -b 2026-03-12-features`.
- Working in the local feature branch (`git commit -m "Expand Git foundations workflow"`):
	After that you change files in VS Code, check what exactly you did with `git status --short` and `git diff --stat`, then locally save your state with the commands `git add 02_GIT_VSCODE_ОСНОВЕ_2h.md` and `git commit -m "Expand Git foundations workflow"`.
- pull and merge of the local feature branch into staging (`git pull origin staging` and `git merge 2026-03-12-features`) and main:
	When you want others to see your work, you send your local working paper to GitHub with the command `git push -u origin 2026-03-12-features`, whereby your local `2026-03-12-features` also gets its remote copy `origin/2026-03-12-features`.
	When the change is verified, you switch to `staging` with `git checkout staging`, refresh it with `git pull origin staging`, bring in the content of your working paper with the command `git merge 2026-03-12-features`, then send the result back to GitHub with `git push origin staging`; later you repeat the same logic for `main`, so Git practically serves to know exactly which paper you are working on, what you changed and how that change moves to the main version.

Since this is a very important concept, let's repeat it enumeratively:
- `main` = the main paper,
- `staging` = the verification paper,
- `2026-03-12-features` = your working paper.
The same branch can exist in two places:
- locally, on your computer,
- remote, on GitHub.
That's why you can have:
- local `staging`,
- remote `origin/staging`.
These are not literally the same branch, but a local and remote copy of the same line of work.
In the paper analogy this means:
- `checkout` = you switch to another paper,
- `commit` = you save the current state of the paper,
- `push` = you send your paper to GitHub,
- `pull` = you get a newer version of the paper from GitHub,
- `merge` = you transfer content from one paper to another paper.
Practically:
- `git checkout staging` means you switched to your local `staging`,
- `git pull origin staging` means you fetched the new state from remote `origin/staging`,
- `git push origin staging` means you sent your local `staging` to remote `origin/staging`.

## 4) What the letters in VS Code Explorer mean
The most common labels are:
- `M` = `Modified`
- `U` = most commonly `Untracked` — a new file that has not yet been added to Git; in a merge conflict it can also mean unresolved/unmerged state
- `A` = `Added`
- `D` = `Deleted`
- `R` = `Renamed`
Practically:
- if you see `M` next to an `.md` file, you changed it locally. `M` typically disappears after a commit or if you revert the file to its original state.
- if you see `U`, Git is not yet tracking that new file. `U` disappears when you add the file to Git with `git add` and later commit, or if you delete that new file.
- if you see `D`, the file has been deleted in the local workspace. `D` disappears when the deletion enters a commit, or if you restore the deleted file.
Generally, the letters disappear when Git no longer sees that change as an "unresolved" local change.

## 5) Explorer is not the same as Source Control panel
- Explorer gives a quick visual signal next to the file,
- Source Control panel shows you in more detail what is staged, what is unstaged and what goes into a commit.
Whenever you are unsure, Source Control panel and `git status --short` are more reliable than guessing by icons.

## 5.1) What the bottom-left corner in VS Code means: Git status indicator
In the Git status indicator you often see a short Git status for the active repo.
Using an example like:
- `odoo4komiti` = the repo you are currently working in,
- `2026-03-11-features` = the branch you are currently on,
- `*` = you have local changes that are not yet committed,
- the circular arrows icon = Git sync/refresh zone; here VS Code shows or offers fetch/pull/push/sync, and if the icon is spinning, a Git operation is usually in progress.
That from the screenshot is not some special "Copilot workspace" or separate agent context, but the VS Code status bar showing the Git context of the active repo in the current workspace.
Practically, the screenshot tells you three things at once:

For the agent this is a useful signal, but not a magic guarantee.
- The Git indicator tells the agent which is the current branch context. In the same clone and the same working tree, the agent cannot work on a different local branch from the one the Git status indicator shows. If the indicator shows `2026-03-11-features`, then the agent in that context works on `2026-03-11-features`.
- If you have multiple agents in the same workspace, they share the same checked-out branch and the same working tree; they cannot work on different local branches.
- If you see a discrepancy between the indicator and what you expect, check `git status` and `git branch --show-current`, because you might be looking at a different repo in a multi-root workspace or a different clone.
If you have multiple root folders in the same workspace, VS Code usually still shows the relevant Git context for the active file or active repo, so you must pay attention to which file is active and in which root you are actually working.
In the paper analogy:
- `odoo4komiti` = the folder where the papers are,
- `2026-03-11-features` = the paper you are currently writing on,
- `*` = you changed the paper, but you have not yet saved that version as a commit.

## 6) Save is not the same as commit
This is a key beginner distinction:
- `save` writes the file to disk,
- `commit` records that change in Git history,
- `push` sends that commit to GitHub.
So the order is often:
1. edit the file,
2. `save`,
3. review the diff,
4. `git add`,
5. `git commit`,
6. `git push`.

## 7) Basic local workflow
This is one whole unit: how Git looks in the actual KomITi workflow, with concrete commands and the order we actually use.

You will later have to carry out this same Git flow yourself for tasks on `komiti_academy`, so don't read it as an abstract rule but as a working procedure.

### Step 1: get the latest `main`
```powershell
git checkout main
git pull origin main
```
- `git checkout main`: switches to the local branch `main`.
- `git pull origin main`: pulls the latest changes from the remote `origin` for the branch `main` and merges them into the local `main`.
- `origin`: argument that specifies which remote you are pulling from.
- `main`: argument that specifies which branch you are pulling.
Here you are taking the latest main branch as a starting base.
This means:
- you switched to the local `main`,
- you pulled the latest state from the remote `origin/main`,
- in the paper analogy: you stood on the main paper and checked whether you have its latest version from the shared folder.

### Step 2: create a new feature branch from `main`
```powershell
git checkout -b 2026-03-12-features
```
- `git checkout -b 2026-03-12-features`: creates a new branch from the current position and immediately switches to it.
- `-b` means: create a new branch and immediately switch to it; it is a short option, i.e. a flag, and is an abbreviation of `branch`.
- `2026-03-12-features` is an argument; with it you specify what the new branch will be named.
If you want the branch to exist on GitHub right away:
```powershell
git push -u origin 2026-03-12-features
```
- `git push -u origin 2026-03-12-features`: sends the new branch to GitHub and remembers the upstream link.
- `-u` means `--set-upstream`; it is an option that tells Git to remember the link between the local branch and the remote branch of the same name.
- `origin` is an argument and means: to which remote you are sending.
- `2026-03-12-features` is an argument and means: which branch you are sending.
Here `checkout -b` means:
- create a new paper from the current paper,
- and immediately stand on that new paper,
- if you also do `push -u`, then that new paper immediately gets its copy in the GitHub folder too.

### Step 3: make local changes
You change files in VS Code, then check the state:
```powershell
git status --short
git diff --stat
git diff -- 02_GIT_VSCODE_ОСНОВЕ_2h.md
```
- `git status --short`: shows a short, compact status of the working tree.
- `git diff --stat`: shows a statistical overview of changes per file.
- `git diff -- 02_GIT_VSCODE_ОСНОВЕ_2h.md`: shows the exact diff for the specified file only.
- `--short` is a long option; you are requesting a shorter, more compact display of the Git status.
- `--stat` is a long option; you are requesting a short statistical overview of changes per file.
- in the command `git diff -- 02_GIT_VSCODE_ОСНОВЕ_2h.md`, the `--` is not a filename but a separator; it tells Git: treat everything after this as a path, not as an option.
- `02_GIT_VSCODE_ОСНОВЕ_2h.md` is an argument, i.e. the file path for which you are requesting the diff.
- in the paper analogy: now you are writing on your working paper and then looking at what you actually changed on it compared to the old state.

### Step 4: stage and commit
```powershell
git add 02_GIT_VSCODE_ОСНОВЕ_2h.md ИЛИ git add --all
git commit -m "Expand Git foundations workflow"
```
- `git add 02_GIT_VSCODE_ОСНОВЕ_2h.md`: stages only that one file.
- When we say `staged`, it practically means: `you chose for that change to enter the next snapshot`, i.e. into the next commit.
- `git add --all`: stages all detected changes in the working tree, including new, modified and deleted files.
- `git commit -m "Expand Git foundations workflow"`: creates a commit from staged changes and immediately writes the commit message.
- `--all`: flag that tells Git you are not picking individual files but all current changes.
- `-m`: short option for `message`.
- `"Expand Git foundations workflow"`: argument of the `-m` option, i.e. the commit message text.
After a successful commit Git often prints something like `66bee36`; that is the short commit ID, i.e. the abbreviated commit hash. That number and letters are not random: it is a short version of the unique identifier of that commit. The full commit hash is much longer, and Git in everyday work often shows only the abbreviated version, sufficient to clearly identify the commit in that repo. Practically, `66bee36` means: "this exact code snapshot". That's why you can say, for example: `look at commit 66bee36` or `this change entered 66bee36`.

Important: Git technically does not commit "the entire branch" as a single special object, but creates a new snapshot of everything you staged while on that branch, so it is more precise to say: `on this branch I committed all current changes`, rather than `I committed the branch`.
This means you locally saved the new state of your feature branch.
This is the part where most beginners first truly see the difference between:
- save,
- add,
- commit.
Additionally:
- `git add` means: you marked which part of the paper you want to enter the snapshot,
- `git commit` means: you made a snapshot of that paper at that moment,
- in the paper analogy: you don't save absolutely everything you ever scribbled, but only what you consciously decided should enter this version.

### Step 5: push to GitHub
```powershell
git push origin 2026-03-12-features
```
- `git push origin 2026-03-12-features`: sends local commits from that branch to GitHub.
- `origin`: argument that specifies to which remote you are sending.
- `2026-03-12-features`: argument that specifies which branch you are sending.
Now your local feature branch also exists as a remote branch on GitHub.
This is an important distinction:
- local `2026-03-12-features` = on your machine,
- remote `origin/2026-03-12-features` = on GitHub,
- in the paper analogy: you sent your working paper to the shared folder so that others can see that version too.

### Step 6: promotion to `staging`
First you switch to `staging` and refresh it:
```powershell
git checkout staging
git pull origin staging
```
- `git checkout staging`: switches to the local branch `staging`.
- `git pull origin staging`: refreshes the local `staging` with the latest state from the remote `origin/staging`.
Then you bring the feature content into `staging`:
```powershell
git merge 2026-03-12-features
git push origin staging
```
- `git merge 2026-03-12-features`: brings the content from the feature branch into the current branch `staging`.
- `git push origin staging`: sends the updated `staging` back to GitHub.
This means the content from your feature branch has moved into `staging`.
Here `merge` works like this:
- you stood on `staging`,
- you refreshed `staging` from GitHub,
- into `staging` you brought the content from `2026-03-12-features`,
- then you sent the new `staging` back to GitHub,
- in the paper analogy: you took the verification paper, checked that it's fresh, then transferred the content from your working paper onto it.

### Step 7: promotion to `main`
When `staging` or the feature change is verified, you go to `main`:
```powershell
git checkout main
git pull origin main
git merge 2026-03-12-features
git push origin main
```
- `git checkout main`: switches to the local branch `main`.
- `git pull origin main`: refreshes the local `main` with the remote state from `origin/main`.
- `git merge 2026-03-12-features`: brings the content of the verified feature branch into `main`.
- `git push origin main`: sends the updated `main` to GitHub.
In some flows `staging` is merged into `main`, and in some directly the feature branch. The essential logic is the same:
- first you stand on the branch that receives the change,
- then you merge the verified branch into it,
- then you push to the remote,
- in the paper analogy: now you take the main paper and transfer onto it what has already passed verification.

### Step 8: return to your feature branch if you continue working
```powershell
git checkout 2026-03-12-features
```
- `git checkout 2026-03-12-features`: returns you to the local feature branch to continue working.
If you understand this, then you practically also understand:
- in the paper analogy: you returned to your working paper and continue writing on it, not on the `staging` or `main` paper,
- what a local branch is,
- what a remote branch is,
- what `checkout` is,
- what `pull` is,
- what `push` is,
- what promotion between branches is.

## 8) Most common beginner mistakes
- confusing `save` and `commit`,
- committing everything without reading the diff,
- including unrelated files in the same commit,
- working directly on the wrong branch,
- seeing `U` and not understanding it is a new untracked file,
- thinking that `push` is the same as `deploy`.

## 9) Key concepts and Minimum commands you need to know
- `working tree`: local changes that are not yet committed,
- `staged changes`: changes prepared for the next commit,
- `commit`: a snapshot of one logical unit,
- `branch`: an isolated line of work,
- `fork`: your personal GitHub copy of someone else's repo, on which you can work without directly modifying the original,
- `checkout`: switching to another branch or creating a new branch,
- `merge`: transferring content from one branch to another branch,
- `origin`: default remote,
- `push`: sending local commits to the remote,
- `pull`: fetching remote changes.

These are the same commands from the workflow above, just as a short cheat-sheet list:
```powershell
git checkout main
git checkout staging
git checkout -b <new-branch>
git status --short
git diff --stat
git diff -- path/to/file
git add path/to/file
git commit -m "Short message"
git merge <source-branch>
git pull origin <branch>
git push origin <branch>
```
- `git checkout main` / `git checkout staging`: switching to an existing local branch.
- `git checkout -b <new-branch>`: creates a new branch and immediately switches to it; `-b` means `branch`.
- `git status --short`: short status of the working tree; `--short` means compact display.
- `git diff --stat`: statistical overview of the diff; `--stat` means summary per file.
- `git diff -- path/to/file`: diff for a single file only; `--` separates options from the path.
- `git add path/to/file`: stages one specific file.
- `git commit -m "Short message"`: creates a commit; `-m` means you provide the message in the same command.
- `git merge <source-branch>`: brings the content of the source branch into the current branch.
- `git pull origin <branch>`: pulls the remote state from `origin` for the given branch and merges it locally.
- `git push origin <branch>`: sends local commits to the remote `origin` for the given branch.

## 10) How this looks in KomITi
In this repo the following discipline applies:
- one commit = one logical unit,
- do not commit unrelated changes,
- first read the `eng codex`,
- do not treat `main` as a playground,
- `staging` is the integration branch, and `main` is the production branch,
- local Git proof is not the same as Odoo runtime proof.

## 11) Self-check
When you finish this document, you must be able to answer:
- what `M` means and what `U` means in VS Code,
- what the difference is between save / commit / push,
- what the difference is between `fork` and `clone`,
- what a branch is,
- what `checkout` does and what `merge` does,
- what the difference is between local `staging` and remote `origin/staging`,
- why we check `git status --short` before a commit,
- why we do not put unrelated files in the same commit.

## 12) What to read next
- `03_ИНФРА_TERRAFORM_DOCKER_AWS_ОСНОВЕ_4h.md`
- `04_ODOO_ОСНОВЕ_4h.md`
- `05_БРЗИ_ПОЧЕТАК_РАДА_1h.md`
- `06_АНАТОМИЈА_ДОБРОГ_ODOO_МОДУЛА_2h.md`
- `07_КАКО_СЕ_ЧИТА_ODOO_МОДУЛ_3h.md`

## 99) Task on the komiti_academy project for the candidate

1. Open your account on GitHub, create a repo `komiti_academy_ime_polaznika` and clone it locally, because that is the remote and local repo in which you do your candidate module.  
Reference: This is explained in chapters `## 2) Git basics you need to know` and `## 7) Basic local workflow`.
2. Determine what your first Git work for `komiti_academy` will look like: the feature branch name, the first logical unit for a commit and the rule of what must not go into the same commit.  
Reference: This is explained in chapters `## 7) Basic local workflow` and `## 10) How this looks in KomITi`.
3. In your repo practice the full Git workflow on a simple file `1.txt`: create local and remote branches `main`, `staging` and `feature` (`feature` should conform to the ENGINEERING_CODEX.md in the company KomITi), then in the `feature` branch create `1.txt` with one line `prvi red`, commit and push that change.  
Reference: This is explained in chapters `## 3.1) Local and remote branch`, `## 7) Basic local workflow` and `## 10) How this looks in KomITi`.
4. After that, promote the same change from `feature` to `staging`, then from `staging` to `main`, then return to `feature`, add a second line `drugi red` to `1.txt` and repeat the same workflow all the way to `main`.  
Reference: This is explained in chapters `## 3.1) Local and remote branch`, `## 7) Basic local workflow`, `## 8) Most common beginner mistakes` and `## 10) How this looks in KomITi`.

Solutions:

1. For the GitHub account, repo and local clone do the following in order:
	1. If you don't already have an account, create one on GitHub and complete the basic registration.
	2. On GitHub create a new repo named `komiti_academy_ime_polaznika` and select for GitHub to immediately create an initial `README`, so that the remote `main` exists right away.
	3. Make sure the repo name clearly carries your candidate context and that you are not working directly in the learning repo `komiti_academy`.
	4. Clone that repo locally with the command `git clone <url-copied-from-github>` and enter the repo folder.
	5. Open that local clone in VS Code and verify with `git branch --show-current` that you are on `main`.
	6. Verify with `git remote -v` that the remote `origin` is connected to your GitHub repo.
2. For this first Git task do the following in order:
	1. In `## 7) Basic local workflow` take the pattern for the branch flow.
	2. In the terminal type `git checkout -b 2026-03-15-komiti-academy-skeleton`; as a result you should switch to a new branch whose name clearly indicates it is related to `komiti_academy`.
	3. Write down what the first logical unit for a commit will be, e.g. `module skeleton` or `initial model`.
	4. From `## 10) How this looks in KomITi` write down the rule of what will not go into the same commit if it does not belong to the same change.
3. For the first full workflow on `1.txt` do the following in order in your repo `komiti_academy_ime_polaznika`:
	1. Verify that you are in the local clone of `komiti_academy_ime_polaznika` and that the local `main` already exists, since you cloned the repo from GitHub.
	2. Create the local `staging` with the command `git checkout -b staging`, then send it to GitHub with the command `git push -u origin staging`; as a result you should have both a local and remote `staging`.
	3. Return to `main` with the commands `git checkout main` and `git pull origin main`, so that you create the feature branch from an up-to-date `main`.
	4. Create the feature branch with the command `git checkout -b 2026-03-15-git-workflow-vjezba`.
	5. In that branch create the file `1.txt` with one line: `prvi red`.
	6. Before staging, type `git status --short` and `git diff --stat` in the terminal; as a result you should see only `1.txt` as one clean logical change.
	7. Do `git add 1.txt` and `git commit -m "Add first line to 1.txt"`.
	8. Do `git push -u origin 2026-03-15-git-workflow-vjezba`; as a result you should have both a local and remote feature branch with the first change.
4. For promotion and repeating the workflow do the following in order:
	1. While on `2026-03-15-git-workflow-vjezba`, verify that `1.txt` is on the remote feature branch and that the commit history makes sense.
	2. Switch to `staging`, refresh it, merge from `2026-03-15-git-workflow-vjezba`, then `git push origin staging`; as a result `prvi red` must also be on the remote `staging`.
	3. Switch to `main`, refresh it, merge from `staging`, then `git push origin main`; as a result `prvi red` must also be on the remote `main`.
	4. Return to `2026-03-15-git-workflow-vjezba`; optionally first do `git merge main`, so the feature branch sees the latest state of `main` before continuing work.
	5. In `1.txt` add the second line `drugi red`, then do `git add 1.txt`, `git commit -m "Add second line to 1.txt"` and `git push origin 2026-03-15-git-workflow-vjezba`.
	6. Repeat the same promotion: `feature` -> `staging` -> `main`, so that `drugi red` also goes through the entire workflow.
	7. At the end verify that local and remote `main`, `staging` and `2026-03-15-git-workflow-vjezba` have the expected history and that you can explain how one small change moves through the entire Git flow.
