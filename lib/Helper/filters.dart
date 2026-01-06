import '../model/filter.dart';

class Filters {

  List<Filter> list(){

    return <Filter>[
      Filter(
          'No Filter',
          [
            1, 0, 0, 0,0,
            0 ,1, 0, 0, 0,
            0, 0, 1, 0, 0,
            0, 0, 0, 1, 0
          ]
      ),
      Filter(
          'Purple',
          [
            1, -0.2, 0, 0,0,
            0 ,1, 0, -0.1, 0,
            0, 1.2, 1, 0.1, 0,
            0, 0, 1.7, 1, 0
          ]
      ),
      Filter(
          'Yellow',
          [
            1, 0, 0, 0,0,
            -0.2 ,1.0, 0.3, 0.1, 0,
            -0.1, 0, 1, 0, 0,
            0, 0, 0, 1, 0
          ]
      ),
      Filter(
          'Cyan',
          [
            1, 0, 0, 1.9,-2.2,
            0 ,1, 0, 0.0, 0.3,
            0, 0, 1, 0, 0.5,
            0, 0, 0, 1, 0.2
          ]
      ),
      Filter(
          'B&W',
          [
            0, 1, 0, 0,0,
            0 ,1, 0, 0, 0,
            0, 1, 0, 0, 0,
            0, 1, 0, 1, 0
          ]
      ),
      Filter(
          'Old Times',
          [
            1, 0, 0, 0,0,
            -0.4 ,1.3, -0.4, 0.2, -0.1,
            0, 0, 1, 0, 0,
            0, 0, 0, 1, 0
          ]
      ),
      Filter(
          'Cold Life',
          [
            1, 0, 0, 0,0,
            0,1, 0, 0,0,
            -0.2, 0.2, 0.1, 0.4, 0,
            0, 0, 0, 1, 0
          ]
      ),
      Filter(
          'Sepium',
          [
            1.3, -0.3, 1.1, 0,0,
            0,1.3, 0.2, 0,0,
            0, 0, 0.8, 0.2, 0,
            0, 0, 0, 1, 0
          ]
      ),
      Filter(
          'Milk',
          [
            0, 1.0, 0, 0,0,
            0,1.0, 0, 0,0,
            0, 0.0, 1, 0, 0,
            0, 0, 0, 1, 0
          ]
      ),
    ];

  }

  static List<double> applyVignette(List<double> matrix, double intensity) {
    // Implement vignette filter logic here.
    // Example implementation (adjust as needed)
    List<double> vignetteMatrix = List.from(matrix); // Create a copy of the matrix
    // Apply vignette effect based on intensity
    for (int i = 0; i < vignetteMatrix.length; i++) {
      if (i % 5 == 4) continue; // Skip alpha channel
      vignetteMatrix[i] *= intensity; // Modify RGB values based on intensity
    }
    return vignetteMatrix;
  }

  static List<double> applyHDR(List<double> matrix, double intensity) {
    // Implement HDR filter logic here.
    // Example implementation (adjust as needed)
    List<double> hdrMatrix = List.from(matrix); // Create a copy of the matrix
    // Apply HDR effect based on intensity
    for (int i = 0; i < hdrMatrix.length; i++) {
      if (i % 5 == 4) continue; // Skip alpha channel
      hdrMatrix[i] = (hdrMatrix[i] - 0.5) * intensity + 0.5; // Adjust RGB values for HDR effect
    }
    return hdrMatrix;
  }

  static List<double> applyDehaze(List<double> matrix, double intensity) {

    List<double> dehazeMatrix = List.from(matrix); // Create a copy of the matrix
    // Apply dehaze effect based on intensity
    for (int i = 0; i < dehazeMatrix.length; i++) {
      if (i % 5 == 4) continue; // Skip alpha channel
      dehazeMatrix[i] = dehazeMatrix[i] * intensity; // Modify RGB values based on intensity
    }
    return dehazeMatrix;
  }
  static List<double> applyVignetteWithMask(List<double> matrix, double intensity, List<int> maskData) {
    // Check if maskData length matches matrix length (assuming one-dimensional matrix)
    if (matrix.length != maskData.length) {
      throw ArgumentError('Matrix and maskData lengths must match.');
    }

    // Constants for vignette effect
    const double centerRatio = 0.5; // Adjust center ratio based on image dimensions
    const double maxIntensity = 0.5; // Maximum intensity of vignette effect

    // Calculate vignette effect based on intensity
    double vignetteIntensity = intensity * maxIntensity;

    // Apply vignette effect with mask
    for (int i = 0; i < matrix.length; i++) {
      // Calculate position within image based on index
      double position = i.toDouble() / matrix.length;

      // Calculate vignette effect based on position and mask data
      double vignette = vignetteIntensity * (1.0 - position * centerRatio);

      // Apply vignette effect only where maskData indicates
      if (maskData[i] == 1) {
        // Adjust matrix element to apply vignette effect
        matrix[i] -= vignette; // Example: Adjust the red channel of the matrix element
      }
    }

    return matrix;
  }
  static List<double> applyHDRWithMask(List<double> matrix, double intensity, List<int> maskData) {
    // Implement HDR filter logic with mask application
    // Example logic:
    // Apply the HDR filter only where maskData is 1
    for (int i = 0; i < matrix.length; i++) {
      if (maskData[i] == 1) {
        matrix[i] *= intensity; // Adjust matrix values accordingly
      }
    }
    return matrix;
  }
  static List<double> applyDehazeWithMask(List<double> matrix, double intensity, List<int> maskData) {
    // Implement Dehaze filter logic with mask application
    // Example logic:
    // Apply the Dehaze filter only where maskData is 1
    for (int i = 0; i < matrix.length; i++) {
      if (maskData[i] == 1) {
        matrix[i] *= intensity; // Adjust matrix values accordingly
      }
    }
    return matrix;
  }

}
