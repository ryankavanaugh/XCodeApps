//
//  CustomAttachmentView.swift
//  StreamSocialMediaApp
//
//  Created by Stefan Blos on 19.05.23.
//

import SwiftUI
import StreamChatSwiftUI

struct CustomAttachmentView: View {
    
    @Binding var selectedCustomAttachment: SelectedCustomAttachment
    @ObservedObject var viewModel: AttachmentsViewModel
    
    var body: some View {
        switch selectedCustomAttachment {
        case .none:
            Text("Unknown attachment selected.")
        case .payment:
            PaymentAttachmentPickerView(viewModel: viewModel)
        }
    }
}

struct CustomAttachmentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAttachmentView(selectedCustomAttachment: .constant(.payment), viewModel: AttachmentsViewModel())
    }
}
