LOCATION="${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}"

IDENTITY="${CODE_SIGN_IDENTITY}"
if [ "$IDENTITY" == "" ]; then
    IDENTITY="-"
fi

SPARKLE="${LOCATION}/Sparkle.framework"

if [ -d "${SPARKLE}/Versions/A/XPCServices" ]; then
    for xpc in "${SPARKLE}/Versions/A/XPCServices"/*.xpc; do
        codesign --verbose --force -o runtime --sign "$IDENTITY" "$xpc"
    done
fi

if [ -d "${SPARKLE}/Versions/A/Updater.app" ]; then
    codesign --verbose --force --deep -o runtime --sign "$IDENTITY" "${SPARKLE}/Versions/A/Updater.app"
fi

codesign --verbose --force -o runtime --sign "$IDENTITY" "${SPARKLE}/Versions/A"
