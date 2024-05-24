import SwiftUI

struct ReactionAnimationProps {
    var scale = 1.0
    var verticalStretch = 1.0
    var verticalTranslation = 0.0
    var angle = Angle.zero
    var chromaAngle = Angle.zero
}

struct ReactionView: View {
    @State private var isAnimating = false
    let reaction: String
    let color: Color

    var body: some View {
        
        
        // Emoji layer
        ZStack {
            color
                .clipShape(Circle())
                .frame(width: 60, height: 60)
                .blur(radius: 3)
            
            Text(reaction)
                .font(.largeTitle)
                .keyframeAnimator(
                    initialValue: ReactionAnimationProps(),
                    trigger: isAnimating ? UUID() : nil
                ) { content, value in
                    content
                        .rotationEffect(value.angle)
                        .hueRotation(value.chromaAngle)
                        .scaleEffect(value.scale)
                        .scaleEffect(y: value.verticalStretch)
                        .offset(y: value.verticalTranslation)
                } keyframes: { _ in
                    KeyframeTrack(\.angle) {
                        CubicKeyframe(.zero, duration: 0.58)
                        CubicKeyframe(.degrees(16), duration: 0.125)
                        CubicKeyframe(.degrees(-16), duration: 0.125)
                        CubicKeyframe(.degrees(16), duration: 0.125)
                        CubicKeyframe(.zero, duration: 0.125)
                    }
                    
                    KeyframeTrack(\.verticalStretch) {
                        CubicKeyframe(1.0, duration: 0.1)
                        CubicKeyframe(0.6, duration: 0.15)
                        CubicKeyframe(1.5, duration: 0.1)
                        CubicKeyframe(1.05, duration: 0.15)
                        CubicKeyframe(1.0, duration: 0.88)
                        CubicKeyframe(0.8, duration: 0.1)
                        CubicKeyframe(1.04, duration: 0.4)
                        CubicKeyframe(1.0, duration: 0.22)
                    }
                    
                    KeyframeTrack(\.scale) {
                        LinearKeyframe(1.0, duration: 0.36)
                        SpringKeyframe(2.0, duration: 0.8, spring: .bouncy)
                        SpringKeyframe(1, spring: .bouncy)
                    }
                    
                    KeyframeTrack(\.verticalTranslation) {
                        LinearKeyframe(0.0, duration: 0.1)
                        SpringKeyframe(20.0, duration: 0.15, spring: .bouncy)
                        SpringKeyframe(-200.0, duration: 1.0, spring: .bouncy)
                        SpringKeyframe(0.0, spring: .bouncy)
                    }
                    
                    KeyframeTrack(\.chromaAngle) {
                        LinearKeyframe(.zero, duration: 0.58)
                        LinearKeyframe(.degrees(45), duration: 0.125)
                        LinearKeyframe(.degrees(-30), duration: 0.125)
                        LinearKeyframe(.degrees(150), duration: 0.125)
                        LinearKeyframe(.zero, duration: 0.125)
                    }
                }
        }
            .onTapGesture {
                isAnimating.toggle()
            }
        
    }
}


#Preview {
    ReactionView(reaction: "🤩", color: .yellow)
        .preferredColorScheme(.dark)
}
