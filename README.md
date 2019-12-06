# git-remotes-sync

- Syncs a forked repository with its upstream repository
- Pushes the source upstream to a different version control application.

For example, one may need their work pushed from GitHub to GitLab.
The source upstream in this case is github and the different version control application is gitlab.
git-remotes-sync simply does the job of getting any repository to another repository in a different version control application.

Version: 1.0.0
Usage:  ./git-upstream-config   [-h | --help]
        ./git-upstream-config   [-p | --path <the local directory containing the target .git directory: path must be absolute>]
                            [-s | --source <the source version control [say github] upstream> <the source upstream URL>]
                            [-d | --destination <the destination version control [say gitlab] upstream> <the destination upstream URL>]
