public void writeToCsv(Integer id, String ecild) {
    String csvFile = "path/to/yourfile.csv"; // Replace with your actual file path
    try (FileWriter writer = new FileWriter(csvFile, true)) {
        writer.append(id.toString())
              .append(',')
              .append(ecild)
              .append('\n');
    } catch (IOException e) {
        logger.error("Error writing to CSV file: {}", e.getMessage());
    }
}


    <!-- Define Console Appender -->
    <appender name="CONSOLE" class="ch.qos.logback.core.ConsoleAppender">
        <encoder>
            <pattern>%d{yyyy-MM-dd HH:mm:ss} - %msg%n</pattern>
        </encoder>
    </appender>



private void writeToCsv(Integer id, String ecild, int status) {
    String csvFile = "path/to/yourfile.csv"; // Replace with your actual file path
    try (FileWriter writer = new FileWriter(csvFile, true)) {
        writer.append(id.toString())
              .append(',')
              .append(ecild != null ? ecild : "") // Only write ecild if it's not null
              .append(',')
              .append(String.valueOf(status))
              .append('\n');
    } catch (IOException e) {
        logger.error("Error writing to CSV file: {}", e.getMessage());
    }
}
