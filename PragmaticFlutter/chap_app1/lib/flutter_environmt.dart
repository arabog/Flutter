/*
Chap 3:
Flutter’s desktop sup-
port allows it to compile Flutter source code to native macOS or Linux desktop apps.
However, a macOS Flutter desktop app can only be assembled on a Mac. A Linux
Flutter desktop app can only be compiled/developed on a Linux machine.

software development kit (SDK)

F lutter C hannels
Flutter channels are used to switch from one Flutter version to another. You can
choose to switch between different Flutter channels using command `flutter
channel` from the command line.
```
$ flutter channel
Flutter channels:
  * master
  dev
  beta
  stable
```
There are four channels at this time that you can choose from. You can switch to the
preferred channel using the command `flutter channel <channel _ name>`.

e.g: `flutter channel dev`

After switching to your preferred channel, you need to run the command `flutter
upgrade` to bring in updates.

continue from pg 25

*/ 