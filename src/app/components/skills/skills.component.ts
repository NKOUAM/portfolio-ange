import { Component } from '@angular/core';
import { SKILLS } from '../../data/portfolio.data';
import { RevealDirective } from '../../directives/reveal.directive';

@Component({
  selector: 'app-skills',
  standalone: true,
  imports: [RevealDirective],
  template: `
    <section class="section" id="competences">
      <div class="section-heading" appReveal>
        <div>
          <p class="section-label">// 02 — MON UNIVERS</p>
          <h2>Compétences<span style="color:var(--cyan);text-shadow:0 0 18px rgba(0,234,255,0.8);">.</span></h2>
        </div>
        <p>Des connaissances que je développe, des idées que je concrétise.</p>
      </div>
      <div class="skills-grid">
        @for (skill of skills; track skill.number; let i = $index) {
          <article class="skill-card" [class]="skill.color" appReveal [delay]="i * 100">
            <span class="skill-level">{{ skill.level }}</span>
            <div class="skill-card-top">
              <span>{{ skill.number }} / 05</span>
              <i class="bi" [class]="skill.icon" style="font-size:22px;"></i>
            </div>
            <h3>{{ skill.title }}</h3>
            <p>{{ skill.description }}</p>
            <div class="skill-tags">
              @for (item of skill.items; track item) { <span class="skill-tag">{{ item }}</span> }
            </div>
          </article>
        }
      </div>
    </section>
  `,
})
export class SkillsComponent { skills = SKILLS; }
