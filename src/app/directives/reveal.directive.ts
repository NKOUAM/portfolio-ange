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
