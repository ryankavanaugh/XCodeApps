import SwiftUI
import StreamChat
import StreamChatSwiftUI

struct Post {
    let id: Int
    let userName, text, profileImageName, imageName: String
}

struct PostView: View {
    @State private var selectedTab = 1
    let post: Post
    let screenWidth: CGFloat
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image(post.profileImageName)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                Text(post.userName).font(.headline)
            }.padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
            Image(post.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 250)
                .clipped()
            Text(post.text)
                .lineLimit(nil)
                .font(.system(size: 15))
                .padding(.leading, 16).padding(.trailing, 16).padding(.bottom, 16)
        }.listRowInsets(EdgeInsets())
        
    }
}

struct Story {
    let id: Int
    let imageName: String
}

struct StoryView: View {
    let stories: [Story]
    var body: some View {
        HStack {
            ForEach(stories, id: \.id) { (story) in
                ZStack {
                    Circle()
                        .fill(Color.init(red: 193/255, green: 53/255, blue: 132/255))
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                    Circle()
                        .fill(Color.white)
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                    Image(story.imageName)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                }
            }
        }
    }
}

struct ContentView: View {
    
    @StateObject var viewModel = MyChannelListViewModel()
    
    let posts: [Post] = [
        Post(id: 1, userName: "Jacques", text: "Friday shoot. Big moood 🌙 \n", profileImageName: "sprofile4", imageName: "Post1"),
        
        Post(id: 0, userName: "Talia", text: "New fit, don't mind me \n", profileImageName: "sprofile6", imageName: "girlprofile1"),
        
        Post(id: 2, userName: "Suzzy", text: "I love winter and hiking with Douglas 😍 Winter vibes! Big slay! \n", profileImageName: "sprofile1", imageName: "doggirl4")
        
    ]
    
    let stories: [Story] = [
        Story(id: 0, imageName: "austin2"),
        Story(id: 1, imageName: "fashiongirl2"),
        Story(id: 2, imageName: "sprofile7"),
        Story(id: 3, imageName: "profile1"),
        Story(id: 4, imageName: "doggirl2"),
        Story(id: 5, imageName: "doggirl3")
    ]
    
    //    var body: some View{
    //        TabView(selection: $selectedTab) {
    //            HomeView()
    //                .tabItem {
    //                    Label("Home", systemImage: "house.fill")
    //                }
    //                .tag(1)
    //
    //            FeedView()
    //                .tabItem {
    //                    Label("Events", systemImage: "calendar")
    //                }
    //                .tag(2)
    //        }
    //    }
    
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                List {
                    ScrollView(.horizontal, showsIndicators: false) {
                        StoryView(stories: self.stories)
                    }.frame(height: 76).clipped()
                    ForEach(self.posts, id: \.id) {(post) in
                        PostView(post: post,screenWidth: geometry.size.width)
                    }
                }.navigationBarTitle(Text("InstaStream"), displayMode: .inline)
                    .navigationBarItems(leading: Button(action: {
                        print("click camera...")
                    }, label: {
                        Image(systemName: "camera")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                    }), trailing: NavigationLink {
                        ChatChannelListView(viewFactory: SocialViewFactory.shared, viewModel: viewModel)
                            .environmentObject(viewModel)
                    } label: {
                        Image(systemName: "paperplane")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 29, height: 29)
                    })
            }
            
        }
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
