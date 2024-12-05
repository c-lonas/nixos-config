# Overview

nixos-config

# Workflow Tips and Reminders


* Remember you can use `git commit --amend`, especially for syntax fixes and formatting
* `nix flake check` can be used to test changes, in conjunction with git amend



# To-Do

* Fonts
  * Cartograph
  * Nerdfonts
    * Iosevka Terminus
* Vault for dynamic SSH keys? Could just bite the python bullet and use ansible (private repo)
* DNS / Networking configuration
  * Going to table this until ready to set up pi-hole


## Next up-
Finish setting up Stylix
- [ ] set a user level value via user-options.nix
- [ ] import user-options.nix in configuration.nix, and get the theme selection from there.
- [ ] Set up overrides in home-manager user section so each user gets their own theme selection
- [ ] Play around with other stylix options
  - [ ] Opacity
  - [ ] Fonts

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

# Hosts

💻 south-ponto

💻 north-ponto 

<br>

# Users

*Add New Users*
1) Create a new entry in /users.nix
This step creates a user at the system level.

Specify `isNormalUser` (which is `true`), `extraGroups`.

Optionally, you can add a `hashedPassword` 
```
mkpasswd --method=sha-512 --salt=<random-string>
```
or you can just set the password imperatively via `passwd`

The current `user.nix` file has user packages being installed too, but this is just for demonstration. The correct way to manage user level packages in this flake is via the `/home/users/<user.nix>` file.

Note that `/modules/users.nix` does not exist under `/home` with the other 'user' files, because this operates at the system level, not the home-manager level.

2) Create a `/home/users/<user.nix>`
This is the home-manager file for the user. This is the correct place to install user level packages, where you can choose which packages are installed depending on what type of host you are on.

This file can also contain program configurations for programs that are not tied to the DE/WM module.

3) Add the user to the desired hosts
For each host the user should have access to, create an entry under `home-manager.users` in each host's `configuration.nix` file

4) Set user level options in `/home/user-options.nix`
For things like theme, for example.




<br>

# Desktop Environments / Window Managers

Desktop Environments and Window Managers are controlled via a single option, `dewm`, selected in `host-options.nix`. This value is read to determine the configuration file to use at the system level (`/modules/dewm/*`) and at the user level, via home-manager (`/modules/home-manager/home-dewm/*`). 

In order to add a new Desktop Environment or Window Manager, there *must* be a corresponding file `<dewm-name>.nix` at *both* locations. If it's a 'batteries included' desktop environment like gnome or kde, and no additional user-level configuration is desired, it's fine for the home-manager file to be empty, like this:

```
#/modules/home-manager/home-dewm/kde-plasma.nix
{
  # empty kde-plasma.nix example
}
```

If the selection is instead a Window Manager that requires you to bring your own modules, then the necessary system level packages and configurations are defined in the `/modules/dewm` (such as `sway`, and a display manager like `sddm`), and then all other modules that are controlled by home-manager are imported through `/modules/home-manager/home-dewm/sway.nix` for example. 

Having 2 separate "entrypoints" is clunky, but it does maintain a clear separation of concerns between system and user level configuration, and the clunkiness is mostly felt in needing to maintain two separate files per DE/WM option, even if one of those files is empty. However, a pretty slick user experience is still achieved in only needing to change a single value in `host-options.nix` to swap between any support DE/WM, which was the primary goal. 



# Helpful Links

[Themes: Base16-Scheme Options](https://github.com/tinted-theming/base16-schemes)