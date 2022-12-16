OPTIONS (SKIP=1)
	LOAD DATA
	INTO TABLE tagobdatcu2 
	TRUNCATE
	FIELDS TERMINATED BY '|'
	TRAILING NULLCOLS(
				
	id_master              	boundfiller ,
	id_cliente             	boundfiller ,
	nombre                 	boundfiller ,
	nexos_apellido_paterno 	boundfiller ,
	apellido_paterno_norm  	boundfiller ,
	nexos_apellido_materno 	boundfiller ,
	apellido_materno_norm  	boundfiller ,
	fecha_nacimiento       	boundfiller ,
	rfc                    	boundfiller ,
	codrfc                 	boundfiller ,
	nomvia                 	boundfiller ,
	numext                 	boundfiller ,
	numint                 	boundfiller ,
	cposta                 	boundfiller ,
	loc_oficial            	boundfiller ,
	lmunicipio             	boundfiller ,
	lentidad               	boundfiller ,
	ind_cer                	boundfiller ,
	firegimenfiscalid      	boundfiller ,
	fcusocfdi              	boundfiller ,

	fxpaiscu                "regexp_substr(:id_cliente,'[^-]+',1,1)",
	fxcanalcu     		 	"regexp_substr(:id_cliente,'[^-]+',1,2)",
	fxsucursalcu  		 	"regexp_substr(:id_cliente,'[^-]+',1,3)",
	fxfoliocu     		 	"regexp_substr(:id_cliente,'[^-]+',1,4)",
	fxnombrecliente        	"SUBSTR ((trim(nvl(:nombre,'')) || ' ' || trim(nvl(:nexos_apellido_paterno,'')) || ' ' || trim(nvl(:apellido_paterno_norm,''))  || ' ' || trim(nvl(:nexos_apellido_materno,'')) || ' ' || trim(nvl(:apellido_materno_norm,'')))  , 0, 100)",
	fxrfccliente           	"case when trim(nvl(:rfc,''))=trim(nvl(:codrfc,'')) then trim(:codrfc) else 'XAXX010101000' end",
	fxdireccionfiscal      	"SUBSTR((trim(nvl(:nomvia,'')) || ' '  || trim(nvl(:numext,'')) ||  ' ' || trim(nvl(:numint,'')) ||  ' ' || trim(nvl(:loc_oficial,'')) || ' '  || trim(nvl(:lmunicipio,'')) || ' '  || trim(nvl(:lentidad,'')))   , 0, 100)",
	fxcodigopostalfiscal   	"SUBSTR (LPAD(:cposta,5,0) ,0,5)",
	fxmodifico             	"sysdate",
	fxusrmodifico          	constant "prueba"
	)