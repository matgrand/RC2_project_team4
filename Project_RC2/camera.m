classdef camera
    properties
        alpha_fov
        beta_fov
        
        R % for now static
        
        UGV_x
        UGV_y
    end
    
    methods
        function cam = camera(alpha, beta, R)
            cam.alpha_fov = alpha;
            cam.beta_fov = beta;
            cam.R = R;
        end
        
        function [UGV_x, UGV_y] = getPos(cam)
            UGV_x = cam.UGV_x;
            UGV_y = cam.UGV_y;
        end
        
        function cam = update(cam, UGV_x, UGV_y)
            cam.UGV_x = UGV_x + randn(1);
            cam.UGV_y = UGV_y + randn(1);
        end
    end
end