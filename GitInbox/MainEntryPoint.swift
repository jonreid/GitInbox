import SwiftUI

@main
struct MainEntryPoint {
    static func main() {
        guard NSClassFromString("XCTestCase") == nil else {
            TestApp.main()
            return
        }

        GitInboxApp.main()
    }
}
