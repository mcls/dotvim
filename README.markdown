## Installation

    git clone https://github.com/mcls/dotvim.git ~/.vim
    ln -nfs ~/.vim/vimrc ~/.vimrc 
    cd ~/.vim
    git submodule init
    git submodule update

## Additional installation

Make sure the RDiscount gem is installed, so Markdown can be previewed.

    gem install rdiscount


## Updating the bundles

Run the following command to fetch the latest versions of the plugins from their
git repos.

    git submodule foreach git pull -q origin master

