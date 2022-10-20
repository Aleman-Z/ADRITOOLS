function [p,curvefit,gof,Yp2]=fitter(x1,y1,xlong)
%xlong could be x1

    x1=x1(~isnan(x1));
    y1=y1(~isnan(y1));

    [curvefit,gof,output] = fit(log10(x1),log10(y1),'poly1','normalize','off');
    %figure();plot(curvefit,log10(x1),log10(y1))

    [p, S] = polyfit(log10(x1),log10(y1),1);
    disp(['Equation is y = ' num2str(p(1)) '*x + ' num2str(p(2))])


    [y_est,delta] = polyval(p,log10(xlong),S);
    Yp2 = 10.^(y_est);

    % Add trend line to plot
    % hold on
    % plot(log10(x1),y_est,'r--','LineWidth',2)
    % hold off


    %
%     plot(x1, Yp2, '-k', 'DisplayName', 'Fit');

end