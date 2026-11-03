package etec.bdd.controller

import etec.bdd.service.ProductoService
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.

@RestController
@RequestMapping("/api/productos")
@CrossOrigin(origins = ["http://localhost:3000"]) // Habilita la conexión con tu Frontend
class ProductoController(
    private val productoService: ProductoService
) {

    @GetMapping
    fun listar(pageable: Pageable): ResponseEntity<Page<ProductoResponse>> {
        return ResponseEntity.ok(productoService.listar(pageable))
    }

    @GetMapping("/{id}")
    fun obtenerPorId(@PathVariable id: Int): ResponseEntity<ProductoResponse> {
        return ResponseEntity.ok(productoService.obtener(id))
    }
}