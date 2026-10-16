import { Component } from '@angular/core';
import { CursorComponent } from './components/cursor/cursor.component';
import { ParticlesComponent } from './components/particles/particles.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { HeroComponent } from './components/hero/hero.component';
import { AboutComponent } from './components/about/about.component';
import { SkillsComponent } from './components/skills/skills.component';
import { ProjectsComponent } from './components/projects/projects.component';
import { ExperienceComponent } from './components/experience/experience.component';
import { WorldsComponent } from './components/worlds/worlds.component';
import { ContactComponent } from './components/contact/contact.component';
import { FooterComponent } from './components/footer/footer.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [
    CursorComponent, ParticlesComponent, NavbarComponent, HeroComponent,
    AboutComponent, SkillsComponent, ProjectsComponent, ExperienceComponent,
    WorldsComponent, ContactComponent, FooterComponent,
  ],
  template: `
    <main class="portfolio">
      <div class="ambient ambient-one"></div>
      <div class="ambient ambient-two"></div>
      <div class="ambient ambient-three"></div>
      <div class="grid-overlay"></div>
      <app-particles></app-particles>
      <app-cursor></app-cursor>
      <app-navbar></app-navbar>
      <app-hero></app-hero>
      <app-about></app-about>
      <app-skills></app-skills>
      <app-projects></app-projects>
      <app-experience></app-experience>
      <app-worlds></app-worlds>
      <app-contact></app-contact>
      <app-footer></app-footer>
    </main>
  `,
})
export class App {}
