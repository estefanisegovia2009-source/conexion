package etec.bdd.dto

import jakarta.validation.constraints.Email
import jakarta.validation.constraints.NotBlank
import jakarta.validation.constraints.Size

data class RegistroRequest(
    @field:NotBlank(message = "El nombre es obligatorio")
    @field:Size(max = 100, message = "El nombre no puede superar 100 caracteres")
    val nombre: String,

    @field:NotBlank(message = "El email es obligatorio")
    @field:Email(message = "El email no tiene un formato válido")
    @field:Size(max = 100, message = "El email no puede superar 100 caracteres")
    val email: String,

    @field:NotBlank(message = "La contraseña es obligatoria")
    @field:Size(
        min = 6,
        max = 72,
        message = "La contraseña debe tener entre 6 y 72 caracteres"
    )
    val password: String,

    @field:Size(max = 20, message = "El teléfono no puede superar 20 caracteres")
    val telefono: String? = null,

    @field:Size(max = 200, message = "La dirección no puede superar 200 caracteres")
    val direccion: String? = null
)