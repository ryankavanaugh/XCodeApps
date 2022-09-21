//
//  CreateInstaAttachmentView.swift
//  StreamSocialMediaApp
//
//  Created by Stefan Blos on 20.09.22.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

struct CreateInstaAttachmentView: View {
    
    var onCustomAttachmentTap: (CustomAttachment) -> Void
    
    var body: some View {
        AttachmentTypeContainer {
            VStack(alignment: .leading) {
                Text("Insta Post")
                    .font(.headline)
                    .standardPadding()
                
                Divider()
                
                Image("PostMsg")
                    .resizable()
                    .scaledToFit()
                
                Divider()
                
                HStack {
                    Spacer()
                
                    Button {
                        onCustomAttachmentTap(CustomAttachment(id: UUID().uuidString, content: AnyAttachmentPayload(payload: InstaAttachmentPayload())))
                    } label: {
                        Text("Send")
                    }
                    .buttonStyle(.bordered)
                }
                .standardPadding()
            }
        }
    }
}

struct CreateInstaAttachmentView_Previews: PreviewProvider {
    static var previews: some View {
        CreateInstaAttachmentView { _ in }
    }
}
