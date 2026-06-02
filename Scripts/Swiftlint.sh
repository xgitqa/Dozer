if which swiftlint >/dev/null; then
  swiftlint --no-cache || true
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
