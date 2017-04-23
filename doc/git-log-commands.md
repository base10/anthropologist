# Git Log commands

## Get commits suitable for minor cleaning

```sh
git log --after='2005-07-01' --pretty=format:'%h|%an|%ae|%ai|%s|' \
  --shortstat --no-merges > ~/Desktop/phoenix-data-log.txt
```

I then follow that up with a run through `script/git_log_cleaner.rb` like so:

```sh
./scripts/git_log_cleaner.rb ~/Desktop/phoenix-log.csv \
  > ~/Desktop/phoenix-log-fixed.csv
```

The next step from there will be running them through an importer.

## Get file history

```sh
git log --after='2005-07-01' --pretty=format:'%h' --numstat --no-merges \
  > ~/Desktop/phoenix-file-log.txt
```

From there, I should be able to directly import without further cleanup
