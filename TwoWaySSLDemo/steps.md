keytool -genkeypair -keyalg RSA -alias client -keystore client.jks -storepass password -validity 360 -keysize 2048
keytool -importkeystore -srckeystore client.jks -destkeystore client.jks -deststoretype pkcs12

keytool -exportcert -alias client -keystore client.jks -file client.cer


the trust_osb.jks from one-way demo

keytool -importcert -alias client -keystore trust_osb.jks -file client.cer

keytool -v -list -keystore trust_osb.jks -alias client

for debug:
modify EXTRA_JAVA_PROPERTIES add "-Dssl.debug=true -Dweblogic.StdoutDebugEnabled=true"