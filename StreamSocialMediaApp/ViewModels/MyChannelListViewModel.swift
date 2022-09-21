//
//  MyChannelListViewModel.swift
//  StreamSocialMediaApp
//
//  Created by Stefan Blos on 21.09.22.
//

import Foundation
import StreamChat
import StreamChatSwiftUI

class MyChannelListViewModel: ChatChannelListViewModel {
    
    @Injected(\.chatClient) var chatClient
    
    func sendCustomAttachmentMessage() {
        guard let selectedChannelId = selectedChannel?.id else {
            print("Selected channel ID couldn't be retrieved")
            return
        }
        let channelId = ChannelId(type: .messaging, id: selectedChannelId)
        
        chatClient.channelController(for: channelId).createNewMessage(text: "", attachments: [AnyAttachmentPayload(payload: InstaAttachmentPayload())])
    }
}
