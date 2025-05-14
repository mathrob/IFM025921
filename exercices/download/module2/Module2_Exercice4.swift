protocol Identifiable {
    var nom: String { get }
}

protocol Animal: Identifiable {
    func faireDuBruit()
    func description() -> String
}

protocol Volant: Animal {
    func voler()
}

struct Chien: Animal {
    let nom: String

    func faireDuBruit() {
        print("\(nom) aboie : Woof!")
    }

    func description() -> String {
        return "Je suis un chien et je m'appelle \(nom)."
    }
}

struct Chat: Animal {
    let nom: String

    func faireDuBruit() {
        print("\(nom) miaule : Miaou!")
    }

    func description() -> String {
        return "Je suis un chat et je m'appelle \(nom)."
    }
}

struct Oiseau: Volant {
    let nom: String

    func faireDuBruit() {
        print("\(nom) chante : Cui cui!")
    }

    func voler() {
        print("\(nom) vole dans le ciel !")
    }

    func description() -> String {
        return "Je suis un oiseau et je m'appelle \(nom)."
    }
}

// Tableau de tous les animaux
let animaux: [Animal] = [
    Chien(nom: "Rex"),
    Chat(nom: "Mimi"),
    Oiseau(nom: "Coco")
]

print("Liste des animaux :")
for animal in animaux {
    print(animal.description())
    animal.faireDuBruit()
}

// Tableau des animaux volants
let volants: [Volant] = [
    Oiseau(nom: "Coco"),
    Oiseau(nom: "Rio")
]

print("\nAnimaux volants :")
for volant in volants {
    print(volant.description())
    volant.voler()
}