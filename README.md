# eye2

A reasoner using Webized Prolog which basically means that atoms can be IRIs.

It performs forward chaining for `conclusion <= premise.` rules and uses `stable(n)`
to fail if the deductive closure at level `n` is not yet stable.

Variables are interpreted as universally quantified variables except for
conclusion-only variables which are interpreted existentially.

Queries are posed as `true <= premise.` and answered as `answer(premise_inst).`

Proofs steps are `ether((conclusion <= premise), premise_inst, conclusion_inst).`.

Inference fuses return code 2 with output `false <= premise.`.

## Installation and test

Install [SWI-Prolog](https://www.swi-prolog.org/Download.html) and run

```
cd etc
./test
```

## Background

- Personal notes by Tim Berners-Lee: [Design Issues](https://www.w3.org/DesignIssues/)
- Book of Markus Triska: [The Power of Prolog](https://www.metalevel.at/prolog)
