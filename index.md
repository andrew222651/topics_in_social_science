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

### Bayesianism and utility theory {#sec-bayesianism-utility}


::: {#def-bayesian-expected-utility}
###### Bayesian expected-utility maximization

Let $A$ and $\Omega$ be finite nonempty sets of actions and states, $p$ a subjective prior on $\Omega$, and $u(a,\omega)\in\mathbb R$ the utility of action $a$'s consequence in state $\omega$. After observing an event $E\subseteq\Omega$ with $p(E)=\sum_{\omega\in E}p(\omega)>0$, choose

$$a^*(E)\in\operatorname*{arg\,max}_{a\in A}
\sum_{\omega\in E}p(\omega\mid E)\,u(a,\omega).$$
:::

Roughly speaking, @def-bayesian-expected-utility would be justified
if given a rational agent, we can uniquely construct
$p$ and $u$ from observed actions.
The following list traces such results
developed over the 20th century
for various aspects of Bayesian expected-utility maximization
and related concepts.
A good overview is [@weisberg2011varieties].


- [@vonneumann1944theory]
  - *Assumptions*: Objective lotteries; complete, transitive, continuous preferences satisfying independence.
  - *Conclusions*: Utility function representing preferences by expected utility.
  - *Foundational in*: Game theory
- [@savage1954foundations]
  - *Assumptions*: Savage's preference axioms, including the sure-thing principle and small-event continuity.
  - *Conclusions*: Expected utility with atomless, finitely additive subjective probability.
- [@anscombe1963definition]
  - *Assumptions*: Objective lotteries and uncertain states; Anscombe-Aumann preference axioms.
  - *Conclusions*: Expected utility with subjective probability and state-independent utility.
- Afriat's theorem [@afriat1967construction]
  - *Assumptions*: Finite market choices at positive prices satisfying the generalized axiom of revealed preference (GARP).
  - *Conclusions*: Continuous, concave, strictly increasing utility rationalizing choices.
- [@teller1973conditionalization]
  - *Assumptions*: Probabilities used as buying and selling prices for bets; updating rule announced in advance; learning which cell of a partition contains the state.
  - *Conclusions*: Bayesian conditionalization.
  - *Foundational in*: Statistics
- Fundamental theorem of asset pricing [@harrison1979martingales]
  - *Assumptions*: Finite-state, finite-horizon frictionless market; strictly positive numeraire; unrestricted self-financing trades.
  - *Conclusions*: Existence of an equivalent martingale (conditioning) measure.
  - *Foundational in*: Finance

@def-bayesian-expected-utility operationalizes
_preferences_ (via $u$) and _beliefs_ (via $p$).
Note that these are behavioral definitions: 
we treat the agent as a black box. 
Also note that these are "revealed preferences", not
"stated preferences".


::: {#rem-utilitarianism}
This interpretation is compatible with decision utilitarianism for example, but differs from classical utilitarianism's concern with hedonic brain states.
:::



### Preferences over time {#sec-consequentialism-discounting}

Fields in economics like price index theory deal with consumption over time.
Rational beliefs evolve via conditioning, but what about preferences?

Let $\Omega$ be a nonempty finite set of states and let dates be $0,\ldots,T$, with $T\ge1$. Information at date $t$ is a partition $\mathcal P_t$ of $\Omega$: the agent learns which cell $E\in\mathcal P_t$ contains the actual state. Assume $\mathcal P_0=\{\Omega\}$ and that each partition refines the preceding one, so information is retained. A *node* $(t,E)$ specifies the date and information; $(0,\Omega)$ is the root.

A *plan* $h=(h_0,\ldots,h_T)$ specifies a bundle $h_t(\omega)\in\mathbb R^K_{++}$ at each date and state, where $K\ge1$ is the number of goods, the first is money, and $\mathbb R^K_{++}$ denotes strictly positive bundles. A plan is *adapted* if $h_t$ is constant on each cell of $\mathcal P_t$: consumption cannot depend on information not yet learned. Let $\mathcal H$ consist of all such plans.

At node $(t,E)$, the *continuation* of $h$ is $(h_\tau(\omega))_{\tau\ge t,\,\omega\in E}$. Assume preferences over these continuations are represented by a real-valued function $V_{t,E}$, continuous in the bundle coordinates and strictly increasing in money: any nonzero, nonnegative adapted cash addition to the continuation raises its value. Write $f\succsim_{t,E}g$ when $V_{t,E}(f)\ge V_{t,E}(g)$, and $f\succ_{t,E}g$ when the inequality is strict, evaluating only the continuations. No expected-utility or additive form is required.

::: {#def-dynamic-consistency}
###### Dynamic consistency

Preferences are *dynamically consistent* if, for every pair of nodes $(s,A)$ and $(t,E)$ with $s<t$ and $E\subseteq A$, and every $f,g\in\mathcal H$ identical before $t$ and outside $E$,

$$f\succsim_{s,A}g\quad\Longleftrightarrow\quad f\succsim_{t,E}g.$$

This preserves both strict rankings and indifference for choices confined to the later continuation; it does not forbid changing decisions when new information arrives.
:::

A *trade* at $(t,E)$ replaces the current plan only on $E$ from date $t$ onward, before that date's consumption. All fees are included, and every resulting complete plan must lie in $\mathcal H$. Under *naive local acceptance*, strictly preferred trades are accepted, strictly worse trades are rejected, and indifference may be resolved either way, without anticipating later offers.

A *pure-fee pump* is a finite sequence of accepted trades, offered chronologically at specified nodes, whose final plan equals the initial plan except for nonnegative money deductions, positive at least once. Thus there is no gain at any date or state and a cash loss somewhere.

The following is a simple version of the classical paid-exchange argument [@davidson1955outlines, pp. 145--146], applied to changing preferences [@hammond1976changing; @rabinowicz2000money].

::: {#prp-no-net-loss-pump}
###### Dynamic consistency and absence of money pumps

Under the preceding assumptions, preferences are dynamically consistent if and only if no pure-fee pump exists from any initial plan in $\mathcal H$.

Whenever consistency fails, there are plans $f,g\in\mathcal H$ differing only on some event $E\in\mathcal P_t$ from some date $t>0$ onward, with

$$f\succ_{0,\Omega}g,\qquad g\succ_{t,E}f.$$

Starting from $g$, two strictly accepted trades suffice: at the root, replace $g$ by $f$ for a sufficiently small positive upfront fee; at $(t,E)$, restore $g$'s continuation for free. Outside $E$, no second trade is needed. The final plan is $g$ minus the upfront fee in every state.
:::

::: {#exm-consistent-changing-tastes}
###### Allowed: different tastes at different consumption dates

There is no uncertainty, dates are $0,1,2$, and a bundle $(m,c,a)\in\mathbb R^3_{++}$ consists of money, coffee, and tea. Let

$$U_0(m,c,a)=m+2c+a,\qquad U_1(m,c,a)=U_2(m,c,a)=m+c+2a,$$

and evaluate remaining consumption by $V_t(h)=\sum_{\tau=t}^2 U_\tau(h_\tau)$. At equal money holdings, the agent prefers two coffees and one tea to one coffee and two teas for consumption at date $0$, but prefers the reverse for consumption at date $1$.

This change is consistent: already at date $0$, the agent prefers the tea-heavy bundle for date-$1$ consumption. The ranking of any fixed future consumption choice is preserved. These preferences therefore admit no pure-fee pump under the stated trading rule.
:::

::: {#exm-inconsistent-changing-tastes}
###### Not allowed: reversing the same future choice

Keep the same dates and goods, but suppose that at date $0$ the agent values every date's bundle by $m+2c+a$, whereas at dates $1$ and $2$ the agent values each remaining bundle by $m+c+2a$, adding across dates. No information arrives. Initially the date-$2$ bundle is $(10,1,2)$, and date-$0$ money exceeds $0.5$:

1. At date $0$, pay $0.5$ immediately to replace the terminal bundle by $(10,2,1)$. Its contribution to date-$0$ utility rises from $14$ to $15$, so the net gain is $0.5$ and the agent accepts.
2. At date $1$, exchange that terminal bundle back for $(10,1,2)$ at no additional charge. Its contribution to date-$1$ utility rises from $14$ to $15$, so the agent accepts again.

All original consumption is restored except the $0.5$ paid at date $0$. This is a pure-fee pump: the agent reverses a ranking over consumption at the same future date, not merely a ranking of goods consumed at different dates.
:::

Commitment, restricted offers, or anticipation of later trades can prevent exploitation despite inconsistent rankings [@strotz1955myopia; @rabinowicz2000money]. Thus absence of observed exploitation does not establish dynamic consistency.

### Causality {#sec-causality}

_Interventions_ in the world are not passively observed data from the environment. 
For example, suppose we observe that a protein marker in the blood is perfectly correlated
with a disease. 
If we simply take this as our posterior, we conclude that artificially altering the marker
will stop the disease with probability 1.
Avoiding this trap requires _causal models_.

Below we introduce causal models and state @prp-causal-representation which shows how expected-utility axioms rank interventions by their posterior expected consequences.
This particular result takes models and probabilities as given rather than recovering them from choices.
Choices among interventions can reveal aspects of causal beliefs given suitable utility restrictions and sufficiently rich choices, but cannot distinguish models that give identical consequence distributions for every available intervention [@joyce1999foundations].

#### Causal models and interventions {#sec-causal-models}

We use acyclic structural causal models and their intervention semantics [@galles1998axiomatic; @pearl2019seven].

::: {#def-scm}
###### Structural causal model

A *structural causal model* (SCM) is a tuple $\mathcal M=\langle\mathcal U,\mathcal V,\mathcal F,P_{\mathcal U}\rangle$. The finite collections $\mathcal U=\{U_1,\ldots,U_m\}$ and $\mathcal V=\{V_1,\ldots,V_n\}$ contain background (*exogenous*) and modeled (*endogenous*) variables, respectively. All variables take values in standard Borel spaces; $\mathcal X_S$ denotes the product state space for a collection $S$ of variables, with product sigma-algebra $\mathcal B_S$.

The background vector $U$ has joint law $P_{\mathcal U}$; its components need not be independent. The measurable structural functions $\mathcal F=\{f_1,\ldots,f_n\}$ specify

$$V_i=f_i(V_{\mathrm{Pa}_i},U_{I_i}),\qquad i=1,\ldots,n,$$

where $\mathrm{Pa}_i\subseteq\{1,\ldots,n\}\setminus\{i\}$ indexes endogenous parents and $I_i\subseteq\{1,\ldots,m\}$ indexes exogenous inputs. Require the graph with edges $V_j\to V_i$ for $j\in\mathrm{Pa}_i$ to be acyclic. Recursive evaluation in a topological order then gives a unique measurable solution $V=g(U)$ and observational law $P_{\mathcal M}=P_{\mathcal U}\circ g^{-1}$.
:::

Relative to this graph, call the parents of an outcome $Y$ its *proximal causes*, and its nonparent ancestors its *distal causes*. Distal effects pass through mediators: in a chain $Z\to X\to Y$, $X$ is proximal and $Z$ distal to $Y$. These descriptions depend on which mechanisms the model represents explicitly; they do not rank causal importance or guarantee a nonzero effect for every intervention [@pearl2019seven].

::: {#def-intervention}
###### Intervention and potential responses

For $X\subseteq\mathcal V$ and $x\in\mathcal X_X$, the notation $\operatorname{do}(X=x)$ means *set* every variable in $X$ to its specified value. It replaces the equations for those variables by $V_j=x_j$, leaving all other equations and $P_{\mathcal U}$ unchanged. This idealized intervention removes incoming arrows to the targets, not their outgoing effects.

Write $g_x$ for the modified system's solution map and $Y_x(U)$ for its $Y$ coordinate. For every measurable $B\subseteq\mathcal X_Y$, define

$$P_{\mathcal M}(Y\in B\mid\operatorname{do}(X=x))
:=P_{\mathcal U}\{z:Y_x(z)\in B\}.$$

The bar here labels a modified model; it is not conditioning on an event called $\operatorname{do}(X=x)$. In contrast, $P_{\mathcal M}(Y\in B\mid X=x)$ retains the original equations and conditions on an observed value. An intervention is defined even when that value has zero observational probability. The empty intervention leaves the model unchanged.
:::

In $Z\to X\to Y$, intervening on the distal cause $Z$ allows its effect to propagate through $X$. Intervening on $X$ instead cuts the link $Z\to X$: $Z$ no longer affects $Y$ through that path. Observing $X=x$ cuts no link and may provide evidence about $Z$. If another path from $Z$ to $Y$ exists, fixing $X$ need not block it.

A *probability kernel* from a measurable space $S$ to a measurable space $T$ assigns each $s\in S$ a probability law $K(s,\cdot)$ on $T$, with $s\mapsto K(s,B)$ measurable for each measurable $B\subseteq T$. A *causal kernel* specifies a node's law when its parents are externally fixed. It is *autonomous* if this mechanism remains unchanged under interventions on other nodes [@pearl2019seven].

These distinctions give a three-level hierarchy of queries and corresponding graphical models [@pearl2019seven, fig. 1]:

| Level | Model and added structure | Typical query | Limits |
| --- | --- | --- | --- |
| 1. Association: observing | An ordinary _Bayesian network_ factors an observational law over a DAG; the graph encodes conditional independencies, not necessarily causation. | $P(Y\in B\mid X=x)$: what does observing $X=x$ tell us about $Y$? | The observational law alone generally does not determine intervention effects. |
| 2. Intervention: doing | A _causal Bayesian network_ gives arrows causal meaning and specifies autonomous kernels that remain unchanged when other mechanisms are replaced. | $P(Y\in B\mid\operatorname{do}(X=x))$: what happens if we set $X=x$? | Intervention laws alone generally do not determine joint potential responses across alternative actions. |
| 3. Counterfactuals: imagining | An _SCM_ supplies structural functions and a joint background law, linking alternative interventions through the same $U$. | $P(Y_{x'}\in B\mid X=x,Y=y)$: given what occurred, what would $Y$ have been under $X=x'$? | Counterfactual conclusions depend on this additional structure and need not be identified from data. |

Each level adds information, not merely arrows: the same endogenous DAG can appear at all three levels. An SCM supports all three queries; its counterfactual calculation conditions the background state on actual evidence before evaluating the alternative intervention.

At an exact observation with probability zero, the observational law alone does not specify a unique conditional prediction [@kallenberg2021foundations, theorem 8.5]. A fully specified SCM nevertheless determines what happens when we *set* a variable to that value, using the modified equations rather than conditioning.

::: {#def-causal-kernels}
###### Node causal kernels

For finite-valued endogenous variables, let $E_i:=U_{I_i}$ denote the background inputs to node $i$, called its *node disturbance*. For each parent configuration $p$ and node value $a$, define the causal probability mass kernel

$$K_i(a\mid p):=P_{\mathcal U}\{z:f_i(p,z_{I_i})=a\}.$$

Thus $K_i(\cdot\mid p)$ is the law of $V_i$ obtained by fixing its parents to $p$ and retaining the original background law. The SCM specifies it even for parent configurations that never occur observationally; the bar denotes the kernel's input, not observational conditioning.
:::

If the disturbance vectors $E_1,\ldots,E_n$ are mutually independent, the intervention law has the *truncated factorization* [@pearl2019seven]

$$P_{\mathcal M}(v\mid\operatorname{do}(X=x))
=\prod_{i:V_i\notin X}K_i(v_i\mid v_{\mathrm{Pa}_i})
\prod_{j:V_j\in X}\mathbb I\{v_j=x_j\}.$$

Here $v=(v_1,\ldots,v_n)$ is a complete endogenous assignment, $v_{\mathrm{Pa}_i}$ is its parent subvector, $P_{\mathcal M}(v\mid\operatorname{do}(X=x))$ is the probability of $V=v$ under the intervention, and $\mathbb I\{v_j=x_j\}$ is one if $v_j=x_j$ and zero otherwise. The factorization is called truncated because the intervention replaces each targeted node's kernel by this indicator.

Under this independence assumption, the kernels agree with observational conditionals on positive-probability parent configurations. At zero-probability parent configurations, they are specified by the SCM, not determined by the observational law. With shared or dependent disturbances this product need not hold, but the causal kernels and the structural definition of interventions still apply.

#### Bayesian inference and causal choice {#sec-bayesian-causal-choice}

To allow uncertainty about causal structure and mechanisms, let $\Theta$ be a finite set of candidate SCMs $\mathcal M_\theta$ on the same endogenous state space, with prior probabilities $\pi(\theta)$. Let $D$ denote observed data and $\ell_\theta(D)$ its likelihood under the actual sampling or experimental design. For positive marginal likelihood, Bayesian updating gives [@gelman2013bayesian]

$$\pi(\theta\mid D)=
\frac{\pi(\theta)\ell_\theta(D)}{\sum_{\vartheta\in\Theta}\pi(\vartheta)\ell_\vartheta(D)}.$$

Consider an intervention on a new unit whose background variables are independent of $D$ conditional on $\theta$, with law $P_{\mathcal U,\theta}$. Learning changes the weights on models; intervention changes the equations within each model. For counterfactuals about a unit already observed, its background law must also be conditioned on that unit's evidence [@pearl2019seven].

::: {#def-supposition}
###### Posterior causal prediction

Let $\mathcal A=\{\operatorname{do}(X=x):X\subseteq\mathcal V,\ x\in\mathcal X_X\}$ be the deterministic intervention acts. For $A=\operatorname{do}(X=x)$ and $E\in\mathcal B_{\mathcal V}$, define the posterior causal law

$$Q_D^A(E)=\sum_{\theta\in\Theta}\pi(\theta\mid D)
P_{\mathcal U,\theta}\{z:g_{\theta,x}(z)\in E\},$$

where $g_{\theta,x}$ is the intervened solution map in $\mathcal M_\theta$. Thus $Q_D^A(E)$ is also written $P(V\in E\mid D,\operatorname{do}(X=x))$. A known SCM is the special case $|\Theta|=1$.
:::

::: {#def-preference-acts}
###### Consequence lotteries and randomized interventions

Fix a finite consequence set $\mathcal C$ with at least two elements and the discrete sigma-algebra. For each $A\in\mathcal A$, a measurable map $h_A:\mathcal X_{\mathcal V}\to\mathcal C$ records all relevant consequences, including intervention costs. Its posterior consequence lottery is

$$\mu_{A,D}(c)=Q_D^A(h_A^{-1}(\{c\})),\qquad c\in\mathcal C.$$

Let $\Delta(\mathcal C)$ be the full simplex of consequence lotteries, with pointwise mixtures, and $\delta_c$ the lottery concentrated at $c$. At fixed evidence $D$, write $\succsim$ for preferences on this simplex and $\succ$ for strict preference.

A randomized intervention $r$ is a finite-support distribution on $\mathcal A$. Conditional on $D$, an external randomizer independent of the model and background variables selects and performs $A$ with probability $r(A)$. Its lottery is $\mu_{r,D}=\sum_A r(A)\mu_{A,D}$; deterministic acts are point masses. *Reduction to the induced law* requires intervention preferences $\succsim_{\mathcal A,D}$ to satisfy

$$r\succsim_{\mathcal A,D}s\iff\mu_{r,D}\succsim\mu_{s,D}.$$

This excludes preferences for a procedure or causal route beyond what $h_A$ records.
:::

The following applies the finite-lottery representation theorem to posterior causal laws [@vonneumann1944theory; @mascolell1995microeconomic, propositions 6.B.3 and 6.B.2]. Its causal interpretation follows the separation of causal beliefs and utilities in causal decision theory [@joyce1999foundations].

::: {#prp-causal-representation}
###### Bayesian causal expected utility

Fix the models, prior, likelihood, consequence maps, and evidence $D$ above. Suppose preferences on $\Delta(\mathcal C)$ satisfy:

1. Weak order: $\succsim$ is complete and transitive.
2. Mixture continuity: for all $L,M,N\in\Delta(\mathcal{C})$, both $\{\alpha\in[0,1]:\alpha L+(1-\alpha)M\succsim N\}$ and $\{\alpha\in[0,1]:N\succsim\alpha L+(1-\alpha)M\}$ are closed.
3. Independence: for all $L,M,N\in\Delta(\mathcal{C})$ and $\alpha\in(0,1)$,
   $$L\succsim M \iff \alpha L+(1-\alpha)N\succsim\alpha M+(1-\alpha)N.$$
4. Nondegeneracy: some $L,M\in\Delta(\mathcal C)$ satisfy $L\succ M$.

Then there is a utility $u:\mathcal{C}\to\mathbb{R}$, unique up to positive affine transformation among utilities representing these full-domain lottery preferences, such that

$$L\succsim M \iff \sum_{c\in\mathcal{C}}L(c)u(c)\ge\sum_{c\in\mathcal{C}}M(c)u(c).$$

If intervention preferences satisfy reduction to the induced law, they are represented by

$$U_D(r)=\sum_A r(A)\sum_{c\in\mathcal C}\mu_{A,D}(c)u(c).$$

In particular, for $A=\operatorname{do}(X=x)$,

$$U_D(A)=\sum_{\theta\in\Theta}\pi(\theta\mid D)
\int_{\mathcal X_{\mathcal U,\theta}}
u(h_A(g_{\theta,x}(z)))\,dP_{\mathcal U,\theta}(z).$$

Conversely, every nonconstant utility on $\mathcal C$ defines lottery preferences satisfying these four axioms, and the displayed $U_D$ defines intervention preferences satisfying reduction.
:::

The result separates three ingredients: structural assumptions determine intervention responses, Bayesian conditioning weights candidate models, and preference axioms justify expected-utility evaluation. It does not derive the first two from the third. Nor does it establish causal identification: models with identical observational likelihoods can predict different intervention effects, leaving their posterior odds unchanged by observational data [@pearl2019seven].

Utility uniqueness uses preferences on the full lottery simplex, not merely feasible interventions. If all feasible interventions induce the same lottery, their mutual indifference cannot identify utility. The result is also at fixed evidence $D$: a common utility across information states or an axiomatic derivation of Bayesian updating requires additional assumptions [@anscombe1963definition; @teller1973conditionalization].

### What Is the Optimal Practical Prior? {#sec-optimal-prior}

Solomonoff induction provides an idealized benchmark for universal sequence prediction [@solomonoff1964formal1; @solomonoff1964formal2]. But 
what's the best we can do in polynomial time?

Here $\log$ denotes the base-2 logarithm and $\ln$ the natural logarithm. Fix an optimal prefix-free universal machine $U_d$. Let $K(x)$ be prefix Kolmogorov complexity and let $\mathbf m_d$ be the discrete universal a priori semimeasure. The coding theorem gives

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

#### Resource-bounded predictive criteria {#sec-sequential-prediction}

A practical criterion evaluates a prior through its posterior predictive rule: how much prediction error remains at a fixed computational budget? This evaluates the prior together with its inference algorithm, not the prior alone.

Let $A$ be a computable sequential predictor returning rational probabilities $A(1\mid x_{\lt n})\in[0,1]$ on every binary history, with $A(0\mid x_{\lt n})=1-A(1\mid x_{\lt n})$. Its induced joint distribution is

$$A(x_{1:N})=\prod_{n=1}^N A(x_n\mid x_{\lt n}).$$

For an environment measure $\mu$, define cumulative expected log-loss regret, using natural logarithms, by

$$L(A,\mu)=\sum_{n=1}^\infty \mathbb E_\mu\left[
D_{KL}\big(\mu(\cdot\mid x_{\lt n})\,\|\,A(\cdot\mid x_{\lt n})\big)
\right].$$

This nonnegative, possibly infinite quantity measures excess loss relative to knowing $\mu$ [@hutter2003optimality; @cesabianchi2006prediction].

Fix a prefix-free interpreter $V$ for explicitly clocked programs and a monotone, time-constructible bound $T(n)$, large enough for fixed programs predicting $0$, $1$, and $1/2$. A program qualifies if, on every history of length $n-1$, it returns a valid rational conditional probability within $T(n)$ bit-computation steps, including input access, clocking, and binary output.

Write $P_T$ for these qualifying programs and $\mu_p$ for the measure induced by program $p$. Define

$$\mathcal M_T=\{\mu_p:p\in P_T\},\qquad
K_T(\mu)=\min\{|p|:p\in P_T,\ \mu_p=\mu\}.$$

The time restriction applies to the description itself; a shorter, slower program does not qualify.

::: {#def-resource-bounded-predictive-criterion}
###### Resource-bounded predictive criterion

The complexity-indexed loss profile of a predictor $A$ is

$$R_A(\ell)=\sup\{L(A,\mu):\mu\in\mathcal M_T,\ K_T(\mu)\le\ell\},
\qquad \sup\varnothing:=0.$$

Fix a bit-computation machine and constants $C>0$ and integer $k\ge1$, shared across candidates. Admissible algorithms have persistent sequential state and worst-case per-round cost

$$C_A(n)\le Cn^k\qquad(n\ge1),$$

over all histories of length $n-1$, counting state updates and probability output. The criterion is to minimize $R_A(\ell)$ across complexity levels $\ell$ subject to this computational budget.
:::

Profiles can cross; neither a unique minimizer nor an algorithm attaining every pointwise infimum is assumed. Unlike uniform-average complexity approximation, this criterion is not satisfied by a trivial length estimate. Unlike universal-average decision error, it permits gradual learning rather than requiring eventual worst-case correctness.

::: {#exm-trivial-prior-loss}
###### A trivial prior fails to learn

The fair-coin prior assigns $A(x_{1:N})=2^{-N}$ to every binary string and always predicts $A(1\mid x_{\lt n})=1/2$. Let $\mu_0\in\mathcal M_T$ generate only zeros. At every round,

$$D_{KL}\big(\mu_0(\cdot\mid 0^{n-1})\,\|\,A(\cdot\mid 0^{n-1})\big)=\ln2.$$

Its expected regret after $N$ observations is $N\ln2$, so $L(A,\mu_0)=\infty$ and $R_A(\ell)=\infty$ for every $\ell\ge K_T(\mu_0)$. Even an arbitrarily long run of zeros leaves its next prediction unchanged. More generally, no history-independent predictor, even one varying with $n$, has finite regret against both constant environments.
:::

The construction below achieves finite $R_A(\ell)$ at every fixed $\ell$. Ideal Solomonoff prediction has an $O(\ell)$ profile on this benchmark, but is incomputable and hence inadmissible [@hutter2003optimality; @leike2015computability].

#### Delayed mixture construction and guarantees {#sec-delayed-mixture}

Combine Bayesian aggregation with bounded program search and delayed expert activation [@levin1973universal; @cesabianchi2006prediction; @freund1997specialize]. Let $b(n)$ be a monotone, time-constructible, unbounded positive-integer budget, and define

$$\tau_b(\ell)=\min\{n\ge1:b(n)\ge2^\ell\},\qquad
w_q=\frac{2^{-|q|}}{(|q|+1)(|q|+2)}\quad(q\in\{0,1\}^*).$$

The weights over all binary strings sum to one. Expert $\nu_q$ predicts $1/2$ before round $\tau_b(|q|)$. Thereafter, it simulates $V(q,x_{\lt n})$ for at most $T(n)$ steps, using the returned probability or $1/2$ on timeout or invalid output. Set

$$\xi_b=\sum_{q\in\{0,1\}^*}w_q\nu_q,\qquad
A_b(a\mid x)=\frac{\xi_b(xa)}{\xi_b(x)}\quad(a\in\{0,1\}).$$

At every finite round, inactive experts supply positive fair-coin mass, so these conditionals are defined on every history.

Implementation maintains active likelihoods and groups all inactive experts into one fair-coin component. At round $n$, the active strings have length at most $h=\lfloor\log_2 b(n)\rfloor$; their number is $O(b(n))$, and the inactive prior mass is $1/(h+2)$. Newly activated experts inherit their previous fair-coin likelihood.

For the following operation count only, rational arithmetic has unit cost and simulation of $V$ has constant overhead, with shared read-only history access. The interpreter itself uses bit computation, including binary numerator-denominator output; the unit-cost convention applies only to mixture aggregation.

::: {#thm-ab-guarantee}
###### Computational and predictive guarantees

The predictor $A_b$ is computable with $O(b(n)T(n))$ interpreter-simulation and rational-arithmetic operations per round under these conventions. If $b$ and $T$ are polynomial, it also has polynomial bit-computation cost, possibly with a larger exponent.

For every integer $\ell\ge0$, its loss profile satisfies

$$R_{A_b}(\ell)\le
(\tau_b(\ell)-1+\ell)\ln2+\ln((\ell+1)(\ell+2)).$$
:::

This is a delayed version of the standard Bayesian log-loss aggregation guarantee [@hutter2003optimality; @cesabianchi2006prediction]. It supplies a finite-profile baseline, not an optimality claim.

#### Bounds and unresolved optimality {#sec-lower-bound-tradeoff}

For a fixed positive integer $d$, take $b(n)=n^d$ and suppose $T(n)=O(n^r)$. The construction gives

$$\text{unit-cost runtime}=O(n^{r+d}),\qquad
R_{A_b}(\ell)=O(2^{\ell/d}+\ell).$$

Larger $d$ trades more computation for a smaller profile upper bound. Allocating $d\le k-r$ applies only to this unit-cost exponent accounting; even there, constants must fit a fixed budget $C$. For the actual $Cn^k$ bit budget, interpreter simulation and exact rational arithmetic must both be charged. Polynomial bit-time computability does not establish the same exponent $r+d$.

A separate information-theoretic lower bound requires richness: for every binary string $y$ of length $m$, assume $\mathcal M_T$ contains the deterministic environment $\mu_y$ emitting $y$ and then zeros, with

$$K_T(\mu_y)\le m+K(m)+O(1),$$

uniformly in $m,y$, where $K(m)$ is prefix-free integer complexity. This assumption is not automatic for an arbitrary $T$.

::: {#thm-minimax-lower-bound}
###### Minimax log-loss bound

Under this richness assumption, every predictor $A$ satisfies, as $\ell\to\infty$,

$$R_A(\ell)\ge(\ell-O(\log\ell))\ln2.$$
:::

This specializes the standard minimax log-loss bound to the complexity-indexed benchmark [@hutter2003optimality; @cesabianchi2006prediction]. Together with Solomonoff's ideal bound, it makes linear dependence on $\ell$ the information-theoretic benchmark.

The polynomial-time construction instead supplies an exponential-in-complexity upper bound. Neither that upper bound nor the information-theoretic lower bound establishes a computational lower bound, an optimal $n^k$ algorithm, or a uniquely optimal practical prior.

## Statistics {#sec-statistics}

### Bayesian Classification with Prior Information on Class Proportions {#sec-bayesian-classification}

The usual Bayesian regression update tacitly assumes $p(\theta\mid x)=p(\theta)$: observing inputs $x$ alone does not inform the regression parameters $\theta$. This is not automatic. For observed labels $y$, Bayes's rule gives

$$p(\theta\mid x,y)\propto p(y\mid x,\theta)p(\theta\mid x),$$

and the usual practice is replacing $p(\theta\mid x)$ with $p(\theta)$ [@gelman2013bayesian, sec. 14.1].
For inputs sampled from a population density $g$, the assumption holds if $g$ is known and does not depend on $\theta$, or if unknown $g$ and $\theta$ are independent a priori. In either case, the input likelihood, integrated over $g$ when necessary, does not depend on $\theta$ and cancels.

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

Suppose all agents observe the same fair coin flip and receive a reward $r>0$
for agreeing with a uniformly sampled other agent. Without outside incentives,
all agents reporting truthfully and all agents reporting falsely are both
equilibria. For a given agent, let $q$ be the fraction of other agents reporting
falsely. Reporting falsely earns expected agreement reward $qr$, whereas truth
earns $(1-q)r$. If $q>1/2$, increasing $r$ strengthens the incentive to report
falsely. An outside benefit from false reports can reinforce this incentive;
there is no general reward threshold that guarantees truthfulness. Comparing
equilibria or coordinated switches requires specifying the outside payoffs and
which agents, if any, are committed to truth-telling.

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
