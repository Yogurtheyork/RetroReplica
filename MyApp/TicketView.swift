import SwiftUI

/// 用真正文字排版重建票券，沒有貼上參考畫面截圖。
struct TicketView: View {
    let title: String

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 14) {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("活動名稱").foregroundStyle(.gray)
                        Spacer()
                        Text("已查看")
                            .font(.system(size: 10, weight: .semibold))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 7)
                            .background(.gray, in: Capsule())
                            .foregroundStyle(.white)
                    }
                    Text(title)
                        .font(.system(size: 15, weight: .semibold))
                        .lineSpacing(3)
                        .foregroundStyle(Color(white: 0.25))
                }
                field("票券可使用時間", "2026.10.25（日）13:15 – 14:10\n(GMT+8)", bold: true)
                field("票號", "2610160400542010445801")
                VStack(alignment: .leading, spacing: 6) {
                    Text("活動地點").font(.system(size: 10))
                    Text("台灣台北市信義區忠孝東路五段8號B2")
                        .foregroundStyle(Color(red: 0.16, green: 0.6, blue: 0.72))
                    Text("統一時代百貨台北店")
                }
                field("活動日期", "2026.10.24（六）11:00 ~ 11.08（日）\n21:30 (GMT+8)")
            }
            .font(.system(size: 12))
            .foregroundStyle(Color(white: 0.6))
            .padding(6)
            .frame(width: 238, alignment: .leading)
            .scaleEffect(geometry.size.width / 250, anchor: .topLeading)
            .padding(6)
        }
        .background(Color.white)
    }

    private func field(_ label: String, _ value: String, bold: Bool = false) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label).font(.system(size: 10))
            Text(value)
                .fontWeight(bold ? .semibold : .regular)
                .foregroundStyle(bold ? Color(white: 0.45) : Color(white: 0.6))
        }
    }
}

#if DEBUG
#Preview("TicketView", traits: .sizeThatFitsLayout) {
    TicketView(title: "Hearts2Hearts The 2nd Mini Album [Lemon Tang] POP–UP in TAIPEI")
            .frame(width: 240, height: 360)
            .clipShape(RoundedRectangle(cornerRadius: 19))
        .padding(16)
        .frame(width: 272, height: 392)
        .background(.black)
        .foregroundStyle(.white)
        .preferredColorScheme(.dark)
}
#endif
