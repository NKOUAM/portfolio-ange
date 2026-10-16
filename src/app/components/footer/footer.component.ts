import { Component } from '@angular/core';
import { CONTACT } from '../../data/portfolio.data';

@Component({
  selector: 'app-footer',
  standalone: true,
  template: `
    <footer class="footer">
      <a href="#accueil" class="brand">AG<span>.</span></a>
      <p>© 2026 Ange Guilbert — Conçu avec curiosité et beaucoup de lignes de code.</p>
      <a [href]="contact.github" target="_blank" rel="noreferrer" aria-label="GitHub" style="color:var(--muted);">
        <i class="bi bi-github" style="font-size:20px;"></i>
      </a>
    </footer>
  `,
})
export class FooterComponent { contact = CONTACT; }
