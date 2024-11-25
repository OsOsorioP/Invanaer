# Invanaer
### Requerimientos de Aplicación
1. Nueva cuenta de Usuario (unico correo)

* Verificación de correo.
* Imagen de perfil de Usuario.
* Detalles del Usuario (nombre, teléfono, dirección, etc...).
* Poder actualizar la información detallada del usuario.

2. Reiniciar la contraseña del usuario (sin haber iniciado sesión)

* Mediante un enlace reinicia la contraseña, este enlace expirará en 24h.
 
3. Acceso del Usuario usando correo y contraseña
  
* JsonWebToken.
* Refrescar el token sin problemas.

4. Mitigación de ataques de fuerza bruta (mecanismo de bloqueo de cuenta)

* Bloquear cuenta en 6 intentos fallidos de inicio de sesión.
  
