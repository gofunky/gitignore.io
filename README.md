[![](https://cdn.rawgit.com/joeblau/gitignore.io/master/Public/img/gitignoreio.svg)](https://www.gitignore.io)   
**Create useful .gitignore files for your project**

[![](https://img.shields.io/badge/Swift-4.1-orange.svg?style=flat-square)](https://swift.org) [![Travis](https://img.shields.io/travis/gofunky/gitignore.io.svg?style=flat-square)](https://travis-ci.org/gofunky/gitignore.io) [![Code Climate Maintainability](https://img.shields.io/codeclimate/maintainability/joeblau/gitignore.io.svg?style=flat-square)](https://codeclimate.com/github/joeblau/gitignore.io/maintainability) ![Platforms](https://img.shields.io/badge/Platforms-Linux%20%7C%20macOS%20%7C%20Windows-blue.svg?style=flat-square) [![license](https://img.shields.io/github/license/joeblau/gitignore.io.svg?style=flat-square)](https://github.com/joeblau/gitignore.io/blob/master/LICENSE.md) [![](https://api.codacy.com/project/badge/Grade/ec8e4f6f54c9427c8a35836ccd9ad308)](https://www.codacy.com/app/gofunky/gitignore.io?utm_source=github.com&utm_medium=referral&utm_content=gofunky/gitignore.io&utm_campaign=Badge_Grade)
[![](https://images.microbadger.com/badges/image/gofunky/gitignore.io.svg)](https://microbadger.com/images/gofunky/gitignore.io "Get your own image badge on microbadger.com")

## `.gitignore` Template Source

Source templates for gitignore.io can be found at https://github.com/dvcs/gitignore

## Install Command Line

To run gitignore.io from your command line you need an active internet connection and an environment function. You need to add a function to your environment that lets you access the gitignore.io API.

### Git
`#!/bin/bash`
```sh
$ git config --global alias.ignore '!gi() { curl -L -s https://www.gitignore.io/api/$@ ;}; gi'
```

### Linux
`#!/bin/bash`
```sh
$ echo "function gi() { curl -L -s https://www.gitignore.io/api/\$@ ;}" >> ~/.bashrc && source ~/.bashrc
```

`#!/bin/zsh`
```sh
$ echo "function gi() { curl -L -s https://www.gitignore.io/api/\$@ ;}" >> ~/.zshrc && source ~/.zshrc
```

`#!/bin/fish`
```sh
$ printf "function gi\n\tcurl -L -s https://www.gitignore.io/api/\$argv\nend\n" > ~/.config/fish/functions/gi.fish
```

### macOS
`#!/bin/bash`
```sh
$ echo "function gi() { curl -L -s https://www.gitignore.io/api/\$@ ;}" >> ~/.bash_profile && source ~/.bash_profile
```
`#!/bin/zsh`
```sh
$ echo "function gi() { curl -L -s https://www.gitignore.io/api/\$@ ;}" >> ~/.zshrc && source ~/.zshrc
```

`#!/bin/fish`
```sh
$ printf "function gi\n\tcurl -L -s https://www.gitignore.io/api/\$argv\nend\n" > ~/.config/fish/functions/gi.fish
```

### Windows
Create a PowerShell v3 Script
```posh
#For PowerShell v3
Function gig {
  param(
    [Parameter(Mandatory=$true)]
    [string[]]$list
  )
  $params = ($list | ForEach-Object { [uri]::EscapeDataString($_) }) -join ","
  Invoke-WebRequest -Uri "https://www.gitignore.io/api/$params" | select -ExpandProperty content | Out-File -FilePath $(Join-Path -path $pwd -ChildPath ".gitignore") -Encoding ascii
}
```
Create a PowerShell v2 Script
```posh
#For PowerShell v2
Function gig {
  param(
    [Parameter(Mandatory=$true)]
    [string[]]$list
  )
  $params = ($list | ForEach-Object { [uri]::EscapeDataString($_) }) -join ","
  $wc = New-Object System.Net.WebClient
  $wc.Headers["User-Agent"] = "PowerShell/" + $PSVersionTable["PSVersion"].ToString()
  $wc.DownloadFile("https://www.gitignore.io/api/$params", "$PWD\.gitignore")
}
```

Create a Command Line Prompt Script
If you have installed [msysgit](http://msysgit.github.io)), create `gi.cmd` with content below. And copy it to `C:\Program Files\Git\cmd\gi.cmd`, assuming `msysgit` was installed to `c:\Program Files\Git`. Make sure that `C:\Program Files\Git\cmd` is added to the environment variable `path`.
```bat
@rem Do not use "echo off" to not affect any child calls.
@setlocal

@rem Get the abolute path to the parent directory, which is assumed to be the
@rem Git installation root.
@for /F "delims=" %%I in ("%~dp0..") do @set git_install_root=%%~fI
@for /F "delims=" %%I in ("%~dp0..") do @set git_mingw_root=%%~fI\mingw
@if not exist "%git_mingw_root%" @set git_mingw_root=%git_install_root%\mingw64
@set PATH=%git_install_root%\bin;%git_mingw_root%\bin;%PATH%

@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@curl.exe -L -s https://www.gitignore.io/api/%*
```
### Other Clients

Clients maintained by third-party developers

| Source Code | Language | Instructions | Maintainer |
|---|---|---|---|
| [gogi](https://github.com/Gnouc/gogi) | Go | [Install](https://github.com/Gnouc/gogi#installation) | [Cuong Manh Le](https://github.com/Gnouc) |
| [ignr](https://github.com/Antrikshy/ignr.py) | Python | [Usage](https://github.com/Antrikshy/ignr.py#usage) | [Antriksh Yadav](https://github.com/Antrikshy) |
| [add-gitignore](https://github.com/TejasQ/add-gitignore) | Node | [Usage](https://github.com/TejasQ/add-gitignore#usage) | [Tejas Kumar](https://github.com/TejasQ) |

Tools or extensions maintained by third-party developers on other platforms

| Source Code | Platform | Instructions | Maintainer
|---|---|---|---|
| [fzf-gitignore](https://github.com/fszymanski/fzf-gitignore) | Neovim | [Install](https://github.com/fszymanski/fzf-gitignore#installation) | [Filip Szymański](https://github.com/fszymanski)
| [gi](https://marketplace.visualstudio.com/items?itemName=rubbersheep.gi) | Visual Studio Code | [Install](https://marketplace.visualstudio.com/items?itemName=rubbersheep.gi#install) | [Hasit Mistry](https://github.com/hasit/)
| [helm-gitignore](https://github.com/jupl/helm-gitignore) | GNU Emacs | [Install](https://github.com/jupl/helm-gitignore#installation) | [Juan Placencia](https://github.com/jupl)

## Use Command Line

After the function is created, the `gi` command will give you command line access to the gitignore.io API. . **Note:** Use `gig` if you are on Windows

### Preview
Show output on the command line. **Note:** Use `gig` if you are on Windows
```sh
$ gi linux,java
# Created by https://www.gitignore.io

### Linux ###
.*
!.gitignore
*~

### Java ###
*.class
# Package Files #
*.jar
*.war
*.ear
```

### Global
Append Operating System and IDE settings to global .gitignore. **Note:** Use `gig` if you are on Windows
```sh
$ gi linux,eclipse >> ~/.gitignore_global
```

### Project
Appending Programming Language settings to your projects .gitignore. **Note:** Use `gig` if you are on Windows
```sh
$ gi java,python >> .gitignore
```

### List
List displays a list of all of the currently support gitignore.io templates. **Note:** Use `gig` if you are on Windows
```sh
$ gi list
actionscript,ada,agda,android,appceleratortitanium,appcode,archives,
archlinuxpackages,autotools,bancha,basercms,bower,bricxcc,c,c++,cakephp,
cfwheels,chefcookbook,clojure,cloud9,cmake,codeigniter,codekit,commonlisp,
compass,composer,concrete5,coq,cvs,dart,darteditor,delphi,django,dotsettings,
dreamweaver,drupal,eagle,eclipse,elasticbeanstalk,elisp,elixir,emacs,ensime,
episerver,erlang,espresso,expressionengine,fancy,finale,flexbuilder,forcedotcom,
freepascal,fuelphp,gcov,go,gradle,grails,gwt,haskell,intellij,java,jboss,jekyll,
jetbrains,joe,joomla,justcode,jython,kate,kdevelop4,kohana,komodoedit,laravel,
latex,lazarus,leiningen,lemonstand,lilypond,linux,lithium,magento,matlab,maven,
mercurial,meteor,modelsim,monodevelop,nanoc,netbeans,node,notepadpp,objective-c,
ocaml,opa,opencart,openfoam,oracleforms,osx,perl,ph7cms,phpstorm,playframework,
plone,prestashop,processing,pycharm,python,qooxdoo,qt,quartus2,r,rails,redcar,
rhodesrhomobile,ros,ruby,rubymine,rubymotion,sass,sbt,scala,scrivener,sdcc,
seamgen,senchatouch,silverstripe,sketchup,stella,sublimetext,sugarcrm,svn,
symfony,symfony2,symphonycms,tags,target3001,tarmainstallmate,tasm,tex,textmate,
textpattern,turbogears2,typo3,unity,vagrant,vim,virtualenv,visualstudio,vvvv,
waf,wakanda,webmethods,webstorm,windows,wordpress,xamarinstudio,xcode,xilinxise,
yeoman,yii,zendframework
```

## Advanced Command Line Improvements

Advanced command line suggestions are tracked on the [gitignore.io wiki](https://github.com/joeblau/gitignore.io/wiki/Advanced-Command-Line).

## Design

| Asset | Description |
| --- | --- |
| <img src="https://cdn.rawgit.com/joeblau/gitignore.io/master/Public/img/gitignoreio.svg" /> | gitignore.io horizontal logo |
| <img src="https://cdn.rawgit.com/joeblau/gitignore.io/master/Public/img/gi.svg" /> | gitignore.io square logo |

## Install Locally

### Requirements

- **Vapor** - [macOS](https://vapor.github.io/documentation/getting-started/install-swift-3-macos.html) / [Linux](https://vapor.github.io/documentation/getting-started/install-swift-3-ubuntu.html)

## Instructions

```sh
$ git clone --recursive git@github.com:joeblau/gitignore.io.git
$ cd gitignore.io/
$ vapor build
$ vapor run
```

### Using Docker

It's also possible to run the app using [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/). It can be done by running the commands below.

```sh
$ git clone --recursive git@github.com:joeblau/gitignore.io.git
$ cd gitignore.io/
$ docker-compose up -d
```

## Companies

Here are some companies that use gitignore.io:

<img src="https://cdn.rawgit.com/joeblau/gitignore.io/master/Public/img/companies.svg" />

## About

.gitignore.io is a web service designed to help you create .gitignore files for
your Git repositories. The site has a graphical and command line method of
creating a .gitignore for your operating system, programming language, or IDE.
