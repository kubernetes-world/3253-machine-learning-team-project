ATTACH 'lit_panel_aggr.duckdb';
CREATE TABLE lit_panel_aggr.lit_panel_aggr AS
SELECT issuerTradingSymbol, accessionNumber, transactionCode, securityTitle, transactionType, count(*),
      sum(TRY_CAST(transactionShares AS INT)) AS _total_transaction_shares,
      sum(TRY_CAST(transactionShares AS INT) * TRY_CAST(transactionPricePerShare AS DOUBLE)) AS _total_transaction_amount
FROM lit_panel
GROUP BY issuerTradingSymbol, accessionNumber, transactionCode, securityTitle, transactionType
ORDER BY count(*) DESC;


