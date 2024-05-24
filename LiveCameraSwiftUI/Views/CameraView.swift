import SwiftUI

struct CameraView: View {
    let width: CGFloat
    let height: CGFloat
    @ObservedObject var model: CameraViewModel
    
    private let label = Text("frame")
    
    
    var body: some View {
        if let image = model.frame {
            Image(image,
                  scale: 1.0,
                  orientation: .up,
                  label: label)
                .resizable()
                .frame(width: width, height: height)
                .aspectRatio(contentMode: .fit)
        } else {
            Color.black
        }
    }
}

struct FrameView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView(width: 300, height: 300, model: .init())
    }
}
