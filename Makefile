.PHONY: build clean

GOBUILD=CGO_ENABLED=0 go build -trimpath -ldflags '-s -w -buildid='
GOSRC=main.go go.mod

webapi-template.gz: $(GOSRC)
	$(GOBUILD) -o webapi-template
	gzip webapi-template

clean:
	rm -rf webapi-template.gz

build: webapi-template.gz
