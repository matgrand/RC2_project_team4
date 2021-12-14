classdef swarm
    properties
        n % number of drones
        drones % drone list
        
        A % neightbours matrix
        D % distance matrix
    end
    
    
    methods
        function group = swarm(n, range)
            group.n = n;
            for i=1:n
                group.drones = [group.drones UAV(i,i,1,range)];
            end
            group.A = zeros(n);
            group.D = zeros(n);
            group = group.matrixA(); 
        end
        
        function group = matrixA(group)
            for i=1:group.n
                for j=1:group.n
                    if (i~=j) %check other drones
                        
                        if(group.drones(i).range^2 > (group.drones(i).x - group.drones(j).x)^2 + ...
                                (group.drones(i).y - group.drones(j).y)^2)
                           group.A(i,j) = 1;
                        end
                        
                    end
                end
            end
        end        
        
        function printDrones(group)
            figure
            theta = [0:1e-1:2*pi];
            hold on
            for i=1:group.n
                plot(group.drones(i).x, group.drones(i).y, 'b.')
                range = group.drones(i).range;
                plot(group.drones(i).x + range*cos(theta), group.drones(i).y + range*sin(theta),'b--');
            end
        end
    end
end