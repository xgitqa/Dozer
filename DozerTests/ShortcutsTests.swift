import XCTest
import KeyboardShortcuts
@testable import Dozer

final class ShortcutsTests: XCTestCase {

    func testToggleDozerIconsNameIsStable() {
        // "toggleDozerIcons" is persisted to UserDefaults as the shortcut key.
        // Renaming it silently erases users' saved shortcuts on update.
        XCTAssertEqual(KeyboardShortcuts.Name.toggleDozerIcons.rawValue, "toggleDozerIcons")
    }

    func testShortcutInitiallyUnset() {
        // In a clean test environment no shortcut should be pre-configured.
        // (KeyboardShortcuts stores per-app in UserDefaults.)
        KeyboardShortcuts.reset(.toggleDozerIcons)
        XCTAssertNil(KeyboardShortcuts.getShortcut(for: .toggleDozerIcons))
    }

    func testShortcutCanBeSetAndCleared() {
        let shortcut = KeyboardShortcuts.Shortcut(.a, modifiers: [.command, .shift])
        KeyboardShortcuts.setShortcut(shortcut, for: .toggleDozerIcons)
        XCTAssertEqual(KeyboardShortcuts.getShortcut(for: .toggleDozerIcons), shortcut)

        KeyboardShortcuts.reset(.toggleDozerIcons)
        XCTAssertNil(KeyboardShortcuts.getShortcut(for: .toggleDozerIcons))
    }
}
