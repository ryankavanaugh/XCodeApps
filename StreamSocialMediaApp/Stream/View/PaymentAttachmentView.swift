//
//  PaymentAttachmentView.swift
//  StreamSocialMediaApp
//
//  Created by Stefan Blos on 22.05.23.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

struct PaymentAttachmentView: View {
    
    @ObservedObject var viewModel: AttachmentsViewModel
    
    var payload: PaymentAttachmentPayload
    var paymentState: PaymentState
    var paymentDate: String?
    var messageId: MessageId
    
    @State private var processing = false
    
    var title: String {
        switch paymentState {
        case .requested:
            return "Payment requested"
        case .processing:
            return "Processing payment"
        case .done:
            return "Payment done"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            HStack {
                Spacer()
                
                Text("\(payload.amount) $")
                    .font(.largeTitle)
                    .bold()
            }
            
            if paymentState == .requested {
                HStack {
                    Spacer()
                    
                    Button {
                        withAnimation {
                            processing = true
                        }
                        
//                        DispatchQueue.main.async
                        viewModel.updatePaymentPaid(
                            messageId: messageId,
                            amount: payload.amount
                        )
                    } label: {
                        Text("Pay")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            
            if paymentState == .done {
                HStack {
                    Spacer()
                    
                    Text("Payment done!")
                        .foregroundColor(.secondary)
                }
                
                if let dateString = paymentDate {
                    Text("Paid on: \(dateString)")
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient.payment,
            in: RoundedRectangle(
                cornerRadius: 10,
                style: .continuous
            )
        )
    }
}

struct PaymentAttachmentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentAttachmentView(
            viewModel: AttachmentsViewModel(),
            payload: .preview,
            paymentState: .requested,
            messageId: .init()
        )
        
        PaymentAttachmentView(
            viewModel: AttachmentsViewModel(),
            payload: .preview,
            paymentState: .done,
            paymentDate: Date().formatted(),
            messageId: .init()
        )
    }
}
