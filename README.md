# Trailmarks.io Documentation

This repository contains the complete documentation for Trailmarks.io, including user guides, technical architecture documentation, and development resources.

## 📁 Structure

```
├── src/                    # Source documentation (AsciiDoc)
│   ├── de/                # German documentation
│   │   ├── architecture/  # ARC42 architecture docs
│   │   ├── user-guide/    # User documentation
│   │   ├── howtos/        # Step-by-step guides
│   │   └── faq/           # Frequently asked questions
│   └── en/                # English documentation
│       ├── architecture/  # ARC42 architecture docs
│       ├── user-guide/    # User documentation
│       ├── howtos/        # Step-by-step guides
│       └── faq/           # Frequently asked questions
├── _layouts/              # Jekyll page layouts
├── _sass/                 # Custom styles
├── assets/                # Static assets
├── scripts/               # Build and conversion scripts
└── *.md                   # Section index pages
```

## 🌐 Documentation Website

The documentation is automatically built and deployed to GitHub Pages:
- **German**: https://trailmarks-io.github.io/docs/
- **English**: https://trailmarks-io.github.io/docs/en/

## 📝 Writing Documentation

### Source Format

All documentation is written in **AsciiDoc** format (`.adoc` files) in the `src/` directory. AsciiDoc provides:

- Rich formatting capabilities
- Code highlighting
- Table support
- Diagram integration with PlantUML
- Cross-references and links

### Architecture Documentation

The architecture documentation follows the **ARC42 template** and includes:

- Introduction and Goals
- Architecture Constraints
- Context and Scope
- Solution Strategy
- Building Block View
- Runtime View
- Deployment View
- Cross-cutting Concepts
- Architecture Decisions
- Risks and Technical Debt
- Glossary

### Diagrams

All architectural diagrams use the **C4 Model** and are created with **PlantUML**:

```asciidoc
[plantuml, diagram-name, svg]
----
@startuml
!include <C4/C4_Context>

Person(user, "User")
System(system, "Trailmarks.io")

Rel(user, system, "Uses")
@enduml
----
```

## 🔄 Build Process

### Automatic Build (GitHub Actions)

The documentation is automatically built and deployed when changes are pushed to the `main` branch:

1. **Convert**: AsciiDoc files are converted to Markdown
2. **Generate**: PlantUML diagrams are generated as SVG
3. **Build**: Jekyll builds the static site
4. **Deploy**: Site is deployed to GitHub Pages

### Local Development

#### Prerequisites

```bash
# Install Ruby and Jekyll
gem install jekyll bundler

# Install AsciiDoctor
gem install asciidoctor asciidoctor-diagram

# Install PlantUML (optional, for diagram generation)
sudo apt-get install plantuml

# Install Pandoc (for better Markdown conversion)
sudo apt-get install pandoc
```

#### Build Locally

```bash
# Clone the repository
git clone https://github.com/trailmarks-io/docs.git
cd docs

# Install dependencies
bundle install

# Convert AsciiDoc to Markdown
./scripts/convert-docs.sh

# Serve locally
bundle exec jekyll serve

# Open http://localhost:4000
```

## 📖 Documentation Sections

### User Documentation

- **[User Guide](user-guide/)**: Complete guide for end users
- **[How-Tos](howtos/)**: Step-by-step task instructions
- **[FAQ](faq/)**: Frequently asked questions

### Technical Documentation

- **[Architecture](architecture/)**: ARC42 technical documentation
- **API Documentation**: (Coming soon)
- **Developer Guides**: (Coming soon)

## 🌍 Internationalization

The documentation is available in:

- 🇩🇪 **German** (Deutsch) - Primary language
- 🇺🇸 **English** - Secondary language

All content should be maintained in both languages.

## 🤝 Contributing

### Adding New Documentation

1. Create `.adoc` files in the appropriate `src/` directory
2. Follow the existing structure and naming conventions
3. Include proper front matter and metadata
4. Add diagrams using PlantUML and C4 Model conventions
5. Test locally before committing

### Updating Existing Documentation

1. Edit the source `.adoc` files
2. Ensure both German and English versions are updated
3. Update any related diagrams
4. Test the build process locally

### Creating Diagrams

Use PlantUML with C4 Model includes:

```asciidoc
[plantuml, your-diagram-name, svg]
----
@startuml
!include <C4/C4_Context>
!include <C4/C4_Container>
!include <C4/C4_Component>

' Your diagram content here

SHOW_LEGEND()
@enduml
----
```

## 📋 Standards and Guidelines

### ARC42 Template

The architecture documentation strictly follows the ARC42 template sections:

1. Introduction and Goals
2. Architecture Constraints
3. Context and Scope
4. Solution Strategy
5. Building Block View
6. Runtime View
7. Deployment View
8. Cross-cutting Concepts
9. Architecture Decisions
10. Quality Requirements
11. Risks and Technical Debt
12. Glossary

### C4 Model

All architecture diagrams follow the C4 Model hierarchy:

- **Level 1**: System Context diagrams
- **Level 2**: Container diagrams
- **Level 3**: Component diagrams
- **Level 4**: Code diagrams (optional)

### Writing Style

- Use clear, concise language
- Include practical examples
- Provide step-by-step instructions
- Cross-reference related sections
- Include troubleshooting information

## 🚀 Deployment

The documentation is automatically deployed to GitHub Pages using GitHub Actions. The deployment process:

1. Triggers on push to `main` branch
2. Converts AsciiDoc to Markdown with front matter
3. Generates PlantUML diagrams
4. Builds Jekyll site
5. Deploys to GitHub Pages

## 📞 Support

For questions about the documentation:

- **Issues**: [GitHub Issues](https://github.com/trailmarks-io/docs/issues)
- **Discussions**: [GitHub Discussions](https://github.com/trailmarks-io/docs/discussions)
- **Email**: docs@trailmarks.io

## 📄 License

This documentation is licensed under [MIT License](LICENSE).