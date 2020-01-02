######################################
# binaries
######################################
CC	= $(PREFIX)gcc
CPP	= $(PREFIX)g++
LD	= $(PREFIX)ld
AR	= $(PREFIX)ar

FOR32 := true

ifeq ($(FOR32), true)
CFLAGS += -m32  -march=i386 -mtune=i386
else
CFLAGS += 
endif

BUILD_DIR=build

BIN:= bin
LIB:= $(BUILD_DIR)/libsdk.a

CFLAGS += -fprofile-arcs -ftest-coverage $(C_DEFS) 
GCOV_FLAGS := --rc lcov_branch_coverage=1 --rc  genhtml_branch_coverage=1
CPP_FLAGS :=  -std=c++11 -fpermissive

#compile dynamic library of liteos module	
SRC+= $(C_SOURCES)
LIB_OBJ:=$(addprefix $(BUILD_DIR)/, $(notdir $(patsubst %.c, %.o, $(SRC))))
vpath %.c $(sort $(dir $(SRC)))

INCLUDES+= $(C_INCLUDES)

all:$(BUILD_DIR) lib $(BIN) 
	@echo "OK"
lib:$(LIB)
	
$(BIN):$(C_OBJ) $(CPP_OBJ)
	@$(CPP) $(CFLAGS) $(CPP_FLAGS) $(INCLUDES) -o $@ $^ -lsdk -L$(BUILD_DIR) -lcpptest -lpthread -static -lrt

$(CPP_OBJ):$(BUILD_DIR)/%.o:%.cpp
	@$(CPP) -c $< $(CFLAGS) $(CPP_FLAGS) $(INCLUDES) -o $@ -lcpptest

$(C_OBJ):$(BUILD_DIR)/%.o:%.c
	@$(CC) -c $< $(INCLUDES) $(CFLAGS) -o $@

$(LIB):$(LIB_OBJ)
#	$(CPP) -shared -o $@ $^
	@$(AR) -r $@ $^

$(LIB_OBJ):$(BUILD_DIR)/%.o:%.c
	@$(CC) $(CFLAGS)	$(INCLUDES) -c $< -o $@

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)
    
clean:
	rm -rf $(BUILD_DIR) bin gcov *.htm *.log

run:
	./$(BIN)

cov:
	mkdir -p gcov
	./$(BIN)
	lcov -c -o gcov/gcov.info -d . -b . $(GCOV_FLAGS)
	lcov -e gcov/gcov.info $(FILE_PATTERN) -o gcov/gcov.info $(GCOV_FLAGS)
	genhtml -o gcov/html gcov/gcov.info  $(GCOV_FLAGS)

memcheck:
	#valgrind --tool=memcheck --leak-check=full --show-reachable=yes --trace-children=yes --smc-check=all ./$(BIN) 2>&1 | tee memcheck.log
	valgrind $(VALGRIND_FLAGS) ./$(BIN) 2>&1 | tee memcheck.log
