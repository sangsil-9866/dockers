# Java 17 기준 (프로젝트 버전에 맞게 변경)
FROM eclipse-temurin:21-jdk

WORKDIR /app

# JAR 복사
COPY silServer-0.0.1-SNAPSHOT.jar app.jar

# 포트 노출 (Spring Boot default=8080)
EXPOSE 8080

# 실행 명령어
ENTRYPOINT ["java", "-jar", "app.jar"]
