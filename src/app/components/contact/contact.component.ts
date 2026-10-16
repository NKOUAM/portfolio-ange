import { Component } from '@angular/core';
import { CONTACT } from '../../data/portfolio.data';
import { RevealDirective } from '../../directives/reveal.directive';

@Component({
  selector: 'app-contact',
  standalone: true,
  imports: [RevealDirective],
  template: `
    <section class="section contact-section" id="contact" appReveal>
      <p class="section-label">// 06 — ET SI ON CONSTRUISAIT ENSEMBLE ?</p>
      <h2>Une idée en tête ?<br><span>Parlons-en.</span></h2>
      <p class="contact-lead">
        Que ce soit pour un projet, une collaboration, une alternance ou simplement pour échanger — je suis ouvert aux opportunités.
      </p>
      <div class="contact-actions">
        <a [href]="'mailto:' + contact.email" class="btn-cyber btn-cyber-primary">
          M'envoyer un message <i class="bi bi-arrow-right"></i>
        </a>
        <a [href]="contact.github" target="_blank" rel="noreferrer" class="btn-cyber btn-cyber-secondary">
          Voir mon GitHub
        </a>
      </div>
      <div class="contact-socials">
        <a [href]="'mailto:' + contact.email" class="contact-social" aria-label="Email">
          <i class="bi bi-envelope" style="font-size:19px;"></i>
        </a>
        <a [href]="contact.github" target="_blank" rel="noreferrer" class="contact-social" aria-label="GitHub">
          <i class="bi bi-github" style="font-size:19px;"></i>
        </a>
      </div>
      <div style="margin-top:60px;">
        <p class="section-label" style="margin-bottom:20px;">// ORGANISATIONS GITHUB</p>
        <div class="orgs-list">
          @for (org of contact.organizations; track org.name) {
            <a [href]="org.url" target="_blank" rel="noreferrer" class="org-pill">&#64;{{ org.name }}</a>
          }
        </div>
      </div>
      <div style="margin-top:50px;">
        <p class="section-label" style="margin-bottom:20px;">// ACHIEVEMENTS</p>
        <div class="orgs-list">
          @for (a of contact.achievements; track a.name) {
            <span class="org-pill">{{ a.icon }} {{ a.name }}</span>
          }
        </div>
      </div>
    </section>
  `,
})
export class ContactComponent { contact = CONTACT; }
