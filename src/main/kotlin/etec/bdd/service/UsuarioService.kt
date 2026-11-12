package etec.bdd.service

import etec.bdd.dto.LoginRequest
import etec.bdd.dto.RegistroRequest
import etec.bdd.dto.UsuarioResponse
import etec.bdd.entity.Usuario
import etec.bdd.repository.UsuarioRepository
import org.springframework.http.HttpStatus
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Service
import org.springframework.web.server.ResponseStatusException

@Service
class UsuarioService(
    private val usuarioRepository: UsuarioRepository
) {
    private val passwordEncoder = BCryptPasswordEncoder()

    fun registrar(request: RegistroRequest): UsuarioResponse {
        val emailNormalizado = request.email.trim().lowercase()

        if (usuarioRepository.existsByEmailIgnoreCase(emailNormalizado)) {
            throw ResponseStatusException(
                HttpStatus.CONFLICT,
                "Ya existe una cuenta registrada con ese email"
            )
        }

        val contraseñaCodificada = requireNotNull(
            passwordEncoder.encode(request.password)
        ) {
            "No se pudo codificar la contraseña"
        }

        val usuario = Usuario(
            nombre = request.nombre.trim(),
            email = emailNormalizado,
            password = contraseñaCodificada,
            telefono = request.telefono?.trim()?.ifBlank { null },
            direccion = request.direccion?.trim()?.ifBlank { null }
        )

        val usuarioGuardado = usuarioRepository.save(usuario)
        return UsuarioResponse.fromEntity(usuarioGuardado)
    }

    fun iniciarSesion(request: LoginRequest): UsuarioResponse {
        val emailNormalizado = request.email.trim().lowercase()
        val usuario = usuarioRepository.findByEmailIgnoreCase(emailNormalizado)

        if (
            usuario == null ||
            !passwordEncoder.matches(request.password, usuario.password)
        ) {
            throw ResponseStatusException(
                HttpStatus.UNAUTHORIZED,
                "Correo o contraseña incorrectos"
            )
        }

        return UsuarioResponse.fromEntity(usuario)
    }
}