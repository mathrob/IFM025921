import Foundation

// Fonction de conversion Fahrenheit → Celsius
func convertToCelsius(fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5 / 9
}

// Fonction de conversion Mètres → Pieds
func convertToFeet(meters: Double) -> Double {
    return meters * 3.28084
}

// Fonction de conversion Livres → Kilogrammes
func convertToKilograms(pounds: Double) -> Double {
    return pounds * 0.453592
}

// Afficher le menu
func displayMenu() {
    print("""
    Bienvenue dans l'application de conversion d'unités !
    Veuillez choisir une option :
    1. Convertir Fahrenheit en Celsius
    2. Convertir Mètres en Pieds
    3. Convertir Livres en Kilogrammes
    4. Quitter
    """)
}

// Lire une entrée utilisateur et convertir en Double
func readInput() -> Double? {
    if let input = readLine(), let value = Double(input) {
        return value
    } else {
        print("Entrée invalide. Veuillez entrer un nombre valide.")
        return nil
    }
}

// Lancer le programme principal
func startConversionApp() {
    var isRunning = true
    while isRunning {
        displayMenu()
        print("Choisissez une option :")
        
        if let choice = readLine() {
            switch choice {
            case "1":
                print("Entrez la température en Fahrenheit :")
                if let fahrenheit = readInput() {
                    let celsius = convertToCelsius(fahrenheit: fahrenheit)
                    print("Résultat : \(fahrenheit)°F = \(String(format: "%.2f", celsius))°C")
                }
            case "2":
                print("Entrez la longueur en mètres :")
                if let meters = readInput() {
                    let feet = convertToFeet(meters: meters)
                    print("Résultat : \(meters) m = \(String(format: "%.2f", feet)) pieds")
                }
            case "3":
                print("Entrez le poids en livres :")
                if let pounds = readInput() {
                    let kilograms = convertToKilograms(pounds: pounds)
                    print("Résultat : \(pounds) lb = \(String(format: "%.2f", kilograms)) kg")
                }
            case "4":
                print("Merci d'avoir utilisé l'application de conversion. À bientôt !")
                isRunning = false
            default:
                print("Option invalide. Veuillez choisir une option entre 1 et 4.")
            }
        }
    }
}

// Exécuter l'application
startConversionApp()
