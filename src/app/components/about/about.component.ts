import { Component } from '@angular/core';
import { RevealDirective } from '../../directives/reveal.directive';

@Component({
  selector: 'app-about',
  standalone: true,
  imports: [RevealDirective],
  template: `
    <section id="apropos" class="section">
      <p class="section-label" appReveal>// 01 — QUI SUIS-JE</p>
      <div class="about-grid" style="margin-top:40px;">
        <div class="about-text" appReveal [delay]="100">
          <h2 style="font-size:clamp(34px,5vw,58px);font-weight:800;letter-spacing:-2.5px;line-height:1.1;">
            Un esprit curieux.<br>
            <span class="gradient-text">Une ambition sans frontières.</span>
          </h2>
          <p style="margin-top:28px;">Je m'appelle <strong>Ange Guilbert</strong>. Je développe mes compétences en informatique tout en explorant d'autres univers — la création numérique, l'entrepreneuriat et l'agronomie.</p>
          <p>Mon objectif n'est pas seulement d'écrire du code : je veux <strong>comprendre les systèmes</strong>, résoudre des problèmes réels et construire des solutions utiles.</p>
          <p>À travers ce portfolio, tu découvriras ce que je sais faire <strong>aujourd'hui</strong>, mais aussi ma capacité à apprendre vite et à mener des projets jusqu'au bout.</p>
        </div>
        <div class="about-stats" appReveal [delay]="200">
          @for (s of stats; track s.label) {
            <div class="stat-card"><div class="stat-value">{{ s.value }}</div><div class="stat-label">{{ s.label }}</div></div>
          }
        </div>
      </div>
    </section>
  `,
})
export class AboutComponent {
  stats = [
    { value: '05', label: 'DOMAINES' },
    { value: '42', label: 'REPOS GITHUB' },
    { value: '∞', label: 'CURIOSITÉ' },
    { value: '24/7', label: 'APPRENTISSAGE' },
  ];
}
