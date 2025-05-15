# Modifier Schema for PIF v1.2

This document lists all active prompt modifiers in the Prosthetic Intelligence Framework (PIF), including descriptions, behavior notes, and usage examples.

---

## -token
**Description:** Outputs only three numbers separated by `|` representing input tokens, output tokens, and token ratio when included in a prompt.  
**Behavior Notes:** Suppresses all other text in response except those three numbers.  
**Example:**  
Prompt: `Explain quantum computing -token`  
Response: `120|80|0.66`

---

## -appendmodifier  
**Description:** Enables appending modifier labels to the end of responses. Disabled by default.  
**Behavior Notes:** Only appends labels if this modifier is active.  
**Example:**  
Prompt: `Summarize AI progress -appendmodifier`  
Response ends with `[ -appendmodifier ]`

---

## -concise  
**Description:** Requests a shorter, more compact response length.  
**Behavior Notes:** Overrides default verbose style to produce brief, direct answers.  
**Example:**  
Prompt: `Explain recursion -concise`  
Response: `Recursion is a function calling itself.`

---

## -explain  
**Description:** Compares text inside parentheses with recent outputs, then generates a congruent simplified assimilation of the difference.  
**Behavior Notes:** Analyzes token similarity and synthesizes simplified explanation.  
**Example:**  
Prompt: `-explain(recursion)`  
Response: `Recursion means a function calling itself repeatedly until a condition is met.`

---

## -example<number>(prompt)  
**Description:** Generates `<number>` examples related to the prompt topic.  
**Behavior Notes:** Produces concrete, instructional examples without redundancy.  
**Example:**  
Prompt: `-example3(prompt engineering)`  
Response: Three concise prompt engineering examples.

---

## -behaviornotes(modifier) / -behaviordetails(modifier)  
**Description:** Outputs detailed behavior notes for the specified modifier.  
**Behavior Notes:** Useful for reviewing modifier behaviors without cluttering the main schema.  
**Example:**  
Prompt: `-behaviornotes(-token)`  
Response: Explains that `-token` outputs only token counts and ratio.

---

## -modifierexample(modifier)  
**Description:** Provides a single example usage case for the specified modifier.  
**Behavior Notes:** Keeps examples separate from schema file, reducing size and clutter.  
**Example:**  
Prompt: `-modifierexample(-concise)`  
Response: `Explain recursion -concise`

---

## -generate  
**Description:** Generates three example types related to a prompt: derived, extrapolated, and inferred.  
**Behavior Notes:** Combines different example generation strategies automatically.  
**Example:**  
Prompt: `-generate(prompt engineering)`  
Response: Three different example types for prompt engineering.

---

## -abstractexample  
**Description:** Generates an abstract/generalized example for a prompt.  
**Behavior Notes:** Focuses on conceptual, non-specific instances.  
**Example:**  
Prompt: `-abstractexample(communication)`  
Response: An example discussing the general nature of communication.

---

## -concreteexample  
**Description:** Generates a specific, tangible example for a prompt.  
**Behavior Notes:** Emphasizes real-world or precise scenarios.  
**Example:**  
Prompt: `-concreteexample(metaphor)`  
Response: A specific metaphor example like "Time is a thief."

---

## -surjectiveexample  
**Description:** Produces an example mapping multiple inputs to a single conceptual output.  
**Behavior Notes:** Shows examples of broad input mapping.  
**Example:**  
Prompt: `-surjectiveexample(causality)`  
Response: Multiple causes leading to a single effect example.

---

## -injunctiveexample  
**Description:** Generates a prescriptive example implying action or behavior.  
**Behavior Notes:** Useful for illustrating recommended or mandated actions.  
**Example:**  
Prompt: `-injunctiveexample(productivity)`  
Response: Advice like "Focus on one task at a time to improve productivity."

---

## -interpolateexample  
**Description:** Creates an example by interpolating between known examples.  
**Behavior Notes:** Blends characteristics of two or more examples into a new intermediate example.  
**Example:**  
Prompt: `-interpolateexample
