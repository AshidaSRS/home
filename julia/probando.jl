j=[11,11,11,5,7,7,3,3,8]
i=[2,10,9,11,11,8,10,8,9]
function pageRankGoogle(i,j)
    Cs=sparse(i,j,1,N,N)
    C=full(Cs)
    N=size(C,2)
    M=size(C,1)
    Nj=sum(C,1)
    aux = find(Nj==0)
    n=1
    for k = 1:N
        if i(n) == k
            if n < length(i)
                n = n+1
            end
            dj(k) = 0
        else
            dj(k)=1
        end
    end
    for k = 1:N
        aux2(k)=sum(S(:,k))
        if aux2(k)==0
           S(:,k)=1
        end   
    end
    dj=sum(S,1)
    for k=1:N
        S(:,k)=S(:,k)./dj(k)
    end
    estocS=sum(S,1)
    alpha = 0.85
    G = alpha*S + ((1-alpha)*(1/N)*ones(N))
    [avalor, avector]=potencia(G,N)
    Gr = G * avector
    r = avector
    normaAutovector = norm(Gr - r)
    normaAutovalor = norm(avalor - 1)
    pageRank(G,N)
end


function potencia(A, nmax)
    x1=ones(size(A,1),1)
    for k = 1:nmax
        x = x1/norm(x1)
        x1 = A*x
        lambda = x' * x1
    end
    return lambda, x1
end

function pageRank(A, nmax)
    x1=ones(size(A,1),1)
    for k = 1:nmax
        x = x1/norm(x1)
        x1 = A*x
        lambda = x' * x1
    end
    return p = plot(x1, Geom.histogram(bincount=100))
end
