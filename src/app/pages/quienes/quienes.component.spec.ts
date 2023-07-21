import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QuienesComponent } from './quienes.component';

describe('QuienesComponent', () => {
  let component: QuienesComponent;
  let fixture: ComponentFixture<QuienesComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QuienesComponent]
    });
    fixture = TestBed.createComponent(QuienesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
