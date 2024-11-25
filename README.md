# Invanaer
### Requerimientos de Aplicación
1. Nueva cuenta de Usuario (unico correo)
  <ul>
    <li>
      Verificación de correo.
    </li>
    <li>
      Imagen de perfil de Usuario.
    </li>
    <li>
      Detalles del Usuario (nombre, teléfono, dirección, etc...).
    </li>
    <li>
      Poder actualizar la información detallada del usuario.
    </li>
  </ul>
  <br/>
  
2. Reiniciar la contraseña del usuario (sin haber iniciado sesión)
<ul>
    <li>
      Mediante un enlace reinicia la contraseña, este enlace expirará en 24h.
    </li>
  </ul>
 <br/>
 
3. Acceso del Usuario usando correo y contraseña
  
<ul>
    <li>
      JsonWebToken.
    </li>
  <li>
      Refrescar el token sin problemas.
    </li>
  </ul>
 <br/>

 4. Mitigación de ataques de fuerza bruta (mecanismo de bloqueo de cuenta)

<ul>
    <li>
      Bloquear cuenta en 6 intentos fallidos de inicio de sesión.
    </li>
  </ul>
 <br/>
  
