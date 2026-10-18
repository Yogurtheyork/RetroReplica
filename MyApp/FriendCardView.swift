import SwiftUI

struct FriendCardView: View {
    let post: FriendPost
    let cardWidth: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            HStack(spacing: 8) {
                Image(post.avatarName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 26, height: 26)
                    .clipShape(Circle())
                    .accessibilityHidden(true)
                Text(post.name)
                    .font(.system(size: 15, weight: .semibold))
                    .lineLimit(1)
            }
            .padding(.horizontal, 7)
            Group {
                if post.isTicket {
                    TicketView(title: "Hearts2Hearts The 2nd Mini Album [Lemon Tang] POP–UP in TAIPEI")
                } else {
                    Image(post.photoName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: cardWidth, height: cardWidth * 1.5)
                        .clipped()
                        .accessibilityLabel("\(post.name)分享的生活照片")
                }
            }
            .frame(width: cardWidth, height: cardWidth * 1.5)
            .clipShape(RoundedRectangle(cornerRadius: 19))
        }
        .frame(width: cardWidth)
    }
}

#if DEBUG
#Preview("票券卡片", traits: .sizeThatFitsLayout) {
    FriendCardView(post: SampleData.friends[0], cardWidth: 240)
        .padding(16)
        .background(.black)
        .foregroundStyle(.white)
        .preferredColorScheme(.dark)
}

#Preview("照片卡片", traits: .sizeThatFitsLayout) {
    FriendCardView(post: SampleData.friends[1], cardWidth: 240)
        .padding(16)
        .background(.black)
        .foregroundStyle(.white)
        .preferredColorScheme(.dark)
}
#endif
