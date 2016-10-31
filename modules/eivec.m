function eivecs = eivec(A)
    eivals = eival(A);
    [r, c] = size(A);
    I = eye(r,c);
    eivecs = zeros(length(eivals), 2);
    % n = 0;
    for i=1:length(eivals)
        lambda = eivals(i);
        Lambda = lambda * I;
        E = A - Lambda
        % let v1 = 1 for convenience
        v1 = 1;
        v2 = (E(1,1) * v1) / E(1,2);
        eivecs(i,:) = [v1 v2];
    end
end
