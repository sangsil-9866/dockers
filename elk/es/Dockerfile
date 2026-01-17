ARG ELK_VERSION=8.17.0

FROM docker.elastic.co/elasticsearch/elasticsearch:${ELK_VERSION}

USER root

# 1. Nori 설치
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-nori

# 2. Entrypoint 스크립트 복사
COPY entrypoint.sh /usr/local/bin/custom-entrypoint.sh

# 3. 스크립트 실행 권한 및 윈도우 줄바꿈 문자 제거 (sed)
# 중요: 데이터 폴더 권한 문제 해결을 위해 chown 명령은 entrypoint에서 실행해야 함
RUN chmod +x /usr/local/bin/custom-entrypoint.sh && \
    sed -i 's/\r$//' /usr/local/bin/custom-entrypoint.sh

USER elasticsearch

ENTRYPOINT ["/usr/local/bin/custom-entrypoint.sh"]