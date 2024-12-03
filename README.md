# eye2

- A reasoner using webized prolog which basically means that atoms can be IRIs.
- Besides top-down reasoning with `conclusion :- premise` rules, it also does bottom-up reasoning with `conclusion ?- premise` rules.
- Bottum-up reasoning can use `stable(n)` to fail if the deductive closure at level `n` is not yet stable.
- Proofs steps are `ether((conclusion ?- premise), premise_inst, conclusion_inst)` and `conclusion_inst` is asserted.
- Variables are interpreted as universally quantified variables except for `conclusion ?- premise` conclusion-only variables which are interpreted existentially.
- Queries are posed as `true ?- premise` and answered as `answer(premise_inst)`.
- Inference fuses are defined as `false ?- premise` and blown as `fuse(premise_inst)` with return code 2.

## Rationale for bottom-up reasoning with `conclusion ?- premise` rules

- conclusion can be a conjunction
- conclusion can be `false` to blow an inference fuse
- conclusion can be `true` to pose a query
- conclusion can not be any other built-in
- conclusion-only variables are existentials
- current way to explain the reasoning as `ether` proof steps
- avoiding loops that could occur with backward chaining

## Installation and test

Install [SWI-Prolog](https://www.swi-prolog.org/Download.html) and run

```
cd etc
./test
```

## Background

- Personal notes by Tim Berners-Lee: [Design Issues](https://www.w3.org/DesignIssues/)
- Book of Markus Triska: [The Power of Prolog](https://www.metalevel.at/prolog)
