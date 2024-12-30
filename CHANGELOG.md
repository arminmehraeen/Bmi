# Changelog

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
