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
        let instaAttachments = message.attachments(payloadType: InstaAttachmentPayload.self)
        let paymentAttachments = message.attachments(payloadType: PaymentAttachmentPayload.self)
        return instaAttachments.count > 0 || paymentAttachments.count > 0
    }
}
