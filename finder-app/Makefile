TARGET = writer

SRCS = writer.c

OBJS = $(SRCS:.c=.o)

CC = $(CROSS_COMPILE)gcc

CFLAGS = -Wall
LDFLAGS =

default: $(TARGET)
all: default

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) $(OBJS)

.PHONY: all clean