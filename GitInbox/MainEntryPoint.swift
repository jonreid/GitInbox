import SwiftUI

@main
struct MainEntryPoint {
    static func main() {
        if NSClassFromString("XCTestCase") != nil {
            TestApp.main()
            return
        }

        GitInboxApp.main()
    }
}
