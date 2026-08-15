# [IDEA] Forge — Semantic Website Framework for Content Creators & Developers

> **Status:** `idea: new` | **Category:** `cat: tool` | **Priority:** `priority: high` | **Author:** Community

---

## 📌 Overview

**Forge** is an open-source TypeScript semantic website framework that transforms plain Markdown (`.md`), MDX (`.mdx`), and structured YAML into beautiful, fast, SEO-optimized static websites without requiring manual front-end component engineering or complex CSS design work.

> *"Markdown is the content. Forge is the designer."*

Most static site generators require developers to design layouts, build component systems, configure CSS frameworks, or manage complex client-side runtimes. Forge introduces a **Semantic Content AST** that automatically parses raw content structure (heroes, features, pricing, FAQs, timelines, stats) and maps them to installable themes — giving users instant, professional websites out of the box while retaining complete developer extensibility.

---

## 🚨 The Problems It Solves

1. **High Frontend Overhead for Content Sites**  
   Traditional Markdown-to-HTML tools (or React frameworks like Next.js/Astro) require developers to manually write components, CSS, responsive layouts, and animations just to publish a visually appealing landing page or documentation portal.

2. **Full CMS Complexity & Infrastructure Bloat**  
   WordPress, Headless CMSs, or page builders introduce database maintenance, hosting costs, server security risks, vendor lock-in, and slow load times for simple content.

3. **MDX Abuse & Loss of Content Portability**  
   Current frameworks often force developers to write heavy JSX/MDX component tags (`<HeroBlock title="...">`) inside Markdown files, locking content into a single framework syntax and making it unreadable for standard Markdown tools or AI generators.

4. **SEO Configuration Fatigue**  
   Technical SEO (OpenGraph cards, Twitter preview tags, Canonical URLs, Schema.org JSON-LD structured data, XML sitemaps, robots.txt) is rarely built-in out of the box and requires installing and configuring multiple third-party plugins.

5. **Heavy JavaScript Runtimes for Static Content**  
   Many SSG frameworks ship heavy React/Vue runtime bundles to client browsers for static text pages, degrading Lighthouse scores, mobile performance, and core web vitals.

6. **Theme Lock-in & Hardcoded Visual Identities**  
   Switching the visual aesthetic of a site usually requires refactoring components and rewriting CSS. In Forge, swapping themes (`theme: startup` vs `theme: cyber`) changes the visual representation entirely while leaving 100% of the content untouched.

7. **Difficult Content Maintenance for AI & Automation**  
   Structured data (like pricing tiers or team members) in conventional SSGs is awkward to write. Forge supports clean YAML-powered content blocks that are human-readable and AI-generator friendly.

8. **Lack of Built-in Performance Pipelines**  
   Image optimization (AVIF/WebP conversion, responsive srcsets, lazy loading, blur placeholders) requires manual build scripts or expensive CDN image services.

---

## 💡 Proposed Solution & Core Features

### Vision: *Semantic Content AST Engine*
Instead of viewing Markdown simply as `Markdown → HTML`, Forge introduces a **Semantic Parsing Engine**:

```
Markdown / MDX / YAML ──► Parser ──► Semantic Content AST ──► Component Selection ──► Theme ──► HTML/CSS
```

When content is written with standard headings and lists:
- **H1 + Intro Paragraph** ──► Auto-detected as **Hero Section**
- **H2 Features + Bullet List** ──► Auto-detected as **Feature Grid Cards**
- **H2 Pricing + H3 Tiers** ──► Auto-detected as **Pricing Tables**
- **H2 FAQ + H3 Q&A Pairs** ──► Auto-detected as **Interactive Accordion**

### Core Principles
- 🟢 **Content-First Simplicity:** Write Markdown; Forge handles design, layout, theme, and responsiveness.
- 🔒 **Zero Infrastructure:** Builds to pure static HTML/CSS files. Host on S3, Cloudflare Pages, GitHub Pages, or any web server.
- ⚡ **Lightweight & HTML-First:** Zero mandatory React runtime. Ships near 100/100 Lighthouse performance defaults.
- 🧩 **Installable Theme System:** Decouple content from visual design (`@forge/theme-startup`, `@forge/theme-minimal`, `@forge/theme-cyber`).
- 🛠️ **3-Level Customization Model:** 
  1. *Zero-Config* (Write `.md`, pick theme)
  2. *Theme Design Tokens* (Tweak colors/fonts/radius via config)
  3. *Full Code Control* (Custom themes, MDX components, custom renderers, and plugins)

---

## 📊 Comprehensive Gap Analysis: Existing Frameworks vs. Forge

| Feature Area | Astro / Next.js / Eleventy | Hugo / Docusaurus / VitePress | Forge Solution |
| :--- | :--- | :--- | :--- |
| **Design Requirement** | Requires writing custom components & CSS | Fixed layout/theme tied to specific docs/blog specs | **Automatic Semantic AST:** Auto-detects heroes, features, pricing, FAQs from plain `.md` |
| **Content vs Design Split** | Mixed (JSX embedded inside Markdown) | Coupled to theme template tags | **100% Decoupled:** Same Markdown content renders in completely different themes |
| **Theme System** | Manual UI library building | Theme templates require framework-specific syntax | **Installable Theme Packages & Inheritance:** (`@forge/theme-startup` -> `@company/theme`) |
| **Runtime Overhead** | Often ships client-side JS bundles | Fast static HTML | **HTML-First, Zero Mandatory JS:** Native HTML/CSS output with optional hydration |
| **Structured Data** | Custom frontmatter & JavaScript mapping | Complex shortcodes | **Native YAML Support:** Turn clean YAML data into interactive UI cards & tables |
| **SEO & Schema.org** | Manual plugin setup or head tags | Basic meta tags | **Zero-Config Technical SEO:** Auto-generates OpenGraph, JSON-LD schemas, sitemap, & RSS |
| **Image Pipeline** | Requires `<Image />` component wrappers | Basic static copies | **Automatic Image Pipeline:** Auto-generates WebP/AVIF, responsive `srcset`, blur placeholders |
| **Developer DX** | Complex project directory structure | Custom CLI tools | **Zero-Boilerplate CLI:** `forge dev`, `forge build`, `forge theme preview` playground |

---

## 🏗️ Architecture & Component System

### 1. Semantic Parser Pipeline
```
[Content (.md / .mdx / .yaml)]
              │
        ┌─────▼─────┐
        │  Parser   │ (Remark / Rehype / MDAST)
        └─────┬─────┘
              │
        ┌─────▼─────┐
        │ Semantic  │ (Maps AST nodes to semantic layout types)
        │    AST    │
        └─────┬─────┘
              │
     ┌────────▼────────┐
     │ Component Engine │ (Auto-selects Hero, FeatureGrid, Pricing, Accordion)
     └────────┬────────┘
              │
        ┌─────▼─────┐
        │   Theme   │ (Applies Design Tokens & Theme Layouts)
        └─────┬─────┘
              │
     ┌────────▼────────┐
     │ Static Renderer │ (Generates ultra-fast HTML/CSS/Assets)
     └─────────────────┘
```

### 2. Built-in Semantic Components
- **Hero & Navbar / Footer**
- **FeatureGrid & Comparison Tables**
- **Pricing Cards & Stats Blocks**
- **FAQ Accordion & Timelines**
- **Gallery, Testimonials, & Callout Cards**

---

## 🎯 Target Users
- **Open-source maintainers** wanting instant, gorgeous product landing pages and docs.
- **Startups & SaaS builders** shipping fast marketing & documentation sites with zero frontend overhead.
- **Developers & Bloggers** who want to write Markdown without managing React component libraries.
- **Internal Platform & DX teams** standardizing documentation and knowledge bases across organizations.

---

## 📋 Submission Checklist (Incubator Standards)

- [x] Category selected (`cat: tool`)
- [x] Clear problem statement with 8 key friction points
- [x] Detailed solution architecture & core principles defined
- [x] Comprehensive feature comparison matrix included
- [x] Target audience identified
- [x] Ready for community discussion & feedback
