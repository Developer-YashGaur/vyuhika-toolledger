# Contributing

The project contains a minimal SwiftUI app and XCTest target. Follow the [development and validation steps](README.md) and report actual build/test outcomes.

- Keep changes small and focused; explain behavior, decisions and actual validation in pull requests.
- Use native SwiftUI and public AppKit APIs, Swift 6 language mode and macOS 14.0 as the minimum deployment target. Availability-check newer APIs.
- Keep domain logic independent of views, persistence and Keychain so meaningful behavior can be unit-tested.
- Add dependencies only when a concrete need justifies maintenance and license costs.
- Once the app exists, run the documented build/test commands and manually verify window behavior. Check the oldest supported OS before claiming macOS 14 compatibility.
- Never submit tokens, credentials, signing keys, personal data, user-specific Xcode state or generated outputs. Review staged content; ignore rules are not secret detection.
- Contributions are submitted under the repository's MIT license; retain required notices for any reused material.

Do not report vulnerabilities in public issues; follow [SECURITY.md](SECURITY.md).
