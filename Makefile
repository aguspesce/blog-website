# Construye tu sitio web en texto-plano con Jekyll
# ------------------------------------------------
BUILD_DIR = _site
DEPLOY_DIR = $(HOME)/public_html
RSYNC = rsync
RSYNC_ARGS = -av

# Determina qué comando utilizar para llamar a jekyll
ifeq (, $(shell which jekyll26 2> /dev/null))
	JEKYLL = bundle exec jekyll
else
	JEKYLL = jekyll26
endif



all: build

build:
	$(JEKYLL) build

serve:
	$(JEKYLL) serve

clean:
	$(JEKYLL) clean

deploy: build $(DEPLOY_DIR)
	$(RSYNC) $(RSYNC_ARGS) $(BUILD_DIR)/ $(DEPLOY_DIR)

