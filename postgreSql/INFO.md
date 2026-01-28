## POSTGRESQL 사용방법

### 사용방법
    로컬용이므로 사용자 한명에 db 하나 사용함
    여러 프로젝트를 사용할 경우 schema를 생성해서 사용한다

### 스키마 생성방법
    CREATE SCHEMA silserver AUTHORIZATION dbuser;
    GRANT ALL ON SCHEMA silserver TO dbuser; -- 여기선 슈퍼유저라 딱히 안해도 됨

### Project Datasource 설정 예시
    spring:
        datasource:
            url: jdbc:postgresql://localhost:5432/dbname?currentSchema=silserver
            username: dbuser
            password: dbpassword


## GITEA 설정
### DB 생성
    -- 0. 관리자로 접속
    docker exec -it postgres psql -U postgres
    
    -- 1. gitea라는 유저 생성 (비밀번호는 원하는대로, 여기선 gitea1234)
    CREATE USER gitea WITH PASSWORD 'gitea1234';
    
    -- 2. gitea라는 이름의 데이터베이스 생성하고 주인은 gitea로 설정
    CREATE DATABASE gitea OWNER gitea;
    -- 3. 나가기
    \q

### 설치 UI


--------------------------------------------------------------------
-- public 스키마 초기화
--------------------------------------------------------------------
-- 1. public 스키마와 그 안의 모든 내용물(테이블 등)을 강제로 삭제
DROP SCHEMA public CASCADE;

-- 2. 깨끗한 public 스키마 다시 생성
CREATE SCHEMA public;

-- 3. 기본 권한 복구 (PostgreSQL 기본 설정)
GRANT ALL ON SCHEMA public TO postgres;
-- ALTER SCHEMA public OWNER TO CURRENT_USER;
GRANT ALL ON SCHEMA public TO public;