package etec.bdd.dto

import etec.bdd.entity.Producto
import java.math.BigDecimal

data class ProductoResponse(
    val id: Int,
    val nombre: String,
    val precio: BigDecimal,
    val stock: Int,
) {
    companion object {
        fun fromEntity(p: Producto): ProductoResponse =
            ProductoResponse(
                id = p.id,
                nombre = p.nombre,
                precio = p.precio,
                stock = p.stock,
            )
    }
}