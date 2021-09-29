wget https://matrix.squiz.net/__data/assets/file/0030/37965/matrix-6.15.0.tgz
mkdir source
tar -xzf matrix-6.15.0.tgz -C source/

cd source/
npm install
npm run build
cd ..

#copy the built source into the docker-compose set up, then delete the node_modules folder before building the images
cp -R source/ php/src/
rm -rf php/src/source/node_modules/

#set up environment variables for domain and postgres password (required)
echo MATRIX_URL=`ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'` > .env
echo POSTGRES_PASSWORD=madeup >> .env

docker-compose up -d
docker-compose logs -f

#Wait for installation to complete, should see "NOTICE: ready to handle connections"
