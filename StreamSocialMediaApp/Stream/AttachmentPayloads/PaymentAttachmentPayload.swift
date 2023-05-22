//
//  PaymentAttachmentPayload.swift
//  StreamSocialMediaApp
//
//  Created by Stefan Blos on 19.05.23.
//

import Foundation
import StreamChat
import StreamChatSwiftUI

enum PaymentState: String, Codable {
    case requested = "request", processing = "processing", done = "done"
}

struct PaymentAttachmentPayload: AttachmentPayload, Identifiable {
    static let type: AttachmentType = .payment
    
    var id: String = UUID().uuidString
    var amount: Int
}

extension PaymentAttachmentPayload {
    
    static var preview: PaymentAttachmentPayload = PaymentAttachmentPayload(amount: 25)
}
