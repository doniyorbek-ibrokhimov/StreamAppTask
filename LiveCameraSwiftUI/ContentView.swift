import SwiftUI

struct UserView: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
                .font(.largeTitle)
                .background(.yellow)
                .clipShape(.circle)
            
            VStack {
                Text("Annie Bae")
                Text("TOP 20")
            }
            .lineLimit(1)
            .fixedSize(horizontal: true, vertical: false)
            .foregroundStyle(.white)
            
            Image(systemName: "heart.fill")
                .foregroundStyle(.white)
                .padding(5)
                .background(.pink)
                .cornerRadius(3)
        }
        .padding(3)
        .background(.blue)
        .cornerRadius(3)
    }
}

struct AppView: View {
    @StateObject private var model = FrameHandler()
    
    var body: some View {
        VStack(spacing: 0) {
            TopView()
                .background(.purple)
                
            
            GeometryReader { proxy in
                VStack {
                    Color.clear
                    
                    CommentsViews()
                }
                .background {
                    FrameView(image: model.frame)
                }
            }
            
            
            BottomView()
                .background(.purple)
        }
    }
}

struct CommentsViews: View {
    var body: some View {
        ScrollView {
            ForEach(0..<10) { i in
                CommentView()
            }
        }
    }
}

struct CommentView: View {
    var body: some View {
        VStack {
            //FIXME: (doni) should be array of views
            HStack {
                Text("VIP1")
                    .padding(5)
                    .background(.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                Text("Andrew Victory")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Hey! You look so beautiful today!")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(.gray.opacity(0.5))
        .clipShape(.rect(cornerRadius: 10))
    }
}

struct BottomView: View {
    var body: some View {
        HStack {
            CommentInputView()
            ReactionView()
            ReactionView()
            ReactionView()
        }
        .padding()
    }
}

struct CommentInputView: View {
    @State var input: String = ""
    
    var body: some View {
        HStack {
            TextField("Comment...", text: $input)
            Image(systemName: "paperplane.fill")
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
        }
        
    }
}

struct ReactionView: View {
    var body: some View {
        Text("😍")
            .font(.title)
            .padding()
            .background(.yellow)
            .clipShape(Circle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

struct TopView: View {
    var body: some View {
        HStack {
            UserView()
            
            Spacer()
            
            Text("12.3K views")
            Image(systemName: "xmark")
        }
        .padding()
    }
}
