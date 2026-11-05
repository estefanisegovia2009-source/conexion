package etec.bdd.controller

import etec.bdd.dto.ProductoResponse
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/productos")
@CrossOrigin(origins = ["http://localhost:3000"]) // <--- Esto habilita el acceso desde el frontend
class ProductoController {
    // ... tus métodos
}