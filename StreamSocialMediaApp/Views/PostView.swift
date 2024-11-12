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
        VStack(spacing: 5) {
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
//                        .background(Color.gray.opacity(0.09))
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
                    // Like
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .scaledToFit()
                        .padding(7)
                        .foregroundColor(.black)
//                        .background(Color.gray.opacity(0.09))
//                        .clipShape(Circle())
                    
                     
                }
                
                Button {
                    // Message
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .frame(width: 27, height: 27)
                        .scaledToFit()
                        .padding(8)
                        .foregroundColor(.black)
//                        .background(Color.gray.opacity(0.09))
//                        .clipShape(Circle())
                }

                Spacer()
                
                Text("\(post.likes) likes")
                    .bold()
//                    .font(.caption)
            }
            .padding(.horizontal)
            
            HStack(alignment: .top, spacing: 9) {
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
                        .foregroundColor(Color.gray.opacity(0.99))
                        .padding(.horizontal, 9)
                        .padding(.vertical, 5)
                        .background(Color.green.opacity(0.1))
                        .clipShape(Capsule())
                }
                
                Spacer()
                
                
                
            }
            .padding(.horizontal)
            
            HStack {
                Spacer()
                Text(post.timePosted)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
            }.padding(.horizontal)
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
