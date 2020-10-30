# A tweak-able (and tweaked) Emacs config

This is abo-abo Emacs configuration fork.
Instead of cloning this config, I suggest to follow abo-abo and his original config: https://github.com/abo-abo/oremacs

# Installation

This config doesn't assume to become your main config when you install it.  It installs in-place in the git directory and will start from there without touching your main config.  But you still get access to all your stuff, like bookmarks stored in your actual `~/.emacs.d/` etc.

How to install abo-abo oremacs:

```sh
cd ~/git
git clone https://github.com/abo-abo/oremacs
cd oremacs
make install
```

This fork follows the same guiding principle as original. Clone, then "make install"
## Running

Run without updating:

```sh
make run
```

Run with an upstream + ELPA update:

```sh
make up
```

Run with an upstream + ELPA + org-mode + CEDET update:

```sh
make install
```

# Personal customization

If you want to track my upstream without difficulties, put your changes into `./personal/personal-init.el`.  I have another git repository inside `./personal/` tracking stuff like my email address etc.

# Perks

## Standalone

You can try it without messing up your current Emacs config.  I actually have multiple versions of this on my system to work-around incompatibility between versions. This way, I can use my full setup even in case I get a bug report for an older Emacs version.

## Fast start up

With a SSD, it starts in 1 second. Most features are autoloaded and it's easy to add new autoloaded features.

## Tracks the most recent org-mode and CEDET

Since these packages take a long time to byte compile, they are updated not with `make up` but with `make install`. They are actually git submodules, which means that they won't update if I don't update them in the upstream.

## Bankruptcy-proof

It's hard to become Emacs-bankrupt with this config, since the config is composed of many independent pieces that you can simply ignore if you don't need them.

## Org mode starter

The config starts you off with a fully configured `org-mode` setup that includes:

- gtd.org for getting things done.
- ent.org to track entertainment.
- wiki folder for quickly starting and selecting wikis.
