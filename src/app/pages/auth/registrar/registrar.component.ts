
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
      email: [''],
      name: [''],
      password: [''],
    });
  }

  // onSubmit();
  validarDatosRegistro() {
    if (this.registrarForm.valid) {
      alert('Llamar al servicio de Registro del Usuario');
      this.router.navigate(['/home']);
    } else {
      alert('Datos incorrectos en el Form');
    }
  }
}

