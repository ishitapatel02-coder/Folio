import Foundation
import CallKit

class CallKitManager: NSObject {
    static let shared = CallKitManager()

    private let provider: CXProvider
    private let callController = CXCallController()

    private override init() {
        let config = CXProviderConfiguration(localizedName: "Folio Demo")
        config.supportsVideo = true
        config.maximumCallsPerCallGroup = 1
        config.supportedHandleTypes = [.phoneNumber]
        provider = CXProvider(configuration: config)

        super.init()
        provider.setDelegate(self, queue: nil)
    }

    func startCall(handle: String) {
        let callHandle = CXHandle(type: .phoneNumber, value: handle)
        let startCallAction = CXStartCallAction(call: UUID(), handle: callHandle)
        let transaction = CXTransaction(action: startCallAction)
        requestTransaction(transaction)
    }

    func end(call uuid: UUID) {
        let endAction = CXEndCallAction(call: uuid)
        let transaction = CXTransaction(action: endAction)
        requestTransaction(transaction)
    }

    private func requestTransaction(_ transaction: CXTransaction) {
        callController.request(transaction) { error in
            if let error = error {
                print("Error requesting transaction: \(error)")
            }
        }
    }
}

extension CallKitManager: CXProviderDelegate {
    func provider(_ provider: CXProvider, perform action: CXStartCallAction) {
        // handle start call
        action.fulfill()
    }

    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        // handle end call
        action.fulfill()
    }

    func providerDidReset(_ provider: CXProvider) {}
}
