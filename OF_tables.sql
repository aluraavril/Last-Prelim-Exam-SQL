-- Create Fans table
CREATE TABLE Fans (
  fan_id INT PRIMARY KEY,
  fan_username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL,
  subscription_tier VARCHAR(50) CHECK (subscription_tier IN ('Free', 'Paid'))
);

-- Create Creators table
CREATE TABLE Creators (
  creator_id INT PRIMARY KEY,
  creator_name VARCHAR(255) NOT NULL,
  profile_description TEXT,
  category VARCHAR(255),
  subscription_price DECIMAL(10, 2) NOT NULL,
  created_at DATETIME NOT NULL
);

-- Create Subscriptions table
CREATE TABLE Subscriptions (
  subscription_id INT PRIMARY KEY,
  fan_id INT,
  creator_id INT,
  start_date DATETIME NOT NULL,
  end_date DATETIME,
  status VARCHAR(10) CHECK (status IN ('Active', 'Non-active')),
  FOREIGN KEY (fan_id) REFERENCES Fans(fan_id),
  FOREIGN KEY (creator_id) REFERENCES Creators(creator_id)
);

-- Create Payment_Methods table
CREATE TABLE Payment_Methods (
  payment_method_id INT PRIMARY KEY,
  fan_id INT,
  payment_type VARCHAR(50) CHECK (payment_type IN ('Card', 'Paypal', 'Venmo')),
  FOREIGN KEY (fan_id) REFERENCES Fans(fan_id)
);

-- Create Transactions table
CREATE TABLE Transactions (
  transaction_id INT PRIMARY KEY,
  fan_id INT,
  creator_id INT,
  payment_method_id INT,
  amount DECIMAL(10, 2) NOT NULL,
  transaction_date DATETIME NOT NULL,
  FOREIGN KEY (fan_id) REFERENCES Fans(fan_id),
  FOREIGN KEY (creator_id) REFERENCES Creators(creator_id),
  FOREIGN KEY (payment_method_id) REFERENCES Payment_Methods(payment_method_id)
);

-- Insert data into Fans table
INSERT INTO Fans (fan_id, fan_username, email, password_hash, created_at, subscription_tier) 
VALUES 
(1, 'fan_lover01', 'fan01@example.com', 'a8b9c123', '2023-05-12 14:23:45', 'Free'),
(2, 'coolfan99', 'fan02@example.com', 'a7g8kq45', '2023-06-19 09:37:12', 'Paid'),
(3, 'subscriber_girl', 'fan03@example.com', 'fh67hh82', '2023-04-22 11:13:55', 'Free'),
(4, 'premium_fan34', 'fan04@example.com', 'l89io11a', '2023-07-03 17:22:01', 'Paid'),
(5, 'random_user77', 'fan05@example.com', 'z6t4m9v0', '2023-08-02 10:45:22', 'Free');

-- Insert data into Creators table
INSERT INTO Creators (creator_id, creator_name, profile_description, category, subscription_price, created_at) 
VALUES 
(1, 'HotModel_X', 'Fashion and Lifestyle content.', 'Fashion', 12.99, '2023-03-01 12:15:30'),
(2, 'Fitness_Guru', 'Fitness tips and workout routines.', 'Fitness', 19.99, '2023-02-14 09:20:12'),
(3, 'FoodieKing', 'Food reviews and cooking tips.', 'Food', 9.99, '2023-01-25 18:40:22'),
(4, 'GamingQueen', 'Live game streaming and tutorials.', 'Gaming', 15.50, '2023-05-11 14:34:55'),
(5, 'MusicMaven', 'Exclusive music and performances.', 'Music', 8.99, '2023-06-07 08:27:49');

-- Insert data into Subscriptions table
INSERT INTO Subscriptions (subscription_id, fan_id, creator_id, start_date, end_date, status) 
VALUES 
(1, 2, 1, '2023-06-19 09:37:12', '2023-07-19 09:37:12', 'Active'),
(2, 4, 2, '2023-07-04 15:23:00', '2023-08-04 15:23:00', 'Non-active'),
(3, 1, 3, '2023-05-12 14:23:45', '2023-06-12 14:23:45', 'Active'),
(4, 5, 4, '2023-08-02 10:45:22', '2023-09-02 10:45:22', 'Active'),
(5, 3, 5, '2023-04-22 11:13:55', '2023-05-22 11:13:55', 'Non-active');


-- Insert data into Payment_Methods table
INSERT INTO Payment_Methods (payment_method_id, fan_id, payment_type) 
VALUES 
(1, 2, 'Card'),
(2, 4, 'Paypal'),
(3, 3, 'Venmo'),
(4, 1, 'Card'),
(5, 5, 'Paypal');

-- Insert data into Transactions table
INSERT INTO Transactions (transaction_id, fan_id, creator_id, payment_method_id, amount, transaction_date) 
VALUES 
(1, 2, 1, 1, 12.99, '2023-06-19 10:15:00'),
(2, 4, 2, 2, 19.99, '2023-07-04 15:40:12'),
(3, 3, 5, 3, 8.99, '2023-04-23 11:20:30'),
(4, 1, 3, 4, 9.99, '2023-05-13 14:00:00'),
(5, 5, 4, 5, 15.50, '2023-08-02 11:00:45');

