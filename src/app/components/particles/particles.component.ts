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
