import SwiftUI

struct DayPhotoView: View {
    let imageName: String
    let day: String

    var body: some View {
        ZStack(alignment: .bottom) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 83, height: 110)
                .clipped()
            LinearGradient(colors: [.clear, .black.opacity(0.6)], startPoint: .center, endPoint: .bottom)
            Text(day)
                .font(.system(size: 15, weight: .semibold))
                .shadow(radius: 3)
                .padding(.bottom, 7)
        }
        .frame(width: 83, height: 110)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(day)的照片")
    }
}

#if DEBUG
#Preview("DayPhotoView", traits: .sizeThatFitsLayout) {
    DayPhotoView(imageName: "TravelGarden", day: "週二")
        .padding(16)
        .frame(width: 115, height: 142)
        .background(.black)
        .foregroundStyle(.white)
        .preferredColorScheme(.dark)
}
#endif
