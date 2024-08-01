
ATTACH 'lit_panel_aggr_v3.duckdb';
CREATE TABLE lit_panel_aggr_v3.lit_panel_aggr_v3 AS
SELECT URL, acceptanceDatetime, accessionNumber, type, period, issuerCIK, documentType, periodOfReport, notSubjectToSection16, issuerTradingSymbol, m_isDirector, m_isOfficer, m_isTenPercentOwner,
    m_isOther, transactionType, securityTitle, transactionFormType, transactionCode, equitySwapInvolved, transactionTimeliness, directOrIndirectOwnership, natureOfOwnership,
    sum(TRY_CAST(transactionShares AS INT)) AS _total_transaction_shares,
    sum(TRY_CAST(transactionShares AS INT) * TRY_CAST(transactionPricePerShare AS DOUBLE)) AS _total_transaction_amount,
    min(TRY_CAST(sharesOwnedFollowingTransaction AS INT)) as _minSharesOwnedFollowingTransaction,
    max(TRY_CAST(sharesOwnedFollowingTransaction AS INT)) as _maxSharesOwnedFollowingTransaction,
    count(*) as _count
FROM lit_panel
GROUP BY URL, acceptanceDatetime, accessionNumber, type, period, issuerCIK, documentType, periodOfReport, notSubjectToSection16, issuerTradingSymbol, m_isDirector, m_isOfficer, m_isTenPercentOwner,
    m_isOther, transactionType, securityTitle, transactionFormType, transactionCode, equitySwapInvolved, transactionTimeliness, directOrIndirectOwnership, natureOfOwnership
ORDER BY count(*) DESC;
