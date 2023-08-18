
import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { FormBuilder, Validators } from '@angular/forms';


@Component({
  selector: 'app-registrar',
  templateUrl: './registrar.component.html',
  styleUrls: ['./registrar.component.css'],
})


export class RegistrarComponent {
  registrarForm;
  // FormBuilder: any;
  constructor(private router: Router, private fb: FormBuilder) {
    this.registrarForm = this.fb.group({
      // email: ['', Validators.required, Validators.email],
      // name: ['', Validators.required, Validators.minLength(3)],
      // password: ['', Validators.required, Validators.minLength(6)],
      email: ['mmm@oooo.com'],
      name: ['juancito'],
      password: ['xxxxx'],
    });
  }

  get email() { return this.registrarForm.get('email'); }
  get name() { return this.registrarForm.get('name'); }
  get password() { return this.registrarForm.get('password'); }
 

  // onSubmit();
  validarDatosRegistro() {
    // if (this.registrarForm.valid) {
    //   alert('Llamar al servicio de Registro del Usuario');
    //   this.registrarForm.markAllAsTouched();
    //   this.router.navigate(['/home']);
    // } else {
    //   this.registrarForm.markAllAsTouched();
    //   alert('Datos incorrectos en el Form');
    // }
  }
}

