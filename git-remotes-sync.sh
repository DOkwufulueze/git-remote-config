#!/bin/sh

gitPathName=;
sourceGitUpstream=;
sourceGitUpstreamURL=;
destinationGitUpstream=;
destinationGitUpstreamURL=;

helpText=$(cat << EOF
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

    Author: Daniel Okwufulueze [https://github.com/DOkwufulueze]
    Date: 06/12/2019

EOF
);

if [ $# -gt 0 ]
then
    while [ "$1" != "" ]
    do
        case "$1" in
            -p | --path )
                shift;
                gitPathName="$1";
            ;;

            -s | --source )
                shift;
                sourceGitUpstream="$1";
                shift;
                sourceGitUpstreamURL="$1";

            ;;

            -d | --destination )
                shift;
                destinationGitUpstream="$1";
                shift;
                destinationGitUpstreamURL="$1";
            ;;

            -h | --help )
                echo "${helpText}" | less +p;
                exit;
            ;;

            * )
                echo ":::Invalid option $1 supplied. Enter ./git-upstream-config -h to see help."
                exit;
            ;;
        esac

        shift;

    done
fi

git -C "${gitPathName}" remote add upstream-"${sourceGitUpstream}" "${sourceGitUpstreamURL}" &&
git -C "${gitPathName}" remote add upstream-"${destinationGitUpstream}" "${destinationGitUpstreamURL}" &&
git -C "${gitPathName}" fetch upstream-"${sourceGitUpstream}" &&
git -C "${gitPathName}" merge upstream-"${sourceGitUpstream}"/master &&
git -C "${gitPathName}" push upstream-"${destinationGitUpstream}" master
