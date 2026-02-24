# Stage 1: Build del proyecto con Maven

FROM maven:3.9.0-eclipse-temurin-17 AS builder

WORKDIR /app

COPY pom.xml .

# Instalo las dependencias del proyecto
RUN mvn dependency:go-offline 

# Copio la carpeta src al contenedor
COPY src ./src

# Realizo el build del proyecto, omitiendo los tests
RUN mvn clean package -DskipTests

# Stage 2: Imagen final para ejecutar la aplicación

FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Copio el archivo JAR generado en la etapa anterior al contenedor
COPY --from=builder /app/target/payment-manager-0.0.1-SNAPSHOT.jar .

EXPOSE 8080

CMD ["java", "-jar", "payment-manager-0.0.1-SNAPSHOT.jar"]