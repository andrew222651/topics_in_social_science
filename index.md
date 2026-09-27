---
title: "Topics in Social Science"
bibliography: references.bib
---

::: {#github-links}
[View the source of this page (`index.md`) on
GitHub](https://github.com/andrew222651/topics_in_social_science/blob/COMMIT_SHA/index.md)
· [GitHub
repository](https://github.com/andrew222651/topics_in_social_science)
:::

<script>
// Quarto inserts the inline TOC (#TOC-body, shown on small screens) at the
// top of the page body; move the GitHub links above it. On larger screens
// #TOC-body is hidden (see styles.css), so this has no visible effect there.
{
  const tocBody = document.getElementById("TOC-body");
  const ghLinks = document.getElementById("github-links");
  if (tocBody && ghLinks) tocBody.before(ghLinks);
}
</script>

# Tools {#sec-tools}

## Naive Decision Theory {#sec-naive-decision-theory}

We will just say "preferences" instead of "revealed preferences."

* von Neumann utility theory [@vonneumann1944theory]: objective probabilities $\to$ utility function
* [@savage1954foundations]: preferences, continuity in events $\to$ atomless subjective probability measure, utility function
* [@anscombe1963definition]: objective probabilities, preferences $\to$ finite subjective probability measure, utility function
* [@arrow1971essays]: objective probabilities, preferences, monotone continuity $\to$ subjective probability measure, utility function
* [@teller1973conditionalization]: bet choices $\to$ finite subjective probability measure with Bayesian updating
* [@epstein1993dynamically]: preferences $\to$ finite subjective probability with Bayesian updating, utility function
* Fundamental theorem of asset pricing [@harrison1979martingales]: market prices $\to$ martingale measure
* GARP (Afriat's theorem) [@afriat1967construction]: market choices $\to$ continuous, concave, and monotonically increasing utility function

> "To the Bayesian all things are Bayesian." — I. J. Good

Wanting is preferences, liking is a hedonic brain state. There isn't a perfect correlation. Classical utilitarianism and decision utilitarianism are different.

"Consequentialism" means decisions are path independent over time.

### Consequentialism Implies Exponential Discounting {#sec-consequentialism-discounting}

#### Environment and Definitions {#sec-dt-definitions}

Let $\mathcal{T} = \{0, 1, \dots, T\}$ be a finite discrete time horizon. Uncertainty is governed by a measurable space of states of nature $(\Omega, \mathcal{F})$, revealed sequentially according to a filtration $\mathbb{F} = (\mathcal{F}_t)_{t=0}^T$, where $\mathcal{F}_0 = \{\emptyset, \Omega\}$, $\mathcal{F}_t \subseteq \mathcal{F}_{t+1}$, and $\mathcal{F}_T = \mathcal{F}$. Let $\mathcal{P}_t$ denote the set of non-empty partition cells (events) generating $\mathcal{F}_t$.

* Consequence space: Let $X \subseteq \mathbb{R}^K_{++}$ be a convex, open set of multidimensional consumption bundles per period. A bundle at time $t$ is a vector $\mathbf{x} = (x_1, \dots, x_K) \in X$, where each component represents an amount of a distinct commodity. Let $\mathbf{e}_1 = (1, 0, \dots, 0) \in \mathbb{R}^K$ denote the unit vector along the first commodity (the numeraire good).
* Multidimensional acts: A dynamic act $\mathbf{h} = (\mathbf{h}_t)_{t=0}^T$ is an adapted stochastic process where each mapping $\mathbf{h}_t: \Omega \to X$ is $\mathcal{F}_t$-measurable. For any event $E_t \in \mathcal{P}_t$, let $\mathbf{h}_{|E_t}$ denote the continuation act restricted to periods $\tau \ge t$ and states $\omega \in E_t$.
* Conditional preferences: At each decision node $(t, E_t)$ with $E_t \in \mathcal{P}_t$, the agent holds a complete, transitive binary preference relation $\succsim_{E_t}$ over continuation acts. Preferences satisfy continuity in the product topology and strict monotonicity in the numeraire: for any continuation act $\mathbf{f}$ and scalar $\varepsilon > 0$, $\mathbf{f} \succ_{E_t} \mathbf{f} - \varepsilon \mathbf{e}_1$ on all non-null sub-events.
* Consequentialism [@hammond1988consequentialist]: For every $t \in \mathcal{T}$ and $E_t \in \mathcal{P}_t$, the preference relation $\succsim_{E_t}$ depends exclusively on the consequences realized in periods $\tau \ge t$ for states $\omega \in E_t$. History prior to $t$ and unreached events $\Omega \setminus E_t$ carry zero normative weight.
* Intertemporal separability [@koopmans1960stationary]: For every node $(t, E_t)$ and every period $\tau \ge t$, the induced preference over period-$\tau$ consequences is independent of the fixed consequences in all other periods: for any continuation acts $\mathbf{f}, \mathbf{g}, \mathbf{f}', \mathbf{g}'$ on $E_t$ such that $\mathbf{f}_\tau = \mathbf{f}'_\tau$ and $\mathbf{g}_\tau = \mathbf{g}'_\tau$, while $\mathbf{f}_s = \mathbf{g}_s$ and $\mathbf{f}'_s = \mathbf{g}'_s$ for all periods $s \neq \tau$,
  $$\mathbf{f} \succsim_{E_t} \mathbf{g} \iff \mathbf{f}' \succsim_{E_t} \mathbf{g}'$$
* Stationarity [@koopmans1960stationary]: The ranking of deterministic continuation streams is independent of calendar time: for any nodes $(t, E_t)$ and $(s, E_s)$ and any deterministic streams $\mathbf{x}, \mathbf{y}$ (the same sequence of bundles in both cases, indexed by time elapsed since the evaluation date),
  $$\mathbf{x} \succsim_{E_t} \mathbf{y} \iff \mathbf{x} \succsim_{E_s} \mathbf{y}$$
* Arbitrage-freedom (no money pump): An agent is immune to arbitrage if there exists no decision tree, initial endowment act $\mathbf{f}$, and sequence of voluntary trades with an outside party such that the agent transitions through intermediate holdings and ends with an act $\mathbf{g}$ satisfying $\mathbf{g}_\tau(\omega) \le \mathbf{f}_\tau(\omega)$ coordinate-wise for all $\tau, \omega$ (with strict inequality in the numeraire on a non-null event), or surrenders a strictly positive total numeraire fee $\sum \varepsilon_i > 0$ while returning to the original act $\mathbf{f}$.

::: {#prp-exponential-discounting}
Let an agent's dynamic preferences $\{\succsim_{E_t}\}_{t \in \mathcal{T}, E_t \in \mathcal{P}_t}$ over multidimensional acts satisfy consequentialism, intertemporal separability, stationarity, continuity, and strict monotonicity in the numeraire. The agent is free from arbitrage across all dynamic decision trees if and only if there exist:

1. a continuous, strictly increasing multivariate utility function $u: X \to \mathbb{R}$, unique up to positive affine transformation;
2. a unique prior probability measure $P$ on $(\Omega, \mathcal{F})$ assigning strictly positive probability to every cell in $\bigcup_{t=0}^T \mathcal{P}_t$;
3. a constant discount factor $\delta \in (0, 1]$,

such that for every node $(t, E_t)$, continuation acts $\mathbf{f}$ are ranked according to the subjective expected utility functional

$$V_{E_t}(\mathbf{f}) = \mathbb{E}_P \left[ \sum_{\tau = t}^T \delta^{\tau - t} u(\mathbf{f}_\tau) \;\middle|\; E_t \right]$$

where conditional beliefs update strictly via Bayes' rule:

$$P(A \mid E_t) = \frac{P(A \cap E_t)}{P(E_t)} \quad \forall A \in \mathcal{F}.$$
:::

#### Supporting Lemmas {#sec-dt-lemmas}

::: {#lem-dynamic-consistency}
## Arbitrage-Freedom Forces Dynamic Consistency

If an agent is free from dynamic arbitrage across all decision trees, then preferences satisfy dynamic consistency: for all $t_1 < t_2$, $E_{t_1} \in \mathcal{P}_{t_1}$, and $E_{t_2} \in \mathcal{P}_{t_2}$ with $E_{t_2} \subset E_{t_1}$, and for any two acts $\mathbf{f}, \mathbf{g}$ that coincide outside $E_{t_2}$ and prior to $t_2$:
$$\mathbf{f} \succsim_{E_{t_1}} \mathbf{g} \iff \mathbf{f} \succsim_{E_{t_2}} \mathbf{g}$$
:::

::: {.proof}
Assume dynamic consistency fails. Then there exist nodes $(t_1, E_{t_1})$ and $(t_2, E_{t_2})$ with $E_{t_2} \subset E_{t_1}$, and continuation acts $\mathbf{f}, \mathbf{g}$ identical outside $E_{t_2}$ and prior to $t_2$, such that:
$$\mathbf{f} \succ_{E_{t_1}} \mathbf{g} \quad \text{and} \quad \mathbf{g} \succ_{E_{t_2}} \mathbf{f}$$

By continuity and strict monotonicity in the numeraire, there exist scalar fees $\varepsilon_1, \varepsilon_2 > 0$ such that:
$$\mathbf{f} - \varepsilon_1 \mathbf{e}_1 \succ_{E_{t_1}} \mathbf{g} \quad \text{and} \quad \mathbf{g} - \varepsilon_2 \mathbf{e}_1 \succ_{E_{t_2}} \mathbf{f}$$

An arbitrageur constructs the following multi-stage decision tree:

1. At $(t_1, E_{t_1})$, the agent is endowed with $\mathbf{g}$. The arbitrageur offers the act $\mathbf{f}$ in exchange for $\mathbf{g}$ plus a fee of $\varepsilon_1$ units of the numeraire. Because $\mathbf{f} - \varepsilon_1 \mathbf{e}_1 \succ_{E_{t_1}} \mathbf{g}$, the agent voluntarily accepts, holds $\mathbf{f}$, and surrenders $\varepsilon_1$.
2. Nature moves, and event $E_{t_2}$ materializes. Under consequentialism, the agent evaluates continuation prospects at $(t_2, E_{t_2})$ independent of past trades or unreached branches; the sunk fee $\varepsilon_1$ carries no normative weight. The arbitrageur offers the act $\mathbf{g}$ in exchange for the holding $\mathbf{f}$ plus a fee of $\varepsilon_2$ units of the numeraire. Because $\mathbf{g} - \varepsilon_2 \mathbf{e}_1 \succ_{E_{t_2}} \mathbf{f}$, the agent voluntarily accepts, holds $\mathbf{g}$ once more, and surrenders $\varepsilon_2$.

If the agent is naive, he returns to the original act $\mathbf{g}$, having forfeited $\varepsilon_1 + \varepsilon_2 > 0$ units of numeraire for no net gain in consumption. (Off event $E_{t_2}$, where no second trade occurs, the agent holds $\mathbf{f}$, which coincides with $\mathbf{g}$ there, and has still paid $\varepsilon_1$.)

If the agent is sophisticated in the sense of Strotz [@strotz1955myopia] and prunes the backward trap, Rabinowicz [@rabinowicz2000money] shows that an arbitrageur can construct an upfront money pump tree: anticipating that his future self will defect to $\mathbf{g}$ at $t_2$, the sophisticated agent voluntarily pays an upfront commitment fee at $t_1$ to an external party to restrict his future choice set.

Iterating these trees across periods extracts positive numeraire without providing consumption benefits. Hence, immunity to dynamic arbitrage across all decision trees requires strict dynamic consistency.
:::

The converse direction — that dynamically consistent preferences in the class considered here are immune to such pumps — is established by the sufficiency argument in the proof of @prp-exponential-discounting below.

::: {#lem-expected-utility-bayes}
## Subjective Uncertainty Forces Expected Utility and Bayes' Rule

If dynamic preferences $\{\succsim_{E_t}\}$ over multidimensional acts satisfy consequentialism and dynamic consistency across all filtrations, then preferences satisfy Savage's sure-thing principle, beliefs are represented by a unique additive probability measure $P$ updating via Bayes' rule, and risk preferences satisfy the von Neumann–Morgenstern independence axiom over $X$.
:::

::: {.proof}
Let $E \in \mathcal{F}_t$ and partition $E = A \cup B$ with $A, B \in \mathcal{F}_{t+1}$. Consider four acts $\mathbf{f}, \mathbf{g}, \mathbf{f}', \mathbf{g}'$ such that:

* On $A$: $\mathbf{f} = \mathbf{f}'$ and $\mathbf{g} = \mathbf{g}'$
* On $B$: $\mathbf{f} = \mathbf{g}$ and $\mathbf{f}' = \mathbf{g}'$
* On $\Omega \setminus E$: all four acts coincide.

By @lem-dynamic-consistency, dynamic consistency requires $\mathbf{f} \succsim_E \mathbf{g} \iff \mathbf{f} \succsim_A \mathbf{g}$. On event $A$, $\mathbf{f}$ and $\mathbf{f}'$ are identical, as are $\mathbf{g}$ and $\mathbf{g}'$. Consequentialism requires that evaluations on sub-tree $A$ depend exclusively on outcomes within $A$. Therefore:
$$\mathbf{f} \succsim_A \mathbf{g} \iff \mathbf{f}' \succsim_A \mathbf{g}'$$
Applying dynamic consistency in reverse from $A$ back to $E$:
$$\mathbf{f}' \succsim_A \mathbf{g}' \iff \mathbf{f}' \succsim_E \mathbf{g}'$$
Hence, $\mathbf{f} \succsim_E \mathbf{g} \iff \mathbf{f}' \succsim_E \mathbf{g}'$, which is Savage's sure-thing principle (Axiom P2) generalized to multidimensional outcomes.

Epstein and Le Breton [@epstein1993dynamically, theorem 1] established that on a rich state space, consequentialism and dynamic consistency across all trees imply probabilistic sophistication: there exists a unique, strictly positive additive probability measure $P$ on $(\Omega, \mathcal{F})$ such that acts yielding identical probability distributions over outcome streams in $X^{T-t+1}$ are indifferent.

If updating departs from Bayes' rule on some event $H \subset E_{t_1}$ ($P(H \mid E_{t_1}) \neq P(H \cap E_{t_1})/P(E_{t_1})$), Green [@green1987making] demonstrated that an arbitrageur can construct a dynamic Dutch book: a portfolio of state-contingent bets accepted conditionally at $E_{t_1}$ but rejected ex-ante, resulting in a strictly negative numeraire payoff in every state of nature. Updating must therefore be Bayesian.

Finally, by Hammond [@hammond1988consequentialist], dynamic consistency across probability mixture trees forces reduction to be linear in probabilities. By the multi-attribute expected utility theorem [@debreu1959theory; @keeney1976decisions], within each period $\tau$, the agent ranks distributions over $X$ by the expectation of a continuous multivariate Bernoulli utility function $u(\mathbf{x}_\tau)$.
:::

::: {#lem-exponential-discounting}
## Dynamic Consistency Forces Constant Exponential Discounting

Under intertemporal separability, stationarity, continuity, and strict monotonicity, evaluations of deterministic dated bundles $(\mathbf{x}, \tau)$ for $\mathbf{x} \in X$ at time $t \le \tau$ are represented by $V_t(\mathbf{x}, \tau) = D(t, \tau) u(\mathbf{x})$, with a node-independent utility $u$, $D(t, t) = 1$, and $D(t, \tau)$ continuous and nonincreasing in $\tau$. If preferences are in addition dynamically consistent, then $D(t, \tau) = \delta^{\tau - t}$ for some constant $\delta \in (0, 1]$.
:::

::: {.proof}
By intertemporal separability, continuity, and strict monotonicity, deterministic continuation streams admit an additively separable representation $\sum_{\tau \ge t} D(t, \tau) \, u(\mathbf{x}_\tau)$ across periods [@debreu1960topological; @koopmans1960stationary], and stationarity makes the per-period utility $u$ and the discount weights time-invariant, so a single dated bundle $(\mathbf{x}, \tau)$ is evaluated as $D(t, \tau) u(\mathbf{x})$.

Consider three periods $t_0 \le t_1 \le t_2$ and two deterministic consumption bundles $(\mathbf{x}, t_1)$ and $(\mathbf{y}, t_2)$ in $X$. By dynamic consistency (@lem-dynamic-consistency):
$$D(t_0, t_1) u(\mathbf{x}) = D(t_0, t_2) u(\mathbf{y}) \iff D(t_1, t_1) u(\mathbf{x}) = D(t_1, t_2) u(\mathbf{y})$$

Because $D(t_1, t_1) = 1$, substituting the second equality into the first yields:
$$D(t_0, t_2) = D(t_0, t_1) \cdot D(t_1, t_2) \quad \forall t_0 \le t_1 \le t_2$$

Stationarity requires that discount factors depend only on the elapsed time lag $\tau - t$: $D(t, \tau) = d(\tau - t)$ for some continuous function $d: \mathbb{R}_+ \to (0, 1]$ with $d(0) = 1$. Let $s = t_1 - t_0 \ge 0$ and $r = t_2 - t_1 \ge 0$. The recursive condition reduces to Cauchy's multiplicative functional equation:
$$d(s + r) = d(s) \cdot d(r) \quad \forall s, r \ge 0$$

Define $\phi(s) = \ln d(s)$. Taking logarithms transforms this into Cauchy's additive functional equation:
$$\phi(s + r) = \phi(s) + \phi(r)$$
Because $d(\cdot)$ is continuous and nonincreasing, $\phi(\cdot)$ is continuous and nonincreasing with $\phi(0) = 0$. The unique continuous solution is linear:
$$\phi(s) = -\rho s \quad \text{for some constant } \rho \ge 0$$

Exponentiating both sides:
$$d(s) = e^{-\rho s} = \delta^s$$
where $\delta = e^{-\rho} \in (0, 1]$. Setting $s = \tau - t$ yields $D(t, \tau) = \delta^{\tau - t}$.
:::

#### Proof of the Proposition {#sec-proof-exponential-discounting}

::: {.proof}
*Necessity ($\implies$).*

1. Assume the agent is immune to arbitrage across all dynamic decision trees. By @lem-dynamic-consistency, preferences must satisfy dynamic consistency.
2. By @lem-expected-utility-bayes [@epstein1993dynamically; @hammond1988consequentialist], consequentialism and dynamic consistency under subjective uncertainty force preferences at each node to satisfy Savage's axioms and the von Neumann–Morgenstern independence axiom. This establishes the existence of a unique additive prior $P$, Bayesian updating, and expected utility evaluation of continuation streams.
3. Restricting to deterministic sequences across time, intertemporal separability and stationarity yield the additively separable dated-bundle evaluations of @lem-exponential-discounting [@debreu1960topological; @koopmans1960stationary], and dynamic consistency then forces the discount function to satisfy Cauchy's multiplicative functional equation [@hammond1976changing]. Its unique continuous solution is exponential discounting: $D(t, \tau) = \delta^{\tau - t}$.
4. Integrating the state-space expected utility representation from @lem-expected-utility-bayes with the intertemporal discounting structure from @lem-exponential-discounting — cardinal uniqueness of the von Neumann–Morgenstern index ties the per-period utilities to a common $u$ — yields the unified functional:
   $$V_{E_t}(\mathbf{f}) = \mathbb{E}_P \left[ \sum_{\tau = t}^T \delta^{\tau - t} u(\mathbf{f}_\tau) \;\middle|\; E_t \right]$$

*Sufficiency ($\impliedby$).* Suppose preferences admit the representation $V_{E_t}(\mathbf{f})$ with Bayesian updating and $\delta \in (0, 1]$. By the law of iterated expectations:
$$V_{E_t}(\mathbf{f}) = u(\mathbf{f}_t) + \delta \, \mathbb{E}_P \left[ V_{E_{t+1}}(\mathbf{f}) \;\middle|\; E_t \right]$$

The functional obeys the Bellman optimality principle. An optimal act planned at $t = 0$ remains optimal at every reachable node $(t, E_t)$. At any node $(t, E_t)$, the agent will reject any proposed trade that lowers continuation value $V_{E_t}$.

Because $V_{E_t}$ is strictly increasing along the numeraire and dynamically consistent, the value of the agent's allocation is weakly monotonically increasing along any sequence of voluntary exchanges.

Therefore, no sequence of trades can terminate in an act $\mathbf{g}$ with $\mathbf{g} \le \mathbf{f}$ coordinate-wise (and strict inequality in numeraire), nor can an arbitrageur extract positive numeraire fees $\sum \varepsilon_i > 0$ while returning the agent to his initial endowment. The agent is strictly immune to arbitrage.
:::

### What Is the Optimal Practical Prior? {#sec-optimal-prior}

Solomonoff induction is the ideal answer when computation is free [@solomonoff1964formal1; @solomonoff1964formal2]. There is no known uniquely optimal polynomial-time replacement. The strongest general answer is instead a family of resource-bounded Bayesian program mixtures, compared by both computational cost and predictive loss. The attainable tradeoff is not known.

The rest of this section justifies that answer. It begins with pointwise approximation, the most direct interpretation, and turns to other criteria when the earlier ones fail or become degenerate. A useful criterion should reject static baselines, respect simple environments, charge for computation, and permit better-or-worse comparisons.

All binary logarithms are base 2; $\ln$ denotes the natural logarithm. Fix an optimal prefix-free universal machine $U_d$. Let $K(x)$ be prefix Kolmogorov complexity and let $\mathbf m_d$ be the discrete universal a priori semimeasure. The coding theorem gives

$$\mathbf m_d(x)=\Theta(2^{-K(x)}),\qquad \sum_x2^{-K(x)}\le1.$$

These definitions and the coding theorem are standard in algorithmic information theory [@livitanyi2019kolmogorov].

This discrete semimeasure should not be confused with the sequential Solomonoff semimeasure $\mathbf M$. For a compatible optimal monotone machine $U_M$,

$$\mathbf M(x)=\sum_{p:\,p\text{ is minimal and }U_M(p)\text{ outputs a string beginning with }x}2^{-|p|}.$$

Normalized conditionals $\overline{\mathbf M}(a\mid x)=\mathbf M(xa)/(\mathbf M(x0)+\mathbf M(x1))$ predict the next symbol, with joint probabilities defined by

$$\overline{\mathbf M}(x_{1:N})=
\prod_{t=1}^N\overline{\mathbf M}(x_t\mid x_{\lt t}).$$

The pointwise analyses below concern $\mathbf m_d$ and $K$; the later behavioral analysis concerns the predictions of $\overline{\mathbf M}$. All hidden constants may depend on the fixed machines and fixed algorithms, but not on $n$ or $x$. The precise computability level of several variants of Solomonoff induction is classified by Leike and Hutter [@leike2015computability].

#### Pointwise Approximation {#sec-pointwise-approximation}

General computability and approximation results for Kolmogorov complexity are surveyed by Vitányi [@vitanyi2020incomputable]. The elementary length-wise bounds below follow from standard incompressibility facts.

Suppose a total computable integer-valued function $A(x)$ estimates $K(x)$. For the proxy weight $2^{-K(x)}$, multiplicative weight error is exactly exponential in additive complexity error:

$$\max\left\{\frac{2^{-A(x)}}{2^{-K(x)}},
\frac{2^{-K(x)}}{2^{-A(x)}}\right\}=2^{|A(x)-K(x)|}.$$

By the coding theorem, the corresponding statement for $\mathbf m_d(x)$ holds up to fixed machine-dependent multiplicative constants.

Define the worst-case additive error on $n$-bit strings by

$$E_A(n)=\max_{|x|=n}|A(x)-K(x)|.$$

Then every total computable $A$ satisfies

$$E_A(n)\ge\frac{n-K(n)-O_A(1)}2.$$

To see this, choose $y\in\{0,1\}^n$ with $K(y)\ge n$, and let $x$ be the lexicographically first length-$n$ string maximizing $A$. Then $A(x)\ge A(y)\ge n-E_A(n)$, while $x$ is computable from $n$, so $A(x)\le K(x)+E_A(n)\le K(n)+O_A(1)+E_A(n)$. Thus every computable pointwise estimate distorts some length-$n$ universal weight by an exponential factor, up to the fixed coding-theorem constants.

For this criterion, the lower bound is tight to lower-order terms. The computable estimator $A_0(x)=\lceil|x|/2\rceil$ satisfies

$$E_{A_0}(n)\le\frac n2+K(n)+O(1),$$

while the lower bound above is $n/2-O_A(\log n)$ for every fixed computable estimator. Thus the best attainable leading term is $n/2$. Every fixed computable estimator incurs worst-case prior-weight distortion at least $2^{n/2-O_A(\log n)}$, while $A_0$ incurs at most $2^{n/2+O(\log n)}$.

One can weaken the requirement by asking only for multiplicative approximation of the complexity itself.

##### Weaker Multiplicative Approximation of $K(x)$ {#sec-multiplicative-approximation}

For a total computable rational-valued $A(x)>0$, define

$$\rho_A(n)=\max_{|x|=n}\max\left\{\frac{A(x)}{K(x)},\frac{K(x)}{A(x)}\right\}.$$

Every fixed $A$ satisfies

$$\rho_A(n)=\Omega_A\!\left(\sqrt{\frac{n}{K(n)}}\right).$$

Since $K(n)=O(\log n)$, this implies

$$\rho_A(n)=\Omega_A\!\left(\sqrt{\frac{n}{\log n}}\right).$$

::: {.proof}
Choose $y\in\{0,1\}^n$ with $K(y)\ge n$, and let $x$ be the first length-$n$ string maximizing $A$. Then $K(x)\le K(n)+O_A(1)$, and

$$\frac n{\rho_A(n)}\le A(y)\le A(x)
\le\rho_A(n)(K(n)+O_A(1)),$$

so $\rho_A(n)^2\ge n/(K(n)+O_A(1))$.
:::

The estimator $A(x)=\lceil\sqrt{|x|}\rceil$ has $\rho_A(n)=O(\sqrt n)$ because $1\le K(x)\le n+O(\log n)$. Thus the best fixed computable estimators have worst-case ratio $\sqrt n$ up to logarithmic factors.

#### Average Pointwise Approximation {#sec-average-approximation}

Worst-case pointwise approximation may be too demanding, so the next natural step is to average the error. This immediately raises a choice: average under which distribution?

##### Uniform Average {#sec-uniform-average}

Let $X_n$ be uniform on $\{0,1\}^n$. Approximating $K(x)$ by $|x|$ gives

$$𝔼_{X_n}[|n-K(X_n)|]=O(K(n))=O(\log n).$$

Indeed, $K(x)\le n+K(n)+O(1)$, while the counting bound $\Pr[K(X_n)<n-d]\le2^{-d+O(1)}$ makes the expected deficiency below $n$ constant. Thus returning the length has small uniform-average additive error, even though its worst-case error is linear.

##### Length-Conditioned Universal Average {#sec-length-conditioned-average}

For comparison, condition the discrete universal weights on length $n$:

$$Z_n=\sum_{|x|=n}2^{-K(x)},\qquad
\mu_n(x)=\frac{2^{-K(x)}}{Z_n}.$$

Here $\min_{|x|=n}K(x)=K(n)+O(1)$ and $Z_n=\Theta(2^{-K(n)})$. The simple string $0^n$ therefore has constant $\mu_n$-mass. Consequently,

$$𝔼_{x\sim\mu_n}[|n-K(x)|]=\Theta(n).$$

Thus returning $n$ is excellent under the uniform distribution but poor under the length-conditioned universal distribution.

Li and Vitányi established that average-case time and space complexities under a universal distribution have the same order as their worst-case counterparts [@li1992average]. The following score identity is a direct length-conditioned adaptation. Let $s(x)\ge0$ be a total computable integer- or rational-valued score with effectively decidable comparisons, and let $S(n)=\max_{|x|=n}s(x)$. Then

$$𝔼_{x\sim\mu_n}[s(x)]=\Theta(S(n)).$$

For the lower bound, take the lexicographically first length-$n$ maximizer $x_n$. It is computable from $n$, so $K(x_n)\le K(n)+O_s(1)$ and hence $\mu_n(x_n)=\Omega_s(1)$.

Thus computable average-case scores under this length-conditioned universal distribution have the same order as their worst cases.

The computability hypothesis is essential: the result does not apply directly to an error score involving the incomputable $K(x)$. Uniform averaging makes a trivial estimator look excellent, while universal averaging gives computably identifiable hard cases constant weight. Neither distribution provides a generally satisfactory relaxation of pointwise approximation.

#### Resource-Bounded Pointwise Approximation {#sec-resource-bounded-approximation}

Let $t$ be a computable time bound, large enough to permit direct printing of an $n$-bit string. Define

$$K^t(x)=\min\{|p|:U_d(p)=x\text{ within }t(|x|)\text{ steps}\}.$$

Time-bounded Kolmogorov complexity is a standard resource-bounded variant [@livitanyi2019kolmogorov]. Its connection to universal search goes back to Levin [@levin1973universal].

For $|x|=n$, $K(x)\le K^t(x)\le n+O(\log n)$. If $t$ is computable, exhaustive bounded simulation computes $K^t$ exactly, but not necessarily efficiently. Thus this replacement moves the problem from computability to computational cost without itself ranking efficient priors.

Schmidhuber instead incorporated runtime into a speed prior [@schmidhuber2002speed]. A later variant has prediction guarantees for polynomial-time estimable measures but requires doubly exponential time in general and exponential time on polynomial-time sequences. Schmidhuber's original has better complexity bounds, but its analogous stochastic guarantee remains open [@filan2016loss]. Neither result supplies a polynomial-time replacement for Solomonoff prediction.

#### Downstream Decision Error {#sec-downstream-error}

For a decidable language $L$ and deterministic heuristic $A$, let $\varepsilon_A(n)$ be its $\mu_n$-probability of error. This probability is either zero or bounded below by a positive constant: if an error exists, the first one is computable from $n$ and therefore has constant $\mu_n$-mass.

Thus $\varepsilon_A(n)=o(1)$ implies eventual worst-case correctness, not merely good average performance. Decision error is operational, but it is problem-specific, and under universal averaging it is again too close to a worst-case criterion to give a general ranking of priors.

#### Sequential Predictive Performance {#sec-sequential-prediction}

The preceding criteria fail for different reasons: pointwise agreement is too demanding, uniform averages ignore simple strings, universal averages expose computably identifiable worst cases, and downstream decision error depends on the chosen problem. The most operational general alternative considered here is to evaluate a prior by its intended use in sequential prediction. This does not make predictive loss the uniquely correct approximation concept.

For a computable measure $\mu$, universal dominance gives

$$\mathbf M(x_{1:N})\ge2^{-K(\mu)-O(1)}\mu(x_{1:N}).$$

Normalizing the one-step conditionals cannot reduce the probability assigned to the observed symbol relative to the raw semimeasure conditionals. Consequently, Solomonoff prediction has cumulative expected log-loss regret

$$D_{KL}(\mu(x_{1:N})\,\|\,\overline{\mathbf M}(x_{1:N}))
\le (K(\mu)+O(1))\ln2.$$

The chain rule and Pinsker's inequality give the corresponding cumulative squared-error bound, smaller by a factor of two.

Solomonoff introduced universal sequence prediction [@solomonoff1964formal1; @solomonoff1964formal2]. Universal dominance and the modern cumulative-loss treatment, including normalization and extensions to general losses, are developed by Hutter [@hutter2003optimality]; see also [@aixi] for a systematic treatment and discussion of computational limitations.

Log loss is useful because mixture dominance bounds it directly and it decomposes over time; squared error is a consequence. This criterion rejects static predictors without requiring pointwise agreement with $\mathbf M$. We now examine the optimization problem it induces under computational limits.

##### Resource-Bounded Setting {#sec-resource-bounded-setting}

Let $T: \mathbb N \to \mathbb N$ be a time-constructible, monotone time bound per step, and fix a universal interpreter $V$ with prefix-free program domain $P_V$. Assume $T(t)\ge c_V$, where $c_V$ is enough time for a fixed $V$-program to output a constant probability.

Define the benchmark class $𝓜_T$ of $T$-time computable measures by

$$𝓜_T = \left\{ \mu_p : p \in P_V, \; \forall t \ge 1, \; \forall x_{\lt t} \in \{0,1\}^{t-1}, \; \text{Time}\big(V(p, x_{\lt t})\big) \le T(t) \right\},$$

where each $p$ computes rational conditional probabilities $\mu_p(x_t=1\mid x_{\lt t})$.

Define the resource-bounded description complexity of an environment by

$$K_T(\mu)=\min\{|p|:p\in P_V,\ \mu_p=\mu,\ \mu_p\in𝓜_T\}.$$

Let $b:\mathbb N_{\ge1}\to\mathbb N_{\ge1}$ be a time-constructible, monotone, unbounded enumeration budget. Let $𝓐_{b,T}$ be the class of uniform deterministic predictors $A$ with persistent sequential state, computing $A(x_t=1\mid x_{\lt t})\in[0,1]$ such that

$$\text{Time}(A(x_{\lt t}))=O(b(t)T(t)).$$

We use unit-cost rational arithmetic; a bit-cost model adds polynomial overhead.

For any sequential predictor $A$ and $\mu\in𝓜_T$, define cumulative log-loss regret and cumulative squared error by

$$L(A,\mu)=\sum_{t=1}^\infty 𝔼_\mu\left[
D_{KL}\big(\mu(\cdot\mid x_{\lt t})\,\|\,A(\cdot\mid x_{\lt t})\big)
\right],$$

$$S(A,\mu)=\sum_{t=1}^\infty 𝔼_\mu\left[
\big(A(1\mid x_{\lt t})-\mu(1\mid x_{\lt t})\big)^2\right].$$

Pinsker's inequality gives $S(A,\mu)\le L(A,\mu)/2$. To compare predictors in this resource-bounded setting, define the complexity-indexed worst-case loss profile

$$R_A(k)=\sup\left\{L(A,\mu):\mu\in𝓜_T,\ K_T(\mu)\le k\right\}.$$

Let $C_A(t)$ be the worst-case time used by $A$ at step $t$. We evaluate $A$ by the pair $(C_A,R_A)$. It dominates $B$ if $C_A=O(C_B)$ and $R_A(k)\le R_B(k)$ for all sufficiently large $k$. Dominance is strict if $C_A=o(C_B)$ or $R_A(k)<R_B(k)$ infinitely often. This defines a computation-loss Pareto frontier while ignoring finite hardcoded improvements.

Related Pareto and fixed-resource optimality results appear in [@hutter2003optimality; @aixi], but the exact profile $R_A$ and pair $(C_A,R_A)$ are the synthesis used here.

Because polynomial time includes every fixed degree $O(t^d)$, increasing the degree may indefinitely trade more computation for less loss. A frontier may therefore exist without a single optimal polynomial-time prior.

A predictor is viable if $R_A(k)<\infty$ for every fixed $k$. This excludes static predictors, while polynomial $C_A$ excludes the incomputable ideal and unconstrained exhaustive substitutes.

##### Divergence of the Trivial Predictor {#sec-trivial-diverges}

Let $A_{\text{triv}} \in 𝓐_{b,T}$ be the static uniform predictor $A_{\text{triv}}(x_t=1\mid x_{\lt t}) = 1/2$ for all $t$.

::: {#thm-trivial-diverges}
The trivial predictor accumulates infinite cumulative loss on simple deterministic environments in $𝓜_T$.
:::

::: {.proof}
Let $\mu_0 \in 𝓜_T$ be the deterministic environment outputting $0^\infty$, so $\mu_0(x_t=1\mid x_{\lt t}) = 0$ for all $t$. The program generating $\mu_0$ has length $O(1)$ and runs within $T(t)$. At every step, the predictor incurs log-loss regret $\ln2$ and squared error $1/4$. Hence

$$L(A_{\text{triv}},\mu_0)=\infty,
\qquad S(A_{\text{triv}},\mu_0)=\infty,$$

so $A_{\text{triv}}$ is not viable.
:::

##### Delayed Mixture Predictor $A_b$ {#sec-delayed-mixture}

The construction combines Bayesian aggregation, Levin-style program search, and specialist experts that activate at different rounds [@hutter2003optimality; @cesabianchi2006prediction; @levin1973universal; @freund1997specialize].

Define the activation time

$$\tau_b(k)=\min\{t\ge1:b(t)\ge2^k\}.$$

For each binary string $q$, let $\nu_q$ predict $1/2$ before $\tau_b(|q|)$. Thereafter it runs $V(q,x_{\lt t})$ for at most $T(t)$ steps, using $1/2$ after a timeout or invalid output. Define

$$\xi_b=\sum_{q\in\{0,1\}^*}
\frac{2^{-|q|}}{(|q|+1)(|q|+2)}\nu_q.$$

These weights sum to one because

$$\sum_{q\in\{0,1\}^*}\frac{2^{-|q|}}{(|q|+1)(|q|+2)}
=\sum_{k=0}^\infty\frac1{(k+1)(k+2)}=1.$$

The predictor $A_b$ is the conditional distribution of $\xi_b$.

##### Complexity and Computability {#sec-ab-computability}

::: {#thm-ab-computable}
The predictor $A_b$ belongs to class $𝓐_{b,T}$ under the stated arithmetic convention.
:::

::: {.proof}
At time $t$, only programs of length at most $\lfloor\log b(t)\rfloor$ have activated. Their number is

$$\sum_{k=0}^{\lfloor \log b(t) \rfloor} 2^k
< 2^{\lfloor \log b(t) \rfloor + 1} \le 2b(t).$$

All inactive components have the same fair-coin likelihood and their telescoping tail weight can be aggregated exactly. Maintaining the active likelihoods and simulating each component for at most $T(t)$ steps gives

$$\text{Time}\big(A_b(x_{\lt t})\big)=O(b(t)T(t)).$$

If $b(t)$ and $T(t)$ are polynomial in $t$, $A_b$ runs in uniform polynomial time per step.
:::

##### Predictive Guarantee {#sec-predictive-guarantee}

::: {#thm-ab-guarantee}
For every target environment $\mu\in𝓜_T$, writing $k_\mu=K_T(\mu)$,

$$L(A_b,\mu)
\le\left(\tau_b(k_\mu)-1+k_\mu\right)\ln2
+\ln((k_\mu+1)(k_\mu+2)),$$

and $S(A_b,\mu)$ is at most half this quantity. Consequently,

$$R_{A_b}(k)\le(\tau_b(k)-1+k)\ln2+
\ln((k+1)(k+2)).$$
:::

::: {.proof}
Fix a shortest $T$-time program $p$ for $\mu$, and let $t_p=\tau_b(|p|)$. The component $\nu_p$ predicts by fair coin for the first $t_p-1$ steps and agrees with $\mu$ thereafter. Therefore, for every horizon $N$,

$$D_{KL}(\mu(x_{1:N})\,\|\,\nu_p(x_{1:N}))
\le (t_p-1)\ln 2.$$

Because the fixed mixture $\xi_b$ assigns weight

$$w_p=\frac{2^{-|p|}}{(|p|+1)(|p|+2)}$$

to $\nu_p$, $\xi_b(x_{1:N})\ge w_p\nu_p(x_{1:N})$. Hence

$$D_{KL}(\mu(x_{1:N})\,\|\,\xi_b(x_{1:N}))
\le (t_p-1+|p|)\ln2+\ln((|p|+1)(|p|+2)).$$

The chain rule identifies the left side with the finite-horizon cumulative log-loss regret of $A_b$. Taking $N\to\infty$ proves the log-loss bound, and Pinsker's inequality gives the squared-error bound. Finite squared loss implies that expected one-step squared error tends to zero.
:::

##### Lower Bound and Computation-Loss Tradeoff {#sec-lower-bound-tradeoff}

Assume the benchmark class is rich enough to contain, for every $y\in\{0,1\}^m$, the deterministic environment that emits $y$ and then zeros, with

$$K_T(\mu_y)\le m+K(m)+O(1).$$

The next theorem adapts the standard counting argument behind minimax log-loss lower bounds to the resource-bounded complexity $K_T$ and the profile $R_A$ [@hutter2003optimality; @cesabianchi2006prediction].

::: {#thm-minimax-lower-bound}
Under the richness assumption above, every predictor $A$ has

$$R_A(k)\ge(k-O(\log k))\ln2.$$
:::

::: {.proof}
For a fixed $m$, the probabilities that $A$ assigns to the $2^m$ possible initial strings sum to one. Some $y\in\{0,1\}^m$ therefore has $A(y)\le2^{-m}$. Against the deterministic environment $\mu_y$, the first $m$ steps alone contribute log-loss regret at least

$$-\ln A(y)\ge m\ln2.$$

Since $K(m)=O(\log m)$, choosing $m=k-O(\log k)$ gives the result.
:::

Hutter's universal-dominance bound gives the ideal Solomonoff predictor an $O(k)$ profile on this benchmark because unrestricted description complexity is at most $K_T(\mu)+O(1)$ [@hutter2003optimality]. Combined with the counting argument and its richness assumption, this gives a $\Theta(k)$ profile: linear dependence on environment complexity is information-theoretically optimal.

For the delayed mixtures, $b(t)=t$ gives

$$R_{A_b}(k)=O(2^k+k).$$

More generally, for every fixed positive integer $d$, $b(t)=t^d$ gives runtime $O(t^dT(t))$ and

$$R_{A_b}(k)=O(2^{k/d}+k).$$

Thus larger polynomial budgets improve the upper bound, while an exponential budget can recover a linear profile.

##### Answer {#sec-prior-answer}

If "practical" means polynomial-time and universal over $𝓜_T$, no uniquely optimal prior is known. Direct approximation of Solomonoff weights fails, and average approximation depends on the averaging distribution. Under sequential log loss, the most principled general substitute is a resource-bounded Bayesian mixture over programs, evaluated by its pair $(C_A,R_A)$ rather than by loss alone.

This conclusion combines Solomonoff and Hutter's ideal loss bounds [@solomonoff1964formal1; @solomonoff1964formal2; @hutter2003optimality], universal search and expert aggregation [@levin1973universal; @cesabianchi2006prediction; @freund1997specialize], and known efficiency limitations of speed priors [@schmidhuber2002speed; @filan2016loss]. The delayed mixtures above are one polynomial-time baseline, not a proved optimum.

The unrestricted minimax profile is $\Theta(k)$ under the stated richness assumption. The delayed polynomial-time mixtures have exponential upper bounds in $k$, but no matching computational lower bound is known. Thus the optimal practical prior is currently an unresolved computation-loss frontier, not a single established algorithm.

### Causality {#sec-causality}

::: {#def-probability-space}
## Probability Space and Exogenous Variables

Let $(\Omega, \Sigma, \mathbb{P})$ be a complete probability space.

An *exogenous variable* is a measurable function $U_i: (\Omega, \Sigma) \to (\mathcal{X}_{U_i}, \mathcal{B}_{U_i})$, where $(\mathcal{X}_{U_i}, \mathcal{B}_{U_i})$ is a standard Borel space. The collection $\mathcal{U} = \{U_1, U_2, \dots, U_m\}$ denotes the complete set of exogenous variables, representing background conditions, physical noise, or external disturbances determined entirely outside the modeled causal system.

The joint distribution of the exogenous variables is the push-forward measure $P_{\mathcal{U}} = \mathbb{P} \circ U^{-1}$ defined on the product measurable space $(\mathcal{X}_{\mathcal{U}}, \mathcal{B}_{\mathcal{U}}) = \prod_{i=1}^m (\mathcal{X}_{U_i}, \mathcal{B}_{U_i})$.
:::

::: {#def-endogenous-variables}
## Endogenous Variables and Structural Functions

Let $\mathcal{V} = \{V_1, V_2, \dots, V_n\}$ be a finite set of *endogenous variables*, where each $V_i$ takes values in a measurable space $(\mathcal{X}_{V_i}, \mathcal{B}_{V_i})$.

A *structural causal equation* for an endogenous variable $V_i$ is a measurable map:

$$f_i: \prod_{j \in \text{Pa}_i} \mathcal{X}_{V_j} \times \mathcal{X}_{U_i} \to \mathcal{X}_{V_i}$$

where $\text{Pa}_i \subseteq \mathcal{V} \setminus \{V_i\}$ denotes the set of *endogenous parents* (direct causes) of $V_i$, and $U_i \subseteq \mathcal{U}$ represents the exogenous variables directly influencing $V_i$.
:::

::: {#def-scm}
## Structural Causal Model

A *Structural Causal Model (SCM)* is a 4-tuple:

$$\mathcal{M} = \langle \mathcal{U}, \mathcal{V}, \mathcal{F}, P_{\mathcal{U}} \rangle$$

where:

1. $\mathcal{U}$ is the set of exogenous variables with joint measure $P_{\mathcal{U}}$ on $(\mathcal{X}_{\mathcal{U}}, \mathcal{B}_{\mathcal{U}})$.
2. $\mathcal{V}$ is the set of endogenous variables with product space $(\mathcal{X}_{\mathcal{V}}, \mathcal{B}_{\mathcal{V}}) = \prod_{i=1}^n (\mathcal{X}_{V_i}, \mathcal{B}_{V_i})$.
3. $\mathcal{F} = \{f_1, f_2, \dots, f_n\}$ is the collection of structural causal equations.
4. The directed graph $G = (\mathcal{V}, \mathcal{E})$, defined by directed edges $(V_j, V_i) \in \mathcal{E} \iff V_j \in \text{Pa}_i$, is a *Directed Acyclic Graph (DAG)*.

Because $G$ is acyclic, there exists a topological ordering $\pi$ of $\mathcal{V}$. By recursive substitution along $\pi$, the system of equations $\mathcal{F}$ defines a unique, measurable mapping $g: \mathcal{X}_{\mathcal{U}} \to \mathcal{X}_{\mathcal{V}}$, such that each endogenous variable is expressed as a deterministic function of the exogenous vector:

$$V_i = g_i(U)$$
:::

Hierarchy of graphical models:

* Level 1: standard Bayesian networks (associational / observational)
  * Core mechanics: represents the joint distribution via factorization of conditional probabilities over a DAG: $P(V_1, \dots, V_n) = \prod_{i=1}^n P(V_i \mid \text{Pa}_i)$.
  * Primary query: passive observation and conditioning—"What does observing $X = x$ tell us about $Y$?" ($P(Y \mid X = x)$).
  * Scope and limits: encodes conditional independencies via $d$-separation, but directed edges do not necessarily denote physical causality. Models within the same Markov equivalence class yield identical probability distributions.
* Level 2: causal Bayesian networks (interventional / action)
  * Core mechanics: treats edges as asymmetric, autonomous physical mechanisms and models interventions via graph surgery and the $do$-operator: $P(V \mid do(X = x^*)) = \prod_{i: V_i \neq X} P(V_i \mid \text{Pa}_i) \cdot \mathbb{I}(V_X = x^*)$.
  * Primary query: active manipulation—"What happens to $Y$ if we force $X = x$?" ($P(Y \mid do(X = x))$).
  * Scope and limits: severs incoming arrows to the target variable, distinguishing physical causation from spurious association. Cannot answer unit-level retrospective or counterfactual questions.
* Level 3: structural causal models (counterfactual / retrospective)
  * Core mechanics: models the system using deterministic assignment functions $V_i = f_i(\text{Pa}_i, U_i)$, where uncertainty originates strictly from the joint distribution over exogenous background variables $P(U)$.
  * Primary query: retrospection and individual attribution—"Given that $X = x$ and $Y = y$ occurred, what would $Y$ have been if $X$ had been set to $x'$ instead?" ($P(Y_{x'} \mid X = x, Y = y)$).
  * Scope and limits: isolates unit-level background states $U = u$, enabling reasoning about alternative outcomes across parallel scenarios. Completely subsumes both Level 1 (conditioning) and Level 2 (population-level interventions).

In a Structural Causal Model (SCM), *proximate causes* correspond to the direct parents ($\text{Pa}(Y)$) immediately adjacent to an outcome, while *distal causes* correspond to upstream ancestors ($\text{Anc}(Y) \setminus \text{Pa}(Y)$) separated from the outcome by one or more intermediate mechanisms (mediators).

::: {#def-intervention}
## Intervention and Potential Response Variables

Let $X \subseteq \mathcal{V}$ and $x \in \mathcal{X}_X = \prod_{V_j \in X} \mathcal{X}_{V_j}$.

An *atomic intervention* $do(X = x)$ forms a modified submodel $\mathcal{M}_x = \langle \mathcal{U}, \mathcal{V}, \mathcal{F}_x, P_{\mathcal{U}} \rangle$, where the equation set $\mathcal{F}_x$ is obtained by replacing $f_j$ for each $V_j \in X$ with the constant map:

$$V_j \equiv x_j$$

while retaining the original functions $f_k$ for all $V_k \notin X$.

For any variable $Y \in \mathcal{V}$ and any realization $u \in \mathcal{X}_{\mathcal{U}}$, the *potential response* $Y_x(u)$ is the unique solution for $Y$ in $\mathcal{M}_x$ under input $u$.

Because $g_{Y; x}: \mathcal{X}_{\mathcal{U}} \to \mathcal{X}_Y$ is measurable, $Y_x$ is a well-defined random variable on $(\Omega, \Sigma, \mathbb{P})$, with induced probability distribution:

$$P_{\mathcal{M}}(Y_x \in B) = P_{\mathcal{U}}\big(\{u \in \mathcal{X}_{\mathcal{U}} \mid Y_x(u) \in B\}\big), \quad \forall B \in \mathcal{B}_Y$$
:::

::: {#def-supposition}
## Causal Supposition Operator

Let $\mathcal{A} = \{do(X = x) \mid X \subseteq \mathcal{V}, x \in \mathcal{X}_X\}$ be the set of atomic causal acts, and let $\mathcal{S}$ denote the set of measurable state propositions over $\mathcal{V}$.

The *causal supposition operator* is a map $P(\cdot \parallel \cdot): \mathcal{S} \times \mathcal{A} \to [0, 1]$ defined such that for any event $E \in \mathcal{B}_Y$ and action $A = do(X = x)$:

$$P(Y \in E \parallel A) := P_{\mathcal{M}}(Y_x \in E)$$

This formalizes subjunctive belief-updating ("the probability that $Y \in E$ would occur if $X$ were set to $x$ by intervention") without reference to indicative conditional probability $P(Y \in E \mid X = x)$.
:::

::: {#def-preference-acts}
## Preference Relation over Causal Acts

Let $\mathcal{C}$ be a set of deterministic consequences, endowed with a $\sigma$-algebra $\Sigma_{\mathcal{C}}$. An act $A \in \mathcal{A}$ induces a probability measure $\mu_A$ on $(\mathcal{C}, \Sigma_{\mathcal{C}})$ via the causal supposition distribution over the states:

$$\mu_A(C) = \int_{\mathcal{X}_{\mathcal{V}}} \mathbb{I}_{C}(\text{outcome}(v, A)) \, dP(v \parallel A)$$

Let $\succsim$ be a binary relation on $\mathcal{A}$, where $A \succsim B$ denotes that the agent weakly prefers act $A$ to act $B$.
:::

::: {#prp-causal-representation}
## Structural-Suppositional Causal Representation

*Assumptions.*

1. Galles–Pearl axiomatization of structural counterfactuals. The set of potential response variables $\{Y_x \mid Y \in \mathcal{V}, X \subseteq \mathcal{V}, x \in \mathcal{X}_X\}$ generated by the structural model $\mathcal{M}$ satisfies the following axioms for all disjoint variable subsets $W, X, Y, Z \subseteq \mathcal{V}$ and corresponding values in the domains of those variables:
   * Effectiveness:
     $$X_x = x$$
   * Composition:
     $$(W_x = w) \implies (Y_{x, w} = Y_x)$$
   * Reversibility (acyclicity): for any finite sequence of variables and values $(Y^{(1)}, y^{(1)}), \dots, (Y^{(k)}, y^{(k)})$:
     $$\left( \bigwedge_{i=1}^{k-1} Y^{(i+1)}_{y^{(i)}} = y^{(i+1)} \right) \land \left( Y^{(1)}_{y^{(k)}} = y^{(1)} \right) \implies \left( Y^{(1)}_{y^{(k-1)}} = y^{(1)} \right)$$
2. Suppositional coherence and mechanism invariance. The causal supposition operator $P(\cdot \parallel \cdot)$ is governed by the distribution $P_{\mathcal{M}}$ induced by the structural model, satisfying:
   * Centering: for all $A = do(X = x)$:
     $$P(X = x \parallel A) = 1$$
   * Autonomous mechanism invariance: for any event $S \in \sigma(\{V_j \in \mathcal{V} \mid V_j \notin \text{Desc}(X)\})$ governed by equations unaffected by the intervention $do(X = x)$:
     $$P(S \parallel do(X = x)) = P_{\mathcal{M}}(S)$$
     where $\text{Desc}(X)$ denotes the topological descendants of $X$ in the DAG $G$.
3. Joycean axioms of causal preference. The preference relation $\succsim$ over $\mathcal{A}$ satisfies:
   * Weak order: $\succsim$ is complete ($\forall A, B \in \mathcal{A}: A \succsim B \lor B \succsim A$) and transitive ($\forall A, B, C \in \mathcal{A}: A \succsim B \land B \succsim C \implies A \succsim C$).
   * Dominance (causal sure-thing principle): for any partition of mutually exclusive and exhaustive states $\{S_i\}_{i=1}^k \subset \mathcal{S}$, if $A$ is weakly preferred to $B$ conditional on every supposed state:
     $$\forall i \in \{1, \dots, k\}, \quad (A \land S_i) \succsim (B \land S_i) \implies A \succsim B$$
   * Archimedean continuity: for all acts $A, B, C \in \mathcal{A}$ such that $A \succ B \succ C$, there exist real numbers $\alpha, \beta \in (0, 1)$ such that:
     $$\alpha A + (1 - \alpha) C \succ B \succ \beta A + (1 - \beta) C$$
     under convex combinations of the induced consequence measures $\mu_A, \mu_B, \mu_C$.
   * Subjunctive neutrality (independence of irrelevant news): for any two acts $A, B \in \mathcal{A}$, preference is invariant under indicative probability conditioning:
     $$A \succsim B \iff \mu_A \succsim \mu_B$$
     where $\mu_A$ and $\mu_B$ depend solely on the causal supposition measure $P(\cdot \parallel \cdot)$ and are strictly independent of the passive diagnostic posteriors $P(\cdot \mid A)$ and $P(\cdot \mid B)$.

*Conclusion.* Under Assumptions 1 through 3:

1. Existence and uniqueness of causal beliefs: the agent's subjective causal beliefs are uniquely represented by the push-forward measure $P_{\mathcal{M}}$ over potential responses generated by the structural causal model $\mathcal{M}$.
2. Existence and affine uniqueness of utility: there exists a bounded, real-valued, $\Sigma_{\mathcal{C}}$-measurable utility function $u: \mathcal{C} \to \mathbb{R}$, unique up to a positive affine transformation:
   $$u^*(\cdot) = a \cdot u(\cdot) + b, \quad a \in \mathbb{R}^+, \; b \in \mathbb{R}$$
3. Causal expected utility representation: for any two candidate actions $A, B \in \mathcal{A}$:
   $$A \succsim B \iff U_{\text{CDT}}(A) \ge U_{\text{CDT}}(B)$$
   where the decision functional $U_{\text{CDT}}: \mathcal{A} \to \mathbb{R}$ is the *Causal Expected Utility*:
   $$U_{\text{CDT}}(A) = \int_{\mathcal{X}_{\mathcal{V}}} u\big(\text{outcome}(v, A)\big) \, dP(v \parallel A) = \int_{\mathcal{X}_{\mathcal{U}}} u\big(\text{outcome}(g_x(u), A)\big) \, dP_{\mathcal{U}}(u)$$
:::

::: {.proof}
1. Existence and validity of causal supposition: by the soundness and completeness results of Galles and Pearl [@galles1998axiomatic], the structural equations $\mathcal{F}$ over the DAG $G$ and probability space $(\mathcal{X}_{\mathcal{U}}, \mathcal{B}_{\mathcal{U}}, P_{\mathcal{U}})$ uniquely generate potential response functions $g_x: \mathcal{X}_{\mathcal{U}} \to \mathcal{X}_{\mathcal{V}}$ satisfying Effectiveness, Composition, and Reversibility. Consequently, the push-forward measure $P_{\mathcal{M}}(\cdot_x) = P_{\mathcal{U}} \circ g_x^{-1}$ is well-defined. The causal supposition operator $P(\cdot \parallel do(X = x)) := P_{\mathcal{M}}(\cdot_x)$ therefore unconditionally satisfies Joyce's foundational suppositional requirements:
   * Centering follows directly from Effectiveness ($X_x = x \implies P(X = x \parallel do(X = x)) = 1$).
   * Mechanism invariance follows from Composition and DAG acyclicity, ensuring non-descendant background mechanisms remain invariant under intervention.
2. Preference representation: because $P(\cdot \parallel \cdot)$ is a valid, centered, and invariant causal supposition measure, the preference relation $\succsim$ satisfies Joyce's structural axioms (Weak Order, Dominance under Supposition, Continuity, and Subjunctive Neutrality). By Joyce's representation theorem [@joyce1999foundations, theorem 5.2]:
   * The subjective probability measure over counterfactual states is uniquely fixed to $P_{\mathcal{M}}$, and
   * There exists an affine-unique utility function $u: \mathcal{C} \to \mathbb{R}$ such that acts are ordered by:
     $$A \succsim B \iff \int_{\mathcal{X}_{\mathcal{V}}} u(\text{outcome}(v, A)) \, dP(v \parallel A) \ge \int_{\mathcal{X}_{\mathcal{V}}} u(\text{outcome}(v, B)) \, dP(v \parallel B)$$

Substituting $P(v \parallel A) = P_{\mathcal{U}} \circ g_x^{-1}$ into the integral yields the result.
:::

## Statistics {#sec-statistics}

### Uncertainty due to computational approximation in Bayesian inference {#sec-uncertainty-computation}

In Bayesian inference, we can factor approximate computation (e.g.
linearization [@herbst2015]) into the actual
posterior probabilities.

Suppose we have a [pmf](https://en.wikipedia.org/wiki/Probability_mass_function)
$f(x) = P(X=x)$ which is hard to compute.
If we approximate $f$ by $\tilde{f}$ then

$$
\begin{align*}
P\left(X = a \,|\, \text{we only compute } \tilde{f}\right)
&= \sum_x x P \left(f(a)=x \,|\, a, \tilde{f}(a) \right)\\
&= E\left(f(a) \,|\, a, \tilde{f}(a) \right)
\end{align*}
$$

What is $P\left(f(a)=x \,|\, a, \tilde{f}(a)\right)$?
Well, if $f$ is hard to compute then we probably can't gather much data, so
there are various options to produce a subjective belief:

* average-case analysis of $\tilde{f}$ with an uninformed prior
* in probabilistic numerics [@hennig2015] for example we may estimate a definite integral by taking a prior on integrands, sampling the integrand, then forming a posterior on integrands and hence on the integral
* we can have an estimate of the probability of a Turing machine halting by forming a prior on how many steps it takes before halting, running it for $n$ steps, then using the posterior. this can be extended to other problems via [reductions](https://en.wikipedia.org/w/index.php?title=RE_(complexity)&oldid=1171980812#RE-complete)
* the linearization in macroeconomic models is a single-iteration Newton method; error bounds are related to Taylor's theorem, see also
  [Propagation of uncertainty through a linear system of equations](https://stats.stackexchange.com/questions/57532/propagation-of-uncertainty-through-a-linear-system-of-equations)
* reference classes of "similar" cases
* uniform distribution across worst-case bounds; interval arithmetic may be useful
* past empirical experience
* etc.

Note that if the mean of the pmf $P(f(a)=\cdot \,|\, a, \tilde{f}(a))$
is $f(a)$ then $P(X = a \,|\, \text{we only compute } \tilde{f}) =  P(X=a)$.
So accounting for uncertainty due to approximation is equivalent to
"de-biasing" it.

::: {#exm-shifted-atom}
Suppose $f$ has a single atom and our approximation $\tilde{f}$ is
modeled as $f$ shifted by some unknown amount:
$\tilde{f}(x) = f(x + Y - 5)$, where
$Y \sim \operatorname{Bin}(10, 1/2)$.
If $\tilde{f}(0) = 1$, then

$$
\begin{align*}
P(X=0 \,|\, \text{we only compute } \tilde{f})
&= P(f(0) = 1 \,|\, \tilde{f}(0) = 1) \\
&\approxeq P(\tilde{f}(0) = 1 \,|\, f(0) = 1) \\
&=\binom{10}{5} 2^{-10} \doteq 0.246.
\end{align*}
$$

(The approximate equality holds if, say, we assume the location of the atom is
a priori uniformly distributed on a large integer interval.)
:::

The concept appears in Bayesian inverse problems [@stuart2010]:
In a Bayesian inverse problem, we observe data $y$ produced by some unknown quantity $\theta$ through a known mathematical model plus noise, for example $y = G(\theta)+\eta$; the
task is to infer $\theta$ from $y$ using Bayes's rule. Often $G(\theta)$ means "what the
observations would look like if $\theta$ had this value," but computing it exactly can be
too slow, so the literature [e.g. @kaipio2007] replaces it with a cheaper approximation $\tilde G(\theta)$ and
treats the error $G(\theta)-\tilde G(\theta)$ as another uncertain quantity. If this error
is modeled as Gaussian with mean $m_\epsilon$ and covariance $\Gamma_\epsilon$, and the
measurement noise has covariance $\Gamma_\eta$, then the likelihood can be approximated by
$y \mid \theta \sim N(\tilde G(\theta)+m_\epsilon,\Gamma_\eta+\Gamma_\epsilon)$, so the
posterior accounts for both noisy observations and uncertainty from the computation.

Inference is approximated for computational reasons in many places such as
linearization as mentioned already, clustering by compression using a zip
algorithm (instead of computing Kolmogorov complexity) [@cilibrasi2005],
PASS-GLM [@huggins2017], MCMC
sampling, numerical methods, approximation algorithms, probabilistic
data structures, et cetera.

Another example: when inferring how likely it is
that software is bug-free based on a finite set of
tests [@banks1998],
we are putting probability distributions on mathematically determined
statements, assuming the software is deterministic.

Is this ultimately rigorous in a decision theoretic sense? I don't think so, because the optimal computation would require proving something like an average-case hardness of approximation lower bound which is generally
difficult.
[See also this.](http://andrew222651.com/2017/10/10/probability-riemann-hypothesis/)
So it's a heuristic, no more no less.

#### DSGE example {#sec-dsge-example}

Dynamic Stochastic General Equilibrium (DSGE) models constitute the foundational framework of modern macroeconomic theory and policy analysis. Because the non-linear system of expectational difference equations characterizing these models rarely admits closed-form solutions, researchers almost universally rely on local perturbation methods. This typically involves computing first-order Taylor approximations of the unknown policy functions evaluated at the deterministic steady state.

During Bayesian inference, the structural parameters $\theta$ are estimated by mapping this linearized state-space representation to observable time-series data using a Kalman filter embedded within a Markov chain Monte Carlo (MCMC) algorithm [@herbst2015]. However, the standard implementation of the Kalman filter suffers from a fundamental methodological limitation: it treats the approximated linear policy rules as exact solutions. If the MCMC algorithm proposes a parameter vector that pushes the model into a highly non-linear regime, where the local linear approximation diverges significantly from the true global solution, the standard filter possesses no mechanism to detect this structural failure. It evaluates the likelihood function predicated entirely on the fit of the misspecified linear dynamics to the empirical data, thereby introducing severe parameter bias and spurious precision.

Drawing upon the principles of probabilistic numerics [@hennig2015], this methodological framework addresses this limitation by formalizing the deterministic numerical approximation error and embedding it directly into the Bayesian inference process as an endogenous random variable.

Rather than operating under the assumption that the true, unknown policy function $g(x_t; \theta)$ maps identically to the linearized matrix representation $\hat{g}(x_t; \theta) = G(\theta)x_t$, the framework defines the true function as the linear approximation plus an orthogonal stochastic error term:

$$g(x_t; \theta) = G(\theta)x_t + \epsilon_t(\theta)$$

To ensure this discrepancy term functions as a rigorous mathematical penalty rather than an ad hoc statistical residual, the framework dynamically links the covariance matrix of this multivariate Gaussian shock, $\epsilon_t \sim \mathcal{N}(0, \Sigma_\epsilon(\theta))$, to strict numerical error bounds evaluated at every step of the MCMC chain.

The covariance matrix is parameterized using two computable metrics:

1.  The Euler equation error ($\Vert E(\theta)\Vert$): the residual magnitude generated when the approximated policy rules are substituted into the original non-linear equilibrium equations. Formally, let the true non-linear expectations model be defined by a functional operator $\mathcal{F}$ such that the exact policy function yields $\mathcal{F}(g) = 0$. The approximation error is the residual evaluated at the linear approximation, $E(\theta) = \mathcal{F}(G(\theta)x_t)$. The metric $\Vert E(\theta)\Vert$ is typically computed as the supremum or the root-mean-square of the residuals evaluated over a strictly defined, discretized grid of the state space, $\mathcal{X}$.
2.  The Jacobian condition number ($\Vert J^{-1}(\theta)\Vert$): a discretized numerical measure of the model's sensitivity, serving as an approximation of the inverse Fréchet derivative of the Euler operator $\mathcal{F}$. To construct this, the operator is evaluated over $N$ collocation points in $\mathcal{X}$, yielding an $N \times N$ Jacobian matrix $J(\theta)$ containing the partial derivatives of the Euler residuals with respect to the approximated policy variables. The matrix norm of its inverse, $\Vert J^{-1}(\theta)\Vert$, quantifies the model's economic conditioning, penalizing parameter regions where the objective functions exhibit insufficient curvature.

The theoretical covariance matrix is subsequently scaled by the square of the product of these bounds:

$$\Sigma_\epsilon(\theta) = \kappa \cdot (\Vert J^{-1}(\theta)\Vert \cdot \Vert E(\theta)\Vert)^2 \cdot I$$

The constant $\kappa > 0$ is required to bridge the transition from a strictly bounded uniform distribution to a Gaussian distribution. Originally, a uniform distribution $\mathcal{U}[-B, B]$, where $B = \Vert J^{-1}(\theta)\Vert \cdot \Vert E(\theta)\Vert$, would perfectly capture the strict heuristic limits of the approximation error. The scalar $B$ represents the theoretical supremum of this error, derived from a functional Taylor expansion of the Euler operator. If the exact solution satisfies $\mathcal{F}(g) = 0$ and the approximation yields a residual $\mathcal{F}(\hat{g}) = E(\theta)$, linearizing the operator around the true solution implies $E(\theta) \approx \mathcal{F}'(g)(\hat{g} - g)$. Inverting this relationship and applying matrix norms reveals that the absolute distance between the approximated and true policy functions is strictly bounded by $\Vert\hat{g} - g\Vert \leq \Vert J^{-1}(\theta)\Vert \cdot \Vert E(\theta)\Vert$.

Because the standard Kalman filter requires Gaussian errors, $\kappa$ must be chosen to map the absolute bounds of this theoretical uniform distribution to a normal variance. Setting $\kappa = 1/3$ forces the Gaussian variance to exactly match the mathematical variance of the bounded uniform distribution. Alternatively, setting $\kappa = 1/9$ ensures that 99.7 percent of the Gaussian probability mass falls strictly within the calculated theoretical limits. Researchers may also treat $\kappa$ as an estimable hyperparameter that quantifies a baseline statistical tolerance for numerical misspecification.

When this state-dependent error covariance is integrated into the measurement equations of the state-space representation, it fundamentally alters the mechanics of the likelihood evaluation.

As the Metropolis-Hastings algorithm proposes a new parameter vector $\theta$, the framework computes the local approximation bounds endogenously. If the proposed $\theta$ specifies a parameter space characterized by high non-linearity or severe ill-conditioning, the computed numerical bounds increase by orders of magnitude. This escalation scales the theoretical covariance matrix $\Sigma_\epsilon(\theta)$ proportionately.

Upon encountering this inflated theoretical variance, the Kalman filter optimally assigns an elevated degree of uncertainty to the state-space mapping. Consequently, the log-likelihood of observing the empirical data conditional on that specific parameter draw is severely penalized, effectively pushing the posterior mass away from parameter regions lacking rigorous numerical validity.


# Belief elicitation without verification {#sec-belief-elicitation}

Dimensions along which mechanisms in this space vary:

* Whether the mechanism can verify at least some questions, possibly at a cost.
* Whether there must be multiple questions, and whether agents must all answer
  the same questions.
* How many agents there can be.
* Whether the game has non-truthful equilibria as well as a truthful
  equilibrium.
* Whether reputation is a factor.
* Whether agents have full information or just a signal.

The "Robust Bayesian Truth Serum" (RBTS) has good but not perfect theoretical
properties. There is a positive empirical result for RBTS when agents generally
have outside incentives: "Paying for the Truth: The Efficacy of a Peer
Prediction Mechanism in the Field". However, the incentives in that study were
small and evenly distributed.

A recent literature review is [@kong_minimal_finite, sec. 2].

Twitter's [Community
Notes](https://vitalik.eth.limo/general/2023/08/16/communitynotes.html) system
assumes that users will be politically biased in their reports at least some of
the time. But if a note receives bipartisan support, it is promoted.

Whom should we trust? If someone told the truth in the past, are they
trustworthy in the future? There is a large literature on reputation in
economics.

In the absence of a mechanism with a truthful outcome, presumably the
equilibrium is to shade beliefs away from the outcome for which there is an
outside incentive.

Suppose the signals are 50-50 binary and highly correlated (e.g. there is a
single coin flip and the agents all see the result), and the mechanism gives a
constant reward for consistency (agreeing with a random other agent), which is
typical in this special case. All agents reporting truthfully and all agents
reporting untruthfully are both equilibria. If one agent always reports
truthfully, the remaining agents still have the two equilibria but now honesty
is Pareto optimal. If a set of agents have an outside incentive to persuade the
mechanism of the false outcome, whether honesty is Pareto optimal depends on
the parameters. If the proportion of incentivized agents is $1 - \epsilon$,
they will lie. Suppose instead the proportion is $1/2 + \epsilon$, and the rest
are truth-tellers. If each incentivized agent gets a utility increase of $c$ if
they all lie, the consistency reward must be greater than $2c$ for the
incentivized agents to choose truth.

Applications:

* Product reviews.
  * Some ground truth may be available: Amazon could have a per-product
    prediction market on what percentage of people will return a product. Uber
    Eats could have markets for whether people will order again from the same
    restaurant. There are the usual legal hurdles; maybe top predictors could
    get gift cards? Alternatively, just show the return/reorder rate. Since
    these are percentages of all orders rather than all reviews, it would cost
    more to change them with fake orders (assuming fake orders have a cost).
    Some markets do this: <https://news.ycombinator.com/item?id=34536344>.
  * Reputation is not useful if agents are anonymous.
* Prediction market outcome determination.
  * Freeman, Lahaie, and Pennock [@freeman2017crowdsourced] analyze crowdsourced outcome determination, but
    there are untruthful equilibria, and behavior in the prediction market is
    just assumed to be truthful. Also, a trading fee is required, which reduces
    market efficiency.
  * Often ground truth is easily available, and the question is just whether
    the market reports it truthfully. Reputation may be the best option.
* Blockchain oracles.
  * The crypto world has high standards for mechanisms, and this is a
    difficulty.
* Is the procedure recommended by the dentist really necessary?
  * There is some literature on reputation [@hubbard2002consumers], but
    reputation needs ground truth.
  * Contract: with probability $p$, I'll spend the time to find the answer
    myself and publish my findings.
    * In the worst-case scenario this would require becoming a dentist.
  * Ask the dentist to "prove" the claim, e.g. by referencing a dentistry
    textbook.
  * Dentists could publish their patients' overall rate of procedures and/or
    dental health outcomes in some verifiable way. We would also need info on
    other factors like patient age.

# References {.unnumbered .unlisted}

::: {#refs}
:::
