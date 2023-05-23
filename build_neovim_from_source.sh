# install prerequisites
sudo apt-get install ninja-build gettext cmake unzip curl

# clone the source
git clone git@github.com:neovim/neovim.git

# build the stable release
cd neovim 
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo

# install
cd build && cpack -G DEB
sudo dpkg -i nvim-linux64.deb
