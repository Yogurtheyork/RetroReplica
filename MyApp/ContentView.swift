import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 0) {
                    WeekHeaderView(week: 42)
                        .padding(.horizontal, 16)
                        .padding(.top, 24)
                        .padding(.bottom, 22)
                    WeekPhotoStripView(photos: SampleData.days)
                    VStack(spacing: 36) {
                        friendRow(SampleData.friends, width: geometry.size.width)
                        friendRow(SampleData.moreFriends, width: geometry.size.width)
                    }
                    .padding(.top, 48)
                    .padding(.bottom, 32)
                }
            }
            .scrollIndicators(.hidden)
            .accessibilityIdentifier("home.verticalScroll")
            .safeAreaInset(edge: .bottom, spacing: 0) {
                BottomBarView(selectedSymbol: "house")
            }
        }
        .background(.black)
        .foregroundStyle(.white)
        .preferredColorScheme(.dark)
    }

    private func friendRow(_ friends: [FriendPost], width: CGFloat) -> some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top, spacing: 16) {
                ForEach(friends) { friend in
                    FriendCardView(post: friend, cardWidth: min(width * 0.61, 320))
                }
            }
            .padding(.horizontal, 16)
        }
        .scrollIndicators(.hidden)
        .accessibilityIdentifier("home.friendScroll")
    }
}

#if DEBUG
#Preview("Retro 首頁") {
    ContentView()
}
#endif
