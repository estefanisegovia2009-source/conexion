package etec.bdd.controller

import etec.bdd.dto.ProductoResponse
import etec.bdd.entity.Producto
import etec.bdd.repository.ProductoRepository
import org.springframework.http.HttpStatus
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

    @PostMapping
    fun crearProducto(
        @RequestBody datos: Producto
    ): ResponseEntity<ProductoResponse> {
        val nuevoProducto = Producto(
            nombre = datos.nombre,
            descripcion = datos.descripcion,
            precio = datos.precio,
            stock = datos.stock,
            categoriaId = datos.categoriaId,
            imagen = datos.imagen
        )

        val guardado = productoRepository.save(nuevoProducto)

        return ResponseEntity
            .status(HttpStatus.CREATED)
            .body(ProductoResponse.fromEntity(guardado))
    }

    @PutMapping("/{id}")
    fun actualizarProducto(
        @PathVariable id: Int,
        @RequestBody datos: Producto
    ): ResponseEntity<ProductoResponse> {
        if (!productoRepository.existsById(id)) {
            return ResponseEntity.notFound().build()
        }

        val productoActualizado = Producto(
            id = id,
            nombre = datos.nombre,
            descripcion = datos.descripcion,
            precio = datos.precio,
            stock = datos.stock,
            categoriaId = datos.categoriaId,
            imagen = datos.imagen
        )

        val guardado = productoRepository.save(productoActualizado)

        return ResponseEntity.ok(ProductoResponse.fromEntity(guardado))
    }

    @DeleteMapping("/{id}")
    fun eliminarProducto(@PathVariable id: Int): ResponseEntity<Void> {
        if (!productoRepository.existsById(id)) {
            return ResponseEntity.notFound().build()
        }

        productoRepository.deleteById(id)
        return ResponseEntity.noContent().build()
    }
}