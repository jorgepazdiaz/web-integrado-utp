<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
      src="https://kit.fontawesome.com/64d58efce2.js"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="assets/css/login.css" />
    <title>Formulario de Ingreso y Registro</title>
  </head>
  <body>
    <div class="container">
      <div class="forms-container">
        <div class="signin-signup">
          <form action="ControladorUsuario" method="POST" class="sign-in-form">
            <img src="assets/img/dsaborcom.png" class="image2" alt="" />

            <h2 class="title">Ingresar</h2>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" placeholder="Usuario" name="nombreUsuario" />
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" placeholder="Contraseña" name="clave"/>
            </div>
            <input type="submit" value="Iniciar Sesión" class="btn solid" name="btnAcceder"/>
            <p class="social-text">
              O iniciar sesión por medio de una red social
            </p>
            <div class="social-media">
              <a href="#" class="social-icon">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-google"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </div>
          </form>

          <form action="Controlador?menu=Usuarios" class="sign-up-form">
            <img src="assets/img/dsaborcom.png" class="image2" alt="" />

            <h2 class="title">Registro</h2>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" name="txtUsuario" placeholder="Usuario" />
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" name="txtPassword" placeholder="Contraseña" />
            </div>
            <input type="submit" class="btn" value="Registrame" name="btnRegistrar"/>
          </form>
        </div>
      </div>

      <div class="panels-container">
        <div class="panel left-panel">
          <div class="content">
            <h3>¿Eres nuevo?</h3>
            <p>
              Registrate y comienza a organizar tus recetas y llevar un mejor
              control de lo que comes y tu presupuesto. ¡Suerte!
            </p>
            <button class="btn transparent" id="sign-up-btn">Registro</button>
          </div>
          <img src="assets/img/log2.svg" class="image" alt="" />
        </div>
        <div class="panel right-panel">
          <div class="content">
            <h3>¿Ya tienes una cuenta?</h3>
            <p>
              Ingresa y sigue actualizando tus recetas y llevando control de lo
              que comes y de tu presupuesto. ¡Te extrañamos!
            </p>
            <button class="btn transparent" id="sign-in-btn">
              Inicia Sesión
            </button>
          </div>
          <img src="assets/img/register2.svg" class="image" alt="" />
        </div>
      </div>
    </div>

    <script src="assets/js/login.js"></script>
  </body>
</html>

