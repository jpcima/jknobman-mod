ASPECTJ ?= /opt/aspectj/bin/ajc
ASPECTJ_HOME ?= /opt/aspectj
INJAR = JKnobMan.jar
OUTJAR = JKnobMan-mod.jar
SRCS = \
  sources/KnobmanXdgConfig.aj

ifneq ($(shell test -f $(INJAR) && echo 1),1)
$(error The input file "$(INJAR)" is missing, please copy it in the folder)
endif

all: $(OUTJAR)

clean:
	rm -f $(OUTJAR)

.PHONY: all clean

$(OUTJAR): $(INJAR) $(SRCS)
	$(ASPECTJ) \
	    -outjar $@ \
	    -inpath $(INJAR):$(ASPECTJ_HOME)/lib/aspectjrt.jar \
	    $(SRCS)
