# GENETIC ALGORITHMS

inspiried by population genetics including heredity and gene frquencies
and evolution at the population level

also based on Mendelian understanding of the structure (genes,alleles)
and mechanisms (recombination and mutation)


# Metaphor

individuals of a population contribute their genetic material (genotype)
proportional to their suitability of their expressed genome (phenotype)
to their environment in the form of offspring

next generation created through a process of mating that involves the
recombination of two individual genomes in the population with the introduction of random copying errors(mutation)

the process may result in an improved adaptive-fit between phenotypes of individuals in a population and the environment

Main goal

maximize payoff of candidate solutions in the population against a cost function
from the problem domain

repeatedly employ surrogates for the recombination and mutation
genetic mechanisms on the population of candidate solutions where the
cost function (fitness function) applied to a decoded representation
of a candidate dicates the probablistic contributions it can make
to the subsequent generation of candidate solutions

* in summary, pick the candidates which maximize the fitness function for the next
iteration

* GA configured with a high probablity of recombination and low probablity of
mutation (1/number of components in a solution)

selection, recombination, mutation, representation

selection refers to the candidate solutions to contribute to the next generation
  cannot be too random nor too greedy

e.g.

selection(binary tournament)

recombination(one point crossover)

mutation(point mutation)


* GA most commnly used as am optimization technique and general adaptive strategy


# REFERENCES

[17] M. Mitchell. An Introduction to Genetic Algorithms. MIT Press, 1998.



* replicate the process of evolution on a computer to optimize a function
or to perform search queries

* defines a rule that tells us when an 'organism' is better than others;
these are then mutated slightly and have the fittest reproduce after a number of cycles to get an 'optimal' organism

below defines the steps for a problem domain which is to find the optimal solution of any given 4 bits of binary string when XOR with 1010

* An organism is represented by a chromosome, which is simply a string

* We randomly generate a bunch of organisms (i.e. strings)

* We determine the fitness of the organisms by taking the string of each and recording the return value from the "fitness function" (i.e. the rule that the machine follows; in our case, the XOR operation)

* We assign probabilities to each organism based on fitness (i.e. higher fitness implies higher probability.) Afterwhich, we pick an organism that we then "reproduce", and the organisms that were unable to reproduce die out.

* All of the organisms find mates with which the strings are “crossed over”.

* We perform many iterations of this cycle.
