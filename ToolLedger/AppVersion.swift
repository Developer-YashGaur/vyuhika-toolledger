import Foundation

/// Formats optional bundle metadata without exposing blank version labels.
struct AppVersion {
    let version: String?
    let build: String?

    var label: String {
        let version = version?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let build = build?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        guard !version.isEmpty else { return "Development build" }
        return build.isEmpty ? "Version \(version)" : "Version \(version) (\(build))"
    }
}
