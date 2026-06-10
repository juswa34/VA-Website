# Charles Portfolio Website

Open `index.html` in a browser to view the complete portfolio.

## Structure

- `index.html` - complete website page
- `assets/css/styles.css` - shared website styles
- `sections/home/section.html` - home section source
- `sections/about/section.html` - about section source
- `sections/portfolio/section.html` - portfolio section source
- `sections/certificates/section.html` - certifications section source
- `sections/services/section.html` - services and pricing section source
- `sections/contact/section.html` - contact and socials section source
- `build.ps1` - rebuilds `index.html` from the section files

After editing a section file, run this command from this folder to update `index.html`:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\build.ps1
```
