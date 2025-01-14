import Foundation

// Classe de base
class Shape {
    var name: String
    
    var area: Double {
        return 0.0 // Par défaut, aucune aire n'est calculée
    }
    
    init(name: String) {
        self.name = name
    }
    
    func displayInfo() {
        print("Forme : \(name), Aire : \(String(format: "%.2f", area))")
    }
}

// Sous-classe Circle
class Circle: Shape {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
        super.init(name: "Cercle")
    }
    
    override var area: Double {
        return Double.pi * pow(radius, 2)
    }
    
    override func displayInfo() {
        print("Forme : \(name), Rayon : \(radius), Aire : \(String(format: "%.2f", area))")
    }
}

// Sous-classe Rectangle
class Rectangle: Shape {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
        super.init(name: "Rectangle")
    }
    
    override var area: Double {
        return width * height
    }
    
    override func displayInfo() {
        print("Forme : \(name), Largeur : \(width), Hauteur : \(height), Aire : \(String(format: "%.2f", area))")
    }
}

// Sous-classe Triangle (Bonus)
class Triangle: Shape {
    var base: Double
    var height: Double
    
    init(base: Double, height: Double) {
        self.base = base
        self.height = height
        super.init(name: "Triangle")
    }
    
    override var area: Double {
        return 0.5 * base * height
    }
    
    override func displayInfo() {
        print("Forme : \(name), Base : \(base), Hauteur : \(height), Aire : \(String(format: "%.2f", area))")
    }
}

// Tester les classes
let circle = Circle(radius: 5.0)
circle.displayInfo()

let rectangle = Rectangle(width: 10.0, height: 4.0)
rectangle.displayInfo()

let triangle = Triangle(base: 6.0, height: 3.0)
triangle.displayInfo()
