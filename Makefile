PROJECT_NAME=vim-eighties
PACKAGE_NAME=$(PROJECT_NAME).zip
INSTALL_LOCATION=~/.vim/bundle/$(PROJECT_NAME)

$(PACKAGE_NAME): clean
	git ls-files | xargs zip $(PACKAGE_NAME)

clean:
	rm -f $(PACKAGE_NAME)

install: $(PACKAGE_NAME)
	rm -rf $(INSTALL_LOCATION)
	unzip $(PACKAGE_NAME) -d $(INSTALL_LOCATION)

.PHONY: clean install
