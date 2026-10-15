# Repository rules

- Inspect existing files and Git status before editing; preserve user changes.
- Native Swift 6 + SwiftUI + public AppKit APIs; minimum macOS 14.0. Do not silently raise deployment requirements.
- Local-first: no backend, hosted database, analytics or unnecessary dependencies.
- Prefer one standard Xcode app target and one unit-test target. Add Swift packages only for a demonstrated need.
- Keep domain logic testable without UI or system services. Avoid placeholder services and speculative abstractions.
- Never commit secrets, signing material, personal data, build outputs or Xcode user state.
- Run relevant build/tests when full Xcode is available. Report exact blockers and actual results; never claim unrun checks passed.
- Do not overwrite existing files, create public remotes, push, release or perform destructive operations without explicit approval.
- Keep changes and final reports concise. Stop at the requested milestone.
