#!/bin/bash

# Simple script to convert AsciiDoc to Markdown for local testing
# Requires: asciidoctor, pandoc

echo "Converting AsciiDoc files to Markdown..."

# Create output directories
mkdir -p docs/de docs/en

# Function to convert a single file
convert_file() {
    local input_file="$1"
    local output_file="$2"
    local lang="$3"
    local title="$4"
    
    if [ ! -f "$input_file" ]; then
        echo "Warning: $input_file not found"
        return
    fi
    
    # Create output directory
    mkdir -p "$(dirname "$output_file")"
    
    # Convert AsciiDoc to HTML first
    asciidoctor -r asciidoctor-diagram -b html5 -o temp.html "$input_file"
    
    if [ ! -f temp.html ]; then
        echo "Error: Failed to convert $input_file to HTML"
        return
    fi
    
    # Create front matter
    cat > "$output_file" << EOF
---
layout: page
title: $title
lang: $lang
---

EOF
    
    # Convert HTML to Markdown and append
    if command -v pandoc >/dev/null 2>&1; then
        pandoc -f html -t markdown temp.html >> "$output_file"
    else
        echo "Warning: pandoc not found, using simple conversion"
        # Fallback: strip HTML tags
        sed 's/<[^>]*>//g' temp.html | sed '/^$/d' >> "$output_file"
    fi
    
    rm -f temp.html
    echo "Converted: $input_file -> $output_file"
}

# Convert German files
if [ -f "src/de/architecture/arc42-documentation.adoc" ]; then
    convert_file "src/de/architecture/arc42-documentation.adoc" "docs/de/architecture/arc42-documentation.md" "de" "Architektur-Dokumentation: Trailmarks.io"
fi

if [ -f "src/de/user-guide/user-guide.adoc" ]; then
    convert_file "src/de/user-guide/user-guide.adoc" "docs/de/user-guide/user-guide.md" "de" "Benutzerhandbuch: Trailmarks.io"
fi

if [ -f "src/de/howtos/import-gps-data.adoc" ]; then
    convert_file "src/de/howtos/import-gps-data.adoc" "docs/de/howtos/import-gps-data.md" "de" "How-To: Trail mit GPS-Daten importieren"
fi

if [ -f "src/de/faq/general-faq.adoc" ]; then
    convert_file "src/de/faq/general-faq.adoc" "docs/de/faq/general-faq.md" "de" "Häufig gestellte Fragen (FAQ)"
fi

# Convert English files
if [ -f "src/en/architecture/arc42-documentation.adoc" ]; then
    convert_file "src/en/architecture/arc42-documentation.adoc" "docs/en/architecture/arc42-documentation.md" "en" "Architecture Documentation: Trailmarks.io"
fi

if [ -f "src/en/user-guide/user-guide.adoc" ]; then
    convert_file "src/en/user-guide/user-guide.adoc" "docs/en/user-guide/user-guide.md" "en" "User Guide: Trailmarks.io"
fi

if [ -f "src/en/howtos/import-gps-data.adoc" ]; then
    convert_file "src/en/howtos/import-gps-data.adoc" "docs/en/howtos/import-gps-data.md" "en" "How-To: Import Trail with GPS Data"
fi

if [ -f "src/en/faq/general-faq.adoc" ]; then
    convert_file "src/en/faq/general-faq.adoc" "docs/en/faq/general-faq.md" "en" "Frequently Asked Questions (FAQ)"
fi

echo "Conversion complete!"