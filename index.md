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

When we speak of "preferences" and "beliefs" we refer
not to mental phenomena necessarily but
to
information encoded by observable decisions with consequences.
Our use of "preferences" means "revealed preferences".
The phrase "revealed beliefs" is not standard but could describe our
use of "beliefs".
For example, these definitions are compatible with decision utilitarianism
but not classical utilitarianism which is concerned with hedonic brain states.

* von Neumann utility theory [@vonneumann1944theory]: objective probabilities $\to$ utility function
* [@savage1954foundations]: preferences, continuity in events $\to$ atomless subjective probability measure, utility function
* [@anscombe1963definition]: objective probabilities, preferences $\to$ finite subjective probability measure, utility function
* [@arrow1971essays]: objective probabilities, preferences, monotone continuity $\to$ subjective probability measure, utility function
* [@teller1973conditionalization]: bet choices $\to$ finite subjective probability measure with Bayesian updating
* [@epstein1993dynamically]: preferences $\to$ finite subjective probability with Bayesian updating, utility function
* Fundamental theorem of asset pricing [@harrison1979martingales]: market prices $\to$ martingale measure
* GARP (Afriat's theorem) [@afriat1967construction]: market choices $\to$ continuous, concave, and monotonically increasing utility function



"Consequentialism" means that a decision tree node's ranking depends only on its continuation consequences, not on foregone branches or past outcomes [@hammond1988consequentialist]. This is distinct from agreement between earlier and later rankings. Neither property alone supplies an expected-utility representation.

### Dynamic Consistency Within Stationary Additive SEU {#sec-consequentialism-discounting}

#### Environment and Assumptions {#sec-dt-definitions}

Let $\Omega$ be a nonempty finite state space, with dates $0,\ldots,T$, where $T\ge2$. Let $\mathcal P_t$ be successively refining partitions, with $\mathcal P_0=\{\Omega\}$ and $\mathcal P_T$ the singleton partition. A node is $(t,E)$ with $E\in\mathcal P_t$. The act domain consists of all adapted streams $h=(h_0,\ldots,h_T)$ of bundles in a nonempty open convex set $X\subseteq\mathbb R^K_{++}$. Thus terminal bundles may vary independently across states. Write $e_1$ for the numeraire coordinate vector.

Assume, rather than derive, a stationary time-additive subjective expected utility (SEU) representation at every node:

$$V_{t,E}(h)=\sum_{\omega\in E}q_{t,E}(\omega)
\sum_{\tau=t}^T d(\tau-t)u(h_\tau(\omega)).$$

Here each $q_{t,E}$ is a probability distribution with strictly positive mass on every state in $E$; the common lag weights satisfy $d(0)=1$ and $d(j)>0$ for $0\le j\le T$; and the common utility $u:X\to\mathbb R$ is continuous and strictly increasing in the numeraire, holding other coordinates fixed. The common $u$, additive SEU form, and node-independent lag weights are substantive assumptions, not consequences of consistency or ordinal separability. Weak coordinate monotonicity of $u$ is an additional assumption only for the dominance claim below.

*Dynamic consistency* means that for every ancestor $(s,A)$ and descendant $(t,E)$, with $s<t$ and $E\subseteq A$, and every pair $f,g$ identical before $t$ and outside $E$,

$$f\succsim_{s,A}g\quad\Longleftrightarrow\quad f\succsim_{t,E}g.$$

This includes preservation of indifference, since the equivalence also applies with $f,g$ interchanged. Equality $E=A$ is allowed when no new information arrives.

::: {#prp-exponential-discounting}
###### Bayesian Updating and Exponential Weights

Under the stated representation assumptions, dynamic consistency holds if and only if, writing $P=q_{0,\Omega}$, every node satisfies

$$q_{t,E}(\omega)=\frac{P(\omega)}{P(E)}\quad(\omega\in E),
\qquad d(j)=\delta^j\quad(0\le j\le T)$$

for some $\delta>0$. Dynamic consistency does not require $\delta\le1$. That bound follows if one additionally assumes impatience: for any bundles $x,y$ with $u(x)>u(y)$, the deterministic stream $(x,y)$ is weakly preferred to $(y,x)$ at two consecutive dates, all other bundles held fixed.
:::

::: {.proof}
Fix an interior bundle $x$. For sufficiently small $a>0$, $x+re_1\in X$ for $|r|\le a$. Continuity and strict numeraire monotonicity imply that the values $u(x+re_1)-u(x)$ contain an open interval about zero. Consequently, any sufficiently small vector of state-contingent terminal utility increments is realizable, as are sufficiently small utility increments at any two dates. No linearity of $u$ in money is needed.

First suppose consistency holds. Fix a node $(t,E)$ with $t>0$. Compare the constant act $x$ with an act whose only utility increments are $z_\omega$ at date $T$, for $\omega\in E$. Set $p_\omega=P(\omega)/P(E)$ and $q_\omega=q_{t,E}(\omega)$. The root and node value differences are respectively

$$d(T)P(E)\sum_{\omega\in E}p_\omega z_\omega,
\qquad d(T-t)\sum_{\omega\in E}q_\omega z_\omega.$$

All prefactors are positive. For each $\eta\in E$, choose $z_\omega=c(\mathbf 1_{\{\omega=\eta\}}-q_\eta)$ with $c>0$ small enough for feasibility. The node is indifferent, so consistency makes the root indifferent. Hence $c(p_\eta-q_\eta)=0$, proving $q=p$. This also covers singleton nodes; the root assertion is immediate.

Next fix any $E\in\mathcal P_1$. For each $k=2,\ldots,T$, compare the constant act with a perturbation supported on $E$ and constant across its states: utility increment $-d(k-1)b$ at date $1$ and $b$ at date $k$, where $b\ne0$ is sufficiently small. These are deterministic two-date continuation perturbations on $E$ and are adapted because $E$ is known at date $1$. Their value difference at $(1,E)$ is zero. Root indifference gives

$$P(E)\bigl[-d(1)d(k-1)+d(k)\bigr]b=0.$$

Thus $d(k)=d(1)d(k-1)$. With $\delta=d(1)>0$ and $d(0)=1$, induction gives $d(j)=\delta^j$ throughout the horizon.

Conversely, under Bayes' rule and these exponential weights, any pair differing only on $E$ from date $t$ onward satisfies

$$V_{s,A}(f)-V_{s,A}(g)
=P(E\mid A)\delta^{t-s}\bigl[V_{t,E}(f)-V_{t,E}(g)\bigr].$$

The multiplier is strictly positive, proving the required equivalence. Finally, the value difference between the two streams in the impatience assumption is a positive factor times $(1-\delta)[u(x)-u(y)]$, so impatience is equivalent to $\delta\le1$ in this class.
:::

The restriction $T\ge2$ makes the recurrence substantive. With $T=1$, any positive $d(1)$ already has the exponential form on the available lags; with $T=0$, no discount factor is identified. Nothing here determines weights beyond $T$. Full support makes every node reachable, and terminal contingent acts identify each node's normalized belief vector for the common $u$: the same zero-increment test distinguishes any two candidate vectors, including at the root. This conclusion concerns only the nodes of the specified tree. Without full support, consistency at the root cannot identify beliefs at null nodes; without sufficiently rich terminal acts, it need not identify state probabilities. No separate utility-representation or utility-uniqueness theorem is asserted.

#### Money Pumps and Local Acceptance {#sec-dt-lemmas}

::: {#lem-dynamic-consistency}
###### A Strict Reversal Permits a Naive Money Pump

Suppose $f,g$ coincide before $t$ and outside $E$, where $(t,E)$ descends from $(s,A)$, and

$$f\succ_{s,A}g,\qquad g\succ_{t,E}f.$$

An agent who accepts each strictly preferred replacement relative to current holdings, without anticipating later replacements, can be induced by two trades to finish with $g$ minus a strictly positive terminal numeraire fee on $E$, and unchanged holdings elsewhere.
:::

::: {.proof}
Let $D_E$ be the stream that is zero except for $e_1$ at date $T$ on $E$. Fees are actual consumption deductions: $h-\varepsilon D_E$ has terminal bundle $h_T(\omega)-\varepsilon e_1$ on $E$. Finiteness and openness of $X$ ensure feasibility for all sufficiently small $\varepsilon>0$. By continuity and the two strict inequalities, choose one such $\varepsilon$ with

$$f-\varepsilon D_E\succ_{s,A}g,
\qquad g-2\varepsilon D_E\succ_{t,E}f-\varepsilon D_E.$$

Starting from $g$, offer $f-\varepsilon D_E$ at $(s,A)$. If $E$ is reached, replace this holding with $g-2\varepsilon D_E$ at $(t,E)$. Both trades are strictly accepted under the stated local rule. The first fee persists in both sides of the second comparison; continuity, not an assumption that it disappears, preserves the reversal. Off $E$, $f=g$ and no fee is due. On $E$, the acts agree before $t$, and the second trade restores the remaining $g$ except for the two terminal fees. Thus the final allocation is exactly $g-2\varepsilon D_E$, with a loss on the positive-probability event $E$.
:::

This proves exploitability of a strict reversal under naive local acceptance, not an equivalence between every weak-ranking inconsistency and a money pump. It makes no claim that a sophisticated agent who anticipates the complete trading policy would accept the first offer. Paying for commitment is not by itself a net-loss cycle.

::: {#prp-no-net-loss-pump}
###### Dynamic Consistency Excludes Finite Net-Loss Pumps

Assume the consistent representation of @prp-exponential-discounting and, additionally, weak coordinate monotonicity: $x\le y$ in $X$ implies $u(x)\le u(y)$. A trade at $(t,E)$ replaces the current feasible act only on $E$ and at dates $\tau\ge t$, incorporating all fees and liabilities in the replacement bundles. It is locally accepted only if its node value is weakly higher. No finite contingent policy of such trades can yield a final act coordinate-wise below the initial act in every date and state, with a strict numeraire loss in at least one date and state. In particular, returning to the initial consumption stream except for nonnegative numeraire fees, positive somewhere, is impossible.
:::

::: {.proof}
Evaluate every complete act at the same fixed date using

$$W(h)=\sum_{\omega\in\Omega}P(\omega)\sum_{\tau=0}^T\delta^\tau u(h_\tau(\omega)).$$

Enumerate the finitely many trade occurrences in the contingent policy in chronological order, keeping the stipulated order for multiple trades at one node. Define $h^i$ as the complete act after the first $i$ event-contingent replacements, retaining current holdings on branches not affected by a replacement. A replacement at $(t,E)$ changes no past or off-event bundles, so

$$W(h^{i+1})-W(h^i)
=P(E)\delta^t\bigl[V_{t,E}(h^{i+1})-V_{t,E}(h^i)\bigr]\ge0.$$

This construction evaluates each accepted offer relative to holdings at that occurrence; later replacements are handled at their own occurrences. Summing gives $W(h^N)\ge W(h^0)$. It does not assert that conditional continuation values are nondecreasing along realized paths as information arrives or time passes.

If $h^N\le h^0$ coordinate-wise, weak monotonicity gives no utility increase anywhere. At a bundle pair $y=h^N_\tau(\omega)$, $x=h^0_\tau(\omega)$ with $y_1<x_1$, openness permits a small $\eta>0$ such that $y+\eta e_1\in X$ and $y+\eta e_1\le x$. Then $u(y)<u(y+\eta e_1)\le u(x)$. Full support and positive weights therefore give $W(h^N)<W(h^0)$, a contradiction. For pure numeraire fees, strict numeraire monotonicity alone suffices.
:::

### What Is the Optimal Practical Prior? {#sec-optimal-prior}

Solomonoff induction provides an idealized benchmark for universal sequence prediction [@solomonoff1964formal1; @solomonoff1964formal2]. Under the computational and predictive criteria developed here, resource-bounded Bayesian program mixtures provide one baseline, not a proved optimum.

We first examine pointwise and average approximation, then compare computational cost with sequential predictive loss. The aim is a criterion that rejects static baselines, respects simple environments, and charges for computation.

All binary logarithms are base 2; $\ln$ denotes the natural logarithm. Fix an optimal prefix-free universal machine $U_d$. Let $K(x)$ be prefix Kolmogorov complexity and let $\mathbf m_d$ be the discrete universal a priori semimeasure. The coding theorem gives

$$\mathbf m_d(x)=\Theta(2^{-K(x)}),\qquad \sum_x2^{-K(x)}\le1.$$

These definitions and the coding theorem are standard in algorithmic information theory [@livitanyi2019kolmogorov].

This discrete semimeasure should not be confused with the sequential Solomonoff semimeasure $\mathbf M$. For a compatible optimal monotone machine $U_M$,

$$\mathbf M(x)=\sum_{p:\,p\text{ is minimal and }U_M(p)\text{ outputs a string beginning with }x}2^{-|p|}.$$

Normalized conditionals $\overline{\mathbf M}(a\mid x)=\mathbf M(xa)/(\mathbf M(x0)+\mathbf M(x1))$ predict the next symbol, with joint probabilities defined by

$$\overline{\mathbf M}(x_{1:N})=
\prod_{t=1}^N\overline{\mathbf M}(x_t\mid x_{\lt t}).$$

The pointwise analyses below concern $\mathbf m_d$ and $K$; the later behavioral analysis concerns the predictions of $\overline{\mathbf M}$. All hidden constants may depend on the fixed machines and fixed algorithms, but not on $n$ or $x$. The precise computability level of several variants of Solomonoff induction is classified by Leike and Hutter [@leike2015computability].

#### Pointwise and Average Approximation {#sec-pointwise-approximation}

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

Worst-case pointwise approximation may be too demanding, so the next natural step is to average the error. This immediately raises a choice: average under which distribution?

Let $X_n$ be uniform on $\{0,1\}^n$. Approximating $K(x)$ by $|x|$ gives

$$𝔼_{X_n}[|n-K(X_n)|]=O(K(n))=O(\log n).$$

Indeed, $K(x)\le n+K(n)+O(1)$, while the counting bound $\Pr[K(X_n)<n-d]\le2^{-d+O(1)}$ makes the expected deficiency below $n$ constant. Thus returning the length has small uniform-average additive error, even though its worst-case error is linear.

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

A different relaxation bounds the computation defining complexity. Let $t$ be a computable time bound, large enough to permit direct printing of an $n$-bit string. Define

$$K^t(x)=\min\{|p|:U_d(p)=x\text{ within }t(|x|)\text{ steps}\}.$$

Time-bounded Kolmogorov complexity is a standard resource-bounded variant [@livitanyi2019kolmogorov]. Its connection to universal search goes back to Levin [@levin1973universal].

For $|x|=n$, $K(x)\le K^t(x)\le n+O(\log n)$. If $t$ is computable, exhaustive bounded simulation computes $K^t$ exactly, but not necessarily efficiently. Thus this replacement moves the problem from computability to computational cost without itself ranking efficient priors.

Schmidhuber instead incorporated runtime into a speed prior [@schmidhuber2002speed]. A later variant has prediction guarantees for polynomial-time estimable measures but requires doubly exponential time in general and exponential time on polynomial-time sequences. Schmidhuber's original has better complexity bounds, but its analogous stochastic guarantee remains open [@filan2016loss]. Neither result supplies a polynomial-time replacement for Solomonoff prediction.

One can also evaluate downstream decision error. For a decidable language $L$ and deterministic heuristic $A$, let $\varepsilon_A(n)$ be its $\mu_n$-probability of error. This probability is either zero or bounded below by a positive constant: if an error exists, the first one is computable from $n$ and therefore has constant $\mu_n$-mass.

Thus $\varepsilon_A(n)=o(1)$ implies eventual worst-case correctness, not merely good average performance. Decision error is operational, but it is problem-specific, and under universal averaging it is again too close to a worst-case criterion to give a general ranking of priors.

#### Resource-Bounded Predictive Criteria {#sec-sequential-prediction}

These limitations motivate evaluating a prior by sequential predictive loss rather than pointwise agreement with universal weights. Predictive loss is not the uniquely correct approximation criterion.

For a computable measure $\mu$, universal dominance gives

$$\mathbf M(x_{1:N})\ge2^{-K(\mu)-O(1)}\mu(x_{1:N}).$$

Normalizing the one-step conditionals cannot reduce the probability assigned to the observed symbol relative to the raw semimeasure conditionals. Consequently, Solomonoff prediction has cumulative expected log-loss regret

$$D_{KL}(\mu(x_{1:N})\,\|\,\overline{\mathbf M}(x_{1:N}))
\le (K(\mu)+O(1))\ln2.$$

The chain rule and Pinsker's inequality give the corresponding cumulative squared-error bound, smaller by a factor of two.

Solomonoff introduced universal sequence prediction [@solomonoff1964formal1; @solomonoff1964formal2]. Universal dominance and the modern cumulative-loss treatment, including normalization and extensions to general losses, are developed by Hutter [@hutter2003optimality]; see also [@aixi] for a systematic treatment and discussion of computational limitations.

Log loss is useful because mixture dominance bounds it directly and it decomposes over time; squared error is a consequence. This criterion rejects static predictors without requiring pointwise agreement with $\mathbf M$. We now examine the optimization problem it induces under computational limits.

Let $T: \mathbb N \to \mathbb N$ be a time-constructible, monotone time bound per step, and fix a universal interpreter $V$ with prefix-free program domain $P_V$. Assume $T(t)\ge c_V$, where $c_V$ is enough time for a fixed $V$-program to output a constant probability.

Define the benchmark class $𝓜_T$ of $T$-time computable measures by

$$𝓜_T = \left\{ \mu_p : p \in P_V, \; \forall t \ge 1, \; \forall x_{\lt t} \in \{0,1\}^{t-1}, \; \text{Time}\big(V(p, x_{\lt t})\big) \le T(t) \right\},$$

where each $p$ computes rational conditional probabilities $\mu_p(x_t=1\mid x_{\lt t})$.

Define the resource-bounded description complexity of an environment by

$$K_T(\mu)=\min\left\{|p|:p\in P_V,\ \mu_p=\mu,\ \forall t\ge1,\ \forall x_{\lt t}\in\{0,1\}^{t-1},\ \text{Time}(V(p,x_{\lt t}))\le T(t)\right\}.$$

The runtime constraint applies to the candidate program itself, not merely to the measure it computes. A shorter but slower program for the same measure does not qualify. For $\mu\in𝓜_T$, the minimum exists because at least one qualifying program exists.

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

Let $C_A(t)$ be the worst-case time used by $A$ at step $t$. We evaluate $A$ by the pair $(C_A,R_A)$. It dominates $B$ if $C_A=O(C_B)$ and $R_A(k)\le R_B(k)$ for all sufficiently large $k$. Dominance is strict if $C_A=o(C_B)$ or $R_A(k)<R_B(k)$ infinitely often. These comparisons define the candidate computation-loss Pareto frontier; they do not establish that undominated predictors exist. They ignore differences confined to finitely many complexity indices, but not necessarily finite hardcoded prediction improvements: changing predictions at finitely many rounds can permanently change cumulative loss, including its worst-case profile at arbitrarily large complexity indices.

Related Pareto and fixed-resource optimality results appear in [@hutter2003optimality; @aixi], but the exact profile $R_A$ and pair $(C_A,R_A)$ are the synthesis used here.

Because polynomial time includes every fixed degree $O(t^d)$, increasing the degree may indefinitely trade more computation for less loss. A frontier may therefore exist without a single optimal polynomial-time prior.

A predictor is viable if $R_A(k)<\infty$ for every fixed $k$. This excludes static predictors, while polynomial $C_A$ excludes the incomputable ideal and unconstrained exhaustive substitutes.

For example, the static predictor $A(1\mid x_{\lt t})=1/2$ incurs log-loss regret $\ln2$ and squared error $1/4$ at every step against the constant-zero environment in $𝓜_T$, so both cumulative losses are infinite and $A$ is not viable.

#### Delayed Mixture Construction and Guarantees {#sec-delayed-mixture}

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

::: {#thm-ab-computable}
###### Computational Cost

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

::: {#thm-ab-guarantee}
###### Predictive Guarantee

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

#### Bounds and Unresolved Optimality {#sec-lower-bound-tradeoff}

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

Under the stated richness assumption, the unrestricted minimax profile is $\Theta(k)$. The delayed mixtures provide polynomial-time baselines when $b$ and $T$ are polynomial, but their exponential upper bounds in $k$ do not establish a computational lower bound or Pareto optimality. The results here therefore leave the attainable computation-loss frontier unresolved; they do not select a uniquely optimal practical prior.

### Causality {#sec-causality}

::: {#def-probability-space}
###### Probability Space and Exogenous Variables

Let $(\Omega, \Sigma, \mathbb{P})$ be a complete probability space.

An *exogenous variable* is a measurable function $U_i: (\Omega, \Sigma) \to (\mathcal{X}_{U_i}, \mathcal{B}_{U_i})$, where $(\mathcal{X}_{U_i}, \mathcal{B}_{U_i})$ is a standard Borel space. The collection $\mathcal{U} = \{U_1, U_2, \dots, U_m\}$ denotes the complete set of exogenous variables, representing background conditions, physical noise, or external disturbances determined entirely outside the modeled causal system.

Writing $U = (U_1, \ldots, U_m)$, the joint distribution of the exogenous variables is the push-forward measure $P_{\mathcal{U}} = \mathbb{P} \circ U^{-1}$ defined on the product measurable space $(\mathcal{X}_{\mathcal{U}}, \mathcal{B}_{\mathcal{U}}) = \prod_{i=1}^m (\mathcal{X}_{U_i}, \mathcal{B}_{U_i})$. The exogenous variables need not be independent.
:::

::: {#def-endogenous-variables}
###### Endogenous Variables and Structural Functions

Let $\mathcal{V} = \{V_1, V_2, \dots, V_n\}$ be a finite set of *endogenous variables*, where each $V_i$ takes values in a measurable space $(\mathcal{X}_{V_i}, \mathcal{B}_{V_i})$.

A *structural causal equation* for an endogenous variable $V_i$ is a measurable map:

$$f_i: \prod_{j \in \text{Pa}_i} \mathcal{X}_{V_j} \times \prod_{k \in I_i}\mathcal{X}_{U_k} \to \mathcal{X}_{V_i}$$

where $\text{Pa}_i \subseteq \{1,\ldots,n\}\setminus\{i\}$ indexes the *endogenous parents* (direct causes) of $V_i$, and $I_i \subseteq \{1,\ldots,m\}$ indexes its exogenous inputs. Write $V_{\text{Pa}_i} = (V_j)_{j\in\text{Pa}_i}$ and $U_{I_i} = (U_k)_{k\in I_i}$.
:::

::: {#def-scm}
###### Structural Causal Model

A *Structural Causal Model (SCM)* is a 4-tuple:

$$\mathcal{M} = \langle \mathcal{U}, \mathcal{V}, \mathcal{F}, P_{\mathcal{U}} \rangle$$

where:

1. $\mathcal{U}$ is the set of exogenous variables with joint measure $P_{\mathcal{U}}$ on $(\mathcal{X}_{\mathcal{U}}, \mathcal{B}_{\mathcal{U}})$.
2. $\mathcal{V}$ is the set of endogenous variables with product space $(\mathcal{X}_{\mathcal{V}}, \mathcal{B}_{\mathcal{V}}) = \prod_{i=1}^n (\mathcal{X}_{V_i}, \mathcal{B}_{V_i})$.
3. $\mathcal{F} = \{f_1, f_2, \dots, f_n\}$ is the collection of structural causal equations.
4. The directed graph $G = (\mathcal{V}, \mathcal{E})$, defined by directed edges $(V_j, V_i) \in \mathcal{E} \iff j \in \text{Pa}_i$, is a *Directed Acyclic Graph (DAG)*.

Because $G$ is acyclic, there exists a topological ordering $\pi$ of $\mathcal{V}$. By recursive substitution along $\pi$, the system of equations $\mathcal{F}$ defines a unique, measurable mapping $g: \mathcal{X}_{\mathcal{U}} \to \mathcal{X}_{\mathcal{V}}$, such that each endogenous variable is expressed as a deterministic function of the exogenous vector:

$$V_i = g_i(U)$$
:::

The following hierarchy distinguishes associational, interventional, and counterfactual queries [@pearl2019seven, fig. 1]. The probability-mass formulas below are for finite-valued variables.

* Level 1: standard Bayesian networks (associational / observational)
  * Core mechanics: represents the joint distribution via factorization of conditional probabilities over a DAG: $P(v_1, \dots, v_n) = \prod_{i=1}^n P(v_i \mid v_{\text{Pa}_i})$.
  * Primary query: passive observation and conditioning—"What does observing $X = x$ tell us about $Y$?" ($P(Y \mid X = x)$).
  * Scope and limits: encodes conditional independencies via $d$-separation, but directed edges do not necessarily denote physical causality. Markov-equivalent DAGs represent the same family of distributions, not identical distributions for arbitrary parameter choices.
* Level 2: causal Bayesian networks (interventional / action)
  * Core mechanics: under independent node disturbances, or appropriate causal sufficiency of the observed DAG, autonomous causal kernels $K_i$ give the truncated product for $X \subseteq \mathcal{V}$: $P(v \mid do(X = x)) = \prod_{i: V_i \notin X} K_i(v_i \mid v_{\text{Pa}_i})\prod_{j: V_j\in X}\mathbb{I}(v_j=x_j)$. Observationally, $P(v)=\prod_i K_i(v_i\mid v_{\text{Pa}_i})$; the kernels agree with observational conditionals on positive-probability parent configurations. Kernels on unobserved configurations require further specification to evaluate interventions reaching them.
  * Primary query: active manipulation—"What happens to $Y$ if we force $X = x$?" ($P(Y \mid do(X = x))$).
  * Scope and limits: severs incoming arrows to the target variable, distinguishing physical causation from spurious association. Cannot answer unit-level retrospective or counterfactual questions.
* Level 3: structural causal models (counterfactual / retrospective)
  * Core mechanics: models the system using deterministic assignment functions $V_i = f_i(V_{\text{Pa}_i}, U_{I_i})$, where uncertainty originates from the joint distribution over exogenous background variables $P_{\mathcal{U}}$.
  * Primary query: retrospection and individual attribution—"Given that $X = x$ and $Y = y$ occurred, what would $Y$ have been if $X$ had been set to $x'$ instead?" ($P(Y_{x'} \mid X = x, Y = y)$).
  * Scope and limits: uses the same background state $U = u$ across alternative scenarios, supplying cross-intervention structure not specified by causal kernels alone. It supports observational, interventional, and counterfactual queries, but their identification from data requires additional assumptions. With correlated or shared node disturbances, the endogenous DAG alone need not give an observational factorization or a truncated-product formula; interventions remain defined by structural recursion and the joint exogenous law.

In a Structural Causal Model (SCM), *proximate causes* correspond to the direct parents ($\text{Pa}(Y)$) immediately adjacent to an outcome, while *distal causes* correspond to upstream ancestors ($\text{Anc}(Y) \setminus \text{Pa}(Y)$) separated from the outcome by one or more intermediate mechanisms (mediators).

::: {#def-intervention}
###### Intervention and Potential Response Variables

Let $X \subseteq \mathcal{V}$ and $x \in \mathcal{X}_X = \prod_{V_j \in X} \mathcal{X}_{V_j}$.

An *atomic intervention* $do(X = x)$ forms a modified submodel $\mathcal{M}_x = \langle \mathcal{U}, \mathcal{V}, \mathcal{F}_x, P_{\mathcal{U}} \rangle$, where the equation set $\mathcal{F}_x$ is obtained by replacing $f_j$ for each $V_j \in X$ with the constant map:

$$V_j \equiv x_j$$

while retaining the original functions $f_k$ for all $V_k \notin X$.

For any variable $Y \in \mathcal{V}$ and any realization $u \in \mathcal{X}_{\mathcal{U}}$, the *potential response* $Y_x(u)$ is the unique solution for $Y$ in $\mathcal{M}_x$ under input $u$.

Because $g_{Y; x}: \mathcal{X}_{\mathcal{U}} \to \mathcal{X}_Y$ is measurable, $Y_x$ is a well-defined random variable on $(\Omega, \Sigma, \mathbb{P})$, with induced probability distribution:

$$P_{\mathcal{M}}(Y_x \in B) = P_{\mathcal{U}}\big(\{u \in \mathcal{X}_{\mathcal{U}} \mid Y_x(u) \in B\}\big), \quad \forall B \in \mathcal{B}_Y$$
:::

::: {#def-supposition}
###### Causal Supposition Operator

Let $\mathcal{A} = \{do(X = x) \mid X \subseteq \mathcal{V}, x \in \mathcal{X}_X\}$ be the set of atomic causal acts, and let $\mathcal{S}$ denote the set of measurable state propositions over $\mathcal{V}$.

The *causal supposition operator* is a map $P(\cdot \parallel \cdot): \mathcal{S} \times \mathcal{A} \to [0, 1]$ defined such that for any event $E \in \mathcal{B}_Y$ and action $A = do(X = x)$:

$$P(Y \in E \parallel A) := P_{\mathcal{M}}(Y_x \in E)$$

This formalizes subjunctive belief-updating ("the probability that $Y \in E$ would occur if $X$ were set to $x$ by intervention") without reference to indicative conditional probability $P(Y \in E \mid X = x)$.
:::

::: {#def-preference-acts}
###### Consequence Lotteries and Randomized Causal Acts

Fix a finite consequence set $\mathcal{C}$ with at least two elements and the discrete $\sigma$-algebra. For every $A = do(X=x) \in \mathcal{A}$, fix a measurable consequence map $h_A:\mathcal{X}_{\mathcal{V}}\to\mathcal{C}$, including any intervention costs in the consequence if relevant. The given SCM induces the lottery

$$\mu_A(c) = \int_{\mathcal{X}_{\mathcal{U}}}\mathbb{I}\{h_A(g_x(z))=c\}\,dP_{\mathcal{U}}(z), \qquad c\in\mathcal{C}.$$

Let $\Delta(\mathcal{C})$ be the full simplex of probability distributions on $\mathcal{C}$, with pointwise mixtures $\alpha L+(1-\alpha)M$, and let $\delta_c$ denote the lottery concentrated at $c$. Preferences $\succsim$ are defined on this full simplex; $\sim$ and $\succ$ denote indifference and strict preference.

A randomized intervention is a finite-support probability distribution $r$ on $\mathcal{A}$: an external randomizer independent of $U$ selects $A$ with probability $r(A)$, then performs it. Its consequence lottery is $\mu_r=\sum_A r(A)\mu_A$. Thus randomizing between $r$ and $s$ with probability $\alpha$ induces $\alpha\mu_r+(1-\alpha)\mu_s$. Deterministic interventions are included as point masses. *Reduction to the induced law* is the additional requirement that intervention preferences $\succsim_{\mathcal{A}}$ satisfy

$$r\succsim_{\mathcal{A}}s \iff \mu_r\succsim\mu_s.$$

This requirement rules out preferences for the randomization procedure or causal route beyond what is recorded in the consequence.
:::

::: {#prp-causal-representation}
###### Finite-Lottery Causal Expected Utility

Fix the acyclic SCM and consequence maps above; they supply the causal outcome laws, rather than being inferred from preferences. Suppose preferences on the full domain $\Delta(\mathcal{C})$ satisfy the following finite-lottery axioms [@vonneumann1944theory]:

1. Weak order: $\succsim$ is complete and transitive.
2. Mixture continuity: for all $L,M,N\in\Delta(\mathcal{C})$, both $\{\alpha\in[0,1]:\alpha L+(1-\alpha)M\succsim N\}$ and $\{\alpha\in[0,1]:N\succsim\alpha L+(1-\alpha)M\}$ are closed.
3. Independence: for all $L,M,N\in\Delta(\mathcal{C})$ and $\alpha\in(0,1)$,
   $$L\succsim M \iff \alpha L+(1-\alpha)N\succsim\alpha M+(1-\alpha)N.$$
4. Nondegeneracy: there are best and worst consequences $b,w\in\mathcal{C}$ with $\delta_b\succsim\delta_c\succsim\delta_w$ for every $c\in\mathcal{C}$ and $\delta_b\succ\delta_w$.

Then there is a utility $u:\mathcal{C}\to\mathbb{R}$, unique up to positive affine transformation among utilities representing these full-domain lottery preferences, such that

$$L\succsim M \iff \sum_{c\in\mathcal{C}}L(c)u(c)\ge\sum_{c\in\mathcal{C}}M(c)u(c).$$

If intervention preferences satisfy reduction to the induced law, they are represented by

$$U_{\mathrm{CDT}}(r)=\sum_A r(A)\sum_{c\in\mathcal{C}}\mu_A(c)u(c).$$

In particular, for $A=do(X=x)$,

$$U_{\mathrm{CDT}}(A)=\int_{\mathcal{X}_{\mathcal{U}}}u(h_A(g_x(z)))\,dP_{\mathcal{U}}(z).$$
:::

::: {.proof}
The finite-lottery expected-utility theorem gives the representation and positive-affine uniqueness [@mascolell1995microeconomic, propositions 6.B.3 and 6.B.2]. The intervened SCM supplies each $\mu_A$ by the topological recursion in @def-intervention. Independence of the intervention randomizer and $U$ gives $\mu_r=\sum_A r(A)\mu_A$ by total probability. Thus

$$\sum_c\mu_r(c)u(c)=\sum_A r(A)\sum_c\mu_A(c)u(c).$$

Reduction to the induced law transfers this representation to intervention preferences. Substituting the push-forward definition of $\mu_A$ gives the displayed integral for a deterministic intervention.
:::

The full consequence-lottery domain is a substantive assumption: it may be larger than the convex hull of laws attainable by feasible interventions. The affine-uniqueness conclusion uses preferences on that full domain and does not follow merely from preferences on restricted interventions. For example, if all feasible interventions induce the same law, their mutual indifference places no restriction on consequence utilities. Likewise, the SCM, its exogenous distribution, and its causal beliefs are supplied, not elicited or identified by this theorem. This is a conditional expected-utility result, not a joint belief-and-utility representation theorem; the causal interpretation concerns the supplied laws used to evaluate actions [@joyce1999foundations].

## Statistics {#sec-statistics}

### Bayesian Classification with Prior Information on Class Proportions {#sec-bayesian-classification}

The usual Bayesian regression update tacitly assumes $p(\theta\mid x)=p(\theta)$: observing inputs $x$ alone does not inform the regression parameters $\theta$. This is not automatic. For observed labels $y$, Bayes's rule gives

$$p(\theta\mid x,y)\propto p(y\mid x,\theta)p(\theta\mid x),$$

and replacing $p(\theta\mid x)$ by $p(\theta)$ requires that assumption [@gelman2013bayesian, sec. 14.1]. For inputs sampled from a population density $g$, it holds if $g$ is known and does not depend on $\theta$, or if unknown $g$ and $\theta$ are independent a priori. In either case, the input likelihood, integrated over $g$ when necessary, does not depend on $\theta$ and cancels.

Prior information on class proportions can break this independence. For a classifier $p(Y=k\mid x,\theta)$ with $Y\in\{1,\ldots,K\}$, the population class proportions are

$$\pi_k=\int p(Y=k\mid x,\theta)g(x)\,dx.$$

If $g$ is known, a compatible prior on $\pi$ can be encoded through a prior on $\theta$ without invalidating the usual update. If $g$ is unknown, information about $\pi$ constrains $(\theta,g)$ jointly. When incorporating it makes them dependent, learning about $g$ from observed inputs can also update $\theta$, so the input model cannot simply be ignored. Not every prior on $\pi$ requires such dependence.

A direct approach is to model class-wise input densities $f_k(x\mid\phi_k)=p(x\mid Y=k,\phi_k)$, with parameters $\phi_k$, and specify the class probabilities $\pi$ explicitly, fixing them if known or assigning them a prior if uncertain. Bayes's rule gives

$$P(Y=k\mid X=x,\pi,\phi)=
\frac{\pi_k f_k(x\mid\phi_k)}
{\sum_{j=1}^K\pi_j f_j(x\mid\phi_j)},$$

where $\phi=(\phi_1,\ldots,\phi_K)$ and the denominator is positive. This incorporates information about class probabilities directly, without translating it into a prior on regression coefficients. For prediction, uncertain parameters are integrated out under their posterior given the observed data and the new input.

For a general construction of informative priors on such functionals of a joint distribution, see *marginally specified priors* [@kessler2015marginally, secs. 2 and 4]. This is not a ready-made logistic-regression procedure; exactly known proportions require separate treatment as constraints.

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

The Robust Bayesian Truth Serum (RBTS) elicits binary information with a strict truthful equilibrium under its common-prior assumptions for populations of at least three agents [@witkowski2012robust]. This does not establish robustness to arbitrary outside incentives. A field experiment found that Bayesian Truth Serum (BTS) payments improved reporting accuracy and reduced favoritism toward family members [@rigol2016paying]. That study used BTS, not RBTS, for payments; its RBTS analysis applied the mechanism to the collected reports afterward.

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
