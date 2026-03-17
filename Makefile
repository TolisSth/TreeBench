CXX      = g++
CXXFLAGS = -std=c++23 -O3 -march=native -Wall -Wextra -Winline -Iinclude

# Directories based on your structure
SRC_DIR  = src
INC_DIR  = include
OBJ_DIR  = obj
BIN_DIR  = bin
RES_DIR  = results

TARGET   = $(BIN_DIR)/TreeBench

SRCS     = $(wildcard $(SRC_DIR)/*.cpp)
OBJS     = $(SRCS:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

all: setup $(TARGET)

setup:
	@mkdir -p $(OBJ_DIR)
	@mkdir -p $(BIN_DIR)
	@mkdir -p $(RES_DIR)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	@echo "Cleaning up build artifacts..."
	rm -rf $(OBJ_DIR) $(BIN_DIR)

run: all
	@echo "Launching Scientific Benchmarks..."
	./$(TARGET) > $(RES_DIR)/benchmark_output.log
	@echo "Results saved to $(RES_DIR)/"

.PHONY: all setup clean run
