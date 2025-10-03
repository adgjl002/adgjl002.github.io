# git checkout --orphan deploy
# git reset --hard
# echo > .nojekyll   # GitHub의 Jekyll 처리 비활성화(권장)
# git commit -m "init pages"
# git push -u origin deploy
# git checkout master

git worktree add --force ../_adgjl002_deploy deploy
rsync -av --delete site/ ../_adgjl002_deploy/docs
cd ../_adgjl002_deploy/docs
touch .nojekyll
git add --all
git commit -m "deploy: $(date +'%Y-%m-%d %H:%M:%S')"
git push
git worktree remove _adgjl002_deploy