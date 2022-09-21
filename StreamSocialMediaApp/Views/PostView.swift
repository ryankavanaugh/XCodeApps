//
//  PostView.swift
//  StreamSocialMediaApp
//
//  Created by Stefan Blos on 21.09.22.
//

import SwiftUI
import StreamChatSwiftUI

struct PostView: View {
    
    @Injected(\.images) var images
    
    let post: Post
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 8) {
                Image(post.profileImageName)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                
                Text(post.userName)
                    .font(.headline)
                
                Spacer()
                
                Button {
                    // Nothing to do
                } label: {
                    Image(systemName: "ellipsis")
                        .frame(width: 34, height: 34)
                        .foregroundColor(.black)
                        .background(Color.gray.opacity(0.3))
                        .clipShape(Circle())
                        .scaledToFit()
                        .rotationEffect(.degrees(90))
                }
                .padding()

            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
            
            Image(post.imageName)
                .resizable()
                .scaledToFill()
            
            HStack {
                Button {
                    // Nothing to do
                } label: {
                    Image(systemName: "heart")
                        .frame(width: 34, height: 34)
                        .foregroundColor(.black)
                        .background(Color.gray.opacity(0.3))
                        .clipShape(Circle())
                        .scaledToFit()
                }
                
                Button {
                    // Nothing to do
                } label: {
                    Image(systemName: "paperplane")
                        .frame(width: 34, height: 34)
                        .foregroundColor(.black)
                    
                        .background(Color.gray.opacity(0.3))
                        .clipShape(Circle())
                        .scaledToFit()
                }

                Spacer()
                
                Text("\(post.likes) likes")
                    .bold()
            }
            .padding(.horizontal)
            
            HStack(alignment: .top, spacing: 20) {
                Text(post.userName)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
                
                Text(post.text)
                    .lineLimit(nil)
                
                Spacer()
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            
            HStack(alignment: .bottom) {
                Button {
                    // Nothing to do
                } label: {
                    Text("View All Comments")
                        .foregroundColor(.primary)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.gray.opacity(0.3))
                        .clipShape(Capsule())
                }
                
                Spacer()
                
                Text(post.timePosted)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
        }
        .padding(.bottom)
        .listRowInsets(EdgeInsets())
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: posts.first!)
    }
}
