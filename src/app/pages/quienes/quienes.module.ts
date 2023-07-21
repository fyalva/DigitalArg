import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { QuienesRoutingModule } from './quienes-routing.module';
import { QuienesComponent } from './quienes.component';


@NgModule({
  declarations: [
    QuienesComponent
  ],
  imports: [
    CommonModule,
    QuienesRoutingModule
  ]
})
export class QuienesModule { }
