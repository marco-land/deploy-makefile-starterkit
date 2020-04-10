remotehost  = 127.0.0.1
remotehosturl = $(remotehost)
remoteuser  = user
remotedir   = /path/to/project
flags = -r -t -u -z -p -P -h -i --delete
excludes = --exclude 'CHANGELOG.md' --exclude 'README.md' --exclude '.DS_Store' --exclude '.gitmodules' --exclude 'node_modules/*' --exclude '.git/*' --exclude '.git' --exclude '.gitignore' --exclude 'Makefile'
filters = --filter "protect path/to/protect/"

deploy:
	@echo "\033[0;31mDeploying...\033[0m"
	rsync $(flags) $(excludes) $(filters) ./ $(remoteuser)@$(remotehost):$(remotedir)
	@echo "\033[0;31mDeploy complete.\033[0m"

# Kirby example [do not upload sesstions/accounts/etc and also protect those folder on the server]
# kirbyExcludes = --exclude 'site/sessions' --exclude 'media' --exclude 'site/accounts' --exclude 'site/accounts/*' --exclude 'content/*'  --exclude 'thumbs/*' --exclude 'site/cache/*' --exclude 'assets/avatars/*'
# kirbyFilters = --filter "protect media/" --filter "protect content/*"  --filter "protect site/accounts/*" --filter "protect site/sessions/*"
