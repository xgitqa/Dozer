import XCTest

/// End-to-end tests — launch the real app binary and verify it stays alive.
/// These run against the built Dozer.app via XCUIApplication.
final class AppLaunchTests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    func testAppLaunchesWithoutCrashing() {
        let app = XCUIApplication()
        app.launch()

        // Allow up to 5 seconds for the app to finish launching.
        // A menu bar app has no windows; we just verify the process is alive.
        let launched = app.wait(for: .runningForeground, timeout: 5)
        XCTAssertTrue(launched, "App should reach runningForeground state within 5s")
    }

    func testAppRemainsStableAfterLaunch() {
        let app = XCUIApplication()
        app.launch()

        _ = app.wait(for: .runningForeground, timeout: 5)

        // Wait 2 seconds and confirm the process hasn't terminated.
        Thread.sleep(forTimeInterval: 2)
        XCTAssertNotEqual(app.state, .notRunning, "App should not crash within 2s of launch")
    }
}
