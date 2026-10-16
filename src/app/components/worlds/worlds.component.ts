import { Component } from '@angular/core';
import { WORLDS } from '../../data/portfolio.data';
import { RevealDirective } from '../../directives/reveal.directive';

@Component({
  selector: 'app-worlds',
  standalone: true,
  imports: [RevealDirective],
  template: `
    <section class="section" id="univers">
      <div class="section-heading" appReveal>
        <div>
          <p class="section-label">// 05 — AU-DELÀ DU CODE</p>
          <h2>Autres univers<span style="color:var(--cyan);text-shadow:0 0 18px rgba(0,234,255,0.8);">.</span></h2>
        </div>
        <p>Création numérique, entrepreneuriat et agronomie — les univers qui nourrissent ma vision.</p>
      </div>
      <div class="worlds-grid">
        @for (w of worlds; track w.title; let i = $index) {
          <article class="world-card" [class]="w.color" appReveal [delay]="i * 100">
            <div class="world-icon"><i class="bi" [class]="w.icon"></i></div>
            <h3>{{ w.title }}</h3>
            <p>{{ w.description }}</p>
            <div class="world-tags">
              @for (t of w.tags; track t) { <span>{{ t }}</span> }
            </div>
          </article>
        }
      </div>
    </section>
  `,
})
export class WorldsComponent { worlds = WORLDS; }
