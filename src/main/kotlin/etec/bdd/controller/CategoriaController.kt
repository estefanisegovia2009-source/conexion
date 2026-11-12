package etec.bdd.controller

import etec.bdd.dto.CategoriaResponse
import etec.bdd.repository.CategoriaRepository
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/categorias")
@CrossOrigin(origins = ["http://localhost:3000"])
class CategoriaController(
    private val categoriaRepository: CategoriaRepository
) {
    @GetMapping
    fun listarCategorias(): List<CategoriaResponse> {
        return categoriaRepository.findAll()
            .map { CategoriaResponse.fromEntity(it) }
    }

    @GetMapping("/{id}")
    fun obtenerCategoria(
        @PathVariable id: Int
    ): ResponseEntity<CategoriaResponse> {
        val categoria = categoriaRepository.findById(id).orElse(null)
            ?: return ResponseEntity.notFound().build()

        return ResponseEntity.ok(CategoriaResponse.fromEntity(categoria))
    }
}