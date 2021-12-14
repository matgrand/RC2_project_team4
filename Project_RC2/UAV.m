classdef UAV
    properties
        x
        y
        z
        
        range % communication range
        
        cam
    end
    
    methods
        function drone = UAV(x0, y0, z0, range) % add camera param after
            drone.x = x0;
            drone.y = y0;
            drone.z = z0;
            drone.range = range;
            
            drone.cam = camera(0,0,eye(3));
        end
        
        function drone = attachCamera(drone, camera)
            drone.camera = camera;
        end
        
        function drone = getCar(drone, UGV_x, UGV_y)
            [drone.UGV_x, drone.UGV_y] = drone.cam.getPos(UGV_x, UGV_y);
        end
        
        function drone = mov(drone)
            [UGV_x, UGV_y] = drone.cam.getPos();
            drone.x = UGV_x;
            drone.y = UGV_y;
        end
    end
end