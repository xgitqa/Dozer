import XCTest
@testable import Dozer

final class ConstantsTests: XCTestCase {

    func testUserDefaultKeysShortcuts() {
        XCTAssertEqual(UserDefaultKeys.Shortcuts.ToggleMenuItems, "toggleMenuItems")
    }

    func testStatusIconActionCases() {
        let actions: [StatusIconAction] = [.show, .hide, .toggle]
        XCTAssertEqual(actions.count, 3)
    }

    func testStatusIconTypeCases() {
        let types: [StatusIconType] = [.normal, .remove]
        XCTAssertEqual(types.count, 2)
    }

    func testDozerIconCases() {
        let icons: [DozerIcon] = [.remove, .normalLeft, .normalRight]
        XCTAssertEqual(icons.count, 3)
    }
}
