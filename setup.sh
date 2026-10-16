#!/bin/bash
set -e
cd ~/porfolio/porfolio

echo "📝 1/18 — angular.json"
cat > angular.json << 'EOF'
{
  "$schema": "./node_modules/@angular/cli/lib/config/schema.json",
  "version": 1,
  "newProjectRoot": "projects",
  "projects": {
    "porfolio": {
      "projectType": "application",
      "schematics": {},
      "root": "",
      "sourceRoot": "src",
      "prefix": "app",
      "architect": {
        "build": {
          "builder": "@angular/build:application",
          "options": {
            "browser": "src/main.ts",
            "polyfills": ["zone.js"],
            "tsConfig": "tsconfig.app.json",
            "assets": [{"glob": "**/*", "input": "public"}],
            "styles": [
              "node_modules/bootstrap/dist/css/bootstrap.min.css",
              "node_modules/bootstrap-icons/font/bootstrap-icons.css",
              "src/styles.css"
            ],
            "scripts": ["node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"]
          },
          "configurations": {
            "production": {
              "budgets": [
                {"type": "initial", "maximumWarning": "800kB", "maximumError": "1.5MB"},
                {"type": "anyComponentStyle", "maximumWarning": "10kB", "maximumError": "20kB"}
              ],
              "outputHashing": "all"
            },
            "development": {
              "optimization": false,
              "extractLicenses": false,
              "sourceMap": true
            }
          },
          "defaultConfiguration": "development"
        },
        "serve": {
          "builder": "@angular/build:dev-server",
          "configurations": {
            "production": {"buildTarget": "porfolio:build:production"},
            "development": {"buildTarget": "porfolio:build:development"}
          },
          "defaultConfiguration": "development"
        },
        "extract-i18n": {"builder": "@angular/build:extract-i18n"}
      }
    }
  }
}
EOF

echo "📝 2/18 — src/index.html"
cat > src/index.html << 'EOF'
<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>Ange Guilbert | Creative Developer & Software Engineer</title>
  <base href="/">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Portfolio d'Ange Guilbert — développement web, architecture logicielle, systèmes, création numérique et entrepreneuriat.">
</head>
<body>
  <app-root></app-root>
</body>
</html>
EOF

echo "📝 3/18 — src/main.ts"
cat > src/main.ts << 'EOF'
import { bootstrapApplication } from '@angular/platform-browser';
import { App } from './app/app';
import { appConfig } from './app/app.config';

bootstrapApplication(App, appConfig).catch((err) => console.error(err));
EOF

echo "📝 4/18 — src/app/app.config.ts"
cat > src/app/app.config.ts << 'EOF'
import { ApplicationConfig, provideZoneChangeDetection } from '@angular/core';

export const appConfig: ApplicationConfig = {
  providers: [provideZoneChangeDetection({ eventCoalescing: true })],
};
EOF

echo "📝 5/18 — src/app/app.ts"
cat > src/app/app.ts << 'EOF'
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
EOF

echo "📝 6/18 — data/portfolio.data.ts"
cat > src/app/data/portfolio.data.ts << 'EOF'
export interface Skill {
  number: string; title: string; description: string;
  icon: string; color: "cyan" | "purple" | "pink" | "green" | "amber";
  items: string[]; level: string;
}
export interface Project {
  id: string; title: string; subtitle: string; description: string;
  tech: string[]; icon: string;
  color: "cyan" | "purple" | "pink" | "green" | "amber";
  status: string; github: string; demo?: string; features: string[];
}
export interface Experience { year: string; title: string; company: string; description: string; tags: string[]; }
export interface World { title: string; icon: string; color: "pink" | "amber" | "green"; description: string; tags: string[]; }

export const SKILLS: Skill[] = [
  { number: "01", title: "Développement Web", description: "Angular, Next.js, React, TypeScript, HTML/CSS responsive, Bootstrap, RxJS et consommation d'API REST.", icon: "bi-code-slash", color: "cyan", items: ["Angular","TypeScript","Next.js","React","RxJS","Bootstrap","API REST"], level: "En pratique régulière" },
  { number: "02", title: "Architecture & Ingénierie", description: "Clean Architecture, séparation en couches, injection de dépendances, JWT, Swagger/OpenAPI, Git & GitHub.", icon: "bi-layers", color: "purple", items: ["Clean Architecture","DDD","Repositories","DI","JWT","Swagger","Git"], level: "En apprentissage actif" },
  { number: "03", title: "Systèmes & Télécoms", description: "Linux, machines virtuelles, configuration d'Asterisk, découverte de PJSIP, endpoints et tests SIP.", icon: "bi-terminal", color: "pink", items: ["Linux","VMs","Asterisk","PJSIP","Softphones","Tests SIP"], level: "Expérimentation" },
  { number: "04", title: "Création Numérique", description: "Univers artistique King-G, direction visuelle de projets musicaux, pochettes, affiches et identité digitale.", icon: "bi-palette", color: "green", items: ["Direction artistique","Pochettes","Affiches","Punchlines","Identité"], level: "Projets personnels" },
  { number: "05", title: "Entrepreneuriat & Agronomie", description: "Concept GOLDEN SKY LTD, arboriculture fruitière, apiculture, réflexion élevage et gestion d'entreprise.", icon: "bi-tree", color: "amber", items: ["GOLDEN SKY LTD","Arboriculture","Apiculture","Élevage","Gestion"], level: "Vision long terme" },
];

export const PROJECTS: Project[] = [
  { id: "kfokam48-fullstack", title: "Épreuve Fullstack KFOKAM48", subtitle: "Exam fullstack Java · Matricule 192", description: "Projet complet pour l'épreuve finale fullstack de KFOKAM48. Backend Java, frontend séparé et intégration API REST.", tech: ["Java","API REST","Frontend"], icon: "bi-server", color: "purple", status: "Terminé", github: "https://github.com/NKOUAM/kfokam48-epreuve-192", features: ["Backend Java structuré","Frontend séparé et intégré","API REST complète","Architecture front/back"] },
  { id: "gestion-stock", title: "Gestion de Stock", subtitle: "Application d'inventaire · Java & TypeScript", description: "Suite d'applications de gestion de stock en plusieurs itérations (Java, TypeScript, microservices). Suivi d'inventaire et tableau de bord.", tech: ["Java","TypeScript","Microservices"], icon: "bi-boxes", color: "green", status: "En développement", github: "https://github.com/NKOUAM/GESTION_DE_STOCK_v1", features: ["Gestion entrées / sorties","Suivi d'inventaire","Version microservice","Travail en organisation"] },
  { id: "nkouam-et-fils", title: "NKOUAM & Fils", subtitle: "Application TypeScript", description: "Application TypeScript pour une activité familiale — gestion, présentation et organisation.", tech: ["TypeScript","Web","Gestion"], icon: "bi-briefcase", color: "amber", status: "En développement", github: "https://github.com/NKOUAM/nkouam-et-fils", features: ["Architecture TypeScript","Interface de gestion","Contexte métier réel"] },
  { id: "kamgaing-ange", title: "Bibliothèque Kamgaing", subtitle: "Application de gestion de livres", description: "Application de gestion de bibliothèque en TypeScript. Catalogue, emprunts et gestion des ouvrages.", tech: ["TypeScript","Angular"], icon: "bi-book", color: "cyan", status: "Publié", github: "https://github.com/NKOUAM/kamgaing-ange", features: ["Catalogue d'ouvrages","Gestion des emprunts","Interface TypeScript"] },
  { id: "djangui-space", title: "DJANGUI SPACE", subtitle: "Plateforme de cotisation en ligne", description: "Site de cotisation en ligne pour groupes (tontines, associations). Suivi des contributions et gestion des membres.", tech: ["HTML","CSS","JavaScript"], icon: "bi-people", color: "pink", status: "Publié", github: "https://github.com/NKOUAM/djanguispace", features: ["Suivi des cotisations","Gestion des membres","Plusieurs versions"] },
  { id: "musichub", title: "MusicHub", subtitle: "Plateforme musicale", description: "Projet autour de la musique — présentation, découverte et gestion de contenus musicaux.", tech: ["Web","TypeScript","UI"], icon: "bi-music-note-beamed", color: "purple", status: "En développement", github: "https://github.com/NKOUAM/musichub", features: ["Interface musicale moderne","Présentation de contenus","Lien avec King-G"] },
  { id: "deifict-crafts", title: "Deifict Crafts", subtitle: "Plateforme artisanat (v1 + v2)", description: "Projet de plateforme autour de l'artisanat. PostgreSQL pour la base de données. Deux versions itératives.", tech: ["PLpgSQL","PostgreSQL","Web"], icon: "bi-bag", color: "green", status: "En développement", github: "https://github.com/NKOUAM/deifict-crafts", features: ["Base PostgreSQL","Deux versions","Logique métier serveur"] },
  { id: "clinique-medicale", title: "Clinique Médicale", subtitle: "Gestion d'établissement de santé", description: "Application orientée gestion médicale — patients, rendez-vous et organisation d'une clinique.", tech: ["Web","Base de données"], icon: "bi-hospital", color: "cyan", status: "En développement", github: "https://github.com/NKOUAM/Clinique-M-dicale", features: ["Gestion patients","Rendez-vous","Interface administration"] },
  { id: "portfolio-old", title: "Portfolio v1", subtitle: "Première version de mon portfolio", description: "Ma première tentative de portfolio en CSS pur. Un souvenir qui montre mon évolution.", tech: ["HTML","CSS"], icon: "bi-file-code", color: "amber", status: "Archive", github: "https://github.com/NKOUAM/portfolio", features: ["HTML/CSS pur","Design responsive","Point de départ"] },
  { id: "superapp", title: "SuperApp", subtitle: "Plateforme multi-services modulaire", description: "Concept de super-application regroupant plusieurs modules. Réflexion sur l'architecture scalable et l'évolution modulaire.", tech: ["Architecture modulaire","TypeScript","Clean Architecture"], icon: "bi-rocket", color: "purple", status: "En conception", github: "https://github.com/NKOUAM", features: ["Architecture modulaire","Séparation des couches","Vision produit"] },
  { id: "g-k-dev", title: "G.K-Dev", subtitle: "Vitrine créative", description: "Projet CSS créatif — vitrine de design et d'identité visuelle. Autre facette côté création numérique.", tech: ["HTML","CSS","Design"], icon: "bi-palette2", color: "green", status: "Publié", github: "https://github.com/NKOUAM/G.K-dev", features: ["Design créatif","Mise en page avancée","Identité visuelle"] },
];

export const EXPERIENCES: Experience[] = [
  { year: "2026", title: "Épreuve finale Fullstack KFOKAM48", company: "KFOKAM48 · Matricule 192", description: "Développement d'un projet fullstack complet (backend Java + frontend + API REST) pour valider l'épreuve finale.", tags: ["Java","API REST","Fullstack"] },
  { year: "2026", title: "Gestion de stock v2 — Organisation GitHub", company: "gestion-de-stock-v2", description: "Développement d'une application de gestion de stock en collaboration. Microservices, Git flow et revues de code.", tags: ["Collaboration","Git","Microservices"] },
  { year: "2025 → 2026", title: "Projets TypeScript & Angular", company: "NKOUAM & Fils · Kamgaing-ange", description: "Construction de plusieurs applications TypeScript pour renforcer ma maîtrise du front moderne et de l'architecture.", tags: ["Angular","TypeScript","Architecture"] },
  { year: "2025", title: "Sites HTML/JS — DJANGUI SPACE, E-commerce", company: "Projets personnels", description: "Création de plateformes web pour maîtriser HTML, CSS et JavaScript côté client.", tags: ["HTML","JavaScript","Web"] },
  { year: "2024 → 2025", title: "Systèmes & Télécommunications", company: "Lab personnel", description: "Configuration d'Asterisk en environnement virtuel, découverte de PJSIP, tests SIP et administration Linux.", tags: ["Linux","Asterisk","PJSIP"] },
  { year: "En continu", title: "Création numérique King-G", company: "Univers artistique personnel", description: "Direction visuelle de projets musicaux, création de pochettes, affiches et identité graphique.", tags: ["Direction artistique","Identité visuelle"] },
];

export const WORLDS: World[] = [
  { title: "King-G — Univers Artistique", icon: "bi-music-note-beamed", color: "pink", description: "Direction visuelle complète pour des projets musicaux : pochettes, affiches, identité graphique.", tags: ["Musique","Pochettes","Affiches"] },
  { title: "GOLDEN SKY LTD — Entrepreneuriat", icon: "bi-briefcase", color: "amber", description: "Concept d'entreprise orienté agronomie et produits naturels. Réflexion sur la structure et la scalabilité.", tags: ["Entrepreneuriat","Gestion","Vision"] },
  { title: "Agronomie & Nature", icon: "bi-tree", color: "green", description: "Projets de vergers fruitiers, apiculture et production de produits naturels. Une vision durable.", tags: ["Arboriculture","Apiculture","Élevage"] },
];

export const CONTACT = {
  email: "angeguilbert10@gmail.com",
  github: "https://github.com/NKOUAM",
  linkedin: "",
  location: "Cameroun",
  organizations: [
    { name: "KFOKAM48-SPECIALISATION", url: "https://github.com/KFOKAM48-SPECIALISATION" },
    { name: "gestion-de-stock-v2", url: "https://github.com/gestion-de-stock-v2" },
    { name: "kfokam48-epreuve-192", url: "https://github.com/kfokam48-epreuve-192" },
  ],
  achievements: [
    { name: "Pull Shark", icon: "🦈" },
    { name: "YOLO", icon: "🎯" },
  ],
};
EOF

echo "📝 7/18 — directives/reveal.directive.ts"
cat > src/app/directives/reveal.directive.ts << 'EOF'
import { Directive, ElementRef, Input, OnInit, OnDestroy } from '@angular/core';

@Directive({ selector: '[appReveal]', standalone: true })
export class RevealDirective implements OnInit, OnDestroy {
  @Input() delay = 0;
  private observer?: IntersectionObserver;
  constructor(private el: ElementRef<HTMLElement>) {}
  ngOnInit(): void {
    const node = this.el.nativeElement;
    node.classList.add('reveal');
    if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
      node.classList.add('revealed');
      return;
    }
    this.observer = new IntersectionObserver(([entry]) => {
      if (entry.isIntersecting) {
        setTimeout(() => node.classList.add('revealed'), this.delay);
        this.observer?.unobserve(node);
      }
    }, { threshold: 0.15 });
    this.observer.observe(node);
  }
  ngOnDestroy(): void { this.observer?.disconnect(); }
}
EOF

echo "📝 8/18 — components/cursor"
cat > src/app/components/cursor/cursor.component.ts << 'EOF'
import { Component, HostListener, signal, computed } from '@angular/core';

@Component({
  selector: 'app-cursor',
  standalone: true,
  template: `
    @if (!isCoarse()) {
      <div class="cursor-halo" [style.transform]="haloTransform()"></div>
      <div class="cursor-dot" [style.transform]="dotTransform()"></div>
    }
  `,
})
export class CursorComponent {
  private x = signal(0);
  private y = signal(0);
  isCoarse = signal(typeof window !== 'undefined' && window.matchMedia('(pointer: coarse)').matches);
  haloTransform = computed(() => `translate(${this.x() - 16}px, ${this.y() - 16}px)`);
  dotTransform = computed(() => `translate(${this.x() - 3}px, ${this.y() - 3}px)`);
  @HostListener('document:mousemove', ['$event'])
  onMove(e: MouseEvent): void { this.x.set(e.clientX); this.y.set(e.clientY); }
}
EOF

echo "📝 9/18 — components/particles"
cat > src/app/components/particles/particles.component.ts << 'EOF'
import { Component, OnInit, signal } from '@angular/core';
interface Particle { id: number; left: number; delay: number; duration: number; color: string; }
const COLORS = ['#00eaff', '#a855f7', '#ff3cac', '#39ffb6'];

@Component({
  selector: 'app-particles',
  standalone: true,
  template: `
    <div class="particles-layer" aria-hidden="true">
      @for (p of particles(); track p.id) {
        <span class="particle"
          [style.left.%]="p.left" [style.background]="p.color" [style.color]="p.color"
          [style.animation-delay.s]="p.delay" [style.animation-duration.s]="p.duration"></span>
      }
    </div>
  `,
})
export class ParticlesComponent implements OnInit {
  particles = signal<Particle[]>([]);
  ngOnInit(): void {
    this.particles.set(Array.from({ length: 22 }, (_, i) => ({
      id: i, left: Math.random() * 100, delay: Math.random() * 12,
      duration: 14 + Math.random() * 12, color: COLORS[i % COLORS.length],
    })));
  }
}
EOF

echo "📝 10/18 — components/navbar"
cat > src/app/components/navbar/navbar.component.ts << 'EOF'
import { Component, signal } from '@angular/core';

@Component({
  selector: 'app-navbar',
  standalone: true,
  template: `
    <header class="navbar-custom">
      <div class="navbar-inner">
        <a href="#accueil" class="brand" (click)="close()">AG<span>.</span></a>
        <nav>
          <ul class="nav-links" [class.open]="open()">
            @for (l of links; track l.href) {
              <li><a [href]="l.href" (click)="close()">{{ l.label }}</a></li>
            }
          </ul>
        </nav>
        <div class="d-flex align-items-center gap-2">
          <a class="availability" href="#contact"><span class="status-dot"></span> Disponible</a>
          <button class="menu-toggle" aria-label="Menu" (click)="toggle()">
            <i class="bi" [class.bi-list]="!open()" [class.bi-x-lg]="open()" style="font-size:20px;"></i>
          </button>
        </div>
      </div>
    </header>
  `,
})
export class NavbarComponent {
  open = signal(false);
  links = [
    { href: '#accueil', label: 'Accueil' },
    { href: '#apropos', label: 'À propos' },
    { href: '#competences', label: 'Compétences' },
    { href: '#projets', label: 'Projets' },
    { href: '#experiences', label: 'Expériences' },
    { href: '#univers', label: 'Autres univers' },
    { href: '#contact', label: 'Contact' },
  ];
  toggle(): void { this.open.update(v => !v); }
  close(): void { this.open.set(false); }
}
EOF

echo "📝 11/18 — components/hero"
cat > src/app/components/hero/hero.component.ts << 'EOF'
import { Component } from '@angular/core';

@Component({
  selector: 'app-hero',
  standalone: true,
  template: `
    <section class="hero-section" id="accueil">
      <div class="reveal revealed">
        <div class="eyebrow"><span class="eyebrow-line"></span> PORTFOLIO · 2026</div>
        <p class="hero-intro">Salut, moi c'est</p>
        <h1 class="hero-title">
          <span class="outline">ANGE</span><br>
          <span class="gradient">GUILBERT</span><span style="color:var(--cyan);">.</span>
        </h1>
        <h2 class="hero-role">Je construis le <span>numérique</span> de demain.</h2>
        <p class="hero-description">
          Creative Developer &amp; Software Engineer in Progress. Développement web,
          architecture logicielle, systèmes et création numérique — j'apprends,
          j'expérimente et je transforme mes idées en projets concrets.
        </p>
        <div class="hero-actions">
          <a href="#projets" class="btn-cyber btn-cyber-primary">Voir mes projets <i class="bi bi-arrow-right"></i></a>
          <a href="#apropos" class="btn-cyber btn-cyber-secondary">Mon parcours</a>
        </div>
        <div class="hero-meta">
          <span><span class="meta-symbol">✳</span> Curieux par nature</span>
          <span><span class="meta-symbol">⌘</span> Orienté projets</span>
          <span><span class="meta-symbol">◆</span> Basé au Cameroun</span>
        </div>
      </div>
      <div class="hero-visual">
        <div class="orbit orbit-outer"><span class="orbit-node"></span></div>
        <div class="orbit orbit-middle"><span class="orbit-node"></span></div>
        <div class="orbit orbit-inner"><span class="orbit-node"></span></div>
        <div class="core"><div class="core-inner">
          <span class="core-mark">AG</span><span class="core-caption">DIGITAL MIND</span>
        </div></div>
        <div class="floating-tag tag-code"><i class="bi bi-code-slash"></i> <span>CODE</span></div>
        <div class="floating-tag tag-creative"><i class="bi bi-lightning-charge"></i> <span>CREATE</span></div>
        <div class="visual-caption"><span class="status-dot"></span> SYSTEM ONLINE</div>
      </div>
    </section>
  `,
})
export class HeroComponent {}
EOF

echo "📝 12/18 — components/about"
cat > src/app/components/about/about.component.ts << 'EOF'
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
EOF

echo "📝 13/18 — components/skills"
cat > src/app/components/skills/skills.component.ts << 'EOF'
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
EOF

echo "📝 14/18 — components/projects"
cat > src/app/components/projects/projects.component.ts << 'EOF'
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
EOF

echo "📝 15/18 — components/experience"
cat > src/app/components/experience/experience.component.ts << 'EOF'
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
EOF

echo "📝 16/18 — components/worlds"
cat > src/app/components/worlds/worlds.component.ts << 'EOF'
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
EOF

echo "📝 17/18 — components/contact"
cat > src/app/components/contact/contact.component.ts << 'EOF'
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
EOF

echo "📝 18/18 — components/footer"
cat > src/app/components/footer/footer.component.ts << 'EOF'
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
EOF

echo ""
echo "✅ Tous les fichiers TypeScript sont remplis !"
echo ""
