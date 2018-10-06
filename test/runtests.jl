using Test
using HyperbolicPlane

p = HPoint(0)
q = HPoint(.2)
r = HPoint(0-0.2im)
@test dist(p,q) == dist(r)

p[:color] = "red"
@test p[:color] == "red"

P = RandomHPoint()
Q = RandomHPoint()
S = P+Q
L = HLine(P,Q)
@test issubset(S,L)
M = midpoint(S)
@test in(P,L)
@test in(P,S)
@test issubset(P+M,S)

@test length(S) == dist(P,Q)

x1 = length(S)
x2 = length(P+M) + length(M+Q)
@test abs(x1-x2) < 100*eps(1.)

T = P+Q+M
@test area(T) < 100*eps(1.0)


L = HLine(1,3)
LL = HLine(2,pi)
P = meet(L,LL)
@test in(P,L)
@test in(P,LL)

TT = reflect_across(T,L)
TT = reflect_across(TT,L)
@test T == TT


S = RandomHSegment()
L = HLine(S)
SS = S'
LL = HLine(SS)
@test L == LL'

SS = -S
LL = HLine(SS)
@test L == -LL

a,b,c,d = [RandomHPoint() for t=1:4]
X = HPolygon(a,b,c,d,HPoint(im*eps(1.0)))
Y = HPolygon(d,c,b,a,HPoint(0))
@test X==Y
