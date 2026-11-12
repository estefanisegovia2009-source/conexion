package etec.bdd.dto

import etec.bdd.entity.Categoria

data class CategoriaResponse(
    val id: Int,
    val nombre: String,
    val descripcion: String?
) {
    companion object {
        fun fromEntity(categoria: Categoria) = CategoriaResponse(
            id = categoria.id,
            nombre = categoria.nombre,
            descripcion = categoria.descripcion
        )
    }
}