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


 private void writeToCsv(Integer id, String ecild, int status) {
        String csvFile = "path/to/yourfile.csv"; // Replace with your actual file path
        File file = new File(csvFile);

        try (FileWriter writer = new FileWriter(file, true)) {
            // Check if the file is new or empty and needs headers
            if (!file.exists() || file.length() == 0) {
                writer.append("GCID,ECIID,status\n");
            }

            // Write data
            writer.append(id.toString())
                  .append(',')
                  .append(ecild != null ? ecild : "")
                  .append(',')
                  .append(String.valueOf(status))
                  .append('\n');
        } catch (IOException e) {
            logger.error("Error writing to CSV file: {}", e.getMessage());
        }
    }



public List<String> getEciNumber(Integer id) {
        String ecild = null;
        int status;
        HttpHeaders headers = new HttpHeaders();
        // ... (Setting up headers)

        HttpEntity<String> entity = new HttpEntity<>(headers);
        String gpUrlNew = url + id;

        try {
            ResponseEntity<String> gpResponse = restTemplate.exchange(gpUrlNew, HttpMethod.GET, entity, String.class);
            status = gpResponse.getStatusCodeValue(); // Capture the status code

            if (gpResponse.getStatusCode() == HttpStatus.OK) {
                ecild = extractEcild(gpResponse.getBody());
            }
        } catch (Exception exception) {
            status = 500; // Default to 500 if an exception occurs
            logger.error("Error during GCP API request for GID {}: {}", id, exception.getLocalizedMessage());
        } finally {
            writeToCsv(id, ecild, status); // Write to CSV in the finally block
        }
        return Collections.singletonList(ecild);
    }
