classdef polygon < handle
    properties (Access = public)
        pos_x = sqrt(2);
        pos_y = sqrt(2);
        radius = 2;
        number_of_verticies = 3; 
        
        rotation_angle = 0; 
        
        polygon_plot;
    end
    properties (Access = private)
        verticies_x; 
        verticies_y;
    end
    methods
        function obj = polygon()
            figure; hold on; axis equal;
            limit = 5.5;
            plot([-limit limit limit -limit -limit], [-limit -limit limit limit -limit], 'k', 'linewidth', 5)
            set(gca, 'xlim', [-limit, limit], 'ylim', [-limit, limit]);
            for i_line = -limit : limit
                plot([i_line, i_line], [-limit limit], ':', 'color', [1 1 1]*0.5);
                plot([-limit limit], [i_line i_line], ':', 'color', [1 1 1]*0.5);
            end
            obj.polygon_plot = plot(0, 0);
%             obj.updateVisualization; 
            obj.updateVertexPosition;
        end
        function updateVisualization(obj)
%             updateVertexPosition(obj)
            t = linspace(0, 1, 100);
            xdata = cos(2*pi*t)*obj.radius + obj.pos_x;
            ydata = sin(2*pi*t)*obj.radius + obj.pos_y;
            set(obj.polygon_plot, 'xdata', xdata, 'ydata', ydata);
        end
        function set.pos_x(obj, x)
            obj.pos_x = x;
%             obj.updateVisualization;
            obj.updateVertexPosition;
        end
        function set.pos_y(obj, y)
            obj.pos_y = y;
%             obj.updateVisualization;
            obj.updateVertexPosition;
        end
        function set.radius(obj, radius)
            obj.radius = radius;
%             obj.updateVisualization;
            obj.updateVertexPosition;
        end
        % set 
        function set.number_of_verticies(obj, numVert)
            arguments 
                obj
                numVert (1,1) {mustBeInteger, mustBeGreaterThanOrEqual(numVert,3)} 
            end
            obj.number_of_verticies = numVert;
%             obj.updateVisualization; 
            obj.updateVertexPosition;
        end
        % get 
        function value = get.number_of_verticies(obj)
            value = obj.number_of_verticies; 
        end
        function value = get.pos_x(obj)
            value = obj.pos_x;
        end
        function value = get.pos_y(obj)
            value = obj.pos_y;
        end
        function value = get.radius(obj)
            value = obj.radius;
        end
        % Update Vertex Position 
        function updateVertexPosition(obj)
            t = linspace(0, 1, obj.number_of_verticies+1);
            obj.verticies_x = cos(2*pi*t+obj.rotation_angle)*obj.radius + obj.pos_x;
            obj.verticies_y = sin(2*pi*t+obj.rotation_angle)*obj.radius + obj.pos_y;
            set(obj.polygon_plot, 'xdata', obj.verticies_x, 'ydata', obj.verticies_y);
        end
        % rotation angle (set and get) 
        function value = get.rotation_angle(obj)
            value = obj.rotation_angle;
        end
        function set.rotation_angle(obj, rot_ang)
            obj.rotation_angle = deg2rad(rot_ang);
%             updateVisualization(obj); 
            obj.updateVertexPosition;
        end
        function value = calculatePerimeter(obj)
            % sum off length of all sides 
            value = obj.number_of_verticies * obj.radius; 
        end
    end
end