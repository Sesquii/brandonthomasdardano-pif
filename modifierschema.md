Modifier Schema

Current List of Modifiers

General Modifiers

-token: Displays input tokens, output tokens, and token ratio in the format: input | output | ratio.

-listmodifiers: Lists all active modifiers.

-modify: Allows inline modification of any existing modifier.

-combine: Merges two or more text inputs into a single, logically consistent output.

-separate(number): Separates text into a specified number of distinct points.

Export and Update Modifiers

-export: Exports the schema and glossary as JSON files.

-exportschema: Exports the schema as a JSON file.

-exportcontext: Exports the context as a JSON file.

-exportglossary: Exports the glossary as a JSON file.

-exportupdatelog: Exports the update log as a text file.

-update: Updates the current schema.

-updateall: Synchronizes and updates all components of the schema.

Analysis Modifiers

-createanalysis: Creates a detailed analysis of a given topic.

-displayanalysis: Displays an analysis in a user-friendly format.

-compare: Compares two or more concepts and generates an analysis.

Algorithm Modifiers

-algorithm(ccg): Combinatory Creation Generation - Combines selected prompts, analyzes them, and generates new ideas.

-algorithm(ncsa): Nested Context Synergy Association - Generates insights by exploring context associations.

-algorithm(lfa): Looping Feedback Algorithm - Optimizes outputs through iterative feedback.

-algorithm(mmg): Modifier Matrix Generation - Creates structured outputs using a matrix of modifiers.

-algorithm(random): Runs a random algorithm from the list and generates an output of 2500 tokens.

Content Generation Modifiers

-story(number): Generates a story using NCSA + LFA + MMG algorithms, with the specified number of pages.

-lyrics(number): Generates song lyrics using NCSA + LFA + MMG algorithms, with the specified number of verses.

-poem(number): Generates a poem using NCSA + LFA + MMG algorithms, with the specified number of stanzas.

Consolidation Modifiers

-consolidate(number): Adjusts an output to the specified number of tokens.

-consolidatestory(number): Adjusts a story's length to the specified number of pages.

-consolidatelyrics(number): Adjusts song lyrics to the specified number of verses.

-consolidatepoem(number): Adjusts a poem to the specified number of stanzas.

Utility Modifiers

-find(string): Finds modifiers containing the specified string.

-checkglossary: Displays differences between the glossary and schema.

-cleanupcontext: Cross-references the modifiers in context with the schema and deletes unused ones.

-delete(-modifier): Deletes a specified modifier from the schema and glossary.

-test: Adds a test case for a modifier without adding it to the schema.

This schema is fully updated as of May 16, 2025.