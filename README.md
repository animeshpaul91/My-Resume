# Professional Resume Template

A clean, single‑page LaTeX resume template specifically designed for software developers and technical professionals. This template emphasizes readability and professional presentation while maintaining ease of customization and compilation.

## Features

- **Single Page Layout**: Optimized for career fairs and quick scanning by recruiters
- **Clean Typography**: Uses standard LaTeX fonts for universal compatibility
- **Modular Structure**: Well-organized sections with custom commands for consistent formatting
- **Easy Customization**: Clearly documented sections make updates straightforward
- **Professional Sections**: Includes Education, Experience, Projects, Skills, and Certifications

## Project Structure

```
├── my_resume.tex         # Main LaTeX resume file
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

Recommended packages (Linux/TeX Live):
- texlive-latex-recommended
- texlive-latex-extra
- texlive-fonts-recommended
- texlive-fonts-extra (for marvosym)

Install examples:
- Ubuntu/Debian: `sudo apt update && sudo apt install -y texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra`
- macOS: install MacTeX from `https://tug.org/mactex/` (includes required packages)
- Windows: install MiKTeX and allow it to install missing packages on first compile

### Usage
1. Clone or download this repository
2. Edit `my_resume.tex` with your personal information
3. Compile using your preferred LaTeX editor or command line:
   ```bash
   pdflatex -interaction=nonstopmode -halt-on-error my_resume.tex
   ```
   The output PDF will be generated as `my_resume.pdf` in the repository root.

Optional (if you use `latexmk`):
```bash
latexmk -pdf -silent my_resume.tex
```

To compile the included weekly schedule: `pdflatex weekly_time_table.tex`

### Customization
The template includes custom commands for consistent formatting:
- `\resumeItem{title}{description}` — For experience and project items
- `\resumeSubheading{title}{date}{subtitle}{location}` — Two‑row heading with right‑aligned date/location
- `\resumeProjectHeading{title}{date}` — For project titles

Tip: If you don’t need a bolded label for a bullet, you can pass an empty first argument like `\resumeItem{}{Your bullet text here}`.

## Motivation

This template was created to address common resume management challenges:
- Google Docs limitations: difficult formatting controls and inconsistent styling
- Two‑column issues: harder to read and scan quickly
- Multi‑page problems: too lengthy for career fairs and initial screenings
- Customization complexity: many templates are brittle or hard to modify

## Web Portfolio

The `docs/` directory contains a complementary HTML portfolio that showcases:
- Detailed project descriptions with visual elements
- Professional certifications and achievements
- Publications and research contributions
- Interactive elements and modern web design

Preview locally:
- Simple server: `python3 -m http.server -d docs 8080` then open `http://localhost:8080`

Deploy with GitHub Pages:
- Push this repository to GitHub
- In repository Settings → Pages, set Source to `Deploy from a branch` and select branch `main` (or `master`) with folder `/docs`
- Your site will be served at `https://<username>.github.io/<repo>/`

Note: The HTML in `docs/` references assets in `docs/Animesh_files/`. Keep this folder intact when deploying.

## Scripts

Utility scripts live under `scripts/`:
- `scripts/update.sh` — Updates apt packages and stops some services (Tomcat/Jetty). Requires `sudo`; review before running.
- `scripts/no_lock_mouse_jiggle.sh` — Keeps the screen awake by nudging the mouse periodically (requires `xdotool`).
- `scripts/Heic_to_jpg_converter.py` — Batch converts HEIC images in a directory to JPG using `pyheif` and `Pillow`.
- `scripts/pre-commit-hook.sh` — Prepends an issue/ticket key from the branch name to the commit message.

## Troubleshooting

- Missing LaTeX packages: install the recommended TeX Live bundles above or allow MiKTeX to auto‑install on Windows.
- PDF not generated: run `pdflatex` twice to resolve references, or use `latexmk` for automatic runs.
- Encoding/font issues: ensure `\usepackage[T1]{fontenc}` is present (it is) and prefer `xelatex` if you need system fonts.

## License

The template format is licensed under MIT License. All personal data and content remain the property of the respective user.
