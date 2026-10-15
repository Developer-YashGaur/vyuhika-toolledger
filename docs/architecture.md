# Minimal architecture

The Phase 1 window and unit-test foundation are implemented in `ToolLedger.xcodeproj`; subsequent sections describe planned extensions. The project uses Swift 6 language mode and macOS 14.0+; keep the minimum OS independent of the development machine's SDK.

## Application and UI

The project contains one app target, one unit-test target and a shared `ToolLedger` scheme. SwiftUI `App` with a `WindowGroup` owns a basic window. Keep UI state on the main actor. Use small value types and direct composition; no dependency framework, service locator or package is needed.

When menu-bar behavior is requested, bridge lifecycle through `NSApplicationDelegateAdaptor` and let an AppKit controller retain an `NSStatusItem` and an `NSPanel` hosting SwiftUI content. Keep the regular window available initially. Decide activation policy and sandbox entitlements from actual behavior rather than speculating now.

An eventual notch-adjacent panel is a normal AppKit window, not an extension of the system notch. Use public `NSScreen` geometry, safe-area information and documented window levels. Support displays without a notch, multiple displays, Spaces, full-screen behavior, keyboard dismissal and accessibility. No private notch APIs or system UI manipulation. Implement none of this during the foundation milestone.

## Local storage and credentials

Use `UserDefaults` only for small preferences. For the first small structured dataset, prefer versioned `Codable` data in the app's Application Support directory, with atomic replacement and explicit error handling. Define migration and recovery when a schema exists. Adopt SwiftData (available on macOS 14) only if relationships, queries or dataset size justify it; do not add a database now.

Store credentials using Security.framework Keychain generic-password items. Choose stable service/account identifiers after the bundle identity is set, handle `OSStatus` errors, and define accessibility and deletion behavior deliberately. No credential values in defaults, files, logs or tests. Add a narrow wrapper and test substitute only when credential behavior is implemented.

## Domain logic and testing

Keep transformations and validation as plain Swift structs/functions independent of SwiftUI, AppKit and storage. `AppVersion` is tested in the app unit-test target using XCTest; Terminal execution is developer-confirmed passing, while Codex execution is blocked by the agent sandbox (see the environment audit). Introduce a protocol only at a real system boundary that needs substitution. Extract a local Swift package only when reuse or isolation demonstrates value.

## Validation and CI

First validate a basic window, shared scheme, unsigned command-line build and unit tests with full Xcode. Then choose an explicit supported GitHub macOS runner and installed Xcode pair from the [runner image inventory](https://github.com/actions/runner-images), pin action revisions, and grant read-only repository permissions. The minimal workflow now selects Xcode 26.6 on `macos-26` and runs unsigned build/tests; its first remote execution remains pending. Verify macOS 14 runtime behavior separately; a build on a newer OS cannot establish it.
