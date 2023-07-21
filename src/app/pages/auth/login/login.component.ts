import { Component } from '@angular/core';
import { Router } from '@angular/router';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

export class LoginComponent {
  username: string ='';
  password: string ='';
  error: string ='';

  constructor( private router: Router) {}
//  constructor(private loginService: LoginService, private router: Router) {}

  onSubmit() {

    this.error = '';
/*
    // Aqu├¡ l├│gica para autenticar al usuario
    this.loginService.login(this.username, this.password).subscribe(
      (response) => {
        // El backend debe devolver una respuesta indicando si el login es exitoso o no.
        if (response.success) {
          console.log('Login exitoso');
          this.error = '';
          this.router.navigate(['/inicio']);
        } else {
          // Autenticaci├│n fallida, mostrar mensaje de error
          this.error = 'Usuario o contrase├▒a incorrectos.';
        }
      },
      (error) => {
        console.error('Error en el servidor:', error);
        this.error = 'Error en el servidor:' + error ;
      }
    );


*/

    if (this.username === '1' && this.password === '1') {
      // Autenticaci├│n exitosa, redirigir a la p├ígina de inicio
      this.error = 'Ok falta ver tema de rutas';
      this.router.navigate(['/home']);
    } else {
      // Autenticaci├│n fallida, mostrar mensaje de error
      this.error = 'Usuario o contrase├▒a incorrectos.';
    }


 }

}
