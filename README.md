# i3wm Background Changer

## requires
1. lua5.2
2. feh
3. a new directory /home/username/Pictures/bg-pics

# instructions

please find the line in backgroundChanger.lua and edit it to your directory you want to have background Changer read the files to use for your backgrounds to change through. should be line 25 and is commented like so.

``--make sure we have the correct working directory;
file.chdir('/home/meleeman/Pictures/bg-pics');``

this will change the working directory of where you will want to store the pics. you will have to create any necessary directories with correct user permissions. usually this just involves `cd`'ing into Pictures and `mkdir bg-pics`.

run install.sh

you may need to refresh i3wm or set up a new shell to check the installation. 

in a new terminal type changeBg , or use dmenu and type until you see changeBg .

## Recommended addition to i3 config 

- exec feh --randomize --bg-scale /home/meleeman/Pictures/bg-pics/
- bindsym $mod+Shift+Return exec changeBg
- bindsym $mod+Shift+equal exec changeBg --next
- bindsym $mod+Shift+minus exec changeBg --previous


