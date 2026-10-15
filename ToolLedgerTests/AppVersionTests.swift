import XCTest
@testable import ToolLedger

final class AppVersionTests: XCTestCase {
    func testFormatsVersionAndBuildAfterTrimmingWhitespace() {
        XCTAssertEqual(AppVersion(version: " 0.1.0\n", build: " 7 ").label, "Version 0.1.0 (7)")
    }

    func testOmitsAbsentOrBlankBuild() {
        for build: String? in [nil, "", " \n"] {
            XCTAssertEqual(AppVersion(version: "0.1.0", build: build).label, "Version 0.1.0")
        }
    }

    func testMissingVersionFallsBackEvenWhenBuildExists() {
        for version: String? in [nil, "", " \n"] {
            XCTAssertEqual(AppVersion(version: version, build: "7").label, "Development build")
        }
    }
}
