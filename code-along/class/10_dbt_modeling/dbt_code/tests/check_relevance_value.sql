SELECT * 
FROM {{ ref('fct_job_ads') }}
WHERE relevance > 1
-- PASS för att man testar om relevance är större än 0 (alla är 1)
-- Test är till för att testa om något är fel, då blir det PASS
-- om man tar relevance = 1 blir det FAIL, för att inget går fel