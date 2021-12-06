classdef circle < handle
    properties (Access = private)
        pos_x = sqrt(2);
        pos_y = sqrt(2);
        radius = 2;
        
        circle_plot;
    end
    methods
        function obj = circle()
            figure; hold on; axis equal; set(gca, 'fontsize', 16); 
            % plot grid lines
            limit = 5.5;
            plot([-limit limit limit -limit -limit], [-limit -limit limit limit -limit], 'k', 'linewidth', 5)
            set(gca, 'xlim', [-limit, limit], 'ylim', [-limit, limit]);
            for i_line = -limit : limit
                plot([i_line, i_line], [-limit limit], ':', 'color', [1 1 1]*0.5);
                plot([-limit limit], [i_line i_line], ':', 'color', [1 1 1]*0.5);
            end
            obj.circle_plot = plot(0, 0);
            obj.updateVisualization; 
        end
        function updateVisualization(obj)
            t = linspace(0, 1, 100);
            xdata = cos(2*pi*t)*obj.radius + obj.pos_x;
            ydata = sin(2*pi*t)*obj.radius + obj.pos_y;
            set(obj.circle_plot, 'xdata', xdata, 'ydata', ydata, 'linewidth', 2);
        end
        function setPosX(obj, x)
            obj.pos_x = x;
            obj.updateVisualization;
        end
        function setPosY(obj, y)
            obj.pos_y = y;
            obj.updateVisualization;
        end
        function setRadius(obj, radius)
            obj.radius = radius;
            obj.updateVisualization;
        end
        function value = getPosX(obj)
            value = obj.pos_x;
        end
        function value = getPosY(obj)
            value = obj.pos_y;
        end
        function value = getRadius(obj)
            value = obj.radius;
        end
        
        function area = calculateArea(obj)
            area = pi*obj.radius^2;
        end
        function c = calculateCircumference(obj)
            c = 2 * pi * obj.radius;
        end
    end
end