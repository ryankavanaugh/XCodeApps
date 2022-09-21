import StreamChat
import StreamChatSwiftUI
import UIKit
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {

    var streamChat: StreamChat?

    var chatClient: ChatClient = {
        var config = ChatClientConfig(apiKey: .init("nvp9bux7jbb8"))
        config.applicationGroupIdentifier = "group.io.getstream.iOS.ChatDemoAppSwiftUI"

        let client = ChatClient(config: config)
        return client
    }()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                        [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // The `StreamChat` instance we need to assign
        let messageTypeResolver = CustomMessageResolver()
        let utils = Utils(messageTypeResolver: messageTypeResolver)
        streamChat = StreamChat(chatClient: chatClient, utils: utils)

        // Calling the `connectUser` functions
        connectUser()

        return true
    }

    // The `connectUser` function we need to add.
    private func connectUser() {
        // This is a hardcoded token valid on Stream's tutorial environment.
        let token = try! Token(rawValue: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiQWRhbSJ9.uv9Kg6IEZfYC_Y0wA0luvtWBIBN-ytX-4nS-07q5i2w")

        // Call `connectUser` on our SDK to get started.
        chatClient.connectUser(
                userInfo: .init(id: "Adam"),
                token: token
        ) { error in
            if let error = error {
                // Some very basic error handling only logging the error.
                log.error("connecting the user failed \(error)")
                return
            }
        }
    }
}
