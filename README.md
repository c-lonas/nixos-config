# Overview

nixos-config



# Workflow Tips and Reminders


* Remember you can use `git commit --amend`, especially for syntax fixes and formatting
* `nix flake check` can be used to test changes, in conjunction with git amend
* `hashedPassword` in the user.nix file can be set via `mkpasswd --method sha-512 --salt <random-string>`


# To-Do

* Set root user account w/ hashedPassword
* Vault for dynamic SSH keys? Could just bite the python bullet and use ansible (private repo)
* DNS / Networking configuration
  * CoreDNS | BIND | Other
  * NetworkManager configuration?
* DE / WM custom option 

# Annoyances

* hostSystemProfile setup
  * Re-declaring the custom option in each configuration file. Maybe can I just declare this in the flake and access in each configuration file? Or does that require a verbose way of passing it in? Could have a dedicated options/vars file, but not worth it for just one custom option, keeping the number of files low is good as long as the files remain readable and maintainable
  * Similarly, copy/pasting the package selection logic in each user file is also not DRY, and the conditional logic is pretty ugly to begin with

# Future consideration

* spicetify
* High contrast themes (cyberdream?) to facilitate readability with blur

## TUI Tools


* [TUI YouTube](https://github.com/Benexl/yt-x)
* gitui
* [TODO](https://github.com/dooit-org/dooit) (consider a dedicated option like this instead of using Obsidian)
