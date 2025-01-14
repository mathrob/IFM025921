//: Playground - noun: a place where people can play

import UIKit

//
//  Carte.swift
//  PairesDeCartes
//
//  Created by Marco Lavoie on 2015-09-10.
//  Copyright (c) 2015 Marco Lavoie. All rights reserved.
//

import Foundation

// Énumération des familles de carte
public enum FamilleDeCarte {
    case Pique, Coeur, Carreau, Trèfle
}

// Classe représentant une carte à jouer (p.ex. 6 de pique)
public class Carte : CustomStringConvertible {
    public var famille: FamilleDeCarte   // famille de la carte
    
    // Valeur de la carte (2 à 10, 11 = valet, 12 = dame, 13 = roi et 14 = as). Un mutateur
    // est défini afin d'assurer la conformité de la valeur donnée
    private var _valeur: Int
    public var valeur: Int {
        get {
            return _valeur
        }
        
        set {
            _valeur = (newValue < 2 ? 2 : (newValue > 14 ? 14 : newValue))
        }
    }
    
    // Initialiseur paramétré  (2 de pique par défaut)
    public init(valeur: Int = 2, famille: FamilleDeCarte = .Pique) {
        _valeur = valeur
        self.famille = famille
    }
    
    // Retourne un descriptif de la carte (sa valeur et sa famille)
    public var description: String {
        var fam: String
        switch (famille) {
        case .Pique:
            fam = "♠︎"
        case .Coeur:
            fam = "♥︎"
        case .Carreau:
            fam = "♦︎"
        case .Trèfle:
            fam = "♣︎"
        default:
            fam = "?"
        }
        
        var val: String
        switch (valeur) {
        case 2...10:
            val = "\(valeur)"
        case 11:
            val = "V"
        case 12:
            val = "D"
        case 13:
            val = "R"
        case 14:
            val = "A"
        default:
            val = "?"
        }
        return val + fam
    }
}

//
//  Paquet.swift
//  PairesDeCartes
//
//  Created by Marco Lavoie on 2015-09-11.
//  Copyright (c) 2015 Marco Lavoie. All rights reserved.
//

import Foundation

// Classe représentant un paquet de cartes à jouer
public class Paquet: CustomStringConvertible {
    private var cartes = [Carte]()   // cartes contenues dans le paquet
    
    // Accesseur retournant le nombre de cartes dans le paquet
    public var nombreDeCartes: Int {
        get {
            return cartes.count
        }
    }
    
    // Initialiseur. Si l'argument fourni est true, le paquet est rempli des 52 cartes
    // conventionnelles; s'il est false, le paquet retourné est vide.
    // Si le paquet retourné contient des cartes, celles-ci sont brassées
    public init(remplir: Bool) {
        if remplir {
            // Insérer les 52 cartes conventionnelles dans le paquet
            for valeur in 2...14 {
                cartes.append(Carte(valeur: valeur, famille: FamilleDeCarte.Pique))
                cartes.append(Carte(valeur: valeur, famille: FamilleDeCarte.Coeur))
                cartes.append(Carte(valeur: valeur, famille: FamilleDeCarte.Carreau))
                cartes.append(Carte(valeur: valeur, famille: FamilleDeCarte.Trèfle))
            }
            
            shuffle()
        }
    }
    
    // Basse les paquet de cartes
    public func shuffle() {
        for i in 0 ..< (cartes.count - 1) {
            let j = Int(arc4random_uniform(UInt32(cartes.count - i))) + i
            
            let temp = cartes[i]
            cartes[i] = cartes[j]
            cartes[j] = temp
        }
    }
    
    // Retourne un tuple donnant le nombre de cartes dans le paquet pour chacune des familles
    public var nombreDeCartesRestantesDeChaqueFamille: (Pique: Int, Coeur: Int, Carreau: Int, Trèfle: Int) {
        var comptePique = 0, compteCoeur = 0, compteCarreau = 0, compteTrèfle = 0
        for carte in cartes {
            switch (carte.famille) {
            case .Pique:
                comptePique += 1;
            case .Coeur:
                compteCoeur += 1;
            case .Carreau:
                compteCarreau += 1
            case .Trèfle:
                compteTrèfle += 1
            }
        }
        
        return (comptePique, compteCoeur, compteCarreau, compteTrèfle)
    }
    
    // Retire la première carte (i.e. celle sur le dessus) du paquet et la retourne;
    // retourne nil si le paquet est vide
    public func piger() -> Carte? {
        if cartes.count > 0 {
            return cartes.remove(at: 0)
        }
        else {
            return nil;
        }
    }
    
    // Retire les premières cartes (i.e. celles sur le dessus) du paquet et les retourne
    // dans un nouveau paquet (non brassé). Si self contient moins de cartes que
    // demandées, les cartes restantes sont retournées
    public func piger(_ nombre: Int) -> Paquet {
        let main = Paquet(remplir: false)
        while cartes.count > 0 && main.nombreDeCartes < nombre {
            main.cartes.append(cartes.remove(at: 0))
        }
        
        return main
    }
    
    // Retourne un descriptif du paquet (liste de ses cartes)
    public var description: String {
        var res = "[ "
        for carte in cartes {
            res += carte.description + " "
        }
        
        return res + " ]"
    }
}

var paquet: Paquet = Paquet(remplir: true)
print(paquet)
var main: Paquet = paquet.piger(5)
print(main)
var carte: Carte? = paquet.piger()
print(carte!)
print(paquet)
let (piques, coeurs, carreaux, trèfles) = paquet.nombreDeCartesRestantesDeChaqueFamille
print("♠:\(piques), ♥:\(coeurs), ♦:\(carreaux), ♣\(trèfles)")

