CREATE TABLE IF NOT EXISTS `usuarios` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `fone` VARCHAR(45) NOT NULL,
    `data_nascimento` DATE NOT NULL,
    `criado_em` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inserção de dados iniciais
INSERT INTO usuarios (nome, email, fone, data_nascimento) VALUES
('Alice', 'alice@example.com', '7777-7777', '2002-02-20'),
('Bob', 'bob@example.com', '8888-8888', '2002-03-15'),
('Carol', 'carol@example.com', '9999-9999', '2004-02-12');
