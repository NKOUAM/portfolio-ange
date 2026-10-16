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
