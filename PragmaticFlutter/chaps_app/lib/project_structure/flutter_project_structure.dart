/*
Chap 4:
CHOOSING FLUTTER CHANNEL
We’ll be using the ‘dev’ channel to run the examples in this book since early support
for desktop along with support for web, Android, and iOS is available in this channel.
After switching to the ‘dev’ channel, don’t forget to run `flutter upgrade`.

flutter channer
then choose dev

You can run the `flutter channel` command to see the active channel marked
with ‘*’.


CREATING FLUTTER PROJECT
There are two ways to create Flutter projects: using command-line tools from
Terminal or using IDE. You can also create the project using the command line and
open it from IDE later on.

Using Command Line ( terminal )
Run the following command to create a ‘hello_books’ project for the ‘Hello Books’
application.
```
$ flutter create hello_books

Using IDE (Android S tudio )
‘Start a New Flutter Project’ Screen
Start a new project by selecting this option on the launch screen

CROSS-PLATFORM FLUTTER PROJECT STRUCTURE
The Flutter project has shared code in the ‘lib’ folder. Each platform has its own
folder to keep the platform-specific code. There are ‘android’, ‘iOS’, ‘web’, ‘linux’,
and ‘macOS’ folders for each platform Flutter app can be deployed to.

RUNNING DEFAULT APP: ANDROID, iOS, WEB, AND DESKTOP
In this section, we will run the ‘hello_books’ Flutter application on all four platforms:
Android, iOS, web, and desktop (macOS). Let’s run the ‘hello_books’ project on all
four platforms together using one simple command, 

‘flutter run -d all’.



(Chapter04: Flutter Project Structure).
USEFUL COMMANDS
Lastly, let’s reiterate the essential and useful commands used in Flutter development
as below:
• flutter doctor: Checks if your machine has all the needed packages
and software to build flutter apps.
• flutter create: Generates new flutter app.
• flutter build: Builds flutter app.
• flutter run: Run flutter app on an attached device. It gives you the
option to select a device from the connected devices.
• flutter help: You can run ’flutter help’ in the command line
to list all other available commands. A screenshot of available commands
is shown in Figure 4.13.



*/ 