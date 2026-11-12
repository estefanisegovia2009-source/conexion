package etec.bdd.entity

import jakarta.persistence.*

@Entity
@Table(name = "usuarios")
data class Usuario(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int = 0,

    @Column(nullable = false, length = 100)
    val nombre: String,

    @Column(nullable = false, unique = true, length = 100)
    val email: String,

    @Column(name = "password", nullable = false, length = 255)
    val password: String,

    @Column(length = 20)
    val telefono: String? = null,

    @Column(length = 200)
    val direccion: String? = null,

    @Column(
        name = "fecha_registro",
        insertable = false,
        updatable = false
    )
    val fechaRegistro: java.time.LocalDateTime? = null
)