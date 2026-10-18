import SwiftUI

struct WeekHeaderView: View {
    let week: Int

    var body: some View {
        HStack(alignment: .center, spacing: 22) {
            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text("第")
                Text("\(week)").font(.system(size: 42, weight: .semibold, design: .serif)).italic()
                Text("週")
            }
            .font(.system(size: 38, weight: .regular))
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("第 \(week) 週")
            Spacer(minLength: 8)
            Image(systemName: "book").accessibilityLabel("回憶相簿")
            Image(systemName: "bubble.right").accessibilityLabel("訊息")
        }
        .font(.system(size: 25))
        .frame(minHeight: 58)
    }
}

#if DEBUG
#Preview("WeekHeaderView", traits: .sizeThatFitsLayout) {
    WeekHeaderView(week: 42)
        .padding(16)
        .frame(width: 393, height: 100)
        .background(.black)
        .foregroundStyle(.white)
        .preferredColorScheme(.dark)
}
#endif
