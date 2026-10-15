# Security policy

No application has been released. There are currently no supported release versions or security-response SLA.

Do not put vulnerability details, credentials or personal data in public issues. If enabled on the intended GitHub repository, use **Security → Report a vulnerability** to contact maintainers privately. Repository availability and private reporting are not yet verified; no monitored email address is established. If private reporting is unavailable, request a private contact channel without disclosing exploit details.

Future implementation must keep user data local, put credentials in macOS Keychain, avoid logging secret values, and use only public Apple APIs. No backend, hosted storage or analytics is planned. Local-first does not by itself encrypt files or exclude them from device backups.

Do not commit signing identities, provisioning profiles, tokens or user data. Review dependencies, entitlements and data-access permissions when introduced. Signing/notarization and distribution policy remain future work; no distribution security guarantees are claimed.
