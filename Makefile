# Variables
CC = gcc
CFLAGS = -Wall -g `pkg-config --cflags gtk+-3.0` `pkg-config --cflags panel`
LDFLAGS = `pkg-config --libs gtk+-3.0` `pkg-config --libs panel`

# Project name
TARGET = my_custom_de

# Source files
SRCS = my_custom_de.c

# Object files
OBJS = $(SRCS:.c=.o)

# Default target to clean and then build the project
all: clean $(TARGET)

# Compile the program
$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS)

# Compile .c to .o (object files)
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up generated files
clean:
	rm -f $(OBJS) $(TARGET)
