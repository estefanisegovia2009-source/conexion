package etec.bdd.controller

import etec.bdd.dto.LoginRequest
import etec.bdd.dto.RegistroRequest
import etec.bdd.dto.UsuarioResponse
import etec.bdd.service.UsuarioService
import jakarta.servlet.http.HttpServletRequest
import jakarta.validation.Valid
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

private const val SESION_USUARIO_ID = "mimoshop_usuario_id"
private const val SESION_USUARIO_ROL = "mimoshop_usuario_rol"

@RestController
@RequestMapping("/api")
class UsuarioController(
    private val usuarioService: UsuarioService
) {
    @PostMapping("/usuarios/registro")
    fun registrar(
        @Valid @RequestBody request: RegistroRequest,
        solicitud: HttpServletRequest
    ): ResponseEntity<UsuarioResponse> {
        val usuario = usuarioService.registrar(request)
        guardarSesion(solicitud, usuario)

        return ResponseEntity
            .status(HttpStatus.CREATED)
            .body(usuario)
    }

    @PostMapping("/auth/login")
    fun iniciarSesion(
        @Valid @RequestBody request: LoginRequest,
        solicitud: HttpServletRequest
    ): ResponseEntity<UsuarioResponse> {
        val usuario = usuarioService.iniciarSesion(request)
        guardarSesion(solicitud, usuario)

        return ResponseEntity.ok(usuario)
    }

    @GetMapping("/auth/me")
    fun obtenerSesion(
        solicitud: HttpServletRequest
    ): ResponseEntity<UsuarioResponse> {
        val sesion = solicitud.getSession(false)
            ?: return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build()

        val idUsuario = sesion.getAttribute(SESION_USUARIO_ID) as? Int
            ?: return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build()

        val usuario = usuarioService.buscarPorId(idUsuario)
            ?: run {
                sesion.invalidate()
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build()
            }

        // Se vuelve a leer el rol actual desde la base de datos.
        sesion.setAttribute(SESION_USUARIO_ROL, usuario.rol)

        return ResponseEntity.ok(usuario)
    }

    @PostMapping("/auth/logout")
    fun cerrarSesion(
        solicitud: HttpServletRequest
    ): ResponseEntity<Void> {
        solicitud.getSession(false)?.invalidate()
        return ResponseEntity.noContent().build()
    }

    private fun guardarSesion(
        solicitud: HttpServletRequest,
        usuario: UsuarioResponse
    ) {
        solicitud.getSession(false)?.invalidate()

        val sesion = solicitud.getSession(true)
        sesion.setAttribute(SESION_USUARIO_ID, usuario.id)
        sesion.setAttribute(SESION_USUARIO_ROL, usuario.rol)
    }
}