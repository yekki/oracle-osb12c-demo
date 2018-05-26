java utils.CertGen -selfsigned -certfile admin.cer -keyfile admin.key -keyfilepass password -cn "admin" -noskid
java utils.ImportPrivateKey -keystore identity_admin.jks -storepass password -keypass password -alias admin-cert -certfile admin.cer.pem -keyfile admin.key.pem -keyfilepass password
keytool -import -trustcacerts -alias trustself-cert -keystore trust_admin.jks -file admin.cer.der -keyalg RSA

keytool -importkeystore -srckeystore identity_admin.jks -destkeystore identity_admin.jks -deststoretype pkcs12
keytool -importkeystore -srckeystore trust_admin.jks -destkeystore trust_admin.jks -deststoretype pkcs12


java utils.CertGen -selfsigned -certfile osb.cer -keyfile osb.key -keyfilepass password -cn "osb" -noskid
java utils.ImportPrivateKey -keystore identity_osb.jks -storepass password -keypass password -alias osb-cert -certfile osb.cer.pem -keyfile osb.key.pem -keyfilepass password
keytool -import -trustcacerts -alias trustself-cert -keystore trust_osb.jks -file osb.cer.der -keyalg RSA

keytool -importkeystore -srckeystore identity_osb.jks -destkeystore identity_osb.jks -deststoretype pkcs12
keytool -importkeystore -srckeystore trust_osb.jks -destkeystore trust_osb.jks -deststoretype pkcs12