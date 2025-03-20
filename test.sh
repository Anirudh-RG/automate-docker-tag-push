docker run -d -p 5000:5000 --name registry2 registry:2
git clone https://github.com/Anirudh-RG/automate-docker-tag-push
cd automate-docker-tag-push
echo | cat run.sh > test-scripter.sh
chmod +x test-scripter.sh
mv test-scripter.sh /usr/local/bin/test-scripter.sh
/usr/local/bin/test-scripter.sh <<END
localhost:5000
END


docker pull nginx:latest
/usr/local/bin/test-scripter.sh nginx:latest nginx
docker run -d -p 80:80 localhost:5000/nginx:latest
docker ps