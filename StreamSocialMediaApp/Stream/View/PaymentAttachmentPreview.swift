//
//  PaymentAttachmentPreview.swift
//  StreamSocialMediaApp
//
//  Created by Stefan Blos on 22.05.23.
//

import SwiftUI

struct PaymentAttachmentPreview: View {
    
    let payload: PaymentAttachmentPayload
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Request money")
                .font(.headline)
            
            HStack {
                Spacer()
                
                Text("\(payload.amount) $")
                    .font(.largeTitle)
            }
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            LinearGradient.payment,
            in: RoundedRectangle(
                cornerRadius: 10,
                style: .continuous
            )
        )
        .padding()
    }
}

struct PaymentAttachmentPreview_Previews: PreviewProvider {
    static var previews: some View {
        PaymentAttachmentPreview(
            payload: PaymentAttachmentPayload(amount: 25)
        )
    }
}
