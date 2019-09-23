######################################
# target
######################################
BIN = client

######################################
# paths
######################################
CUR_DIR		= $(PWD)
TOP_DIR		= $(CUR_DIR)/../../../../..
SDK_DIR		= $(TOP_DIR)
BUILD_DIR	= build
TEST_DIR	= $(TOP_DIR)/test

######################################
# config
######################################

## config sources
CONFIG_OS_TYPE		:= "linux"
CONFIG_TCPIP_TYPE   := "linux_socket"

iot_link_root = $(SDK_DIR)/iot_link

include $(iot_link_root)/inc/inc.mk
include $(iot_link_root)/link_misc/link_misc.mk
include $(iot_link_root)/os/os.mk
include $(iot_link_root)/network/tcpip/tcpip.mk

LIBCOAP_DIR = $(SDK_DIR)/iot_link/network/coap/coap_imp/libcoap
include $(LIBCOAP_DIR)/libcoap.mk


######################################
# binaries
######################################
CC	= $(PREFIX)gcc
CPP	= $(PREFIX)g++
LD	= $(PREFIX)ld
AR	= $(PREFIX)ar

######################################
# source
######################################
# C sources
C_SOURCES += ${wildcard $(CUR_DIR)/*.c}

# C++ sources
CPP_SOURCES +=

#######################################
# CFLAGS
#######################################
# C defines
C_DEFS	+=
		
# C includes
C_INCLUDES +=

# C++ includes
CPP_INCLUDES += -I .
		
# compile gcc flags
CFLAGS += $(C_DEFS) $(C_INCLUDES)

# library
LIB_DIR += -L$(CUR_DIR)
LIBS += -lpthread
LDFLAGS += $(LIB_DIR) $(LIBS)

#######################################
# build the application
#######################################
# objects
C_OBJECTS := $(addprefix $(BUILD_DIR)/, $(notdir $(patsubst %.c, %.o, $(C_SOURCES))))
vpath %.c $(sort $(dir $(C_SOURCES)))

all:$(BUILD_DIR) $(BIN)

# build bin
$(BIN):$(C_OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

$(C_OBJECTS):$(BUILD_DIR)/%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

distclean:clean
	
clean:
	rm -rf $(BUILD_DIR) $(BIN) *.txt

run:
	./$(BIN)

