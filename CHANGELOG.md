# Changelog

## [1.0.0] - 2024-03-21

### Added
- Body fat percentage calculation using the Deurenberg formula
- Ideal weight range calculation
- Waist-to-height ratio analysis
- Support for both metric and imperial measurement systems
- Enhanced activity level categories
- Comprehensive health recommendations
- Improved error handling
- Better type safety with enums
- Detailed documentation

### Changed
- Improved BMI categorization with more detailed classes
- Enhanced BMR calculation accuracy
- Better code organization and structure
- Updated documentation and examples

### Fixed
- Fixed potential calculation errors
- Improved input validation
- Enhanced error messages

## [0.0.3] - 2023-05-04

### Added
- Initial release with basic BMI calculation
- BMR calculation
- Calorie suggestions
- Age-based categorization

## [0.0.1]
Advanced body mass index ( BMI ) calculator flutter package 

## [0.0.2]
### Added:
- **BMI Calculation**: Implemented BMI calculation using weight and height.
- **BMR Calculation**: Added Basal Metabolic Rate (BMR) calculation using the Harris-Benedict equation.
- **Calorie Suggestions**: Suggested daily calorie intake based on activity level (sedentary, lightly active, etc.).
- **Age Category Determination**: Introduced age categories (child, adult, elderly) to adjust BMI status and calculations.
- **AdvancedBmiModel**: Integrated BMI, BMR, status, age category, and calorie suggestions into the `AdvancedBmiModel`.

### Changed:
- **Controller Logic**: Refined BMI and BMR calculation logic and structured the response.
- **Error Handling**: Added validation for invalid inputs (e.g., negative weight, zero height, or invalid gender).

### Fixed:
- **Edge Case Handling**: Improved handling for extreme values (e.g., zero height or negative weight).
- **Invalid Gender Handling**: Added checks for invalid gender inputs other than 'male' or 'female'.

### Removed:
- No removals in this version.