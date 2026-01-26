-- 3. silServer 프로젝트용 스키마 생성 (소유권 부여)
CREATE SCHEMA silserver AUTHORIZATION dbuser;
GRANT ALL ON SCHEMA silserver TO dbuser;