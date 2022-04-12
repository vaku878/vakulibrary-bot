FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/vaku878/vakulibrary-bot.git

FROM maven:3.8.5-jdk-11 as build
WORKDIR /app
COPY --from=clone /app/vakulibrary-bot/ /app
RUN mvn install

FROM openjdk:11-slim
CMD ["java", "-version"]
WORKDIR /app
COPY --from=build /app/target/vakulibrary_bot-1.0-SNAPSHOT.jar /app/vakulibrary_bot.jar
CMD ["java", "-jar", "/app/vakulibrary_bot.jar"]