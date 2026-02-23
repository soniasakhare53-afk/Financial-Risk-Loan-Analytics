-- Financial Risk & Loan Default Analytics
-- Database Schema
-- Author: Sonia Sakhare


CREATE DATABASE IF NOT EXISTS loan_risk_analytics;
USE loan_risk_analytics;

-- Customer table
CREATE TABLE customer (
    customer_id INT UNSIGNED PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    city VARCHAR(50),
    employment_type VARCHAR(50),
    annual_income DECIMAL(12,2)
) ENGINE=InnoDB;

-- Loans table
CREATE TABLE loans (
    loan_id INT UNSIGNED PRIMARY KEY,
    customer_id INT UNSIGNED,
    loan_amount DECIMAL(12,2),
    interest_rate DECIMAL(5,2),
    loan_term_months INT,
    loan_type VARCHAR(50),
    loan_start_date DATE,
    CONSTRAINT fk_loans_customer
        FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
) ENGINE=InnoDB;

-- Repayments table
CREATE TABLE repayments (
    repayment_id INT UNSIGNED PRIMARY KEY,
    loan_id INT UNSIGNED,
    emi_amount DECIMAL(10,2),
    due_date DATE,
    payment_date DATE,
    payment_status VARCHAR(20),
    CONSTRAINT fk_repayments_loans
        FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
) ENGINE=InnoDB;

-- Credit scores table
CREATE TABLE credit_scores (
    credit_score_id INT UNSIGNED PRIMARY KEY,
    customer_id INT UNSIGNED,
    credit_score INT,
    score_date DATE,
    CONSTRAINT fk_credit_customer
        FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
) ENGINE=InnoDB;

-- Defaults table
CREATE TABLE defaults (
    default_id INT UNSIGNED PRIMARY KEY,
    loan_id INT UNSIGNED,
    default_date DATE,
    default_reason VARCHAR(100),
    CONSTRAINT fk_defaults_loans
        FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
) ENGINE=InnoDB;

-- Risk scores table (derived using Python)
CREATE TABLE risk_scores (
    customer_id INT UNSIGNED,
    risk_score INT,
    risk_category VARCHAR(20),
    CONSTRAINT fk_risk_customer
        FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
) ENGINE=InnoDB;