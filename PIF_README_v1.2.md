
Prosthetic Intelligence Framework (PIF)  
Schema: @brandonthomasdardano/pif-v1.2

---

Overview

The Prosthetic Intelligence Framework (PIF) is a modular schema designed to extend and enhance human cognition through tailored AI-assisted interaction. It supports neurodivergent, creative, and cognitively adaptive workflows via user-defined modifiers—keywords that shape AI responses to fit specific cognitive needs.

This framework is designed to evolve while preserving user-facing consistency through versioned modularity.

---

Features

🧠 Modifier System
Modifiers are inline prompt directives (e.g., -token, -generate) that alter the assistant’s behavior dynamically. Each modifier is defined with:

- Name: e.g., -token
- Behavior specification
- Versioned logic
- Associated metadata

---

🪢 Version Alias System (introduced in v1.2)

Each public modifier (e.g., -token) is a stable alias that points to its most recent stable implementation version (e.g., -token-v1.2).

✅ Benefits:
- Consistency for users: -token always works the same until explicitly updated.
- Stability for developers: Older versions (e.g., -token-v1.1) remain accessible.
- Traceability: Modifier behavior is tracked through versioned definitions.

Example:
Prompt: This is a sentence -token
→ Internally resolves to: -token-v1.2
→ Output: 11 | 185 | 16.82

You can also invoke a specific version directly:
Prompt: This is a sentence -token-v1.1

---

🧾 modifiermeta Field

Every modifier includes a structured modifiermeta field, containing:

modifiermeta:
  version: v1.2
  changelog: "Compact output formatting for token compression. Added version aliasing."
  author: "@brandonthomasdardano"
  last_updated: 2025-05-15

Why this matters:
- Transparency: Each modifier documents its evolution.
- Forkability: Others can build compatible systems or versions.
- Integrity: You preserve authorship and intent even as others adopt or adapt.

---

Example Modifier: -token

name: -token
alias: -token-v1.2
description: "Returns 3 pipe-separated numbers: input tokens, output tokens, and output/input ratio."
modifiermeta:
  version: v1.2
  changelog: "Initial release with compact output for token evaluation."
  author: "@brandonthomasdardano"
  last_updated: 2025-05-15
behavior:
  input: Any prompt text
  output: "input_tokens | output_tokens | output/input_ratio"

---

Installation / Adoption Guide

1. Fork or clone this repo to define your own modifier schema.
2. Use the -assimilategpt(modifier) prompt generator to seed individual modifiers into other ChatGPT environments.
3. Maintain your schema using the versioning system and modifiermeta fields.

---

License & Attribution

The PIF is free and open source under a non-monetizable conceptual license:
- You may build, adapt, or fork this framework freely.
- Monetization of individual implementations or adaptations is permitted.
- The Prosthetic Intelligence Framework (PIF) must always credit @brandonthomasdardano as its originator.

---

Contact & Contribution

Want to contribute modifiers, propose enhancements, or fork your own version?

> Contact: dardanobrandon@gmail.com
