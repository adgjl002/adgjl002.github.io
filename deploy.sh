# git checkout --orphan publish
# git reset --hard
# echo > .nojekyll   # GitHub의 Jekyll 처리 비활성화(권장)
# git commit -m "init pages"
# git push -u origin publish
# git checkout master

git worktree add --force ../_adgjl002_deploy publish
rsync -av --delete site/ ../_adgjl002_deploy
cd ../_adgjl002_deploy
touch .nojekyll
git add --all
git commit -m "deploy: $(date +'%Y-%m-%d %H:%M:%S')"
git push
git worktree remove /