package etec.bdd.entity

import jakarta.persistence.*
import java.math.BigDecimal

@Entity
@Table(name = "productos") // Nombre de tu tabla en phpMyAdmin
data class Producto(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int,
    val nombre: String,
    val precio: BigDecimal,
    val stock: Int // <--- Solo debe decir Int (o Long si tu stock en la base es numérico largo)
)