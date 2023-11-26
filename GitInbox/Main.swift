import SwiftUI

@main
struct Main {
    static func main() {
        if NSClassFromString("XCTestCase") != nil {
            TestApp.main()
        } else {
            GitInboxApp.main()
        }
    }
}
