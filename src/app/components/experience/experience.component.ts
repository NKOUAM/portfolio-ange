import { Component } from '@angular/core';
import { EXPERIENCES } from '../../data/portfolio.data';
import { RevealDirective } from '../../directives/reveal.directive';

@Component({
  selector: 'app-experience',
  standalone: true,
  imports: [RevealDirective],
  template: `
    <section class="section" id="experiences">
      <div class="section-heading" appReveal>
        <div>
          <p class="section-label">// 04 — PARCOURS</p>
          <h2>Expériences<span style="color:var(--cyan);text-shadow:0 0 18px rgba(0,234,255,0.8);">.</span></h2>
        </div>
        <p>Travaux réalisés, apprentissages et problèmes résolus.</p>
      </div>
      <div class="timeline">
        @for (exp of experiences; track exp.title + exp.year; let i = $index) {
          <div class="timeline-item" appReveal [delay]="i * 80">
            <span class="timeline-dot"></span>
            <div class="timeline-year">{{ exp.year }}</div>
            <div class="timeline-title">{{ exp.title }}</div>
            <div class="timeline-company">{{ exp.company }}</div>
            <p class="timeline-desc">{{ exp.description }}</p>
            <div class="timeline-tags">
              @for (t of exp.tags; track t) { <span class="timeline-tag">{{ t }}</span> }
            </div>
          </div>
        }
      </div>
    </section>
  `,
})
export class ExperienceComponent { experiences = EXPERIENCES; }
