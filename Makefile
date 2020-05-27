build:
	mkdir -p .tmp/
	mkdir -p build/
	SDL_VIDEODRIVER="dummy" schismtracker --diskwrite .tmp/tyvuyv.it.%c.wav src/tyvuyv.it
	ecasound -z:mixmode,sum \
         -a:sc -i .tmp/tyvuyv.it.03.wav -chmix:1 -chmute:2 \
         -a:main -i .tmp/tyvuyv.it.01.wav -chmove:2,3 -chmove:1,2 \
         -a:sc,main -f:,3, -o loop,mixdown \
         -a:mix -i loop,mixdown -el:sc3,5,40,-30,5,,,1 -f:s16,2,48000 -o .tmp/tyvuyv.it.01+sc+03.wav
	ecasound \
         -a:01+sc+03 -i .tmp/tyvuyv.it.01+sc+03.wav \
         -a:03 -i .tmp/tyvuyv.it.03.wav \
         -a:04 -i .tmp/tyvuyv.it.04.wav \
         -a:all -o build/tyvuyv.it.wav
	normalize-audio build/tyvuyv.it.wav
	lame --preset insane build/tyvuyv.it.wav build/tyvuyv.it.mp3
	flac build/tyvuyv.it.wav -f -o build/tyvuyv.it.flac

clean:
	rm -rf build/
	rm -rf .tmp/

.PHONY: build
