import CoreGraphics
@testable import DockDoor
import Testing

struct DockClickRoutingTests {
    @Test func controlClickKeepsTheNativeContextMenu() {
        #expect(!DockObserver.isPrimaryDockClick(type: .leftMouseDown, flags: .maskControl))
        #expect(!DockObserver.isPrimaryDockClick(type: .leftMouseDown, flags: [.maskControl, .maskShift]))
    }

    @Test func ordinaryLeftClickStillUsesDockClickHandling() {
        #expect(DockObserver.isPrimaryDockClick(type: .leftMouseDown, flags: []))
        #expect(!DockObserver.isPrimaryDockClick(type: .rightMouseDown, flags: []))
    }
}
