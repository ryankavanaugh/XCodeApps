
import Foundation
import StreamChatSwiftUI
import StreamChat
import SwiftUI

class SocialViewFactory: ViewFactory {
    
    @ObservedObject private var attachmentsViewModel: AttachmentsViewModel
    
    init(attachmentsViewModel: AttachmentsViewModel) {
        self.attachmentsViewModel = attachmentsViewModel
    }
    
    @Injected(\.chatClient) var chatClient: ChatClient
    
    func makeChannelListHeaderViewModifier(title: String) -> SocialChannelModifier {
        SocialChannelModifier(title: "Nextdoor Messages", currentUserController: chatClient.currentUserController(), viewFactory: self)
    }
    
    func makeCustomAttachmentViewType(
        for message: ChatMessage,
        isFirst: Bool,
        availableWidth: CGFloat,
        scrolledId: Binding<String?>
    ) -> some View {
        // get possible attachments
        let paymentAttachments = message.attachments(payloadType: PaymentAttachmentPayload.self)
        let paymentState = PaymentState(rawValue: message.extraData["paymentState"]?.stringValue ?? "")
        let paymentDate = message.extraData["paymentDate"]?.stringValue

        return VStack {
            ForEach(paymentAttachments.indices) { [weak self] index in
                if let viewModel = self?.attachmentsViewModel, let paymentState {
                    PaymentAttachmentView(
                        viewModel: viewModel,
                        payload: paymentAttachments[index].payload,
                        paymentState: paymentState,
                        paymentDate: paymentDate,
                        messageId: message.id
                    )
                }
            }
        }
    }
    
    func makeLeadingComposerView(state: Binding<PickerTypeState>, channelConfig: ChannelConfig?) -> some View {
        attachmentsViewModel.closeAttachments = {
            state.wrappedValue = .expanded(.none)
        }
        return LeadingComposerView(viewModel: attachmentsViewModel, pickerTypeState: state, channelConfig: channelConfig)
    }
    
    func makeCustomAttachmentView(
        addedCustomAttachments: [CustomAttachment],
        onCustomAttachmentTap: @escaping (CustomAttachment) -> Void
    ) -> some View {
//        CreateInstaAttachmentView(onCustomAttachmentTap: onCustomAttachmentTap)
        CustomAttachmentView(selectedCustomAttachment: $attachmentsViewModel.selectedCustomAttachment, viewModel: attachmentsViewModel)
    }
    
    func makeAttachmentSourcePickerView(selected: AttachmentPickerState, onPickerStateChange: @escaping (AttachmentPickerState) -> Void) -> some View {
//        MyAttachmentSourcePickerView(
//            selected: selected,
//            selectedCustomAttachment: $attachmentsViewModel.selectedCustomAttachment,
//            onTap: onPickerStateChange
//        )
        attachmentsViewModel.onPickerStateChange = onPickerStateChange
        return EmptyView()
    }
    
    func makeCustomAttachmentPreviewView(
        addedCustomAttachments: [CustomAttachment],
        onCustomAttachmentTap: @escaping (CustomAttachment) -> Void
    ) -> some View {
        let paymentAttachments = addedCustomAttachments.compactMap { $0.content.payload as? PaymentAttachmentPayload }
        return VStack {
            // Show Payment attachments - if any
            ForEach(paymentAttachments) { paymentAttachment in
                PaymentAttachmentPreview(payload: paymentAttachment)
            }
        }
    }
    
}
