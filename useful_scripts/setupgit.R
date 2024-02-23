## How to setup GitHub in RStudio
## (You must have a github account first)
library(devtools)

## set your user name and email (those used for GitHub) :
usethis::use_git_config(user.name = "epi-gde", user.email = "gilles@desve.fr")

## create a personal access token for authentication
## The next command will open web version of GitHub, you will have to enter GitHub login password 
## create a Personal Access Token (PAT) and copy it's value 
usethis::create_github_token(
  scopes=c("repo","user","gist","workflow",
           "write:packages","notifications",
           "write:discussions"),
  description = "RStudio Epi" 
  ) 

## set personal access token for RStudion:
## here insert your own personal access token
credentials::set_github_pat("xxxXXXxxx")

#### Restart R! ###########################################################

# ----------------------------------------------------------------------------
# Not recommended but it's also possible to put PAT into R environment
# by adding GITHUB_PAT=xxxyyyzzz
# usethis::edit_r_environ()


#### Verify settings ######################################################
#usethis::gh_token_help() 

usethis::git_sitrep()

# if something wrong gitcreds better  manage PAT conflicts
library(gitcreds)
# the next command will open a choice 
# select option 2 and paste your access token 
gitcreds::gitcreds_set()

usethis::git_sitrep()
