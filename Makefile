CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -D_GNU_SOURCE -O2
LDFLAGS = -lssl -lcrypto

TARGET = zerofrag
SOURCES = runtime.c launcher.c exploit.c
OBJECTS = $(SOURCES:.c=.o)
HEADERS = launcher.h profile.h unified.h

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)
	@echo "✓ Build successful: $(TARGET)"

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS) $(TARGET)
	@echo "✓ Clean complete"

help:
	@echo "ZDI-CAN-33367 PoC Makefile"
	@echo "Usage:"
	@echo "  make         - Build the exploit binary"
	@echo "  make clean   - Remove build artifacts"
	@echo "  make help    - Show this help message"

.PHONY: all clean help
