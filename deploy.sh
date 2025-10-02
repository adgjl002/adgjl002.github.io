git worktree add --force ../_adgjl002_deploy gh-pages
rsync -av --delete site/ ../_adgjl002_deploy/docs
cd ../_adgjl002_deploy/docs
touch .nojekyll
git add --all
git commit -m "deploy: $(date +'%Y-%m-%d %H:%M:%S')"
git push
git worktree remove ../