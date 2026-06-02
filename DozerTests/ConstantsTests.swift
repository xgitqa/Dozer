import XCTest
@testable import Dozer

final class ConstantsTests: XCTestCase {

    // MARK: - UserDefaultKeys

    func testShortcutKeyIsStable() {
        // Changing this would silently erase users' saved shortcuts on update.
        XCTAssertEqual(UserDefaultKeys.Shortcuts.ToggleMenuItems, "toggleMenuItems")
    }

    // MARK: - Enums

    func testStatusIconActionAllCases() {
        let all: [StatusIconAction] = [.show, .hide, .toggle]
        XCTAssertEqual(all.count, 3)

        // Verify no two cases accidentally alias each other
        func idx(_ a: StatusIconAction) -> Int {
            switch a { case .show: return 0; case .hide: return 1; case .toggle: return 2 }
        }
        XCTAssertEqual(idx(.show), 0)
        XCTAssertEqual(idx(.hide), 1)
        XCTAssertEqual(idx(.toggle), 2)
    }

    func testStatusIconTypeAllCases() {
        let all: [StatusIconType] = [.normal, .remove]
        XCTAssertEqual(all.count, 2)
    }

    func testDozerIconAllCases() {
        let all: [DozerIcon] = [.remove, .normalLeft, .normalRight]
        XCTAssertEqual(all.count, 3)
    }

    // MARK: - Preferences pane identifiers

    func testPaneIdentifiers() {
        XCTAssertEqual(Preferences.PaneIdentifier.dozer.rawValue, "dozer")
        XCTAssertEqual(Preferences.PaneIdentifier.general.rawValue, "general")
    }

    // MARK: - AppInfo

    func testBundleIdentifierNonEmpty() {
        // In a test host build, main bundle identifier is the app's.
        // Just verifies it resolves without crashing.
        let id = Bundle.main.bundleIdentifier
        XCTAssertNotNil(id)
        XCTAssertFalse(id!.isEmpty)
    }
}
