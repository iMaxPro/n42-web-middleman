---
title: "Better iOS Projects: Advanced Usages of rbenv"  
#open graph metadata for facebook
preview_url: "blog/2018/06/11/2018-06-11-advancedrbenv.html"
preview_type: article
preview_description: 'In the series "Better iOS Projects", we have a look at the various tools and environments that are useful to have a more convenient and efficient handling of iOS Projects. After we learnt to install and use rbenv and bundler in the previous post of the series "Better iOS Projects", "How to manage the ruby environment of your iOS Project using rbenv", we learnt to install and use rbenv and bundler. Now we have a look at some of the more advanced features and pitfalls of using rbenv and bundler…'
preview_image: "blog/articles/2018-06-11-advancedRbenv/assets/Ruby_1_cut.jpg"
---
_June 11, 2018, by [Wolfgang Lutz](https://number42.de/#team)_

# Better iOS Projects: Advanced Usages of rbenv

![](assets/Ruby_1_cut.jpg)
*Digging deeper with ruby*

In the series "Better iOS Projects", we have a look at the various tools and environments that are useful to have a more convenient and efficient handling of iOS Projects.

## Special Note
You should not have to use root user permissions via _sudo_ for any of the calls that follow. If you seem to need to, you most likely already had a permission problem before or you did not install and setup _rbenv_ correctly.

## Advanced Usages of rbenv

After we learnt to install and use _rbenv_ and _bundler_ in the previous post of the series "Better iOS Projects", [How to manage the ruby environment of your iOS Project using rbenv](https://number42.de/blog/2018/05/22/rbenv-2018-05-22-rbenv.html), we continue by having a look at some of the more advanced features and pitfalls of using _rbenv_ and _bundler_.

### How do I use bundler in _ruby_-scripts?

To ensure that the correct versions of gems are used inside a ruby script, you need to require _rubygems_ and _bundler/setup_ at the top of the script:

```ruby
#!/usr/bin/ruby

# Non-Bundler Dependencies
require 'optparse'
require 'ostruct'

# Support for Bundler and Gems
require 'rubygems'
require 'bundler/setup'

# Now, the version of xcodeproj defined via Bundler is used
require 'xcodeproj'
```

### Using binstubs

To ensure that all calls use the version defined in the _Gemfile_ without prefixing the call with `bundle exec`, you can append `--binstubs` along with the gems to stub to the installation command:

```bash
bundle install --binstubs fastlane
```

It is recommended to explicitly name the gems you want to stub to avoid conflicts with gems that deliver their own stubs, e.g. _rake_.

Then, you can call the command by prepending `bin/`, e.g.

```bash
bin/fastlane
```

You can also add `export PATH="./bin:$PATH"` to your shell's rc file (see above) to always search the bin folder (where binstubs are installed to) when running commands. This might have [security implications](https://github.com/rbenv/rbenv/wiki/Understanding-binstubs) though. I you do this, it is enough to type

```bash
fastlane
```

As an alternative to binstubs, you can also add the alias `alias be="bundle exec"` to your .rc file, to make the original call shorter:

```bash
be fastlane
```

## Bonus: How to automate installing the correct ruby version and gems

At Number42, we always include a script called [bootstrap.sh](https://github.com/num42/n42-buildscripts/blob/master/bootstrap.sh) in our projects, which does the most basic setup calls needed to run the project afterwards. Whenever something does not work out of the box after cloning (or pulling) a project, calling `sh bootstrap.sh` is able to sort out the larger part of problems in most cases. We use this the same way for iOS and web projects. We will have a closer look at the bootstrap script in an upcoming episode of this series.

Among those are the installation of _ruby_, _Bundler_ and _Gems_:

```sh
#!/bin/sh

# exit script on error
set -e

# define colors
RED=`tput setaf 1`
GREEN=`tput setaf 2`
NOCOLOR=`tput sgr0`

# Guard to update brew only once and only if necessary
NEEDS_TO_UPDATE_BREW=1

# Helper to install brew dependencies
installDependencyWithBrew(){
  if [ $NEEDS_TO_UPDATE_BREW -eq 1 ]; then
    echo ""
    echo  "${GREEN} UPDATING BREW ${NOCOLOR}";

    # update brew to keep dependencies up to date
    brew update || echo "${RED} FAILED TO UPDATE BREW ${NOCOLOR}";
    NEEDS_TO_UPDATE_BREW=0
  fi

  echo ""
  echo  "${GREEN} INSTALLING $1 WITH BREW ${NOCOLOR}";

  # install dependency, if is not installed
  brew list $1 || brew install $1 || echo "${RED} FAILED TO INSTALL $1 ${NOCOLOR}";

  # upgrade dependency, if it is outdated
  brew outdated $1 || brew upgrade $1 || echo "${RED} FAILED TO UPGRADE $1 ${NOCOLOR}";
}

# Install ruby if a .ruby-version exists
if [ -e ".ruby-version" ]; then
  echo ""
  echo  "${GREEN} SETTING UP RUBY ${NOCOLOR}";

  installDependencyWithBrew rbenv
  installDependencyWithBrew ruby-build
  # install ruby version from .ruby-version, skipping if already installed (-s)
  rbenv install -s
fi

# Install gems if a Gemfile exists
if [ -e "Gemfile" ]; then
  echo ""
  echo  "${GREEN} INSTALLING GEMS ${NOCOLOR}";

  # install bundler gem for ruby dependency management
  gem install bundler --no-document || echo "${RED} FAILED TO INSTALL BUNDLER ${NOCOLOR}";
  bundle install || echo "${RED} FAILED TO INSTALL BUNDLE ${NOCOLOR}";
fi
```

## Glossary

* __.ruby-version:__ a simple file that defines, what version of ruby you want to use for the project
* __bash:__ The default shell for most Linux and UNIX systems, see [BASH](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29)
* __bundler:__ the ruby dependency manager
* __gem:__ a ruby dependency
* __Gemfile:__ the definition file, where all the dependencies are listed that bundler should install
* __Gemfile.lock:__ the file, where bundler saves the exact versions of all dependencies and their dependencies, as resolved during install
* __oh-my-zsh:__ a collection of configurations and scripts for zsh
* __rbenv:__ a tool to manage multiple versions of ruby on the same computer
* __ruby-build:__ a tool to install ruby versions
* __ruby:__ a [programming language](https://en.wikipedia.org/wiki/Ruby_\(programming_language)
* __zsh:__ the [Z Shell](https://en.wikipedia.org/wiki/Z_shell)

## Acknowledgments
Thanks, as always, to [Melanie Kloss](https://number42.de/#team) for the great banner image.

## Everything from the series 'Better iOS Projects':
- [How to manage the ruby environment of your iOS project using rbenv](https://number42.de/blog/2018/05/22/rbenv-2018-05-22-rbenv.html)
- [How to manage your tooling with mint](https://number42.de/blog/2018/07/03/mint-2018-07-03-mint.html)
- [Getting (nearly) rid of Xcodeproject - A (not so) short Introduction to Xcodegen](https://number42.de/blog/1970/01/01/xcodegen-1970-01-01-xcodegen.html)
