/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

import Cocoa
import KeyboardShortcuts
import Sparkle
import Defaults
import Preferences


final class AppDelegate: NSObject, NSApplicationDelegate {
    // Retained for app lifetime — Sparkle 2.x requirement
    let updaterController = SPUStandardUpdaterController(
        startingUpdater: true,
        updaterDelegate: nil,
        userDriverDelegate: nil
    )

    func applicationDidFinishLaunching(_: Notification) {
        KeyboardShortcuts.onKeyUp(for: .toggleDozerIcons) {
            DozerIcons.shared.toggle()
        }

        _ = DozerIcons.shared
        DozerIcons.shared.hideAtLaunch()
        _ = DozerIcons.toggleDockIcon(showIcon: false)
    }

    func applicationOpenUntitledFile(_ sender: NSApplication) -> Bool {
        DozerIcons.shared.showAll()
        return true
    }

    lazy var preferences: [PreferencePane] = [
        Dozer(),
        General()
    ]

    lazy var preferencesWindowController = PreferencesWindowController(
        preferencePanes: preferences,
        style: .toolbarItems,
        animated: true,
        hidesToolbarForSingleItem: true
    )
}
