-- Sample Data Insertion
-- Financial Risk & Loan Default Analytics


-- Customers
INSERT INTO customer VALUES
(1, 'Amit Sharma', 35, 'Mumbai', 'Salaried', 900000),
(2, 'Neha Verma', 29, 'Delhi', 'Salaried', 650000),
(3, 'Rohit Mehta', 42, 'Pune', 'Self-Employed', 1200000),
(4, 'Priya Singh', 31, 'Bangalore', 'Salaried', 800000),
(5, 'Ankit Jain', 45, 'Jaipur', 'Self-Employed', 500000);

-- Loans
INSERT INTO loans VALUES
(101, 1, 500000, 10.5, 36, 'Personal', '2022-01-15'),
(102, 2, 300000, 11.0, 24, 'Personal', '2022-06-10'),
(103, 3, 1500000, 9.0, 60, 'Home', '2021-03-20'),
(104, 4, 800000, 10.0, 48, 'Auto', '2022-09-01'),
(105, 5, 400000, 12.5, 24, 'Personal', '2023-01-05');

-- Repayments (includes missed EMIs)
INSERT INTO repayments VALUES
(201, 101, 16500, '2023-01-10', '2023-01-09', 'PAID'),
(202, 101, 16500, '2023-02-10', NULL, 'MISSED'),
(203, 102, 14500, '2023-01-15', '2023-01-15', 'PAID'),
(204, 102, 14500, '2023-02-15', '2023-02-16', 'PAID'),
(205, 103, 32000, '2023-01-05', NULL, 'MISSED'),
(206, 104, 18500, '2023-01-20', '2023-01-19', 'PAID'),
(207, 105, 19500, '2023-02-10', NULL, 'MISSED');

-- Credit scores
INSERT INTO credit_scores VALUES
(301, 1, 720, '2023-01-01'),
(302, 2, 680, '2023-01-01'),
(303, 3, 750, '2023-01-01'),
(304, 4, 710, '2023-01-01'),
(305, 5, 620, '2023-01-01');

-- Defaults
INSERT INTO defaults VALUES
(401, 103, '2023-02-01', 'Multiple missed EMIs'),
(402, 105, '2023-03-01', 'Low income and missed payments');