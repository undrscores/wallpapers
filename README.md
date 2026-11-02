# Wallpapers

Wallpaper collection for the Nimbus shell (niri). Nimbus scans `~/Pictures/Wallpapers` recursively.

    git clone https://github.com/undrscores/wallpapers ~/Pictures/Wallpapers
    cd ~/Pictures/Wallpapers && ./fetch.sh   # downloads the Wallhaven images listed in sources.txt
    nimbus wallpaper -r                      # random wallpaper
    nimbus wallpaper -f FILE                 # a specific one

## Layout

- Images committed in the repo root or other folders are my own or openly licensed (see [CREDITS.md](CREDITS.md)).
- Third-party images are **not** hosted here. They are listed in `sources.txt` and downloaded from Wallhaven
  into `wallhaven/` (git-ignored) by `fetch.sh`, with credit to the uploader.

## Adding one

Wallhaven image: add a line `id | descriptive-name | credit` to `sources.txt`, run `./fetch.sh`.
Own/openly licensed image: commit it as `descriptive-name.ext` and add a row to `CREDITS.md`.
