FROM openjdk:11-slim
COPY ./target/vakulibrary_bot-1.0-SNAPSHOT.jar /usr/app/vakulibrary_bot.jar
WORKDIR /usr/app
CMD ["java", "-jar", "/home/vakulibrary_bot.jar"]