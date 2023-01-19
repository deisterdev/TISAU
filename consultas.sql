select * from bp_rprepofe_cartven order by date_created desc

<select>
    <columns>UNIQUE gdelegac.codigo delega, <nvl>gdelegac.auxchr1, 'ca'</nvl> idioma, gdelegac.nomdlg</columns>
    <from table='gdelegac'/>
    <where>
        ((gdelegac.agrupa IN(SELECT agrupa
                                FROM bp_rprepofe_cartven
                                WHERE bp_rprepofe_cartven.agrupa = gdelegac.agrupa)
            AND gdelegac.codigo != '0141')
            OR gdelegac.codigo = '0141')

        AND gdelegac.codigo MATCHES '*'
        AND ((gdelegac.agrupa MATCHES '*' AND "MATCHES '*'" NOT MATCHES '*0141*')
                OR ("MATCHES '*'" MATCHES '*0141*' AND gdelegac.codigo MATCHES '*'))
        AND gdelegac.fecalt &lt;= '18-01-2023'
        AND <nvl>gdelegac.auxfec1, '18-01-2023'</nvl> &gt;= '18-01-2023'
    </where>
</select>