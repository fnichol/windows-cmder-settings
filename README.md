# Windows cmder Settings

[![license](http://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/fnichol/windows-cmder-settings/blob/master/LICENSE-MIT)

A project to save the settings and preferences for [cmder](http://cmder.net/) to a Git repository in XML format.

There are 2 included programs:

* [`install-settings.ps1`](contrib/install-settings.ps1): downloads the XML file and installs it into the correct location
* [`update-settings.ps1`](contrib/update-settings.ps1): takes the current settings and preferences and copies it into this repository (`git diff` can be used to inspect any changes)

Note that cmder could overwrite your preferences when it exits so there are some checks to make sure it's doing it's work cleanly.

## Pre-requisites

These particular settings use the [Inconsolata](http://levien.com/type/myfonts/inconsolata.html) font which is assumed to already be installed. To download and install, simply use [Chocolatey](https://chocolatey.org/):

```ps1
choco install Inconsolata
```

To install cmder you can also use Chocolaty:

```ps1
choco install cmder
```

## Installation

You can install the settings by "curl bashing" the installation script:

```ps1
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/fnichol/windows-cmder-settings/master/contrib/install-settings.ps1'))
```

Alternatively, clone the Git repository and run the command from there:

```ps1
git clone https://github.com/fnichol/windows-cmder-settings.git
cd windows-cmder-settings
.\contrib\install-settings.ps1
```

## Updating

Updating the current settings and preferences XML file is done by running the update program out of the Git clone:

```ps1
.\contrib\update-settings.ps1
```

You can inspect any changes with `git diff` and commit any changes by:

```sh
git add user-ConEmu.xml
git commit
```
