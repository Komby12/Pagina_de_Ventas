<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <link rel="stylesheet" href="diseño.css">
</head>
<body>
    <div class="background">
        <div class="registration-container">
            <h2>Registro</h2>
            <form id="registration-form" method="POST" action="registerApi.php" enctype="multipart/form-data">
                <label class="input-label" for="email">Correo Electrónico:</label>
                <input type="email" id="email" name="email" class="input-field" placeholder="Correo Electrónico" required>
                
                <label class="input-label" for="username">Nombre de Usuario:</label>
                <input type="text" id="username" name="username" class="input-field" placeholder="Nombre de Usuario" required>
                
                <label class="input-label" for="password">Contraseña:</label>
                <input type="password" id="password" name="password" class="input-field" placeholder="Contraseña" required>
                
                <label class="input-label" for="role">Rol:</label>
                <select id="role" name="role" class="input-field" required>
                    <option value="comprador">Comprador</option>
                    <option value="vendedor">Vendedor</option>
                </select>
                <label class="input-label" for="profile-photo">Foto de Perfil:</label>
                <input type="file" id="foto" name="foto" accept="image/*">
                <input type="hidden" id="foto-name" name="foto-name" class="input-field" placeholder="Nombre de la foto" readonly>
                
                <label class="input-label" for="first-name">Nombre:</label>
                <input type="text" id="first-name" name="nombre" class="input-field" placeholder="Nombre" required>

                <label class="input-label" for="last-name">Apellido Paterno:</label>
                <input type="text" id="last-name" name="apellidoPaterno" class="input-field" placeholder="Apellido Paterno" required>

                <label class="input-label" for="middle-name">Apellido Materno:</label>
                <input type="text" id="middle-name" name="apellidoMaterno" class="input-field" placeholder="Apellido Materno" required>
                
                <label class="input-label" for="birthdate">Fecha de Nacimiento:</label>
                <input type="date" id="birthdate" name="birthdate" class="input-field" max="2005-12-31">
                
                <div class="input-label">Sexo:</div>
                <div class="gender-options">
                <input type="radio" id="male" name="gender" value="1" required>
                <label for="male">Masculino</label>
                <input type="radio" id="female" name="gender" value="0" required>
                <label for="female">Femenino</label>
                </div>
                
                <button type="submit" id="register-button" class="btn">Registrarse</button>
            </form>
            <p id="registro-exitoso" style="color: green;"></p>
            <div id="alert-message" style="display: none;"></div>
            <a href="index.php" class="login-link">¿Ya tienes una cuenta? Inicia sesión</a>
        </div>
    </div>
    <footer class="footer">
        <p>Derechos de autor © 2023. Todos los derechos reservados.</p>
        <a href="politica-de-privacidad.html">Política de Privacidad</a>
    </footer>

    <script>
document.addEventListener("DOMContentLoaded", function () {
    const registrationForm = document.getElementById("registration-form");
    const registroExitosoMessage = document.getElementById("registro-exitoso");
    const alertMessage = document.getElementById("alert-message");

    registrationForm.addEventListener("submit", function (event) {
        event.preventDefault(); // Detén el envío del formulario por defecto

        const usernameInput = document.getElementById("username");
        const passwordInput = document.getElementById("password");
        const fotoNameInput = document.getElementById("foto-name");
        const emailInput = document.getElementById("email");
        const roleInput = document.getElementById("role");
        const nombreInput = document.getElementById("first-name");
        const apellidoPaternoInput = document.getElementById("last-name");
        const apellidoMaternoInput = document.getElementById("middle-name");
        const birthdateInput = document.getElementById("birthdate");
        const genderInputs = document.querySelectorAll('input[name="gender"]');

        const username = usernameInput.value;
        const password = passwordInput.value;
        const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        const foto = fotoNameInput.value;
        const email = emailInput.value;
        const role = roleInput.value;
        const nombre = nombreInput.value;
        const apellidoPaterno = apellidoPaternoInput.value;
        const apellidoMaterno = apellidoMaternoInput.value;
        const birthdate = birthdateInput.value;
        const gender = genderInputs.value;

        let valid = true;

        if (username.length < 3) {
            alert("El nombre de usuario debe tener al menos 3 caracteres.");
            valid = false;
        }

        if (!passwordPattern.test(password)) {
            alert("La contraseña debe tener al menos 8 caracteres y contener al menos una mayúscula, una minúscula, un número y un carácter especial.");
            valid = false;
        }

        if (!valid) {
            // Si hay errores de validación, no se envía el formulario
            event.preventDefault();
        } else {
            // Si el formulario es válido, puedes enviar los datos
            const formData = new FormData(registrationForm);

            fetch("registerApi.php", {
                method: "POST",
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    alert(data.error); // Mostrar alerta de error
                } else if (data.message) {
                    alert(data.message); // Mostrar alerta de éxito
                }
            })
            .catch(error => {
                console.error("Error en la solicitud:", error);
            });
        }
    });
});
</script>
</body>
</html>