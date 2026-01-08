USE fabrica_dam;

CREATE TABLE Componente
(CodComp char(4) PRIMARY KEY,
NomComp varchar(30) NOT NULL,
StockComp int unsigned NOT NULL,
StockMinComp int unsigned DEFAULT 5 NOT NULL);
CREATE TABLE Composición
(CodCompSup char(4),
CodCompInf char(4),
Cant int unsigned NOT NULL DEFAULT 1,
CONSTRAINT FK_CompSup FOREIGN KEY (CodCompSup) REFERENCES Componente(CodComp),
CONSTRAINT FK_CompInf FOREIGN KEY (CodCompInf) REFERENCES Componente(CodComp),
CONSTRAINT PK_Composición PRIMARY KEY (CodCompSup, CodCompInf));
INSERT INTO Componente VALUES ('AUTA', 'Automóvil A', 25, 5);
INSERT INTO Componente VALUES ('MOTA', 'Motor automóvil A', 25, 5);
INSERT INTO Componente VALUES ('CARA', 'Carrocería automóvil A', 25, 5);
INSERT INTO Componente VALUES ('PARD', 'Parabrisas delantero', 25, 5);
INSERT INTO Componente VALUES ('PART', 'Parabrisas trasero', 25, 5);
INSERT INTO Componente VALUES ('PUED', 'Puerta delantera', 50, 10);
INSERT INTO Componente VALUES ('PUET', 'Puerta trasera', 50, 10);
INSERT INTO Componente VALUES ('PUEM', 'Puerta del maletero', 25, 5);
INSERT INTO Componente VALUES ('RUEA', 'Rueda automóvil A', 125, 25);
INSERT INTO Componente VALUES ('CRID', 'Cristal puerta delantera', 50, 10);
INSERT INTO Componente VALUES ('CRIT', 'Cristal puerta trasera', 50, 10);
INSERT INTO Composición VALUES ('AUTA', 'MOTA', 1);
INSERT INTO Composición VALUES ('AUTA', 'CARA', 1);
INSERT INTO Composición VALUES ('CARA', 'PUED', 2);
INSERT INTO Composición VALUES ('CARA', 'PUET', 2);
INSERT INTO Composición VALUES ('CARA', 'PUEM', 1);
INSERT INTO Composición VALUES ('CARA', 'RUEA', 5);
INSERT INTO Composición VALUES ('CARA', 'PARD', 1);
INSERT INTO Composición VALUES ('CARA', 'PART', 1);
INSERT INTO Composición VALUES ('PUED', 'CRID', 1);
INSERT INTO Composición VALUES ('PUET', 'CRIT', 1);