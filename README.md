# set

## Description
An implementation of the game of set in ruby, provided in both a CLI form and a GUI form using Shoes.

## Dependencies
-CLI version
..-Ruby 2.2.2 or above (Only 2.2.2p95 has been thoroughly tested)
-GUI version
..-Shoes Walkabout (v3.3.0 r2333 tested)

## Setup
-Downloading Ruby (only needed for the CLI version):
..-On a Debian based machine run `#apt-get install ruby`
..-On an Arch machine run `#pacman -S ruby`
..-On a RPM based machine run `#yum install ruby`
..-On gentoo run `#emerge dev-lang/ruby`
..-If compiling from source, download a suitable tarbar and unpack it, then **in the directory** run `#./configure; make; make install;`
..-These instructions are not inclusive of all distros or OS's. If your OS is not listed, please feel free to look up instructions for installing ruby
-Downloading Shoes (only needed for the GUI version):
..-Download shoes from <http://shoesrb.com/downloads> and then follow the instructions on <http://shoesrb.com/manual/Installing.html>
-Clone this repo

## Running the game

### CLI version
navigate to the src folder and run `$ruby game_cli.rb` then follow the onscreen instructions.

### GUI version
Open shoes as illustrated in the instructions linked above. Then from there choose 'open an app' and navigate to the repo>src>GUI>Main_menu.rb
