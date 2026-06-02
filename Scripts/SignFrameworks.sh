LOCATION="${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}"

IDENTITY="${CODE_SIGN_IDENTITY}"
if [ "$IDENTITY" == "" ]; then
    IDENTITY="-"
fi

SPARKLE="${LOCATION}/Sparkle.framework"

if [ ! -d "${SPARKLE}" ]; then
    exit 0
fi

# Sparkle 2.x (SPM) uses a flat framework layout — no Versions/A symlink
if [ -d "${SPARKLE}/Versions/A/XPCServices" ]; then
    SPARKLE_CONTENTS="${SPARKLE}/Versions/A"
elif [ -d "${SPARKLE}/XPCServices" ]; then
    SPARKLE_CONTENTS="${SPARKLE}"
else
    SPARKLE_CONTENTS=""
fi

if [ -n "${SPARKLE_CONTENTS}" ]; then
    for xpc in "${SPARKLE_CONTENTS}/XPCServices"/*.xpc; do
        [ -d "$xpc" ] && codesign --verbose --force -o runtime --sign "$IDENTITY" "$xpc"
    done
    if [ -d "${SPARKLE_CONTENTS}/Updater.app" ]; then
        codesign --verbose --force --deep -o runtime --sign "$IDENTITY" "${SPARKLE_CONTENTS}/Updater.app"
    fi
fi

codesign --verbose --force -o runtime --sign "$IDENTITY" "${SPARKLE}"
