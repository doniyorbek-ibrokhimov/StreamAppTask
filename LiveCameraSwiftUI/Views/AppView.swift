import SwiftUI

struct AppView: View {
    var body: some View {
        VStack(spacing: 0) {
            TopView()
                .padding(.top, 5)
                .background(Color.accentColor)
            
            GeometryReader { proxy in
                VStack(spacing: 0) {
                    Color.clear
                    ChatHeaderView()
                    CommentsViews()
                }
                .padding(.horizontal)
                .background {
                    CameraView(width: proxy.size.width,
                               height: proxy.size.height,
                               model: .init())
                }
            }
            
            BottomView()
                .padding(.bottom, 5)
                .background(Color.accentColor)
            
        }
    }
}

private struct ChatHeaderView: View {
    var body: some View {
        Text("Viewers chat")
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct CommentsViews: View {
    var body: some View {
        ScrollView {
            ForEach(0..<10) { _ in
                CommentView()
            }
        }
    }
}

private struct CommentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("VIP1")
                    .padding(.horizontal, 5)
                    .background(.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                Text("Andrew Victory")
            }
            
            Text("Hey! You look so beautiful today!")
        }
        .padding()
        .background(.gray.opacity(0.5))
        .clipShape(.rect(cornerRadius: 10))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct BottomView: View {
    var body: some View {
        HStack {
            CommentInputView()
            ReactionView(reaction: "♥️", backgroundColor: .red)
            ReactionView(reaction: "🥂", backgroundColor: .brown)
            ReactionView(reaction: "🤩", backgroundColor: .yellow)
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

private struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    var placeholderColor: Color
    var textColor: Color
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(placeholderColor)
            }
            TextField("", text: $text)
                .foregroundColor(textColor)
                .disabled(true)
        }
    }
}


private struct CommentInputView: View {
    @State private var input: String = ""
    private let accentColor: Color = .gray
    
    var body: some View {
        HStack {
            CustomTextField(text: $input, placeholder: "Comment...", placeholderColor: accentColor, textColor: accentColor)
            
            Image(systemName: "paperplane.fill")
        }
        .foregroundStyle(accentColor)
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
                .fill(accentColor)
        }
    }
}

private struct TopView: View {
    var body: some View {
        HStack {
            UserView()
            
            Spacer()
            
            Group {
                Text("12.3K views")
                    .font(.title2)
                Image(systemName: "xmark")
                    .font(.title)
            }
            .foregroundStyle(.white)
        }
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}

private struct UserView: View {
    var body: some View {
        HStack {
            UserDetailsView()
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .padding(.leading)
                .background(Color.userProfileBackgroundColor)
                .cornerRadius(10)
                .padding(.leading, 25)
        }
        .overlay(alignment: .leading) {
            ProfileImageView()
        }
    }
}

private struct UserDetailsView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Annie Bae")
                Text("TOP 20")
            }
            .lineLimit(1)
            .fixedSize(horizontal: true, vertical: false)
            .font(.subheadline)
            
            Image(systemName: "heart.fill")
                .padding(5)
                .background(Color.pink)
                .cornerRadius(3)
        }
    }
}

private struct ProfileImageView: View {
    var body: some View {
        Image(systemName: "person")
            .font(.system(size: 45))
            .background(Color.yellow)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.blue, lineWidth: 2)
            )
            .padding(.vertical, 13)
            .overlay(alignment: .top) {
                Image(systemName: "crown.fill")
                    .foregroundColor(.blue)
            }
    }
}

#Preview {
    AppView()
}
