---
title: "Topics in Social Science"
subtitle: "A Single-Page Quarto Demonstration"
bibliography: references.bib
---

[View the source of this page (`index.md`) on
GitHub](https://github.com/andrew222651/topics_in_social_science/blob/COMMIT_SHA/index.md)
· [GitHub
repository](https://github.com/andrew222651/topics_in_social_science)

## Introduction {#sec-intro}

This page demonstrates Quarto's cross-referencing features: an auto-generated
table of contents (see the sidebar), theorem and section references, LaTeX
math, and citations from a BibTeX file. The main result is presented in
@sec-theorem, with mathematical details in @sec-math.

## A Famous Theorem {#sec-theorem}

The central result of social choice theory can be stated as follows.

::: {#thm-arrow}
## Arrow's Impossibility Theorem

For three or more alternatives, no social welfare function can simultaneously
satisfy unrestricted domain, Pareto efficiency, independence of irrelevant
alternatives, and non-dictatorship.
:::

@thm-arrow was first proved by @arrow1951 and launched the modern field of
social choice theory. Its consequences are discussed further in
@sec-conclusion.

## Mathematical Formulation {#sec-math}

Let $N = \{1, \dots, n\}$ be a set of voters and $A$ a set of alternatives
with $|A| \geq 3$. Each voter $i \in N$ has a complete and transitive
preference ordering $\succ_i$ over $A$, with associated utility

$$
u_i(x) \;=\; \mathbb{E}\bigl[\, v(x \mid \theta_i) \,\bigr]
\;=\; \int_{\Theta} v(x, \theta) \, dF_i(\theta).
$$

A social welfare function aggregates a preference profile into a single
social ordering:

$$
f : (\succ_1, \dots, \succ_n) \;\longmapsto\; \succ .
$$

@thm-arrow states that no such $f$ satisfies all four of Arrow's axioms at
once.

## Conclusion {#sec-conclusion}

As shown by @thm-arrow (introduced in @sec-intro), aggregating individual
preferences into a coherent social choice requires relaxing at least one of
Arrow's conditions [@arrow1951].

## References {.unnumbered .unlisted}

::: {#refs}
:::
