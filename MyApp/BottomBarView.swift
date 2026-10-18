import SwiftUI

struct BottomBarView: View {
    let selectedSymbol: String
    private let items = [
        (symbol: "house", label: "首頁"),
        (symbol: "person.2", label: "好友"),
        (symbol: "clock.arrow.circlepath", label: "回憶"),
        (symbol: "bell", label: "通知"),
        (symbol: "person.crop.circle", label: "個人檔案")
    ]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(items, id: \.symbol) { item in
                VStack(spacing: 4) {
                    Image(systemName: item.symbol)
                        .font(.system(size: 24))
                        .foregroundStyle(item.symbol == selectedSymbol ? .white : Color(white: 0.5))
                    Circle()
                        .fill(item.symbol == "bell" ? .red : .clear)
                        .frame(width: 4, height: 4)
                }
                .frame(maxWidth: .infinity)
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(item.label)
                .accessibilityAddTraits(item.symbol == selectedSymbol ? .isSelected : [])
            }
        }
        .padding(.top, 17)
        .padding(.bottom, 8)
        .background(.black)
    }
}

#if DEBUG
#Preview("BottomBarView", traits: .sizeThatFitsLayout) {
    BottomBarView(selectedSymbol: "house")
        .padding(16)
        .frame(width: 393, height: 85)
        .background(.black)
        .foregroundStyle(.white)
        .preferredColorScheme(.dark)
}
#endif
