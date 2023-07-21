import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { RegistrarRoutingModule } from './registrar-routing.module';
import { RegistrarComponent } from './registrar.component';


@NgModule({
  declarations: [
    RegistrarComponent
  ],
  imports: [
    CommonModule,
    RegistrarRoutingModule
  ]
})
export class RegistrarModule { }
