TOP_DIR:=../../../..
SDK_DIR:=$(TOP_DIR)

include config.mk

######################################
# match files that display the coverage rate
######################################
FILE_PATTERN = "*at*.c"

# C++ sources
CPP_SRC := $(wildcard *.cpp)
CPP_OBJ = $(addprefix $(BUILD_DIR)/, $(notdir $(patsubst %.cpp, %.o, $(CPP_SRC))))

# C sources
C_SRC   := $(wildcard *.c)
C_OBJ:=$(addprefix $(BUILD_DIR)/, $(notdir $(patsubst %.c, %.o, $(C_SRC))))

INCLUDES:= -I $(TOP_DIR)/llt/cpptest/at
CFLAGS := 

include $(TOP_DIR)/test/llt/cpptest/build.mk

