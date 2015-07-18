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
#### if OmniSharp doesn't work
```
brew update
brew upgrade brew-cask
brew uninstall macvim
brew install macvim --with-lua --override-system-vim --with-client-server
:NeoBundleUpdate
cd youcompleteme & git submodule update --init --recursive
```


### vim-go
```
:GoInstallBinaries
```
