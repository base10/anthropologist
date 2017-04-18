# Git Log commands

## Get 50 commits suitable for minor cleaning

```sh
git log -50 --pretty=format:'%h|%an|%ae|%ai|%s|' \
  --shortstat --no-merges | paste - - - > <FILE>
```

I then follow that up with a run through `script/git_log_cleaner.rb` like so:

```sh
./scripts/git_log_cleaner.rb ~/Desktop/phoenix-log.csv \
  > ~/Desktop/phoenix-log-fixed.csv
```

The next step from there will be running them through an importer.

## Get 50 commits of file history

```sh
git log -50 --pretty=format:'%h' --numstat --no-merges
```

From there, I should be able to directly import without further cleanup
