# Professional Resume Template

A clean, single-page LaTeX resume template specifically designed for software developers and technical professionals. This template emphasizes readability and professional presentation while maintaining ease of customization and compilation.

## Features

- **Single Page Layout**: Optimized for career fairs and quick scanning by recruiters
- **Clean Typography**: Uses standard LaTeX fonts for universal compatibility
- **Modular Structure**: Well-organized sections with custom commands for consistent formatting
- **Easy Customization**: Clearly documented sections make updates straightforward
- **Professional Sections**: Includes Education, Experience, Projects, Skills, and Certifications

## Project Structure

```
├── myresume.tex          # Main LaTeX resume file
├── docs/                 # HTML portfolio and assets
│   ├── index.html        # Personal portfolio homepage
│   ├── projects.html     # Projects showcase
│   ├── publications.html # Publications and research
│   ├── certifications.html # Professional certifications
│   └── Animesh_files/    # Assets (CSS, JS, images)
├── scripts/              # Utility scripts
└── README.md            # This file
```

## Getting Started

### Prerequisites
- LaTeX distribution (TeX Live, MiKTeX, or MacTeX)
- Basic knowledge of LaTeX syntax

### Usage
1. Clone or download this repository
2. Edit `myresume.tex` with your personal information
3. Compile using your preferred LaTeX editor or command line:
   ```bash
   pdflatex myresume.tex
   ```

### Customization
The template includes custom commands for consistent formatting:
- `\resumeItem{title}{description}` - For experience and project items
- `\resumeSubheading{title}{date}{subtitle}{location}` - For section headers
- `\resumeProjectHeading{title}{date}` - For project titles

## Motivation

This template was created to address common resume management challenges:
- **Google Docs Limitations**: Difficult formatting controls and inconsistent styling
- **Two-Column Issues**: Hard to read and scan quickly
- **Multi-Page Problems**: Too lengthy for career fairs and initial screenings
- **Customization Complexity**: Most templates are hard to modify without breaking formatting

## Web Portfolio

The `docs/` directory contains a complementary HTML portfolio that showcases:
- Detailed project descriptions with visual elements
- Professional certifications and achievements
- Publications and research contributions
- Interactive elements and modern web design

## License

The template format is licensed under MIT License. All personal data and content remain the property of the respective user.
