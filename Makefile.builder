ifeq ($(DIST),nixos)
    NIXOS_PLUGIN_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
    DISTRIBUTION := nixos
    BUILDER_MAKEFILE = $(NIXOS_PLUGIN_DIR)Makefile.nixos
    TEMPLATE_SCRIPTS = $(NIXOS_PLUGIN_DIR)scripts
endif

# vim: ft=make
