MAX = 1000
"""
(*), condition for non-empty C_d
"""
nonempty = [d for d in range(8, MAX + 1) if d % 6 in [0, 2]]
print("nonempty:", nonempty)

"""
(**), Hassett's condition for an associated K3
"""
primes = [p for p in prime_range(MAX + 1) if p % 3 == 2]
hassett = [d for d in nonempty if all((d//2) % p != 0 for p in [9] + primes)]
print("hassett:", hassett)

"""
(**'), Huybrechts' condition for an associated twisted K3
"""
huybrechts = [d for d in nonempty if all(n % 2 == 0 for (p, n) in factor(d // 2) if p in primes)]
print("huybrechts:", huybrechts)

"""
(**''), condition for a rational Lagrangian fibration on F(X)
featured in arXiv:2501.03534
"""
lagrangian = [d for d in nonempty if is_square(d // 2)]
print("lagrangian:", lagrangian)

"""
number of FM partners of the K3 category of a very general member of C_d
Theorem 1.1 of arXiv:2307.14486
"""
def fm_number(d):
    N = len([n for n in Zmod(2*d) if n.is_unit() and n^2 == 1])
    if d % 3 != 0: return N // 4
    if d % 9 != 0: return N // 8
    if d % 27 == 0: return 3 * N // 4
    return N // 4 if (d // 18) % 3 == 1 else N // 2

print("fm:", {d: fm_number(d) for d in nonempty})

"""
(***), Addington's condition for an associated K3

TODO do the Pell thing explained on the top of page 3 of https://arxiv.org/pdf/1405.4902.pdf
"""


#N = 300
#sorted(list(d for d in set([(2*n^2 + 2*n + 2) // a^2 for a in range(-N, N) for n in range(-N, N) if a != 0 and (2*n^2 + 2*n + 2) % a^2 == 0]) if d <= 1000))
