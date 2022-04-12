FROM alpine/git as clone
WORKDIR /app1
RUN git clone https://github.com/vaku878/vakulibrary-bot.git

FROM maven:3.8.5-jdk-11 as build
WORKDIR /app2
COPY --from=clone /app1/vakulibrary-bot/ /app2
RUN mvn -B package -e -X --file /app2/pom.xml

FROM openjdk:11-slim
CMD ["java", "-version"]
WORKDIR /app3
COPY --from=build /app2/target/vakulibrary_bot-1.0-SNAPSHOT.jar /app3/vakulibrary_bot-1.0-SNAPSHOT.jar
CMD ["java", "-jar", "/app/vakulibrary_bot-1.0-SNAPSHOT.jar.jar"]