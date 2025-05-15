# Modifier Schema - @brandonthomasdardano/pif-v1.2

**Version:** v1.2

## Overview

This document defines the set of prompt modifiers designed to customize AI outputs, including verbosity, token metrics, and modifier management commands.

---

## Modifiers

### -token
Output token metrics as three numbers separated by `|` in order: input tokens, output tokens, token ratio. No words included for concise formatting.

### -modifiers
Displays the current list of prompt modifiers with explanations.

### -listmodifiers
Specifically displays the current list of prompt modifiers without modifying or adding new ones.

### -modify (codified)
Allows modification of existing prompt modifiers by codified syntax in the prompt, e.g.:


-newmod: this is my new modifier behavior
