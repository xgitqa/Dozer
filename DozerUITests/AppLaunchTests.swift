import XCTest

/// End-to-end tests — launch the real app binary and verify it stays alive.
/// Dozer is a menu-bar agent (LSUIElement); it runs as runningBackground,
/// not runningForeground, so we check for either active state.
final class AppLaunchTests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    func testAppLaunchesWithoutCrashing() {
        let app = XCUIApplication()
        app.launch()

        // Agent/LSUIElement apps reach runningBackground, not runningForeground.
        // Poll for up to 10s for any running state.
        let deadline = Date().addingTimeInterval(10)
        var running = false
        while Date() < deadline {
            let s = app.state
            if s == .runningForeground || s == .runningBackground {
                running = true
                break
            }
            Thread.sleep(forTimeInterval: 0.5)
        }
        XCTAssertTrue(running, "App should be running (foreground or background) within 10s; got \(app.state.rawValue)")
    }

    func testAppRemainsStableAfterLaunch() {
        let app = XCUIApplication()
        app.launch()

        // Wait for the app to start
        let deadline = Date().addingTimeInterval(10)
        while Date() < deadline {
            if app.state == .runningForeground || app.state == .runningBackground { break }
            Thread.sleep(forTimeInterval: 0.5)
        }

        // Pause, then confirm it hasn't crashed
        Thread.sleep(forTimeInterval: 2)
        XCTAssertNotEqual(app.state, .notRunning, "App should not crash within 2s of launch")
    }
}
