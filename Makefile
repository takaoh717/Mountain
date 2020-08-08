.PHONY: setup-mac
setup-mac:
	brew bundle

.PHONY: install-mint
install-mint: # Install Mint dependencies
	mint bootstrap

.PHONY: update-mac-app
update-mac-app:
	brew cask upgrade

.PHONY: install-bundler
install-bundler: # Install Bundler dependencies
	bundle config path vendor/bundle
	bundle install --jobs 4 --retry 3

.PHONY: install-cocoapods
install-cocoapods: # Install CocoaPods dependencies and generate workspace
	bundle exec pod install

.PHONY: update-cocoapods
update-cocoapods: # Update CocoaPods dependencies and generate workspace
	bundle exec pod update

.PHONY: install-carthage
install-carthage: # Install Carthage dependencies
	mint run carthage carthage bootstrap --platform iOS --cache-builds
	$(MAKE) show-carthage-dependencies

.PHONY: update-carthage
update-carthage: # Update Carthage dependencies
	mint run carthage carthage update --platform iOS
	$(MAKE) show-carthage-dependencies

.PHONY: clean
clean: # Delete cache
	xcodebuild clean -alltargets
	rm -rf ./Pods
	rm -rf ./Carthage
	rm -rf ./vendor/bundle
	rm -rf ./Templates
