
import Foundation
import StreamChatSwiftUI
import StreamChat
import SwiftUI

class SocialViewFactory: ViewFactory {
    
    private init() {}
    public static let shared = SocialViewFactory()
    
    @Injected(\.chatClient) var chatClient: ChatClient
    
    func makeChannelListHeaderViewModifier(title: String) -> SocialChannelModifier {
        SocialChannelModifier(title: "InstaStream Messages", currentUserController: chatClient.currentUserController())
    }
    
    func makeCustomAttachmentViewType(for message: ChatMessage, isFirst: Bool, availableWidth: CGFloat, scrolledId: Binding<String?>) -> some View {
        InstaAttachmentView()
    }
    
    func makeLeadingComposerView(state: Binding<PickerTypeState>, channelConfig: ChannelConfig?) -> some View {
        LeadingComposerView(pickerTypeState: state, channelConfig: channelConfig)
    }
    
    func makeCustomAttachmentView(addedCustomAttachments: [CustomAttachment], onCustomAttachmentTap: @escaping (CustomAttachment) -> Void) -> some View {
        CreateInstaAttachmentView(onCustomAttachmentTap: onCustomAttachmentTap)
    }
    
    func makeAttachmentSourcePickerView(selected: AttachmentPickerState, onPickerStateChange: @escaping (AttachmentPickerState) -> Void) -> some View {
        MyAttachmentSourcePickerView(selected: selected, onTap: onPickerStateChange)
    }
    
}
