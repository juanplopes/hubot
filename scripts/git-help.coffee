# Show some help to git noobies
#
# use it as:
# git help <topic>
#
# <topic> can be one of: 
# create|clone|add|remove|commit|synchronize|branch|merge|tag|restore
#
# developed by http://github.com/vquaiato - Crafters Software Studio

module.exports = (robot) ->
	git_help = {
		create: "create a new repository -> git init\nclone local repository -> git clone /path/to/repository\nclone remote repository -> git clone username@host:/path/to/repository",
		add: "add changes to INDEX -> git add <filename>\nadd all changes to INDEX -> git add * \nremove or delete -> git rm <filename>",
		commit: "commit changes -> git commit -m \"Commit message\"\npush changes to remote repository -> git push origin master\nconnect local repository to remote repository -> git remote add origin <server>\nupdate local repository with remote changes -> git pull",
		branch: "create new branch -> git checkout -b <name>\nswitch to master branch -> git checkout master\ndelete branch -> git branch -d <name>\npush branch to remote repository -> git push origin <branch name>",
		merge: "merge changes from another branch -> git merge <branch>\nview changes between two branches -> git diff <source branch> <target branch>",	
		tag: "create tag -> git tag <tag name> <commit ID>\nget commit IDs -> git log",
		restore: "replace working copy with latest from HEAD -> git checkout --<file name>"}
		
	git_help["clone"] = git_help["create"]
	git_help["remove"] = git_help["add"]
	git_help["synchronize"] = git_help["commit"]

	robot.hear /^git help (create|clone|add|remove|commit|synchronize|branch|merge|tag|restore)$/i, (msg) ->
		help = git_help[msg.match[1]]
		msg.send help