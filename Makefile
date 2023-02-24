# Running the app in different environments
# runs the app in development
.PHONY: run-dev
run-dev:
	flutter run --target lib/application/bin/environments/main_development.dart --flavor development

# runs in staging
.PHONY: run-staging
run-staging:
	flutter run --target lib/application/bin/environments/main_uat.dart --flavor uat --release


# runs in production
.PHONY: run-production
run-production:
	flutter run --target lib/application/bin/environments/main_production.dart --flavor production --release

.PHONY: generate
generate:
	flutter pub run build_runner build --delete-conflicting-outputs



# Generate app icons for each platform
.PHONY: generate-icons
generate-icons:
	flutter pub run flutter_launcher_icons:main -f config/icons/flutter_launcher_icons*


# run tests
.PHONY: test
test:
	rm -rf coverage* && \
	flutter analyze && flutter test --coverage test/ && \
	lcov --remove coverage/lcov.info 'lib/**/*.g.dart' -o coverage/lcov.info && \
    lcov --remove coverage/lcov.info 'lib/**/*.freezed.dart' -o coverage/lcov.info && \
    genhtml -q -o coverage coverage/lcov.info && \
	google-chrome coverage/index.html


### Example
# make test-file this=<file-path>
###
.PHONY: test-file
test-file:
	rm -rf coverage* && \
	flutter test --coverage $(this) && lcov --remove coverage/lcov.info 'lib/**/*.g.dart' -o coverage/lcov.info && \
    lcov --remove coverage/lcov.info 'lib/**/*.freezed.dart' -o coverage/lcov.info && \
    lcov --remove coverage/lcov.info 'lib/**/*.gr.dart' -o coverage/lcov.info && \
    genhtml -q -o coverage coverage/lcov.info && \
	google-chrome coverage/index.html


# generate flutter splash screens
.PHONY: generate-splash
generate-splash:
	flutter pub run flutter_native_splash:create --flavor development --path=config/splash_screens/flutter_native_splash-development.yaml
	flutter pub run flutter_native_splash:create --flavor uat --path=config/splash_screens/flutter_native_splash-uat.yaml
	flutter pub run flutter_native_splash:create --flavor production --path=config/splash_screens/flutter_native_splash-production.yaml


# dev build
.PHONY: build-debug-dev
build-debug-dev:
	flutter build apk -t lib/application/bin/environments/main_development.dart --flavor development --build-number 1 --dart-define=APP_VERSION=1.0.0 --obfuscate --split-debug-info='(pwd)/dump' --build-name='1.0.0'

# uat build
.PHONY: build-prod-uat
build-prod-uat:
	flutter build apk -t lib/application/bin/environments/main_staging.dart --flavor staging --release --build-number 1 --dart-define=APP_VERSION=1.0.0 --obfuscate --split-debug-info='(pwd)/dump' --build-name='1.0.0'



# prod build
.PHONY: build-prod-apk
build-prod-apk:
	flutter build apk -t lib/application/bin/environments/main_production.dart --flavor production --release --build-number 1 --dart-define=APP_VERSION=1.0.0 --obfuscate --split-debug-info='(pwd)/dump' --build-name='1.0.0'


# prod build app bundle
.PHONY: build-prod-app-bundle
build-prod-app-bundle:
	flutter build appbundle --flavor production --release -t lib/application/bin/environments/main_production.dart --build-number 1 --dart-define=APP_VERSION=1.0.0 --obfuscate --split-debug-info='(pwd)/dump' --build-name='1.0.0'

