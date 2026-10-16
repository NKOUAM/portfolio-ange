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
