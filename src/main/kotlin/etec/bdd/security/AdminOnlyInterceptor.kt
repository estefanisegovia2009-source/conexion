package etec.bdd.security

import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import org.springframework.stereotype.Component
import org.springframework.web.servlet.HandlerInterceptor

@Component
class AdminOnlyInterceptor : HandlerInterceptor {
    override fun preHandle(
        request: HttpServletRequest,
        response: HttpServletResponse,
        handler: Any
    ): Boolean {
        if (request.method == "OPTIONS") return true

        if (request.method == "GET" || request.method == "HEAD") {
            return true
        }

        val rol = request.getSession(false)
            ?.getAttribute("mimoshop_usuario_rol") as? String

        if (rol.equals("ADMIN", ignoreCase = true)) {
            return true
        }

        response.status = HttpServletResponse.SC_FORBIDDEN
        response.contentType = "application/json"
        response.characterEncoding = "UTF-8"
        response.writer.write(
            """{"message":"Necesitás una sesión de administrador para modificar productos"}"""
        )
        return false
    }
}