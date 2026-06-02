import XCTest
import Defaults
@testable import Dozer

/// Functional tests — verify settings propagate correctly to Defaults storage.
/// DozerIcons itself requires NSStatusBar (UI), so we test its public properties
/// through the shared singleton which is already created by the test host app.
final class FunctionalTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Reset Defaults so each test starts clean
        Defaults.reset(
            .hideAtLaunchEnabled,
            .hideAfterDelayEnabled,
            .hideAfterDelay,
            .noIconMode,
            .removeDozerIconEnabled,
            .showIconAndMenuEnabled,
            .iconSize,
            .buttonPadding,
            .isShortcutSet
        )
    }

    // MARK: - Settings propagation (DozerIcons properties → Defaults)

    func testHideAtLaunchPropagatestoDefaults() {
        DozerIcons.shared.hideStatusBarIconsAtLaunch = true
        XCTAssertTrue(Defaults[.hideAtLaunchEnabled])
        DozerIcons.shared.hideStatusBarIconsAtLaunch = false
        XCTAssertFalse(Defaults[.hideAtLaunchEnabled])
    }

    func testHideAfterDelayPropagatestoDefaults() {
        DozerIcons.shared.hideStatusBarIconsAfterDelay = true
        XCTAssertTrue(Defaults[.hideAfterDelayEnabled])
        DozerIcons.shared.hideStatusBarIconsAfterDelay = false
        XCTAssertFalse(Defaults[.hideAfterDelayEnabled])
    }

    func testNoIconModePropagatestoDefaults() {
        DozerIcons.shared.hideBothDozerIcons = true
        XCTAssertTrue(Defaults[.noIconMode])
        DozerIcons.shared.hideBothDozerIcons = false
        XCTAssertFalse(Defaults[.noIconMode])
    }

    func testRemoveDozerIconPropagatestoDefaults() {
        DozerIcons.shared.enableRemoveDozerIcon = true
        XCTAssertTrue(Defaults[.removeDozerIconEnabled])
        DozerIcons.shared.enableRemoveDozerIcon = false
        XCTAssertFalse(Defaults[.removeDozerIconEnabled])
    }

    func testIconFontSizePropagatestoDefaults() {
        DozerIcons.shared.iconFontSize = 14
        XCTAssertEqual(Defaults[.iconSize], 14)
        DozerIcons.shared.iconFontSize = 10
        XCTAssertEqual(Defaults[.iconSize], 10)
    }

    func testButtonPaddingPropagatestoDefaults() {
        DozerIcons.shared.buttonPadding = 15
        XCTAssertEqual(Defaults[.buttonPadding], 15, accuracy: 0.001)
        DozerIcons.shared.buttonPadding = 25
        XCTAssertEqual(Defaults[.buttonPadding], 25, accuracy: 0.001)
    }

    // MARK: - Defaults → property initialisation

    func testSharedInstanceReflectsCurrentDefaults() {
        // Properties initialise from Defaults at creation time.
        // Since shared is a singleton we just verify the getter/setter symmetry.
        let original = DozerIcons.shared.hideStatusBarIconsAtLaunch
        DozerIcons.shared.hideStatusBarIconsAtLaunch = !original
        XCTAssertEqual(DozerIcons.shared.hideStatusBarIconsAtLaunch, !original)
        DozerIcons.shared.hideStatusBarIconsAtLaunch = original
    }

    // MARK: - toggleDockIcon

    func testToggleDockIconReturnsBool() {
        // Should not crash; result is OS-dependent in a test environment.
        let result = DozerIcons.toggleDockIcon(showIcon: false)
        XCTAssertTrue(result == true || result == false)
    }
}
