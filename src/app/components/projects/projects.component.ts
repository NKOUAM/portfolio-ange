import { Component } from '@angular/core';
import { PROJECTS } from '../../data/portfolio.data';
import { RevealDirective } from '../../directives/reveal.directive';

@Component({
  selector: 'app-projects',
  standalone: true,
  imports: [RevealDirective],
  template: `
    <section class="section" id="projets">
      <div class="section-heading" appReveal>
        <div>
          <p class="section-label">// 03 — RÉALISATIONS</p>
          <h2>Projets<span style="color:var(--cyan);text-shadow:0 0 18px rgba(0,234,255,0.8);">.</span></h2>
        </div>
        <p>Des projets concrets, des apprentissages réels et du code que je peux expliquer.</p>
      </div>
      <div class="projects-grid">
        @for (p of projects; track p.id; let i = $index) {
          <article class="project-card" [class]="p.color" appReveal [delay]="(i % 3) * 80">
            <div class="project-header">
              <div class="project-icon"><i class="bi" [class]="p.icon"></i></div>
              <span class="project-status">{{ p.status }}</span>
            </div>
            <h3>{{ p.title }}</h3>
            <div class="project-subtitle">{{ p.subtitle }}</div>
            <p class="project-description">{{ p.description }}</p>
            <ul class="project-features">
              @for (f of p.features; track f) { <li>{{ f }}</li> }
            </ul>
            <div class="project-tech">
              @for (t of p.tech; track t) { <span>{{ t }}</span> }
            </div>
            @if (p.github) {
              <div class="project-links">
                <a [href]="p.github" target="_blank" rel="noreferrer" class="project-link">
                  <i class="bi bi-github"></i> Code source
                </a>
              </div>
            }
          </article>
        }
      </div>
    </section>
  `,
})
export class ProjectsComponent { projects = PROJECTS; }
