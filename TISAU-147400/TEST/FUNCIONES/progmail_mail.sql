CREATE PROCEDURE progmail_mail(
        p_progname        LIKE progmail.progname
    ) RETURNING CHAR(500);               

    DEFINE GLOBAL gl_debug       SMALLINT DEFAULT 0;    -- DEBUG FLAG

    DEFINE m_premail  LIKE progmail.email;
    DEFINE m_mail    CHAR(500);

    -- ----------------------------------------------------------------------
    -- Determina si se ha activado el flag de DEBUG global
    --- ---------------------------------------------------------------------
    IF gl_debug > 1 THEN
        TRACE ON;
    END IF

    LET m_mail = '';
    
    FOREACH WITH HOLD
       SELECT email
         INTO m_premail
         FROM progmail
        WHERE progname = p_progname

       LET m_mail = TRIM(m_mail)||' '||TRIM(m_premail);
    END FOREACH

   IF m_mail IS NULL OR m_mail = '' THEN
       LET m_mail = 'operosi@bonpreu.cat';
    END IF;

    RETURN TRIM(m_mail);

END PROCEDURE;