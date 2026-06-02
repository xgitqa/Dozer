import XCTest
import Defaults
@testable import Dozer

final class DefaultsKeysTests: XCTestCase {

    override func setUp() {
        super.setUp()
        Defaults.reset(
            .hideOnLogin,
            .hideAtLaunchEnabled,
            .hideAfterDelayEnabled,
            .hideAfterDelay,
            .noIconMode,
            .removeDozerIconEnabled,
            .showIconAndMenuEnabled,
            .iconSize,
            .buttonPadding,
            .animationEnabled,
            .isShortcutSet
        )
    }

    func testDefaultValues() {
        XCTAssertFalse(Defaults[.hideOnLogin])
        XCTAssertFalse(Defaults[.hideAtLaunchEnabled])
        XCTAssertFalse(Defaults[.hideAfterDelayEnabled])
        XCTAssertEqual(Defaults[.hideAfterDelay], 10, accuracy: 0.001)
        XCTAssertFalse(Defaults[.noIconMode])
        XCTAssertFalse(Defaults[.removeDozerIconEnabled])
        XCTAssertFalse(Defaults[.showIconAndMenuEnabled])
        XCTAssertEqual(Defaults[.iconSize], 10)
        XCTAssertEqual(Defaults[.buttonPadding], 25, accuracy: 0.001)
        XCTAssertFalse(Defaults[.animationEnabled])
        XCTAssertFalse(Defaults[.isShortcutSet])
    }

    func testBoolRoundTrip() {
        Defaults[.hideAtLaunchEnabled] = true
        XCTAssertTrue(Defaults[.hideAtLaunchEnabled])

        Defaults[.hideAfterDelayEnabled] = true
        XCTAssertTrue(Defaults[.hideAfterDelayEnabled])

        Defaults[.noIconMode] = true
        XCTAssertTrue(Defaults[.noIconMode])

        Defaults[.isShortcutSet] = true
        XCTAssertTrue(Defaults[.isShortcutSet])
    }

    func testNumericRoundTrip() {
        Defaults[.hideAfterDelay] = 30
        XCTAssertEqual(Defaults[.hideAfterDelay], 30, accuracy: 0.001)

        Defaults[.iconSize] = 16
        XCTAssertEqual(Defaults[.iconSize], 16)

        Defaults[.buttonPadding] = 10
        XCTAssertEqual(Defaults[.buttonPadding], 10, accuracy: 0.001)
    }

    func testResetRestoresDefaults() {
        Defaults[.hideAfterDelay] = 999
        Defaults[.iconSize] = 42
        Defaults.reset(.hideAfterDelay, .iconSize)
        XCTAssertEqual(Defaults[.hideAfterDelay], 10, accuracy: 0.001)
        XCTAssertEqual(Defaults[.iconSize], 10)
    }

    // Regression: key "animationEnabeld" has a typo — ensure it stays stable
    // so existing user prefs are not lost on update.
    func testAnimationKeyStorageNameIsStable() {
        Defaults[.animationEnabled] = true
        let raw = UserDefaults.standard.bool(forKey: "animationEnabeld")
        XCTAssertTrue(raw, "Storage key 'animationEnabeld' must not be renamed — would break existing user prefs")
    }
}
