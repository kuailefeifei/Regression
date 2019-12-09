function parameters = regression(input,output,ordnung)
    
    A = zeros(numel(input),ordnung + 1);
    b = reshape(output,numel(output),1);
    
    for i = 1:numel(input)
        for j = 1:ordnung
            A(i,j) = input(i).^j;
        end
    end
    
    A(:,ordnung + 1) = 1;
    parameters = inv(A'*A)*A'*b; % Pseudo Inverse
end