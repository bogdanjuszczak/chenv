chenv - quick shell environment switcher

ABOUT chenv
It's a little bourne shell helper script that I wrote for myself, which switches between work environments (so - basically directories) on a server. For example you have configuration and directories as below:

Production:
/var/www/myProject/sites/www

Stage:
/var/www/myProject/stage/sites/www

Develompent:
/var/www/myProject/dev/sites/www

and lot's of other stuff in each, like:
stylesheets
javascript
framework

etc.

Now if you are on dev server, working on some file in this location:

/var/www/myProject/dev/sites/www/framework/core/controller/javascript/

and you want to quick move to the corresponding location on stage environment...
Instead of typing full path and 'cd' command you can just run:

chenv stage

boom! and you are there.

/var/www/myProject/stage/sites/www/framework/core/controller/javascript/


First version ever, fresh, new and buggy. Tested on Bourne Shell. Doesn't work on ZSH.
Use it, test it, have fun and give me a feedback.


INSTALL
1) download to some location on your server f.e.
/var/www/chenv.sh

2) give rights to run
chmod +x chenv.sh

3) create an alias
chenv=". /var/www/chenv.sh"

4) adjust your environments' paths (lines 4-6 in script)

5) enjoy!


HOW TO USE
a) run without parameters to check where you are
b) run with environment parameter to switch to it, f.e.
chenv stage
