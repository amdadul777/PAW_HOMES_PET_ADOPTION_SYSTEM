 -- Users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Pets table
CREATE TABLE IF NOT EXISTS pets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    species VARCHAR(50) NOT NULL,
    breed VARCHAR(100),
    age VARCHAR(50),
    gender ENUM('Male','Female') NOT NULL,
    description TEXT,
    image_url VARCHAR(255) DEFAULT 'images/default_pet.png',
    status ENUM('Available','Adopted','Pending') DEFAULT 'Available',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Adoption requests table
CREATE TABLE IF NOT EXISTS adoptions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    pet_id INT NOT NULL,
    message TEXT,
    status ENUM('Pending','Approved','Rejected') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (pet_id) REFERENCES pets(id)
);

-- Admin table
CREATE TABLE IF NOT EXISTS admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Insert default admin (username: admin, password: admin123)
INSERT INTO admins (username, password) VALUES ('admin', MD5('admin123'));

-- Insert sample pets
INSERT INTO pets (name, species, breed, age, gender, description, image_url) VALUES
('Buddy', 'Dog', 'Golden Retriever', '2 years', 'Male', 'Buddy is a playful and friendly Golden Retriever who loves to play fetch and cuddle. He is great with kids and other dogs.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/YellowLabradorLooking_new.jpg/1200px-YellowLabradorLooking_new.jpg'),
('Whiskers', 'Cat', 'Persian', '3 years', 'Female', 'Whiskers is a calm and affectionate Persian cat. She loves to sit on laps and be pampered.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Gatto_europeo4.jpg/1200px-Gatto_europeo4.jpg'),
('Max', 'Dog', 'German Shepherd', '4 years', 'Male', 'Max is a loyal and intelligent German Shepherd. He is well-trained and very protective of his family.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Collage_of_Nine_Dogs.jpg/1200px-Collage_of_Nine_Dogs.jpg'),
('Luna', 'Cat', 'Siamese', '1 year', 'Female', 'Luna is a young and energetic Siamese cat. She is very curious and loves to explore.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Siam_lilacpoint.jpg/1200px-Siam_lilacpoint.jpg'),
('Rocky', 'Dog', 'Labrador', '5 years', 'Male', 'Rocky is a gentle Labrador who is great with children. He enjoys long walks and swimming.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Labrador_on_Quantock_%282175262184%29.jpg/1200px-Labrador_on_Quantock_%282175262184%29.jpg'),
('Bella', 'Rabbit', 'Holland Lop', '2 years', 'Female', 'Bella is a sweet and gentle Holland Lop rabbit. She loves to hop around and eat vegetables.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Oryctolagus_cuniculus_Rcdo.jpg/1200px-Oryctolagus_cuniculus_Rcdo.jpg');
