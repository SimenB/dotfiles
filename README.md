# dotfiles

My macOS setup, deployed with [mise dotfiles](https://mise.jdx.dev/dotfiles.html).

## New machine

1. Install [mise](https://mise.jdx.dev/installing-mise.html).
2. Run this command to [bootstrap](https://mise.jdx.dev/bootstrap/from-repository.html#global-config-elsewhere). Add `--dry-run` to preview.

   ```sh
   mise bootstrap --from git@github.com:SimenB/dotfiles.git --from-dir ~/repos/dotfiles --config-dir mise/.config/mise
   ```

Work config is in a private repo, `dotfiles-work`. Without access to it, remove it from `[bootstrap.repos]` and `mise-work` from `dotfile_groups`.

## Day to day

- `mise bootstrap --update` fast-forwards this checkout and bootstraps from the new commit.
- `mise dot status` shows files that differ from the repo.
- `mise dot apply` deploys new or changed files. Add `--force` to replace a real file with a link.
- `mise bootstrap packages status` shows Homebrew packages that differ from the config.
