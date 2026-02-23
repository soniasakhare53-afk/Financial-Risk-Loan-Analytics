-- Advanced SQL Analytics
-- Financial Risk & Loan Default Analytics


-- 1. Customers with missed EMIs
SELECT c.customer_id, c.name, l.loan_id, r.due_date, r.emi_amount
FROM customer c
JOIN loans l ON c.customer_id = l.customer_id
JOIN repayments r ON l.loan_id = r.loan_id
WHERE r.payment_status = 'MISSED';

-- 2. Count of missed EMIs per customer
SELECT c.customer_id, c.name, COUNT(r.repayment_id) AS missed_emi_count
FROM customer c
JOIN loans l ON c.customer_id = l.customer_id
JOIN repayments r ON l.loan_id = r.loan_id
WHERE r.payment_status = 'MISSED'
GROUP BY c.customer_id, c.name
ORDER BY missed_emi_count DESC;

-- 3. Defaulted loans with customer profile
SELECT c.name, c.annual_income, l.loan_type, d.default_date, d.default_reason
FROM defaults d
JOIN loans l ON d.loan_id = l.loan_id
JOIN customer c ON l.customer_id = c.customer_id;

-- 4. Default rate by loan type
SELECT 
    l.loan_type,
    COUNT(DISTINCT d.loan_id) * 100.0 / COUNT(DISTINCT l.loan_id) AS default_rate_percent
FROM loans l
LEFT JOIN defaults d ON l.loan_id = d.loan_id
GROUP BY l.loan_type;

-- 5. Credit score vs default status
SELECT 
    c.name,
    cs.credit_score,
    CASE 
        WHEN d.loan_id IS NOT NULL THEN 'DEFAULTED'
        ELSE 'NON-DEFAULT'
    END AS loan_status
FROM customer c
JOIN credit_scores cs ON c.customer_id = cs.customer_id
LEFT JOIN loans l ON c.customer_id = l.customer_id
LEFT JOIN defaults d ON l.loan_id = d.loan_id;

-- 6. Loan-to-income ratio (repayment stress)
SELECT 
    c.name,
    c.annual_income,
    l.loan_amount,
    ROUND(l.loan_amount / c.annual_income, 2) AS loan_to_income_ratio
FROM customer c
JOIN loans l ON c.customer_id = l.customer_id
ORDER BY loan_to_income_ratio DESC;

-- 7. High-risk customers (rule-based)
SELECT DISTINCT c.customer_id, c.name
FROM customer c
JOIN loans l ON c.customer_id = l.customer_id
JOIN repayments r ON l.loan_id = r.loan_id
JOIN credit_scores cs ON c.customer_id = cs.customer_id
WHERE r.payment_status = 'MISSED'
  AND cs.credit_score < 650;