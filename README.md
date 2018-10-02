# HPER_for_PageRank
ACHTUNG! ----Almost every content in this repository is written in italian----

This repository contains an experimental comparison I made between HPER and the traditional power method for PageRank calculation.

HPER stands for Householder Preconditioned Euler-Richardson and it's a method designed by Stefano Cipolla, Carmine Di Fiore and Francesco Tudisco in an article I'm attaching.

I implemented both methods (and several others) in Matlab and compared their performances on both synthetic and real data.

Moreover the HPER_alpha.m script implements a perturbation on the starting stochastic matrix to speed that method up meaning it provides us with the solution of a slightly different problem, so I tried to measure how close is sorting in the perturbed case to the original one plotting the permutation graphic.

Here you can find:
*pota
*figa
