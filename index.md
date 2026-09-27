---
title: "Topics in Social Science"
subtitle: "A Single-Page Quarto Demonstration"
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

# Tools

## Statistics

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

1.  **The Euler Equation Error ($\Vert E(\theta)\Vert$):** The residual magnitude generated when the approximated policy rules are substituted into the original non-linear equilibrium equations. Formally, let the true non-linear expectations model be defined by a functional operator $\mathcal{F}$ such that the exact policy function yields $\mathcal{F}(g) = 0$. The approximation error is the residual evaluated at the linear approximation, $E(\theta) = \mathcal{F}(G(\theta)x_t)$. The metric $\Vert E(\theta)\Vert$ is typically computed as the supremum or the root-mean-square of the residuals evaluated over a strictly defined, discretized grid of the state space, $\mathcal{X}$.
2.  **The Jacobian Condition Number ($\Vert J^{-1}(\theta)\Vert$):** A discretized numerical measure of the model's sensitivity, serving as an approximation of the inverse Fréchet derivative of the Euler operator $\mathcal{F}$. To construct this, the operator is evaluated over $N$ collocation points in $\mathcal{X}$, yielding an $N \times N$ Jacobian matrix $J(\theta)$ containing the partial derivatives of the Euler residuals with respect to the approximated policy variables. The matrix norm of its inverse, $\Vert J^{-1}(\theta)\Vert$, quantifies the model's economic conditioning, penalizing parameter regions where the objective functions exhibit insufficient curvature.

The theoretical covariance matrix is subsequently scaled by the square of the product of these bounds:

$$\Sigma_\epsilon(\theta) = \kappa \cdot (\Vert J^{-1}(\theta)\Vert \cdot \Vert E(\theta)\Vert)^2 \cdot I$$

The constant $\kappa > 0$ is required to bridge the transition from a strictly bounded uniform distribution to a Gaussian distribution. Originally, a uniform distribution $\mathcal{U}[-B, B]$, where $B = \Vert J^{-1}(\theta)\Vert \cdot \Vert E(\theta)\Vert$, would perfectly capture the strict heuristic limits of the approximation error. The scalar $B$ represents the theoretical supremum of this error, derived from a functional Taylor expansion of the Euler operator. If the exact solution satisfies $\mathcal{F}(g) = 0$ and the approximation yields a residual $\mathcal{F}(\hat{g}) = E(\theta)$, linearizing the operator around the true solution implies $E(\theta) \approx \mathcal{F}'(g)(\hat{g} - g)$. Inverting this relationship and applying matrix norms reveals that the absolute distance between the approximated and true policy functions is strictly bounded by $\Vert\hat{g} - g\Vert \leq \Vert J^{-1}(\theta)\Vert \cdot \Vert E(\theta)\Vert$.

Because the standard Kalman filter requires Gaussian errors, $\kappa$ must be chosen to map the absolute bounds of this theoretical uniform distribution to a normal variance. Setting $\kappa = 1/3$ forces the Gaussian variance to exactly match the mathematical variance of the bounded uniform distribution. Alternatively, setting $\kappa = 1/9$ ensures that 99.7 percent of the Gaussian probability mass falls strictly within the calculated theoretical limits. Researchers may also treat $\kappa$ as an estimable hyperparameter that quantifies a baseline statistical tolerance for numerical misspecification.

When this state-dependent error covariance is integrated into the measurement equations of the state-space representation, it fundamentally alters the mechanics of the likelihood evaluation.

As the Metropolis-Hastings algorithm proposes a new parameter vector $\theta$, the framework computes the local approximation bounds endogenously. If the proposed $\theta$ specifies a parameter space characterized by high non-linearity or severe ill-conditioning, the computed numerical bounds increase by orders of magnitude. This escalation scales the theoretical covariance matrix $\Sigma_\epsilon(\theta)$ proportionately.

Upon encountering this inflated theoretical variance, the Kalman filter optimally assigns an elevated degree of uncertainty to the state-space mapping. Consequently, the log-likelihood of observing the empirical data conditional on that specific parameter draw is severely penalized, effectively pushing the posterior mass away from parameter regions lacking rigorous numerical validity.


# References {.unnumbered .unlisted}

::: {#refs}
:::
