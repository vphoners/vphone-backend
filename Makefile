CONTAINER=asterisk
SHELLCMD=asterisk -rvvvvv

all: build

build:
	docker build -t vphone/$(CONTAINER):latest .
