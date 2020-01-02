TOP_DIR:=../../../..
SDK_DIR:=$(TOP_DIR)

include config.mk

######################################
# match files that display the coverage rate
######################################
FILE_PATTERN = "*ota_flag.c" "*pcp.c"

LIB_OBJ:=$(addprefix $(BUILD_DIR)/, $(notdir $(patsubst %.c, %.o, $(SRC))))
vpath %.c $(sort $(dir $(SRC)))
	
INCLUDES:= $(C_INCLUDES) -I. -I./pcp
# C++ sources
CPP_SRC := $(wildcard *.cpp) $(wildcard ./pcp/*.cpp)
CPP_OBJ = $(addprefix $(BUILD_DIR)/, $(notdir $(patsubst %.cpp, %.o, $(CPP_SRC))))
vpath %.cpp $(sort $(dir $(CPP_SRC)))
# C sources
C_SRC   := $(wildcard *.c)
C_OBJ    = $(addprefix $(BUILD_DIR)/, $(notdir $(patsubst %.c, %.o, $(C_SRC))))

CFLAGS := 

include $(TOP_DIR)/test/llt/cpptest/build.mk

