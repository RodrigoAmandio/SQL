SELECT 
AVG(gi)::INTEGER AS media_gi,
(AVG(gi)+(3*STDDEV(gi)))::INTEGER AS LSE_gi,
(AVG(gi)-(3*STDDEV(gi)))::INTEGER AS LIE_gi,
STDDEV(gi)::INTEGER AS desvio_gi,

AVG(glicina)::INTEGER AS media_glicina,
(AVG(glicina)+(3*STDDEV(glicina)))::INTEGER AS LSE_glicina,
(AVG(glicina)-(3*STDDEV(glicina)))::INTEGER AS LIE_glicina,
STDDEV(glicina)::INTEGER AS desvio_glicina,

AVG(ida)::INTEGER AS media_ida,
(AVG(ida)+(3*STDDEV(ida)))::INTEGER AS LSE_ida,
(AVG(ida)-(3*STDDEV(ida)))::INTEGER AS LIE_ida,
STDDEV(ida)::INTEGER AS desvio_ida,

AVG(acf)::INTEGER AS media_acf,
(AVG(acf)+(3*STDDEV(acf)))::INTEGER AS LSE_acf,
(AVG(acf)-(3*STDDEV(acf)))::INTEGER AS LIE_acf,
STDDEV(acf)::INTEGER AS desvio_acf,

ROUND(AVG(gt),4)::NUMERIC AS media_gt,
ROUND((AVG(gt)+(3*STDDEV(gt))),4)::NUMERIC AS LSE_gt,
ROUND((AVG(gt)-(3*STDDEV(gt))),4)::NUMERIC AS LIE_gt,
STDDEV(gt)::NUMERIC AS desvio_gt,

AVG(nfg)::INTEGER AS media_nfg,
(AVG(nfg)+(3*STDDEV(nfg)))::INTEGER AS LSE_nfg,
(AVG(nfg)-(3*STDDEV(nfg)))::INTEGER AS LIE_nfg,
STDDEV(nfg)::INTEGER AS desvio_nfg,

AVG(ampa)::INTEGER AS media_ampa,
(AVG(ampa)+(3*STDDEV(ampa)))::INTEGER AS LSE_ampa,
(AVG(ampa)-(3*STDDEV(ampa)))::INTEGER AS LIE_ampa,
STDDEV(ampa)::INTEGER AS desvio_ampa,

AVG(nmg)::INTEGER AS media_nmg,
(AVG(nmg)+(3*STDDEV(nmg)))::INTEGER AS LSE_nmg,
(AVG(nmg)-(3*STDDEV(nmg)))::INTEGER AS LIE_nmg,
STDDEV(nmg)::INTEGER AS desvio_nmg,

AVG(po4)::INTEGER AS media_po4,
(AVG(po4)+(3*STDDEV(po4)))::INTEGER AS LSE_po4,
(AVG(po4)-(3*STDDEV(po4)))::INTEGER AS LIE_po4,
STDDEV(po4)::INTEGER AS desvio_po4,

AVG(formol)::INTEGER AS media_formol,
(AVG(formol)+(3*STDDEV(formol)))::INTEGER AS LSE_formol,
(AVG(formol)-(3*STDDEV(formol)))::INTEGER AS LIE_formol,
STDDEV(formol)::INTEGER AS desvio_formol

FROM oxidacao_vw
