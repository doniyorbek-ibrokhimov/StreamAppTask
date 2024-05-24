import SwiftUI


struct AppView: View {
    @StateObject private var model = CameraHandler()
    
    var body: some View {
        VStack(spacing: 0) {
            TopView()
                .background(Color.cyan)
            
            VStack {
                Color.clear
                
                Text("Viewers chat")
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                CommentsViews()
            }
            .background { CameraView(image: model.frame) }
            
            BottomView()
                .background(Color.cyan)
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

struct BottomView: View {
    var body: some View {
        HStack {
            CommentInputView()
            ReactionView(reaction: "♥️", color: .red)
            ReactionView(reaction: "🥂", color: .brown)
            ReactionView(reaction: "🤩", color: .yellow)
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

import SwiftUI

struct CustomTextField: View {
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
        }
    }
}


struct CommentInputView: View {
    @State var input: String = ""
    
    var body: some View {
        HStack {
//            TextField("Comment...", text: $input)
            CustomTextField(text: $input, placeholder: "Comment...", placeholderColor: .white, textColor: .white)
                
            Image(systemName: "paperplane.fill")
        }
        .foregroundStyle(.white)
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
                .fill(.white)
        }
        
    }
}

struct preview: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

struct TopView: View {
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

struct UserView: View {
    var body: some View {
        HStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Annie Bae")
                    Text("TOP 20")
                }
                .lineLimit(1)
                .fixedSize(horizontal: true, vertical: false)
                .foregroundStyle(.white)
                .font(.subheadline)
                
                Image(systemName: "heart.fill")
                    .foregroundStyle(.white)
                    .padding(5)
                    .background(.pink)
                    .cornerRadius(3)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .padding(.leading)
            .background(Color.purple)
            .cornerRadius(3)
            .padding(.leading, 30)
            
        }
        .overlay(alignment: .leading) {
            Image(systemName: "person")
                .font(.system(size: 45))
                .background(.yellow)
                .clipShape(.circle)
                .overlay {
                    Circle()
                        .stroke(lineWidth: 2)
                        .fill(Color.blue)
                }
                .padding(.vertical, 13)
                .overlay(alignment: .top) {
                    Image(systemName: "crown.fill")
                        .foregroundStyle(.blue)
                }
        }
        
        
        
    }
}
