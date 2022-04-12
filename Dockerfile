FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/vaku878/vakulibrary-bot.git

FROM maven:3.8.5-jdk-11-slim as build
WORKDIR /app
COPY --from=clone /app/vakulibrary-bot/ /app
RUN mvn compile assembly:single
CMD ["ls", "/app/target"]

FROM openjdk:11-slim
CMD ["java", "-version"]
WORKDIR /app
COPY --from=build /app/target/vakulibrary_bot-jar-with-dependencies.jar /app/vakulibrary_bot-1.0-SNAPSHOT.jar
CMD ["java", "-jar", "/app/vakulibrary_bot-1.0-SNAPSHOT.jar"]