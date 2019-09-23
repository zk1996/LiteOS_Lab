

LIBCOAP_BASE_DIR    = $(LIBCOAP_DIR)/libcoap-4.2.0
LIBCOAP_ADAPTER_DIR	= $(LIBCOAP_DIR)/adapter

LIBCOAP_SRC_DIR = $(LIBCOAP_BASE_DIR)/src
LIBCOAP_PORT_DIR = $(LIBCOAP_ADAPTER_DIR)/port

LIBCOAP_SRC = \
		${wildcard $(LIBCOAP_SRC_DIR)/address.c} \
		${wildcard $(LIBCOAP_SRC_DIR)/async.c} \
		${wildcard $(LIBCOAP_SRC_DIR)/block.c} \
		${wildcard $(LIBCOAP_SRC_DIR)/coap_debug.c} \
		${wildcard $(LIBCOAP_SRC_DIR)/coap_event.c} \
		${wildcard $(LIBCOAP_SRC_DIR)/coap_hashkey.c} \
		${wildcard $(LIBCOAP_SRC_DIR)/coap_session.c} \
		${wildcard $(LIBCOAP_SRC_DIR)/encode.c} \
		${wildcard $(LIBCOAP_SRC_DIR)/mem.c} \
		${wildcard $(LIBCOAP_SRC_DIR)/net.c} \
		${wildcard $(LIBCOAP_SRC_DIR)/option.c} \
		${wildcard $(LIBCOAP_SRC_DIR)/pdu.c} \
		${wildcard $(LIBCOAP_SRC_DIR)/resource.c} \
		${wildcard $(LIBCOAP_SRC_DIR)/str.c} \
		${wildcard $(LIBCOAP_SRC_DIR)/subscribe.c} \
		${wildcard $(LIBCOAP_SRC_DIR)/uri.c}

LIBCOAP_SRC += \
		${wildcard $(LIBCOAP_SRC_DIR)/coap_notls.c}
		
LIBCOAP_SRC += \
		${wildcard $(LIBCOAP_PORT_DIR)/coap_io.c} \
		${wildcard $(LIBCOAP_PORT_DIR)/coap_time.c}

C_SOURCES += $(LIBCOAP_SRC)


LIBCOAP_INC = \
		-I $(LIBCOAP_BASE_DIR) \
		-I $(LIBCOAP_BASE_DIR)/include \
		-I $(LIBCOAP_BASE_DIR)/include/coap2 \
		-I $(LIBCOAP_PORT_DIR)

C_INCLUDES += $(LIBCOAP_INC)
