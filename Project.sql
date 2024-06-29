-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS CRMWebproject;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'student', 'pic') NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Complaints (
    complaint_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    blok VARCHAR(50) NOT NULL,
    aras VARCHAR(50) NOT NULL,
    no_bilik VARCHAR(50) NOT NULL,
    lokasi_lain TEXT,
    jenis_aduan ENUM('kerosakanAwam', 'kerosakanElektrikal', 'kerosakanPerabot', 'lain-lain') NOT NULL,
    detail_aduan TEXT NOT NULL,
    keterangan_aduan TEXT NOT NULL,
    status ENUM('pending', 'in_progress', 'resolved') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Actions (
    action_id INT AUTO_INCREMENT PRIMARY KEY,
    complaint_id INT NOT NULL,
    action_taken TEXT NOT NULL,
    action_by INT NOT NULL,
    action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (complaint_id) REFERENCES Complaints(complaint_id),
    FOREIGN KEY (action_by) REFERENCES Users(user_id)
);



