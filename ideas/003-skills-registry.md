# [IDEA] Open AI Skills Registry & Package Manager (Skillshub)

> **Status:** `idea: new` | **Category:** `cat: tool` | **Priority:** `priority: high` | **Author:** Community

---

## 📌 Overview

**Skillshub** is an open-source, GitHub-native registry and package manager for AI coding skills, rules, agent commands, and developer instructions.

As AI coding assistants (Claude, Codex, Cursor, VS Code agents, custom LLM sidecars) become increasingly customizable through project-specific rules and reusable workflows, developer instructions remain fragmented across personal gists, unindexed GitHub repositories, and manual file copies. Skillshub makes AI skills as easy to **discover, install, update, extend, and publish** as open-source npm or Cargo packages today.

> *"Package management for the AI-assisted development era — free, open, and community-driven."*

---

## 🚨 The Problems It Solves

1. **Fragmented & Manual Skill Distribution**  
   Developers create brilliant coding standards, security rules, and framework guidelines, but others must manually discover repositories, clone them, copy files into local AI directories (`.cursorrules`, `SKILL.md`, `.claude/`), and manually maintain updates.

2. **Vendor Lock-in & Specification Fragmentation**  
   Instructions are often locked to single AI platforms or proprietary extensions. Skillshub introduces a vendor-neutral open skill format adaptable to any coding assistant.

3. **No Centralized Discovery or Quality Metrics**  
   Finding high-quality, audited instructions for specific tech stacks (e.g., "Idiomatic Go + Security + PostgreSQL") is difficult. There is no central index with upvotes, ratings, version tracking, or installation statistics.

4. **Security Risks from Unaudited AI Instructions**  
   AI skills can instruct agents to execute shell commands, install binaries, or modify sensitive project files. Unvalidated skills can introduce destructive actions or leak secrets. Skillshub adds automated static analysis and security status checks.

5. **Lack of Composition & Extension (Skill Inheritance)**  
   Developers cannot easily extend base standards (e.g., extending a base *Go Production Standard* with *AWS* or *Microservices* additions) while maintaining clean upstream sync.

6. **Outdated Local Rules**  
   When best practices or framework APIs evolve, installed local AI instructions quickly become stale. Skillshub enables automated CLI updates (`skillshub update`).

---

## 💡 Proposed Solution & Core Features

### Vision: *GitHub as the Canonical Source of Truth*
Skillshub leverages existing GitHub infrastructure rather than replacing it:

```text
GitHub Repository ──► Skills Registry ──► CLI (skillshub) ──► Developer / AI Tool
```

- **Open Specification:** Standardized `skill/` directory layout (`SKILL.md`, `metadata.yaml`, `rules/`, `commands/`, `examples/`).
- **Cross-Platform CLI (`skillshub`):** npm-distributed CLI to search, install, update, and manage skills locally (`skillshub install go-production`).
- **GitHub-Native Webhook Sync:** Pushing updates to a GitHub repo automatically triggers CI/CD validation and updates the registry index.
- **Automated CI/CD Validation & Security:** Automated checks for valid structure, secret exposure, command safety, and versioning.
- **Community Governance & Skill Inheritance:** Community ratings, upvotes, extension tracking, and pull-request driven contributions.

---

## 📊 Comprehensive Gap Analysis: Manual Setup vs. Skillshub

| Feature Area | Manual File Copying / Gists | Vendor-Specific Extensions | Skillshub Solution |
| :--- | :--- | :--- | :--- |
| **Discovery** | Scattered across GitHub & blogs | Restricted to platform store | **Unified Open Registry:** Instant CLI & web search across all public skill repos |
| **Installation** | Manual download & file copying | Proprietary plugin manager | **One-Command Install:** `skillshub install github:owner/repo` |
| **Vendor Support** | Locked to a single folder layout | Single-vendor runtime | **Vendor-Neutral Adapters:** Translates skills into Cursor, Claude, Codex, VS Code formats |
| **Updates** | Manual copy-pasting | Variable | **Automated CLI Sync:** `skillshub update` refreshes all installed local skills |
| **Security & Safety** | Zero inspection | Basic automated scans | **Automated Analysis:** Checks for dangerous shell scripts, exposed secrets, and command warnings |
| **Skill Inheritance** | Copying code manually | Not supported | **Fork & Extension Tracking:** Explicit relationship mapping (`Extended from: base-skill`) |

---

## 🏗️ System Architecture & CLI Spec

### 1. High-Level Architecture
```text
                 GitHub Repository
                         │
                 GitHub App / Webhooks
                         │
                         ▼
                ┌─────────────────┐
                │ Skills Registry  │ (Indexing, Search, Security Scans)
                └────────┬────────┘
                         │
            ┌────────────┼────────────┐
            ▼            ▼            ▼
         Search       Metadata     Versions
            │            │            │
            └────────────┼────────────┘
                         │
                         ▼
                   CLI (skillshub)
                         │
          ┌──────────────┼──────────────┐
          ▼              ▼              ▼
        Cursor         Claude         Codex / VS Code
```

### 2. Standard Skill Directory Structure
```text
skill/
├── SKILL.md
├── metadata.yaml
├── rules/
│   ├── coding.md
│   ├── security.md
│   └── testing.md
├── commands/
│   ├── review.md
│   └── refactor.md
└── examples/
```

### 3. CLI Command Suite
- `skillshub search <query>` — Search for community skills.
- `skillshub install <skill-name|github:owner/repo>` — Install skill to current project or global AI path.
- `skillshub info <skill-name>` — View metadata, ratings, security status, and dependencies.
- `skillshub update` — Check and apply updates for all installed skills.
- `skillshub remove <skill-name>` — Uninstall a skill.

---

## 🎯 Target Users
- **Developers & AI Power Users** using Claude, Cursor, Codex, or VS Code assistants.
- **Engineering Teams** standardizing code quality, security rules, and DevOps instructions across repositories.
- **Open-Source Maintainers** shipping AI assistant guidelines for their libraries and frameworks.
- **Domain Experts** publishing specialized rules for security, compliance, performance, and architecture.

---

## 📋 Submission Checklist (Incubator Standards)

- [x] Category selected (`cat: tool`)
- [x] Clear problem statement with 6 key friction points
- [x] Solution architecture & core principles defined
- [x] Comprehensive feature gap analysis matrix included
- [x] CLI commands and skill directory specification defined
- [x] Target audience identified
- [x] Ready for community discussion & feedback
