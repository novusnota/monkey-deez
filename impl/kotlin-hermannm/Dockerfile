FROM gradle:8.1.1-jdk11-alpine

COPY --chown=gradle:gradle . /app
WORKDIR /app

CMD echo "===> Formatting"
CMD ./gradlew ktlintFormat

CMD echo "===> Linting"
CMD ./gradlew ktlintCheck

CMD echo "===> Testing"
CMD ./gradlew cleanTest test
