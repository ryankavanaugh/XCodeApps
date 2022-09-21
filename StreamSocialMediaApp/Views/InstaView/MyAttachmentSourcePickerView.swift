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
    var onTap: (AttachmentPickerState) -> Void
    
    var body: some View {
        HStack {
            AttachmentPickerButton(icon: UIImage(systemName: "photo")!, pickerType: .photos, isSelected: selected == .photos, onTap: onTap)
            
            AttachmentPickerButton(icon: UIImage(systemName: "folder")!, pickerType: .files, isSelected: selected == .files, onTap: onTap)
            
            AttachmentPickerButton(icon: UIImage(systemName: "camera.aperture")!, pickerType: .custom, isSelected: selected == .custom, onTap: onTap)
        }
    }
}

struct MyAttachmentSourcePickerView_Previews: PreviewProvider {
    static var previews: some View {
        MyAttachmentSourcePickerView(selected: .custom) { _ in }
    }
}
