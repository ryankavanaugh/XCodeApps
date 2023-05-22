//
//  SocialChannelListHeader.swift
//  StreamSocialMediaApp
//
//  Created by Ryan Kavanaugh on 7/27/22.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

struct SocialChannelListHeader: ToolbarContent {
    
    var currentUserController: CurrentChatUserController
    @Binding var isNewChatShown: Bool
    
    var title: String
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading){
            Button {
                //TBD
            }label: {
            Text("Edit")
            }
        }
        
        ToolbarItem(placement: .principal) {
            Text(title)
                .bold()
            
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                isNewChatShown = true
            } label: {
                Image(systemName: "square.and.pencil")
            }
        }
    }
}




struct SocialChannelModifier: ChannelListHeaderViewModifier {
    
    @Injected(\.chatClient) var chatClient
    
    var title: String
    
    var currentUserController: CurrentChatUserController
    var viewFactory: SocialViewFactory
    
    @State var isNewChatShown = false
    
    func body(content: Content) -> some View {
        ZStack {
            content.toolbar {
                SocialChannelListHeader(currentUserController: currentUserController, isNewChatShown: $isNewChatShown, title: title
                )
            }
            
            NavigationLink(isActive: $isNewChatShown) {
                NewChatView(viewFactory: viewFactory, isNewChatShown: $isNewChatShown)
            } label: {
                EmptyView()
            }
            .isDetailLink(false)
        }
    }
}
