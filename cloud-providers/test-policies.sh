echo aws policies test:
cd aws
sentinel test
echo azure policies test:
cd ../azure
sentinel test
echo agnostic policies test:
cd ../cloud-agnostic
sentinel test
echo gcp policies test:
cd ../gcp
sentinel test
echo vmware policies test:
cd ../vmware
sentinel test
cd ..