FROM alpine/git as clone
WORKDIR /app1
RUN git clone https://github.com/vaku878/vakulibrary-bot.git

FROM maven:3.8.5-jdk-11-slim as build
WORKDIR /app2
COPY --from=clone /app1/vakulibrary-bot/ /app2
RUN mvn compile assembly:single

FROM openjdk:11-slim
CMD ["java", "-version"]
WORKDIR /app3
COPY --from=build /app2/target/akulibrary_bot-jar-with-dependencies.jar /app3/akulibrary_bot-jar-with-dependencies.jar
CMD ["java", "-jar", "/app/akulibrary_bot-jar-with-dependencies.jar"]