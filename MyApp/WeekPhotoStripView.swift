import SwiftUI

struct WeekPhotoStripView: View {
    let photos: [DayPhoto]

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 2) {
                ForEach(photos) { photo in
                    DayPhotoView(imageName: photo.imageName, day: photo.day)
                }
            }
            .clipShape(UnevenRoundedRectangle(topLeadingRadius: 22, bottomLeadingRadius: 22))
            .padding(.horizontal, 16)
        }
        .scrollIndicators(.hidden)
        .accessibilityIdentifier("home.weekScroll")
    }
}

#if DEBUG
#Preview("WeekPhotoStripView", traits: .sizeThatFitsLayout) {
    WeekPhotoStripView(photos: SampleData.days)
        .padding(16)
        .frame(width: 393, height: 142)
        .background(.black)
        .foregroundStyle(.white)
        .preferredColorScheme(.dark)
}
#endif
