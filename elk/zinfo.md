es 안에 들어가기
docker exec -it elasticsearch /bin/bash
# 비번 재설정
bin/elasticsearch-setup-passwords interactive



# 1. 데이터가 저장될 상위 폴더의 권한을 풉니다 (Elasticsearch가 쓸 수 있게)
# 생성
/Users/sangsil/dev/docker/datas/opt/logstash/logstash-8.17.0/unzip
chmod -R 777 ../../datas



# 2. 인증서 파일의 권한을 읽기 가능하게 설정합니다.
# (너무 닫혀있으면 읽지를 못하고, 너무 열려있으면 보안 경고가 뜨지만, 644는 보통 통과됩니다)
chmod 644 ssl/localhost.crt
chmod 644 ssl/localhost_private.key

# 기존 컨테이너 및 볼륨 삭제 (데이터 초기화 주의)
docker-compose down -v

# 다시 빌드 및 실행
docker-compose up -d --build

# 설정등 변경 있을 때
docker-compose up setup

docker-compose restart logstash

