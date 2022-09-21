//
//  CustomMessageResolver.swift
//  StreamSocialMediaApp
//
//  Created by Stefan Blos on 21.09.22.
//

import Foundation
import StreamChat
import StreamChatSwiftUI

class CustomMessageResolver: MessageTypeResolving {
    func hasCustomAttachment(message: ChatMessage) -> Bool {
        let attachments = message.attachments(payloadType: InstaAttachmentPayload.self)
        return attachments.count > 0
    }
}
