# [IDEA] OpenPortal — Self-Hosted Developer Portal for Modern APIs

> **Status:** `idea: new` | **Category:** `cat: tool` | **Priority:** `priority: high` | **Author:** Community

---

## 📌 Overview

**OpenPortal** is an open-source, self-hosted developer portal for modern APIs.

Most API documentation tools stop at rendering a static OpenAPI file. OpenPortal aims to become the single place where developers discover, understand, test, and collaborate around APIs while giving organizations complete control over access and deployment.

---

## 🚨 The Problems It Solves

1. **API documentation is often exposed publicly**  
   Many teams unintentionally expose their documentation in production because it's bundled directly with the application. Others disable documentation entirely, making it difficult for developers and partners to work with the API. OpenPortal separates documentation access from API deployment.

2. **Documentation is scattered**  
   Organizations often have dozens of services, each with its own documentation page, URL, authentication method, and UI. Developers waste time searching for the correct docs.

3. **Existing documentation is difficult to navigate**  
   Finding an endpoint, schema, authentication method, or example usually requires clicking through multiple pages.

4. **API documentation lacks context**  
   Developers don't just need endpoint definitions—they need workflows, authentication guides, best practices, migration guides, error explanations, and real-world examples.

5. **Documentation quickly becomes outdated**  
   APIs evolve rapidly, but docs lag behind. OpenPortal encourages documentation to stay synchronized with API changes while highlighting differences between versions.

6. **Partner APIs need controlled access**  
   Not every API should be public. Internal developers, external partners, customers, QA teams, and contractors need fine-grained access control.

7. **No single place for onboarding**  
   New developers collect info from multiple sources (auth, env URLs, SDKs, tutorials, changelogs). OpenPortal turns API docs into a complete onboarding experience.

8. **Documentation isn't searchable across services**  
   Finding a model, endpoint, parameter, or error across 50+ microservices is frustrating. OpenPortal provides unified global search.

9. **APIs evolve constantly**  
   Breaking changes, deprecated endpoints, and new versions are hard to track without automatic diffs and version timelines.

10. **Open-source alternatives are limited**  
    Commercial/cloud-first portals are expensive and lock in data. OpenPortal is 100% open source, self-hosted, and community driven.

---

## 💡 Proposed Solution & Core Features

### Vision: *The Grafana for API Documentation*
Just as Grafana became the standard interface for visualizing metrics from many different systems, **OpenPortal** aims to become the standard interface for discovering, understanding, and working with APIs from many different services.

### Core Principles
- 🟢 **Open source forever** & Self-hosted
- 🔒 **Privacy first** & Secure by default
- ⚡ **Lightweight** & Fast
- 🧩 **Extensible** & Framework agnostic
- 💻 **Developer-first**

---

## 📊 Comprehensive Gap Analysis: OpenAPI vs. OpenPortal

| Feature Area | What OpenAPI Does | Where It Falls Short | OpenPortal Solution |
| :--- | :--- | :--- | :--- |
| **Documentation** | Describes endpoints | Doesn't explain business workflows or usage context | Combines API specs with Markdown guides & workflow diagrams |
| **Authentication** | Defines security schemes | Doesn't manage user access to documentation | Built-in authentication & SSO integration |
| **RBAC** | Not supported | No roles like Admin, Partner, Internal, Public | Fine-grained Role-Based Access Control |
| **SSO** | Outside scope | No built-in OIDC, SAML, LDAP integration | Native OIDC, SAML, and LDAP SSO support |
| **Multiple APIs** | Manual / viewer specific | No unified portal for many services | Single-pane hub for all organizational APIs |
| **Search** | Basic text search | No global search across APIs, models, errors, guides | Unified instant global search across all specs & docs |
| **API Discovery** | Lists endpoints | Doesn't help developers find the right API | Categorized API registry with tags & service discovery |
| **Guides & Tutorials** | Limited | No onboarding, tutorials, architecture docs | Integrated documentation pages alongside spec references |
| **Changelog** | Not part of spec | No endpoint history or release timeline | Automated version history & release changelogs |
| **Version Comparison**| Not supported | Can't compare v1 vs v2 automatically | Automatic visual diff between spec versions |
| **Breaking Changes** | Not included | No API diff or compatibility analysis | Automated breaking change detection on spec push |
| **Deprecation Tracking**| Basic `deprecated` flag | No migration guidance or sunset tracking | Sunset timelines with automated migration guides |
| **Access Control** | None | Can't hide endpoints by user role | Endpoint-level visibility rules based on RBAC |
| **Environment Mgmt**| Server URL list | Poor support for dev/staging/prod switching | Dynamic environment switching with custom tokens |
| **Interactive Testing**| Basic viewer runner | Limited request history, collections | Interactive API runner with environment variables & history |
| **Request/Response Examples**| Static examples | Doesn't capture real or dynamic responses | Dynamic example generators & response snapshots |
| **SDK Distribution** | External generators | No built-in SDK management or downloads | Integrated SDK download links & package registry pointers |
| **Protocol Support** | REST/OpenAPI | No native support for GraphQL, gRPC, AsyncAPI | Multi-protocol hub: OpenAPI, AsyncAPI, GraphQL, gRPC |
| **Collaboration** | None | No comments, discussions, reviews | Inline comments, endpoint reviews, & feedback loops |
| **Approval Workflow** | None | No documentation review or publishing flow | Draft → Review → Publish staging workflows |
| **Code Ownership** | None | No mapping between endpoints and code owners | Codeowner tags & team assignment per service |
| **Dependency Mapping**| None | Can't visualize service relationships | Interactive service dependency graph |
| **Lifecycle Modeling** | None | Doesn't model draft → review → deprecated → retired | Full API Lifecycle stage management |
| **Compliance Tagging** | None | Can't tag endpoints for GDPR, HIPAA, PCI, etc. | Compliance & privacy data tags per field/endpoint |

---

## 🎯 Target Users
- **Startups & SaaS companies** needing partner-facing API portals
- **Enterprises** with dozens of internal microservices
- **API-first businesses** needing developer onboarding
- **Internal Platform & DX teams** standardizing documentation
- **Open-source maintainers** documenting complex ecosystems

---

## 📋 Submission Checklist (Incubator Standards)

- [x] Category selected (`cat: tool`)
- [x] Clear problem statement with 10 key friction points
- [x] Detailed solution architecture & core principles defined
- [x] 24+ point feature matrix comparing status quo vs proposed solution
- [x] Target audience identified
- [x] Ready for community discussion & feedback
