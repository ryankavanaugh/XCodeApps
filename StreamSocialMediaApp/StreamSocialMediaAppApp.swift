//
//  StreamSocialMediaAppApp.swift
//  StreamSocialMediaApp
//
//  Created by Ryan Kavanaugh on 7/27/22.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

@main
struct StreamSocialMediaAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//            ChatChannelListView(viewFactory: SocialViewFactory)
//            ChatChannelListView()
//            ChatView()
        }
    }
}
