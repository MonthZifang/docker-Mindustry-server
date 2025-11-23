FROM openjdk:17-jdk-alpine



RUN apk add --no-cache curl


# 目录
WORKDIR /server/Mindustry


COPY server-release.jar server-release.jar

EXPOSE 6567


CMD ["java", "-jar", "server-release.jar"]
