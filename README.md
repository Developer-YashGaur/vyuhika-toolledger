# Vyuhika ToolLedger

A native, local-first, open-source macOS developer utility. Planned stack: Swift 6, SwiftUI and AppKit, targeting macOS 14.0 and later. No backend, hosted database, analytics SDK or third-party packages.

## Foundation status

The first native app is implemented in `ToolLedger.xcodeproj`, with a shared `ToolLedger` scheme. Product: **Vyuhika ToolLedger**; bundle identifier: `com.vyuhika.toolledger`; minimum macOS 14.0; Swift 6 language mode. No external dependencies.

## Project structure

- `ToolLedger/ToolLedgerApp.swift`: SwiftUI lifecycle and main window.
- `ToolLedger/WelcomeView.swift`: welcome screen with system typography and an indigo accent.
- `ToolLedger/AppVersion.swift`: pure-Swift bundle version-label formatting used by the screen.
- `ToolLedgerTests/AppVersionTests.swift`: XCTest coverage for metadata trimming, optional build numbers and missing versions.

No overlay, networking, database, persistence or provider integration is implemented.

## Development and validation

Open `ToolLedger.xcodeproj` in full Xcode and select the `ToolLedger` scheme. Verified toolchain: Xcode 27.0 (27A266a), Swift 6.4, macOS SDK 27.0. License/first-launch checks now pass. Project signing defaults to local ad-hoc signing with no development team or production credentials. App Sandbox is enabled for signed builds. Unsigned command-line builds bypass signing and therefore do not validate sandbox enforcement or distribution readiness.

Exact commands run on this Apple Silicon Mac:

```sh
xcodebuild -project ToolLedger.xcodeproj -scheme ToolLedger -configuration Debug -destination 'platform=macOS,arch=arm64' -derivedDataPath build/DerivedData CODE_SIGNING_ALLOWED=NO build
xcodebuild -project ToolLedger.xcodeproj -scheme ToolLedger -configuration Debug -destination 'platform=macOS,arch=arm64' -derivedDataPath build/TestDerivedData CODE_SIGNING_ALLOWED=NO ONLY_ACTIVE_ARCH=YES test
```

The application build passed locally. The developer confirmed that unit tests pass in normal macOS Terminal. Codex test execution exited 133 because its sandbox blocked test-manager access and distributed notifications; this was not a verified assertion failure. Visual launch verification, macOS 14 runtime testing, and Intel runtime testing remain outstanding. See [the environment audit](docs/environment.md) for outcomes and warnings.

In normal macOS Terminal, change to your checkout and run the same test command:

```sh
cd /path/to/ToolLedger
xcodebuild -project ToolLedger.xcodeproj -scheme ToolLedger -configuration Debug -destination 'platform=macOS,arch=arm64' -derivedDataPath build/TestDerivedData CODE_SIGNING_ALLOWED=NO ONLY_ACTIVE_ARCH=YES test
open ToolLedger.xcodeproj
```

Replace `/path/to/ToolLedger` with your checkout directory. In Xcode, select `ToolLedger` and **My Mac**, then **Product → Run**. Confirm the welcome screen and version label render, resize the window, and quit/relaunch successfully. The Codex failure is an execution-environment restriction, not an observed assertion failure. Terminal test success is developer-confirmed; manual launch verification remains outstanding.

## Continuous integration

[macOS workflow](.github/workflows/macos.yml) builds and tests the `ToolLedger` scheme on pushes and pull requests targeting `main`. It uses GitHub's `macos-26` ARM64 runner and explicitly selects Xcode 26.6 through `DEVELOPER_DIR`. The [runner inventory](https://github.com/actions/runner-images/blob/main/images/macos/macos-26-arm64-Readme.md) lists this installation; it differs from local Xcode 27.0 and has not yet been exercised for this project.

CI runs the same unsigned `xcodebuild` build/test operations above with `ONLY_ACTIVE_ARCH=YES` and a shared `build/DerivedData` directory. It grants read-only repository access and uses only GitHub's checkout action, pinned to a commit, with credential persistence disabled. No signing credentials or repository secrets are needed. Local YAML/structure and shell syntax checks do not establish remote success; **GitHub CI has not run**. Runner software changes over time, so update the selected Xcode path against the inventory when necessary.

Intended remote: `Developer-YashGaur/vyuhika-toolledger`; existence and visibility are unverified. Do not create, push or publish without explicit approval.

See [architecture](docs/architecture.md), [contributing](CONTRIBUTING.md), and [security](SECURITY.md).

## License

MIT; see [LICENSE](LICENSE). This covers repository contributions, not Apple SDKs or third-party assets. Contributors must have rights to submitted code and assets. Apple tooling, signing, notarization and distribution have separate terms; MIT does not grant trademark rights.
