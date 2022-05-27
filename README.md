Messing around with a Schism Tracker and ecasound based workflow
for music composition and post-processing. It's probably better to just use a
real DAW, but whatever.

* [Schism Tracker](http://schismtracker.org/)
* [Ecasound](https://ecasound.seul.org/ecasound/)
* [normalize](http://normalize.nongnu.org/)
* [lame](https://lame.sourceforge.io/)
* [flac](https://xiph.org/flac/)
* [Steve Harris' LADSPA plugins](http://plugin.org.uk/), sc3 in particular
* [GNU Make](https://www.gnu.org/software/make/)

```
sudo apt install schism ecasound normalize-audio lame flac swh-plugins make
git clone https://github.com/hiimalexjgarcia/my-test-tune.git
cd my-test-tune
make
xdg-open build/tyvuyv.it.mp3
```

(Makefile presumes Schism Tracker and Ecasound are exporting WAV files at 44khz.)
