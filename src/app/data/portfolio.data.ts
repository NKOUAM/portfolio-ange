export interface Skill {
  number: string; title: string; description: string;
  icon: string; color: "cyan" | "purple" | "pink" | "green" | "amber";
  items: string[]; level: string;
}
export interface Project {
  id: string; title: string; subtitle: string; description: string;
  tech: string[]; icon: string;
  color: "cyan" | "purple" | "pink" | "green" | "amber";
  status: string; github: string; demo?: string; features: string[];
}
export interface Experience { year: string; title: string; company: string; description: string; tags: string[]; }
export interface World { title: string; icon: string; color: "pink" | "amber" | "green"; description: string; tags: string[]; }

export const SKILLS: Skill[] = [
  { number: "01", title: "Développement Web", description: "Angular, Next.js, React, TypeScript, HTML/CSS responsive, Bootstrap, RxJS et consommation d'API REST.", icon: "bi-code-slash", color: "cyan", items: ["Angular","TypeScript","Next.js","React","RxJS","Bootstrap","API REST"], level: "En pratique régulière" },
  { number: "02", title: "Architecture & Ingénierie", description: "Clean Architecture, séparation en couches, injection de dépendances, JWT, Swagger/OpenAPI, Git & GitHub.", icon: "bi-layers", color: "purple", items: ["Clean Architecture","DDD","Repositories","DI","JWT","Swagger","Git"], level: "En apprentissage actif" },
  { number: "03", title: "Systèmes & Télécoms", description: "Linux, machines virtuelles, configuration d'Asterisk, découverte de PJSIP, endpoints et tests SIP.", icon: "bi-terminal", color: "pink", items: ["Linux","VMs","Asterisk","PJSIP","Softphones","Tests SIP"], level: "Expérimentation" },
  { number: "04", title: "Création Numérique", description: "Univers artistique King-G, direction visuelle de projets musicaux, pochettes, affiches et identité digitale.", icon: "bi-palette", color: "green", items: ["Direction artistique","Pochettes","Affiches","Punchlines","Identité"], level: "Projets personnels" },
  { number: "05", title: "Entrepreneuriat & Agronomie", description: "Concept GOLDEN SKY LTD, arboriculture fruitière, apiculture, réflexion élevage et gestion d'entreprise.", icon: "bi-tree", color: "amber", items: ["GOLDEN SKY LTD","Arboriculture","Apiculture","Élevage","Gestion"], level: "Vision long terme" },
];

export const PROJECTS: Project[] = [
  { id: "kfokam48-fullstack", title: "Épreuve Fullstack KFOKAM48", subtitle: "Exam fullstack Java · Matricule 192", description: "Projet complet pour l'épreuve finale fullstack de KFOKAM48. Backend Java, frontend séparé et intégration API REST.", tech: ["Java","API REST","Frontend"], icon: "bi-server", color: "purple", status: "Terminé", github: "https://github.com/NKOUAM/kfokam48-epreuve-192", features: ["Backend Java structuré","Frontend séparé et intégré","API REST complète","Architecture front/back"] },
  { id: "gestion-stock", title: "Gestion de Stock", subtitle: "Application d'inventaire · Java & TypeScript", description: "Suite d'applications de gestion de stock en plusieurs itérations (Java, TypeScript, microservices). Suivi d'inventaire et tableau de bord.", tech: ["Java","TypeScript","Microservices"], icon: "bi-boxes", color: "green", status: "En développement", github: "https://github.com/NKOUAM/GESTION_DE_STOCK_v1", features: ["Gestion entrées / sorties","Suivi d'inventaire","Version microservice","Travail en organisation"] },
  { id: "nkouam-et-fils", title: "NKOUAM & Fils", subtitle: "Application TypeScript", description: "Application TypeScript pour une activité familiale — gestion, présentation et organisation.", tech: ["TypeScript","Web","Gestion"], icon: "bi-briefcase", color: "amber", status: "En développement", github: "https://github.com/NKOUAM/nkouam-et-fils", features: ["Architecture TypeScript","Interface de gestion","Contexte métier réel"] },
  { id: "kamgaing-ange", title: "Bibliothèque Kamgaing", subtitle: "Application de gestion de livres", description: "Application de gestion de bibliothèque en TypeScript. Catalogue, emprunts et gestion des ouvrages.", tech: ["TypeScript","Angular"], icon: "bi-book", color: "cyan", status: "Publié", github: "https://github.com/NKOUAM/kamgaing-ange", features: ["Catalogue d'ouvrages","Gestion des emprunts","Interface TypeScript"] },
  { id: "djangui-space", title: "DJANGUI SPACE", subtitle: "Plateforme de cotisation en ligne", description: "Site de cotisation en ligne pour groupes (tontines, associations). Suivi des contributions et gestion des membres.", tech: ["HTML","CSS","JavaScript"], icon: "bi-people", color: "pink", status: "Publié", github: "https://github.com/NKOUAM/djanguispace", features: ["Suivi des cotisations","Gestion des membres","Plusieurs versions"] },
  { id: "musichub", title: "MusicHub", subtitle: "Plateforme musicale", description: "Projet autour de la musique — présentation, découverte et gestion de contenus musicaux.", tech: ["Web","TypeScript","UI"], icon: "bi-music-note-beamed", color: "purple", status: "En développement", github: "https://github.com/NKOUAM/musichub", features: ["Interface musicale moderne","Présentation de contenus","Lien avec King-G"] },
  { id: "deifict-crafts", title: "Deifict Crafts", subtitle: "Plateforme artisanat (v1 + v2)", description: "Projet de plateforme autour de l'artisanat. PostgreSQL pour la base de données. Deux versions itératives.", tech: ["PLpgSQL","PostgreSQL","Web"], icon: "bi-bag", color: "green", status: "En développement", github: "https://github.com/NKOUAM/deifict-crafts", features: ["Base PostgreSQL","Deux versions","Logique métier serveur"] },
  { id: "clinique-medicale", title: "Clinique Médicale", subtitle: "Gestion d'établissement de santé", description: "Application orientée gestion médicale — patients, rendez-vous et organisation d'une clinique.", tech: ["Web","Base de données"], icon: "bi-hospital", color: "cyan", status: "En développement", github: "https://github.com/NKOUAM/Clinique-M-dicale", features: ["Gestion patients","Rendez-vous","Interface administration"] },
  { id: "portfolio-old", title: "Portfolio v1", subtitle: "Première version de mon portfolio", description: "Ma première tentative de portfolio en CSS pur. Un souvenir qui montre mon évolution.", tech: ["HTML","CSS"], icon: "bi-file-code", color: "amber", status: "Archive", github: "https://github.com/NKOUAM/portfolio", features: ["HTML/CSS pur","Design responsive","Point de départ"] },
  { id: "superapp", title: "SuperApp", subtitle: "Plateforme multi-services modulaire", description: "Concept de super-application regroupant plusieurs modules. Réflexion sur l'architecture scalable et l'évolution modulaire.", tech: ["Architecture modulaire","TypeScript","Clean Architecture"], icon: "bi-rocket", color: "purple", status: "En conception", github: "https://github.com/NKOUAM", features: ["Architecture modulaire","Séparation des couches","Vision produit"] },
  { id: "g-k-dev", title: "G.K-Dev", subtitle: "Vitrine créative", description: "Projet CSS créatif — vitrine de design et d'identité visuelle. Autre facette côté création numérique.", tech: ["HTML","CSS","Design"], icon: "bi-palette2", color: "green", status: "Publié", github: "https://github.com/NKOUAM/G.K-dev", features: ["Design créatif","Mise en page avancée","Identité visuelle"] },
];

export const EXPERIENCES: Experience[] = [
  { year: "2026", title: "Épreuve finale Fullstack KFOKAM48", company: "KFOKAM48 · Matricule 192", description: "Développement d'un projet fullstack complet (backend Java + frontend + API REST) pour valider l'épreuve finale.", tags: ["Java","API REST","Fullstack"] },
  { year: "2026", title: "Gestion de stock v2 — Organisation GitHub", company: "gestion-de-stock-v2", description: "Développement d'une application de gestion de stock en collaboration. Microservices, Git flow et revues de code.", tags: ["Collaboration","Git","Microservices"] },
  { year: "2025 → 2026", title: "Projets TypeScript & Angular", company: "NKOUAM & Fils · Kamgaing-ange", description: "Construction de plusieurs applications TypeScript pour renforcer ma maîtrise du front moderne et de l'architecture.", tags: ["Angular","TypeScript","Architecture"] },
  { year: "2025", title: "Sites HTML/JS — DJANGUI SPACE, E-commerce", company: "Projets personnels", description: "Création de plateformes web pour maîtriser HTML, CSS et JavaScript côté client.", tags: ["HTML","JavaScript","Web"] },
  { year: "2024 → 2025", title: "Systèmes & Télécommunications", company: "Lab personnel", description: "Configuration d'Asterisk en environnement virtuel, découverte de PJSIP, tests SIP et administration Linux.", tags: ["Linux","Asterisk","PJSIP"] },
  { year: "En continu", title: "Création numérique King-G", company: "Univers artistique personnel", description: "Direction visuelle de projets musicaux, création de pochettes, affiches et identité graphique.", tags: ["Direction artistique","Identité visuelle"] },
];

export const WORLDS: World[] = [
  { title: "King-G — Univers Artistique", icon: "bi-music-note-beamed", color: "pink", description: "Direction visuelle complète pour des projets musicaux : pochettes, affiches, identité graphique.", tags: ["Musique","Pochettes","Affiches"] },
  { title: "GOLDEN SKY LTD — Entrepreneuriat", icon: "bi-briefcase", color: "amber", description: "Concept d'entreprise orienté agronomie et produits naturels. Réflexion sur la structure et la scalabilité.", tags: ["Entrepreneuriat","Gestion","Vision"] },
  { title: "Agronomie & Nature", icon: "bi-tree", color: "green", description: "Projets de vergers fruitiers, apiculture et production de produits naturels. Une vision durable.", tags: ["Arboriculture","Apiculture","Élevage"] },
];

export const CONTACT = {
  email: "angeguilbert10@gmail.com",
  github: "https://github.com/NKOUAM",
  linkedin: "",
  location: "Cameroun",
  organizations: [
    { name: "KFOKAM48-SPECIALISATION", url: "https://github.com/KFOKAM48-SPECIALISATION" },
    { name: "gestion-de-stock-v2", url: "https://github.com/gestion-de-stock-v2" },
    { name: "kfokam48-epreuve-192", url: "https://github.com/kfokam48-epreuve-192" },
  ],
  achievements: [
    { name: "Pull Shark", icon: "🦈" },
    { name: "YOLO", icon: "🎯" },
  ],
};
