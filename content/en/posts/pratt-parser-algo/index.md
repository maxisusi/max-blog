---
title: Pratt Parser Algorithm
date: 2025-01-23
author: Max Balej
description: Discover the wonders of the Pratt Parser Algorithm.
draft: true
tags:
  - Programming Language
  - Algorithm
---

In my journey of discovering how programming languages are parsed, I stumbled upon the Pratt Parser Algorithm.
Pratt Parser is a parser algorithm discovered by Vaughan Pratt in 1973. It is best describe as a **top-down operator precedence**.

Let's demistfiy what this all wizardry is about! :mage:

## What is a Parser?

Let's start with the basics. There is an awesome explanation by Alexis King in his blog [Parse don't validate](https://lexi-lambda.github.io/blog/2019/11/05/parse-don-t-validate/#:~:text=Consider%3A%20what%20is%20a%20parser%3F%20Really%2C%20a%20parser%20is%20just%20a%20function%20that%20consumes%20less%2Dstructured%20input%20and%20produces%20more%2Dstructured%20output.)
that says:

> A parser is just a function that consumes less-structured input and produces more-structured output.

The goal here is to take a raw input and convert it into a data structure that can be easily manipulated in order to
perform some operation.

## How Pratt Parser Works?

#### Some defintions first

- **Token** : A token is a single unit of a language. For example, `+` is a token.
- **Operator** : An operator is a token that performs some operation on one or more operands. For example, `+` is an operator.
- **Operand** : An operand is a value that an operator operates on. For example, `1` and `2` are operands.
- **Expression** : An expression is considered as some token sequence that produces a value. For example, `1 + 2` produces `3`.

Pratt parser is a way of parsing expressions in order to generate an _AST_ (Abstract Syntax Tree).

Pratt assumes three expressions type:

- **Infix expression**: expressions that have an operator in the middle of two operands. `1 + 2`
- **Prefix expression**: expressions that have an operator before the operand. `-1` or `!true`
- **Postfix expression**: expressions that have an operator after the operand. `1!` or `2.`

### The precedence rule

Pratt uses a rule called precedence to determine how certain expression should be grouped together.
Some value has a higher precendece than others. Let's take the following example:

Suppose we have an expression

```rust
a + b * 3
```

The precedence rule states that the multiplication operator `*` has a higher precedence than the addition operator `+`
so the final result of our paring should be:

```rust
a + (b * 3)
```

To make it easier, we can call the precendece rule as the _binding power_ of an operator. The more the binding power, the
more the operator glue to its operands.

Let's rewrite the expresion above using numbers to represent the binding power of each operator:

```rust
a + b * 3
 1|1 3|3
```
