CC = gcc
CFLAGS = -g -c -Wall
LDFLAGS = -lcrypt 

SOURCES = nntp-proxy.c
OBJECTS = $(SOURCES:.c=.o)

EXECUTABLE = nntp-proxy

CFLAGS  += `pkg-config --cflags libevent_openssl openssl`
LDFLAGS += `pkg-config --libs libevent_openssl openssl`

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS)

.c.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm $(OBJECTS) $(EXECUTABLE)

.PHONY : all clean