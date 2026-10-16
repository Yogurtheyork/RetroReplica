import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("第 42 週")
                .font(.system(size: 34, weight: .bold))
                .foregroundStyle(.white)
                .accessibilityIdentifier("weekTitle")
        }
    }
}
