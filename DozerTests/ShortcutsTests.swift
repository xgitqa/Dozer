import XCTest
import KeyboardShortcuts
@testable import Dozer

final class ShortcutsTests: XCTestCase {

    func testToggleDozerIconsNameIsStable() {
        // Verifies the shortcut name string stays "toggleDozerIcons" across refactors.
        // Changing it would silently erase users' saved shortcuts on update.
        XCTAssertEqual(KeyboardShortcuts.Name.toggleDozerIcons.rawValue, "toggleDozerIcons")
    }
}
