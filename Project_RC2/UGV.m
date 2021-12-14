classdef UGV
    properties
        x
        y
    end
    
    methods
        function car = UGV(x,y) % Initilization
            car.x = x;
            car.y = y;
        end
        
        function car = move(car, xf, yf)
            car.x = xf;
            car.y = yf;
        end            
    end
end