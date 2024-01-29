-- Tabel Univeristate 
CREATE TABLE IF NOT EXISTS universitate (
    universitateID INT PRIMARY KEY,
    nume VARCHAR(255) NOT NULL,
    adresa VARCHAR(255) NOT NULL,
    anInfiintare INT NOT NULL,
    rangAcademic VARCHAR(50) NOT NULL
);

-- Tabel facultate
CREATE TABLE IF NOT EXISTS facultate (
    facultateID INT PRIMARY KEY,
    nume VARCHAR(255) NOT NULL,
    decan VARCHAR(255) NOT NULL,
    anInfiintare INT NOT NULL,
    universitateID INT,
    FOREIGN KEY (universitateID) REFERENCES universitate(universitateID)
);

-- Tabel Departament
CREATE TABLE IF NOT EXISTS departament (
    departamentID INT PRIMARY KEY,
    nume VARCHAR(255) NOT NULL,
    decan VARCHAR(255)NOT NULL,
    sefDepartament VARCHAR(255) NOT NULL,
    anInfiintare INT NOT NULL,
    facultateID INT,
    FOREIGN KEY (facultateID) REFERENCES facultate(facultateID)
);

-- Tabel pt program de studii
CREATE TABLE IF NOT EXISTS programStudii (
    programStudiiID INT PRIMARY KEY,
    nume VARCHAR(255) NOT NULL,
    nivelStudii VARCHAR(50) NOT NULL,
    durata INT NOT NULL
);

-- Tabel Profesor
CREATE TABLE IF NOT EXISTS profesor (
    profesorID INT PRIMARY KEY,
    nume VARCHAR(255) NOT NULL,
    titluAcademic VARCHAR(100) NOT NULL,
    specializare VARCHAR(100) NOT NULL
);

-- Tabel Student
CREATE TABLE IF NOT EXISTS student (
    studentID INT PRIMARY KEY,
    nume VARCHAR(255) NOT NULL,
    nrIdentificare VARCHAR(20) NOT NULL,
    anStudiu INT NOT NULL
);

-- Tabel Materie
CREATE TABLE IF NOT EXISTS materie (
    materieID INT PRIMARY KEY,
    nume VARCHAR(255) NOT NULL,
    codCurs VARCHAR(20) NOT NULL,
    nrCredite INT NOT NULL,
    programStudiiID INT,
    profesorID INT,
    FOREIGN KEY (programStudiiID) REFERENCES programStudii(programStudiiID),
    FOREIGN KEY (profesorID) REFERENCES profesor(profesorID)
);

-- Tabel Parinte
CREATE TABLE IF NOT EXISTS parinte (
    parinteID INT PRIMARY KEY,
    nume VARCHAR(255) NOT NULL,
    relatieCuStudentul VARCHAR(500) NOT NULL,
    studentID INT,
    FOREIGN KEY (studentID) REFERENCES student(studentID)
);

-- Tabela relatie facultate - profesor
CREATE TABLE IF NOT EXISTS facultateProfesor (
    facultateID INT,
    profesorID INT,
    PRIMARY KEY (facultateID, profesorID),
    FOREIGN KEY (facultateID) REFERENCES facultate(facultateID),
    FOREIGN KEY (profesorID) REFERENCES profesor(profesorID)
);

-- Tabela relatie materie - profesor
CREATE TABLE IF NOT EXISTS studentMaterie (
    studentID INT,
    materieID INT,
    PRIMARY KEY (studentID, materieID),
    FOREIGN KEY (studentID) REFERENCES student(studentID),
    FOREIGN KEY (materieID) REFERENCES materie(materieID)
);

-- Tabela relatie profesor-student
CREATE TABLE IF NOT EXISTS studentProfesor (
    studentID INT,
    profesorID INT,
    PRIMARY KEY (studentID, profesorID),
    FOREIGN KEY (studentID) REFERENCES student(studentID),
    FOREIGN KEY (profesorID) REFERENCES profesor(profesorID)
);

