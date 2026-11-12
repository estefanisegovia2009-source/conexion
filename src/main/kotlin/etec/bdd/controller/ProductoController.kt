package etec.bdd.controller

import etec.bdd.dto.ProductoResponse
import etec.bdd.repository.ProductoRepository
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/productos")
@CrossOrigin(origins = ["http://localhost:3000"])
class ProductoController(
    private val productoRepository: ProductoRepository
) {
    @GetMapping
    fun listarProductos(
        @RequestParam(required = false) categoriaId: Int?
    ): List<ProductoResponse> {
        val productos = if (categoriaId == null) {
            productoRepository.findAll()
        } else {
            productoRepository.findByCategoriaId(categoriaId)
        }

        return productos.map { ProductoResponse.fromEntity(it) }
    }

    @GetMapping("/{id}")
    fun obtenerProducto(@PathVariable id: Int): ResponseEntity<ProductoResponse> {
        val producto = productoRepository.findById(id).orElse(null)
            ?: return ResponseEntity.notFound().build()

        return ResponseEntity.ok(ProductoResponse.fromEntity(producto))
    }
}