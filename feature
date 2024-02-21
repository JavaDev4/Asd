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
