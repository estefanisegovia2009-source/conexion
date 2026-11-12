package etec.bdd.controller

import etec.bdd.dto.LoginRequest
import etec.bdd.dto.RegistroRequest
import etec.bdd.dto.UsuarioResponse
import etec.bdd.service.UsuarioService
import jakarta.validation.Valid
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = ["http://localhost:3000"])
class UsuarioController(
    private val usuarioService: UsuarioService
) {
    @PostMapping("/usuarios/registro")
    fun registrar(
        @Valid @RequestBody request: RegistroRequest
    ): ResponseEntity<UsuarioResponse> {
        val usuario = usuarioService.registrar(request)

        return ResponseEntity
            .status(HttpStatus.CREATED)
            .body(usuario)
    }

    @PostMapping("/auth/login")
    fun iniciarSesion(
        @Valid @RequestBody request: LoginRequest
    ): ResponseEntity<UsuarioResponse> {
        val usuario = usuarioService.iniciarSesion(request)
        return ResponseEntity.ok(usuario)
    }
}