package etec.bdd.entity

import jakarta.persistence.*
import java.math.BigDecimal

@Entity
@Table(name = "productos")
data class Producto(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int = 0,

    @Column(nullable = false, length = 150)
    val nombre: String,

    @Column(columnDefinition = "TEXT")
    val descripcion: String? = null,

    @Column(nullable = false)
    val precio: BigDecimal,

    @Column(nullable = false)
    val stock: Int = 0,

    @Column(name = "categoria_id")
    val categoriaId: Int? = null,

    @Column(length = 255)
    val imagen: String? = null
)