package etec.bdd.dto

import java.math.BigDecimal

data class ProductoRequest(
    val nombre: String,
    val descripcion: String? = null,
    val precio: BigDecimal,
    val stock: Int = 0,
    val categoriaId: Int? = null,
    val imagen: String? = null
)