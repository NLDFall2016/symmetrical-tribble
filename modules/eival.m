function eivals = eival(A)
    detA = A(1,1) * A(2,2) - A(2,1) * A(1,2);
    tau = A(1,1) + A(2,2);
    lambda1 = (tau + sqrta(tau ^ 2 - 4 * detA)) / 2;
    lambda2 = (tau - sqrta(tau ^ 2 - 4 * detA)) / 2;
    eivals = [lambda1 lambda2];
end
