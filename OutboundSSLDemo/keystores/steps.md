keytool -exportcert -alias osb-cert -keystore identity_osb.jks -file osb.cer

keytool -importcert -alias osb-cert -keystore client.jks -file osb.cer

keytool -v -list -keystore identity_osb.jks -alias osb-cert
keytool -v -list -keystore client.jks -alias osb-cert