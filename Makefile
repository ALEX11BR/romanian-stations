PHP ?= php
NMLC ?= nmlc
JINJA ?= jinja2

JINJA_FLAGS ?= --strict
OPENTTD_USER_DIR ?= $${XDG_DATA_HOME:-$$HOME/.local/share}/openttd

GRF_NAME ?= romanian_stations


$(GRF_NAME).grf: $(GRF_NAME).nml $(wildcard img/*.png) $(wildcard lang/*.lng)
	$(NMLC) --grf $(GRF_NAME).grf $(GRF_NAME).nml

$(GRF_NAME).nml: $(wildcard src/*.jnml)
	$(JINJA) $(JINJA_FLAGS) src/$(GRF_NAME).jnml > $(GRF_NAME).nml

.PHONY: clean
clean:
	rm -f $(GRF_NAME).grf $(GRF_NAME).nml

.PHONY: install
install: $(GRF_NAME).grf
	install -Dm644 $(GRF_NAME).grf $(OPENTTD_USER_DIR)/newgrf/$(GRF_NAME).grf
