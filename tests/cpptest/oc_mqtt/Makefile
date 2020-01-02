TOP_DIR:=../../..
SDK_DIR:=$(TOP_DIR)

include config.mk

######################################
# match files that display the coverage rate
######################################
FILE_PATTERN = "*/oc_mqtt_al/*.c" "*/oc_mqtt_tiny/*.c"

# C++ sources
CPP_SRC := $(wildcard *.cpp)
CPP_OBJ = $(addprefix $(BUILD_DIR)/, $(notdir $(patsubst %.cpp, %.o, $(CPP_SRC))))

# C sources
C_SRC := $(wildcard *.c)
C_OBJ = $(addprefix $(BUILD_DIR)/, $(notdir $(patsubst %.c, %.o, $(C_SRC))))

C_INCLUDES += -I $(iot_link_root)/network/mqtt/mqtt_al

include $(TOP_DIR)/llt/cpptest/build.mk
