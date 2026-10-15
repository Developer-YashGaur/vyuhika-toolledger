import SwiftUI

struct WelcomeView: View {
    private let version = AppVersion(
        version: Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String,
        build: Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
    )

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "wrench.and.screwdriver")
                .font(.system(size: 40, weight: .medium))
                .foregroundStyle(.tint)
                .accessibilityHidden(true)
            Text("Vyuhika ToolLedger")
                .font(.largeTitle.bold())
            Text("Your local developer workspace.")
                .font(.title3)
                .foregroundStyle(.secondary)
            Text("Welcome. Your tools will find a home here.")
                .font(.body)
            Text(version.label)
                .font(.caption)
                .foregroundStyle(.secondary)
                .padding(.top, 12)
        }
        .multilineTextAlignment(.center)
        .padding(40)
        .frame(minWidth: 480, minHeight: 340)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.background)
        .tint(.indigo)
    }
}
