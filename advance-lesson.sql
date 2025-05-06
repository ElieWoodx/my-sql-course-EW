SELECT
    ps.PatientId
    ,ps.AdmittedDate
    ,ps.Hospital
    , ps.Tariff
    , (SELECT SUM(subq.Tariff) FROM PatientStay subq WHERE subq.PatientId <= ps.PatientId AND subq.Hospital = ps.Hospital) as CumulativeTariff
    , (SELECT Count(*) FROM PatientStay subq WHERE subq.PatientId <= ps.PatientId AND subq.Hospital = ps.Hospital) AS PatientIndex
FROM
    PatientStay ps
ORDER BY ps.Hospital, ps.PatientId

