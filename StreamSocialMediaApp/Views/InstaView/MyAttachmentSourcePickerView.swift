//
//  MyAttachmentSourcePickerView.swift
//  StreamSocialMediaApp
//
//  Created by Stefan Blos on 20.09.22.
//

import SwiftUI
import StreamChatSwiftUI

struct MyAttachmentSourcePickerView: View {
    
    var selected: AttachmentPickerState
    @Binding var selectedCustomAttachment: SelectedCustomAttachment
    var onTap: (AttachmentPickerState) -> Void
    
    var body: some View {
        HStack(spacing: 20) {
            AttachmentPickerButton(icon: UIImage(systemName: "photo")!, pickerType: .photos, isSelected: selected == .photos, onTap: onTap)
            
            AttachmentPickerButton(icon: UIImage(systemName: "folder")!, pickerType: .files, isSelected: selected == .files, onTap: onTap)
            
            AttachmentPickerButton(icon: UIImage(systemName: "dollarsign.arrow.circlepath")!, pickerType: .custom, isSelected: selected == .custom && selectedCustomAttachment == .payment) { attachmentPickerState in
                selectedCustomAttachment = .payment
                onTap(attachmentPickerState)
            }
//
//            AttachmentPickerButton(icon: UIImage(systemName: "camera.aperture")!, pickerType: .custom, isSelected: selected == .custom, onTap: onTap)
        }
        .padding(.vertical, 10)
    }
}

struct MyAttachmentSourcePickerView_Previews: PreviewProvider {
    static var previews: some View {
        MyAttachmentSourcePickerView(selected: .custom, selectedCustomAttachment: .constant(.payment)) { _ in }
    }
}
