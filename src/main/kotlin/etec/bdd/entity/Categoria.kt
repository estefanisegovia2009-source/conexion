package etec.bdd.entity

import jakarta.persistence.*

@Entity
@Table(name = "categorias")
data class Categoria(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int = 0,

    @Column(nullable = false, unique = true, length = 100)
    val nombre: String,

    @Column(columnDefinition = "TEXT")
    val descripcion: String? = null
)