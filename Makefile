# Thomas Burns 2014
# thomasburns88@gmail.com
#

all:
	go build -v -o SnotraDaemon

install: SnotraDaemon
	install SnotraDaemon /usr/local/bin
	install SnotraDaemon.sh /etc/init.d
	update-rc.d SnotraDaemon.sh defaults 98 02

uninstall:
	update-rc.d -f SnotraDaemon.sh remove
	rm /usr/local/bin/SnotraDaemon
	rm /etc/init.d/SnotraDaemon.sh

clean:
	rm -rf SnotraDaemon

