CREATE TABLE article_sport(
   Id_article_sport INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   titre_article VARCHAR(50),
   contenu_article VARCHAR(50),
   image_article VARCHAR(50)
);

CREATE TABLE article_cinema(
   Id_article_cinema INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   titre_article VARCHAR(50),
   contenu_article VARCHAR(50),
   image_article VARCHAR(50)
);

CREATE TABLE article_serie(
   Id_article_serie INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   titre_article VARCHAR(50),
   contenu_article VARCHAR(50),
   image_article VARCHAR(50)
);

CREATE TABLE visiteur(
   Id_visiteur INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   nom_visiteur VARCHAR(50),
   prenom_visiteur VARCHAR(50),
   mdp_visiteur VARCHAR(50),
   login_visiteur VARCHAR(50)
);

CREATE TABLE admin(
   Id_admin INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   nom_admin VARCHAR(50),
   prenom_admin VARCHAR(50),
   mdp_admin VARCHAR(50),
   login_admin VARCHAR(50)
);

CREATE TABLE message(
   Id_message INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   objet_message VARCHAR(50),
   contenu_message VARCHAR(50),
   Id_visiteur INT NOT NULL,
   FOREIGN KEY(Id_visiteur) REFERENCES visiteur(Id_visiteur)
);

CREATE TABLE commentaire(
   Id_commentaire INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   texte_commentaire VARCHAR(50)
);

CREATE TABLE commentaire_visiteur(
   Id_commentaire_visiteur INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   texte_commentaire VARCHAR(50)
);

CREATE TABLE mot_clef_article(
   Id_mot_clef INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   sport VARCHAR(50),
   cinema VARCHAR(50),
   serie VARCHAR(50)
);

CREATE TABLE premium(
   Id_premium INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   article_sport_premium VARCHAR(50),
   article_cinema_premium VARCHAR(50),
   article_serie_premium VARCHAR(50)
);

CREATE TABLE produit(
   Id_produit INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   nom_produit VARCHAR(50),
   prix_produit VARCHAR(50)
);

CREATE TABLE ticket(
   Id_ticket INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   quantite VARCHAR(50)
);

CREATE TABLE auteur(
   Id_auteur INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   nom_auteur VARCHAR(50),
   prenom_auteur VARCHAR(50),
   mdp_auteur VARCHAR(50),
   login_utilisateur VARCHAR(50),
   Id_article_serie INT NOT NULL UNIQUE,
   Id_article_cinema INT NOT NULL UNIQUE,
   Id_article_sport INT NOT NULL UNIQUE,
   FOREIGN KEY(Id_article_serie) REFERENCES article_serie(Id_article_serie),
   FOREIGN KEY(Id_article_cinema) REFERENCES article_cinema(Id_article_cinema),
   FOREIGN KEY(Id_article_sport) REFERENCES article_sport(Id_article_sport)
);

CREATE TABLE vendeur(
   Id_vendeur INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   nom_vendeur VARCHAR(50),
   prenom_vendeur VARCHAR(50),
   Id_produit INT UNIQUE,
   FOREIGN KEY(Id_produit) REFERENCES produit(Id_produit)
);

CREATE TABLE voir(
   Id_article_sport INT,
   Id_visiteur INT,
   PRIMARY KEY(Id_article_sport, Id_visiteur),
   FOREIGN KEY(Id_article_sport) REFERENCES article_sport(Id_article_sport),
   FOREIGN KEY(Id_visiteur) REFERENCES visiteur(Id_visiteur)
);

CREATE TABLE lire(
   Id_article_cinema INT,
   Id_visiteur INT,
   PRIMARY KEY(Id_article_cinema, Id_visiteur),
   FOREIGN KEY(Id_article_cinema) REFERENCES article_cinema(Id_article_cinema),
   FOREIGN KEY(Id_visiteur) REFERENCES visiteur(Id_visiteur)
);

CREATE TABLE consulter(
   Id_article_serie INT,
   Id_visiteur INT,
   PRIMARY KEY(Id_article_serie, Id_visiteur),
   FOREIGN KEY(Id_article_serie) REFERENCES article_serie(Id_article_serie),
   FOREIGN KEY(Id_visiteur) REFERENCES visiteur(Id_visiteur)
);

CREATE TABLE gerer(
   Id_auteur INT,
   Id_admin INT,
   PRIMARY KEY(Id_auteur, Id_admin),
   FOREIGN KEY(Id_auteur) REFERENCES auteur(Id_auteur),
   FOREIGN KEY(Id_admin) REFERENCES admin(Id_admin)
);

CREATE TABLE administrer(
   Id_visiteur INT,
   Id_admin INT,
   PRIMARY KEY(Id_visiteur, Id_admin),
   FOREIGN KEY(Id_visiteur) REFERENCES visiteur(Id_visiteur),
   FOREIGN KEY(Id_admin) REFERENCES admin(Id_admin)
);

CREATE TABLE commenter(
   Id_auteur INT,
   Id_commentaire INT,
   PRIMARY KEY(Id_auteur, Id_commentaire),
   FOREIGN KEY(Id_auteur) REFERENCES auteur(Id_auteur),
   FOREIGN KEY(Id_commentaire) REFERENCES commentaire(Id_commentaire)
);

CREATE TABLE poster(
   Id_visiteur INT,
   Id_commentaire_visiteur INT,
   PRIMARY KEY(Id_visiteur, Id_commentaire_visiteur),
   FOREIGN KEY(Id_visiteur) REFERENCES visiteur(Id_visiteur),
   FOREIGN KEY(Id_commentaire_visiteur) REFERENCES commentaire_visiteur(Id_commentaire_visiteur)
);

CREATE TABLE vendre(
   Id_vendeur INT,
   Id_ticket INT,
   PRIMARY KEY(Id_vendeur, Id_ticket),
   FOREIGN KEY(Id_vendeur) REFERENCES vendeur(Id_vendeur),
   FOREIGN KEY(Id_ticket) REFERENCES ticket(Id_ticket)
);
