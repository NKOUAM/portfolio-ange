import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Worlds } from './worlds';

describe('Worlds', () => {
  let component: Worlds;
  let fixture: ComponentFixture<Worlds>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Worlds]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Worlds);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
