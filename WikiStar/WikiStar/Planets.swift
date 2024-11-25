// Definimos la estructura 'Planetas', que modela los datos de un planeta.
// Esta estructura debe cumplir con el protocolo 'Codable' para permitir
// la conversión a y desde formatos como JSON (ideal para trabajar con APIs).
struct Planetas: Codable {
    
    // Propiedad calculada 'id' que siempre devuelve 0.
    // Esto podría ser útil si el identificador del planeta no es necesario o si se está utilizando un valor predeterminado.
    var id: Int {
        get { return 0 }  // 'id' siempre devuelve 0
    }
    
    // Propiedades que describen las características de un planeta.
    // Todas son cadenas de texto (String), aunque algunas podrían ser números en realidad.
    var name: String               // Nombre del planeta
    var rotation_period: String    // Periodo de rotación (cuánto tarda en girar sobre su eje)
    var orbital_period: String     // Periodo orbital (cuánto tarda en dar una vuelta alrededor de su estrella)
    var diameter: String           // Diámetro del planeta
    var climate: String            // Clima del planeta
    var gravity: String            // Gravedad del planeta
    var terrain: String            // Terreno del planeta (puede ser "montañas", "desierto", etc.)
    var surface_water: String      // Porcentaje o cantidad de agua en la superficie
    var population: String         // Población del planeta

}

// Definimos la estructura 'PlanetasRespuesta', que modela la respuesta de una API
// que devuelve una lista de planetas (probablemente paginada).
// También adopta el protocolo 'Codable' para permitir su conversión con JSON.
struct PlanetasRespuesta: Codable {
    
    // 'count' almacena el número total de planetas disponibles en la base de datos o API.
    let count: Int
    
    // 'next' es la URL (opcional) para la siguiente página de resultados si la API tiene paginación.
    let next: String?
    
    // 'previous' es la URL (opcional) para la página anterior si la API soporta paginación.
    let previous: String?
    
    // 'results' es un arreglo de planetas, cada uno representado como un objeto de la estructura 'Planetas'.
    let results: [Planetas]
}
