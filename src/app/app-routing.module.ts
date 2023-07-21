import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
   { path: '', redirectTo: '/home', pathMatch: 'full' },
   { path: 'home' , loadChildren: () => import('./pages/home/home.module').then(m => m.HomeModule) },
   { path: 'login', loadChildren: () => import('./pages/auth/login/login.module').then(m => m.LoginModule) },
   { path: 'registrar', loadChildren: () => import('./pages/auth/registrar/registrar.module').then(m => m.RegistrarModule) },
   { path: 'quienes', loadChildren: () => import('./pages/quienes/quienes.module').then(m => m.QuienesModule) },
   { path: '**', redirectTo: '/home', pathMatch: 'full' }, //Para redirigir al home si pone cualquier ruta
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
