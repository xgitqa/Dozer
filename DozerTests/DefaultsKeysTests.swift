import XCTest
import Defaults
@testable import Dozer

final class DefaultsKeysTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Reset all defaults to factory values before each test
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

    func testRoundTrip() {
        Defaults[.hideAtLaunchEnabled] = true
        XCTAssertTrue(Defaults[.hideAtLaunchEnabled])

        Defaults[.hideAfterDelay] = 30
        XCTAssertEqual(Defaults[.hideAfterDelay], 30, accuracy: 0.001)

        Defaults[.iconSize] = 16
        XCTAssertEqual(Defaults[.iconSize], 16)

        Defaults[.buttonPadding] = 10
        XCTAssertEqual(Defaults[.buttonPadding], 10, accuracy: 0.001)
    }
}
