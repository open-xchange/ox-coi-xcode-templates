## Preambel
To be consistent - from a file structure point of view - in development for OX Coi please use these templates whenever you create a new Swift file for this project.

> [Thank you for your cooperation](https://www.youtube.com/watch?v=nx2G3OCVRNk).

## Installation

There is **NO NEED** to clone this repo just to install the templates. To install the Xcode templates just open your terminal and execute the command below:

```
$ curl -SL https://raw.githubusercontent.com/open-xchange/ox-coi-xcode-templates/master/install.sh | sh
```

That's all and you're done.

## What will happen during installation?

Xcode allows us to create our own file templates. In general they can be found under `~/Library/Developer/Xcode/Templates`.

But it's only half of the truth. This is because besides the *"File Templates"* there are also *"Project Templates"*. If you like to create your own templates for this case, both file and project templates have to be installed separately.

This script checks whether if there is a *"File Templates"* directory already. If so, anything is fine and the file templates from this repository are being installed in `~/Library/Developer/Xcode/Templates/File Templates/OX Coi`.

If the *"File Templates"* directory is missing, it will be created and all existing templates will be moved into it.

Now, when you launch Xcode and create a new file via project navigator you will see a new section in the template choser called *OX Coi*.

![Xcode File-Template Chooser](https://user-images.githubusercontent.com/871198/64420599-ef057300-d09f-11e9-89e6-51965e187f93.jpg)