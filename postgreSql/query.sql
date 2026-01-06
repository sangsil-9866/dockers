-- 0. 관리자로 접속
docker exec -it postgres psql -U dbuser -d dbname

-- 1. gitea라는 유저 생성 (비밀번호는 원하는대로, 여기선 gitea1234)
CREATE USER gitea WITH PASSWORD 'gitea1234';

-- 2. gitea라는 이름의 데이터베이스 생성하고 주인은 gitea로 설정
CREATE DATABASE gitea OWNER gitea;
-- 3. 나가기
\q