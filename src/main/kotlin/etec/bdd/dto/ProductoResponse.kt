package etec.bdd.dto

import etec.bdd.entity.Producto
import java.math.BigDecimal

data class ProductoResponse(
    val id: Int,
    val nombre: String,
    val descripcion: String?,
    val precio: BigDecimal,
    val stock: Int,
    val categoriaId: Int?,
    val imagen: String?
) {
    companion object {
        fun fromEntity(producto: Producto) = ProductoResponse(
            id = producto.id,
            nombre = producto.nombre,
            descripcion = producto.descripcion,
            precio = producto.precio,
            stock = producto.stock,
            categoriaId = producto.categoriaId,
            imagen = producto.imagen
        )
    }
}