//
//  InstaAttachmentPayload.swift
//  StreamSocialMediaApp
//
//  Created by Stefan Blos on 20.09.22.
//

import Foundation
import StreamChat
import StreamChatSwiftUI

struct InstaAttachmentPayload: AttachmentPayload {
    static let type: AttachmentType = .insta
}

extension InstaAttachmentPayload: Identifiable {
    var id: String {
        UUID().uuidString
    }
}
