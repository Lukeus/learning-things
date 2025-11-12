# Documentation Clarity Improvements

This document summarizes all improvements made to ensure clarity throughout the learning-things repository.

## Files Modified

### Main README.md
**Changes:**
- Expanded Prerequisites section with explanation of Spec Kit workflow
- Added examples of AI assistants (Copilot, Warp Agent, Claude)
- Created separate Unix/macOS and Windows (PowerShell) quick start sections
- Clarified npm vs pnpm choice with explicit guidance

### Lab A - Greenfield (labs/lab-a-greenfield/)
**Changes:**
- **README.md**: 
  - Removed reference to non-existent `starter/` directory
  - Added specific `spec-kit` CLI commands with examples
  - Clarified that scenario is in separate SCENARIO.md file
- **PROMPTS.md**:
  - Reformatted prompts with better structure
  - Added "When to use" context for each stage
  - Wrapped prompts in code blocks for easy copying
  - Numbered prompts to match workflow sequence

### Lab B - Brownfield (labs/lab-b-brownfield/)
**Changes:**
- **README.md**:
  - Removed reference to non-existent `sample-repo/` directory
  - Added reference to new Baseline.md template
  - Added specific CLI commands for artifact generation
  - Clarified references to SCENARIO.md
- **PROMPTS.md**:
  - Reformatted with better structure and context
  - Added "When to use" guidance
  - Improved prompt clarity and formatting

### Templates (templates/)
**Changes:**
- **Baseline.md** (NEW FILE):
  - Created missing template for brownfield projects
  - Includes sections for endpoints, domain model, architecture, tech debt, and dependencies
  
- **Clarifications.md**:
  - Added HTML comments with guidance
  - Provided example questions and decisions
  - Showed expected format with concrete examples
  
- **Spec.md**:
  - Added guidance comments for each section
  - Provided example user story format
  - Added sample endpoints, status codes, and acceptance criteria
  - Included example constraints and edge cases
  
- **Plan.md**:
  - Added detailed examples of modules and responsibilities
  - Showed ports/adapters pattern with concrete examples
  - Added risk/mitigation table format
  - Included test strategy examples
  
- **Tasks.md**:
  - Replaced minimal template with comprehensive example
  - Organized by category (Setup, Core Features, Rate Limiting, etc.)
  - Linked tasks to test names
  - Added guidance comments
  
- **LegacySpec.md**:
  - Added detailed guidance on documenting existing behavior
  - Provided concrete example of legacy behavior documentation
  - Included characterization test examples
  - Added risk documentation section

### Handouts (handouts/)
**Changes:**
- **Mentor-Guide.md**:
  - Restructured with clear sections
  - Added "What Agent-Agnostic Means" section with examples
  - Listed specific AI assistants and their usage patterns
  - Clarified teaching points with examples
  
- **Quick-Reference.md**:
  - Added "Common Spec Kit CLI Commands" section
  - Included specific commands for init, generate, validate, and update
  - Added note about command variations
  - Maintained workflow overview with better structure
  
- **Rubric.md**:
  - Expanded each criterion with 0, 1, and 2-point descriptions
  - Added specific examples of what earns each score
  - Made pass threshold more prominent
  - Provided concrete guidance for assessment

### Scripts (scripts/)
**New Files:**
- **setup.ps1**: PowerShell equivalent of setup.sh for Windows users
- **print-tree.ps1**: PowerShell equivalent of print-tree.sh for Windows users

Both scripts check for Node.js, npm, pnpm, and spec-kit CLI, providing appropriate error messages and installation guidance.

## Key Improvements Summary

### 1. Cross-Platform Support
- Added Windows PowerShell equivalents for all shell scripts
- Provided platform-specific installation instructions
- Ensured commands work on both Unix/macOS and Windows

### 2. Template Enhancement
- All templates now include guidance comments
- Added concrete examples showing expected content
- Provided structure to reduce ambiguity

### 3. CLI Command Documentation
- Added specific `spec-kit` commands throughout
- Showed exact syntax for common operations
- Linked to official documentation for details

### 4. Workflow Clarity
- Numbered prompt steps to match workflow
- Added "When to use" context for each stage
- Clarified relationships between artifacts

### 5. Assessment Clarity
- Expanded rubric with detailed scoring criteria
- Added examples of what earns each point level
- Made expectations concrete and measurable

### 6. Missing Artifacts
- Created Baseline.md template for brownfield work
- Removed references to non-existent directories
- Ensured all referenced files exist

### 7. Tool-Agnostic Guidance
- Clarified "agent-agnostic" concept with examples
- Listed multiple AI assistant options
- Emphasized process over specific tools

## Files That Still Need Attention

None - all identified issues have been addressed.

## Next Steps for Users

1. Run the appropriate setup script for your platform
2. Review the enhanced templates before starting labs
3. Use the PROMPTS.md files as guides with your AI assistant
4. Reference the Quick Reference for CLI commands
5. Check the Rubric to understand assessment criteria before starting
