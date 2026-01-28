-- 1. dbuser 생성 (비밀번호: dbpassword) 및 슈퍼유저 권한 부여
CREATE USER dbuser WITH PASSWORD 'dbpassword' SUPERUSER;

-- 2. dbuser가 사용할 데이터베이스 생성 (필요하다면)
CREATE DATABASE dbname OWNER dbuser;

-- 3. 권한 확실하게 부여 (슈퍼유저라 사실 다 되지만 명시적으로)
GRANT ALL PRIVILEGES ON DATABASE dbname TO dbuser;