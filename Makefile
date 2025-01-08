# Variables
CC = gcc
CFLAGS = -Wall -g `pkg-config --cflags gtk+-3.0` `pkg-config --cflags panel`
LDFLAGS = `pkg-config --libs gtk+-3.0` `pkg-config --libs panel`

# Project name
TARGET = my_custom_de

# Source files
SRCS = my_custom_de.c

# Default target to clean and then build the project
all: clean $(TARGET)

# Compile and link in one step (no object files)
$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

# Clean up generated files
clean:
	rm -f $(TARGET)
