

CHART_LIST = $(sort $(dir $(wildcard ./charts/*/.)))

.PHONY: check
check:
	helm lint $(CHART_LIST)
