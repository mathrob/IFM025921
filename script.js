function showModule(moduleNumber) {
    // Masquer toutes les sections
    const sections = document.querySelectorAll('.module-section');
    sections.forEach(section => {
        section.style.display = 'none';
    });

    // Afficher le module sélectionné
    const selectedModule = document.getElementById(`module-${moduleNumber}`);
    if (selectedModule) {
        selectedModule.style.display = 'block';
    }
}