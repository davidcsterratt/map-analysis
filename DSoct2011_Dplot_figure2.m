function [] = DSoct2011_Dplot_figure2(params,takeout,anclabels)

% Copied from Adrianna's plot_figure2.m
% With the added facility of specifying which nodes to leave out
% Also supply a list of nodes for anchors

    ancnums=length(anclabels);

 
%RTOC
        ret_coords = params.RTOC.ret_points;
        coll_coords = params.RTOC.coll_points;
        list_of_neighbours = params.RTOC.list_of_neighbours;
        color = 'k';
        num_points = params.RTOC.numpoints;
%        takeout = params.RTOC.takeout;
        list_of_points = setdiff(1:num_points,takeout);
        sets_of_intersections = params.RTOC.sets_of_intersections;
    
    figure(2)
    clf
   %RTOC Retina
   subplot(2,3,1)

   print_links(list_of_points, ret_coords, list_of_neighbours, color);
   hold on
   [cross_points,list_of_crossings] = make_cross_list(list_of_points,sets_of_intersections);
   print_links(cross_points, ret_coords, list_of_crossings, 'r');
   anchors = plot_anchors(ret_coords,ancnums,anclabels);

   axis ij
   set(gca,'PlotBoxAspectRatio',[1 1 1], 'FontSize', 16, 'XTick',[0,0.5,1] ,'XTickLabel',{'0','0.5','1'}, 'YTick',[0,0.5,1] ,'YTickLabel',{'0','0.5','1'});
   axis([0 1 0 1]);

   title('Retina');
   
   %RTOC Coll
   subplot(2,3,2)
   print_links(list_of_points, coll_coords, list_of_neighbours, color);
   hold on
   [cross_points,list_of_crossings] = make_cross_list(list_of_points,sets_of_intersections);
   print_links(cross_points, coll_coords, list_of_crossings, 'r');
   plot_anchors(coll_coords,ancnums,anclabels);
   set(gca,'PlotBoxAspectRatio',[1 1 1], 'FontSize', 16, 'XTick',[0,0.5,1] ,'XTickLabel',{'0','0.5','1'}, 'YTick',[0,0.5,1] ,'YTickLabel',{'0','0.5','1'});
   axis([0 1 0 1]);
   axis ij
   title('Colliculus');


   
   %RTOC circ_plot
   subplot(2,3,3)
%  minimal fix for figures
   angles = -params.RTOC.angles;
   norm_links = params.RTOC.norm_links;
   flipped_links = params.RTOC.flipped_links;
   circ_plot(angles(norm_links>0),'hist',color,40,false,true,'linewidth',2,'color',color);
   hold on
   circ_plot(angles(flipped_links>0),'hist','r',40,false,true,'linewidth',2,'color','r');
   title(params.datalabel);    
   
   %CTOR
    coll_coords = params.CTOR.coll_points;
    ret_coords = params.CTOR.ret_points;
    list_of_neighbours = params.CTOR.list_of_neighbours;
    color = 'b';
    num_points = params.CTOR.numpoints;
    takeout = params.CTOR.takeout;
    list_of_points = setdiff(1:num_points,takeout);
    sets_of_intersections = params.CTOR.sets_of_intersections;
       

   %CTOR Ret
   subplot(2,3,4)
   
   print_links(list_of_points, ret_coords, list_of_neighbours, color);
   hold on
   [cross_points,list_of_crossings] = make_cross_list(list_of_points,sets_of_intersections);
   print_links(cross_points, ret_coords, list_of_crossings, 'r');
   anchors = plot_anchors(ret_coords,ancnums,anclabels);

   axis ij
  set(gca,'PlotBoxAspectRatio',[1 1 1], 'FontSize', 16, 'XTick',[0,0.5,1] ,'XTickLabel',{'0','0.5','1'}, 'YTick',[0,0.5,1] ,'YTickLabel',{'0','0.5','1'});
   axis([0 1 0 1]);

   
   %CTOR Coll
   subplot(2,3,5)
   print_links(list_of_points, coll_coords, list_of_neighbours, color);
   hold on
   [cross_points,list_of_crossings] = make_cross_list(list_of_points,sets_of_intersections);
   print_links(cross_points, coll_coords, list_of_crossings, 'r');
   plot_anchors(coll_coords,ancnums,anclabels);

  set(gca,'PlotBoxAspectRatio',[1 1 1], 'FontSize', 16, 'XTick',[0,0.5,1] ,'XTickLabel',{'0','0.5','1'}, 'YTick',[0,0.5,1] ,'YTickLabel',{'0','0.5','1'});
   axis([0 1 0 1]);
   axis ij

   
   %CTOR circ_plot
   subplot(2,3,6)
%   minimal fix for figures
   angles = -params.CTOR.angles;
   norm_links = params.CTOR.norm_links;
   flipped_links = params.CTOR.flipped_links;
   circ_plot(angles(norm_links>0),'hist',color,40,false,true,'linewidth',2,'color',color);
   hold on
   circ_plot(angles(flipped_links>0),'hist','r',40,false,true,'linewidth',2,'color','r');
   

   figure(2)
   orient tall
   filename = [num2str(params.id),'_fig2.pdf'];
   print(2,'-dpdf',filename)
   
         
   
   
