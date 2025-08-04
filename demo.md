---
layout: page
title: Demo - Template Overview
lang: de
---

# Trailmarks.io Documentation Template - Demonstration

Diese Seite zeigt die implementierten Features des Dokumentations-Templates.

## ✅ Implementierte Features

### 📁 Struktur
- **Bilingual**: Deutsch/Englisch mit automatischer Sprachumschaltung
- **ARC42**: Vollständige Architektur-Dokumentation nach Standard
- **C4 Model**: PlantUML-Integration für Architektur-Diagramme
- **Modularer Aufbau**: Separate Bereiche für verschiedene Dokumentationstypen

### 🛠️ Technische Implementation

#### AsciiDoc Source Format
```asciidoc
= Dokument Titel
:doctype: book
:toc: left

== Hauptkapitel

Text mit *formatierung* und Links.

[plantuml, diagram-name, svg]
----
@startuml
!include <C4/C4_Context>
Person(user, "User")
@enduml
----
```

#### Automatische Konvertierung
- **Source**: AsciiDoc (`.adoc`) Dateien im `src/` Verzeichnis
- **Build**: GitHub Actions konvertiert zu Markdown
- **Output**: Jekyll generiert statische Website
- **Deploy**: Automatische Veröffentlichung auf GitHub Pages

#### C4 Model Diagramme
```plantuml
Context Diagram:
- Person(user, "Trail User")
- System(trailmarks, "Trailmarks.io")
- System_Ext(maps, "Maps Service")

Container Diagram:
- Container(spa, "Single Page App", "React")
- Container(api, "API Application", "Node.js")
- ContainerDb(db, "Database", "PostgreSQL")

Component Diagram:
- Component(controller, "REST Controllers")
- Component(service, "Business Logic")
- Component(repository, "Data Access")
```

### 📖 Dokumentations-Bereiche

#### Benutzer-Dokumentation
- **[Benutzerhandbuch](../user-guide/)**: Vollständige Anleitung
- **[How-Tos](../howtos/)**: Schritt-für-Schritt Anleitungen
- **[FAQ](../faq/)**: Häufig gestellte Fragen

#### Technische Dokumentation
- **[Architektur](../architecture/)**: ARC42-konforme Dokumentation
- **API Dokumentation**: (Geplant)
- **Entwickler-Handbuch**: (Geplant)

### 🌐 Navigation

```
├── 🏠 Startseite
├── 📖 Benutzerhandbuch
│   └── Vollständige Anleitung
├── 🏗️ Architektur
│   └── ARC42 Dokumentation
├── 🛠️ How-Tos
│   └── Import GPS-Daten
└── ❓ FAQ
    └── Allgemeine Fragen
```

### 🔄 Build-Pipeline

1. **Source**: AsciiDoc in `src/de/` und `src/en/`
2. **Convert**: AsciiDoctor konvertiert zu HTML
3. **Transform**: Pandoc erstellt Markdown mit Jekyll Front Matter
4. **Diagrams**: PlantUML generiert SVG-Diagramme
5. **Build**: Jekyll baut statische Website
6. **Deploy**: GitHub Pages Deployment

## 📋 Template-Inhalt

### Architektur (ARC42)
Die Architektur-Dokumentation folgt strikt dem ARC42-Template:

1. **Einführung und Ziele** ✅
2. **Randbedingungen** ✅
3. **Kontextabgrenzung** ✅ (mit C4 Context Diagrams)
4. **Lösungsstrategie** ✅
5. **Bausteinsicht** ✅ (mit C4 Container/Component Diagrams)
6. **Laufzeitsicht** ✅ (mit Sequence Diagrams)
7. **Verteilungssicht** ✅ (mit Deployment Diagrams)
8. **Querschnittliche Konzepte** ✅
9. **Architekturentscheidungen** ✅ (ADR Format)
10. **Risiken und technische Schulden** ✅
11. **Glossar** ✅

### C4 Model Integration
Alle Architektur-Diagramme verwenden das C4 Model:

```asciidoc
[plantuml, context-diagram, svg]
----
@startuml
!include <C4/C4_Context>

Person(user, "Trail User", "Nutzer der Anwendung")
System(trailmarks, "Trailmarks.io", "Trail Management System")
System_Ext(maps, "Maps Service", "Externe Kartendienste")

Rel(user, trailmarks, "Nutzt", "HTTPS")
Rel(trailmarks, maps, "Holt Daten", "API")

SHOW_LEGEND()
@enduml
----
```

## 🚀 Nächste Schritte

1. **Content-Erstellung**: AsciiDoc-Dateien mit Inhalten füllen
2. **Diagramm-Vervollständigung**: Weitere PlantUML-Diagramme hinzufügen
3. **API-Dokumentation**: OpenAPI/Swagger Integration
4. **Testing**: Automatische Tests für Dokumentation
5. **Analytics**: Tracking und Verbesserung der Nutzererfahrung

## 📞 Support

- **GitHub**: [trailmarks-io/docs](https://github.com/trailmarks-io/docs)
- **Issues**: [Bug Reports & Feature Requests](https://github.com/trailmarks-io/docs/issues)
- **Email**: docs@trailmarks.io

---

*Template erstellt für Trailmarks.io Dokumentation*