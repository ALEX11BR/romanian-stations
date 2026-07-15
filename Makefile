PHP ?= php
NMLC ?= nmlc
JINJA ?= jinja2

OPENTTD_USER_DIR ?= $${XDG_DATA_HOME:-$$HOME/.local/share}/openttd

GRF_NAME ?= romanian-stations


$(GRF_NAME).grf: main.nml $(wildcard img/*.png) $(wildcard lang/*.lng)
	$(NMLC) --grf $(GRF_NAME).grf main.nml

main.nml: $(wildcard src/*.phpnml src/**/*.phpnml)
	$(PHP) src/main.phpnml > main.nml

alt.nml: $(wildcard src/*.jinja src/**/*.jinja)
	$(JINJA) src/main.jinja > alt.nml

.PHONY: clean
clean:
	rm -f $(GRF_NAME).grf main.nml

.PHONY: install
install: $(GRF_NAME).grf
	install -Dm644 $(GRF_NAME).grf $(OPENTTD_USER_DIR)/newgrf/$(GRF_NAME).grf
