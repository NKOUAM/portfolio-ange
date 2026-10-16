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
