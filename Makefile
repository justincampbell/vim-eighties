PACKAGE_NAME=vim-eighties.zip

all: clean package

clean:
	rm -f $(PACKAGE_NAME)

package:
	git ls-files | xargs zip $(PACKAGE_NAME)
