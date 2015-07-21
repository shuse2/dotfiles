# dotfiles


### Install Tern
```
cd ~/.vim/bundle/tern_for_vim && npm install
```

### Install YCM
```
cd ~/.vim/bundle
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer

 npm -g install instant-markdown-d
```

### Install Unite
```
cd /.vim/bundle/vimproc.vim/
make -f make_mac.mak
```

### OmniSharp
```
cd ~/.vim/bundle
cd omnisharp-vim
git submodule update --init --recursive
cd server
xbuild
```

#### run server manually
```
alias ominisharp="mono PATH_TO_DOTFILES/vim/bundle/omnisharp-vim/server/OmniSharp/bin/Debug/OmniSharp.exe"
```
#### if OmniSharp doesn't work
uninstall old mono
http://www.mono-project.com/docs/about-mono/supported-platforms/osx/
```
#!/bin/sh -x

#This script removes Mono from an OS X System.  It must be run as root

rm -rf /Library/Frameworks/Mono.framework

rm -rf /Library/Receipts/MonoFramework-*

for dir in /usr/bin /usr/share/man/man1 /usr/share/man/man3 /usr/share/man/man5; do
   (cd ${dir};
    for i in `ls -al | grep /Library/Frameworks/Mono.framework/ | awk '{print $9}'`; do
      sudo rm ${i}
    done);
done
```

```
brew update
brew upgrade brew-cask
brew uninstall macvim
brew install macvim --with-lua --override-system-vim --with-client-server
:NeoBundleUpdate
cd youcompleteme & git submodule update --init --recursive
brew install mono or upgrade mono
```


### vim-go
```
:GoInstallBinaries
```
