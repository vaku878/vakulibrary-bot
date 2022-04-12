FROM openjdk:11-slim
COPY /home/runner/work/vakulibrary-bot/vakulibrary-bot/target/vakulibrary_bot-1.0-SNAPSHOT.jar /home/vakulibrary_bot.jar
CMD ["java", "-jar", "/home/vakulibrary_bot.jar"]