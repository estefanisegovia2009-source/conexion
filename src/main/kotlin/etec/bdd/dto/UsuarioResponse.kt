package etec.bdd.dto

import etec.bdd.entity.Usuario

data class UsuarioResponse(
    val id: Int,
    val nombre: String,
    val email: String,
    val telefono: String?,
    val direccion: String?,
    val rol: String
) {
    companion object {
        fun fromEntity(usuario: Usuario) = UsuarioResponse(
            id = usuario.id,
            nombre = usuario.nombre,
            email = usuario.email,
            telefono = usuario.telefono,
            direccion = usuario.direccion,
            rol = usuario.rol
        )
    }
}