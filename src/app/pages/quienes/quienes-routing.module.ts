import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { QuienesComponent } from './quienes.component';

const routes: Routes = [{ path: '', component: QuienesComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class QuienesRoutingModule { }
