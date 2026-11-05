package etec.bdd.controller

import etec.bdd.dto.ProductoResponse
import etec.bdd.repository.ProductoRepository
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/productos")
@CrossOrigin(origins = ["http://localhost:3000"])
class ProductoController(private val productoRepository: ProductoRepository) {

    @GetMapping
    fun listarProductos(): List<ProductoResponse> {
        // Consulta directamente la base de datos y mapea los resultados a DTO
        return productoRepository.findAll().map { ProductoResponse.fromEntity(it) }
    }
}