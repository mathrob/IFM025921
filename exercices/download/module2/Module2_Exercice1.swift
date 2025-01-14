class ToDoList {
    private var tasks: [(description: String, isCompleted: Bool)] = []
    
    // Ajouter une tâche
    func addTask(description: String) {
        tasks.append((description, false))
    }
    
    // Marquer une tâche comme terminée
    func completeTask(index: Int) {
        guard index >= 0 && index < tasks.count else {
            print("Index invalide.")
            return
        }
        tasks[index].isCompleted = true
    }
    
    // Supprimer une tâche
    func removeTask(index: Int) {
        guard index >= 0 && index < tasks.count else {
            print("Index invalide.")
            return
        }
        tasks.remove(at: index)
    }
    
    // Afficher les tâches
    func showTasks() {
        for (index, task) in tasks.enumerated() {
            let status = task.isCompleted ? "✅" : "⏳"
            print("\(index + 1). \(status) \(task.description)")
        }
    }
    
    // Effacer les tâches terminées
    func clearCompletedTasks() {
        tasks.removeAll { $0.isCompleted }
    }
    
    // Rechercher une tâche
    func searchTask(keyword: String) {
        let results = tasks.enumerated().filter { $0.element.description.contains(keyword) }
        if results.isEmpty {
            print("Aucune tâche trouvée pour le mot-clé '\(keyword)'.")
        } else {
            print("Résultats de la recherche :")
            for (index, task) in results {
                let status = task.isCompleted ? "✅" : "⏳"
                print("\(index + 1). \(status) \(task.description)")
            }
        }
    }
}

// Tests
let toDoList = ToDoList()
toDoList.addTask(description: "Faire les courses")
toDoList.addTask(description: "Réviser pour l'examen")
toDoList.addTask(description: "Appeler le médecin")
toDoList.addTask(description: "Nettoyer la maison")
toDoList.addTask(description: "Lire un chapitre de livre")

print("Liste initiale :")
toDoList.showTasks()

toDoList.completeTask(index: 0)
toDoList.completeTask(index: 2)

print("\nAprès avoir marqué des tâches comme terminées :")
toDoList.showTasks()

print("\nRésultat de la recherche pour 'maison' :")
toDoList.searchTask(keyword: "maison")

toDoList.clearCompletedTasks()
print("\nAprès suppression des tâches terminées :")
toDoList.showTasks()
