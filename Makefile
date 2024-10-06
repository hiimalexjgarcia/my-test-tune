build:
	mkdir -p .tmp/
	mkdir -p build/

	SDL_VIDEODRIVER="dummy" schismtracker --diskwrite .tmp/tyvuyv.it.%c.wav src/tyvuyv.it
# SC3 parameters
# k: Attack time (ms) (2 to 400)
# k: Release time (ms) (2 to 800)
# k: Threshold level (dB) (-30 to 0)
# k: Ratio (1:n) (1 to 10)
# k: Knee radius (dB) (1 to 10)
# k: Makeup gain (dB) (0 to 24)
# k: Chain balance (0 to 1)

	ecasound -z:mixmode,sum \
         -a:sc -i .tmp/tyvuyv.it.03.wav -chmix:1 -chmute:2 \
         -a:main -i .tmp/tyvuyv.it.01.wav -chmove:2,3 -chmove:1,2 \
         -a:sc,main -f:,3, -o loop,mixdown \
         -a:mix -i loop,mixdown -el:sc3,2,20,-30.00,10,0.00,0.00,1.00 -f:,2, -o .tmp/tyvuyv.it.01+sc+03.wav

	ecasound \
         -a:01+sc+03 -i .tmp/tyvuyv.it.01+sc+03.wav \
         -a:03 -i .tmp/tyvuyv.it.03.wav \
         -a:04 -i .tmp/tyvuyv.it.04.wav \
         -a:06 -i .tmp/tyvuyv.it.06.wav \
         -a:08 -i .tmp/tyvuyv.it.08.wav \
         -a:all -o build/tyvuyv.it.wav

	normalize-audio build/tyvuyv.it.wav

	lame --preset insane build/tyvuyv.it.wav build/tyvuyv.it.mp3

	flac build/tyvuyv.it.wav -f -o build/tyvuyv.it.flac

clean:
	rm -rf build/
	rm -rf .tmp/

.PHONY: build
