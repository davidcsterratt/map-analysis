function params = Drerun_data(id,params_old, TAKEOUT,plotting)
%  form the maps again but this time
%  remove collicular points with non compact projections


    params = getparams(id);
    disp(['Loading data ',num2str(id), '...'])
    params = load_data(params);
    params = find_active_pixels(params);
    params = Dremove_more_pixels(params,params_old,TAKEOUT);
    params = make_list_of_points(params);
    disp('Selecting point positions...')
    params = select_point_positions(params,'CTOF');
    params = select_point_positions(params,'FTOC');
    disp('Creating projection...')
    params = create_projection(params, 'CTOF');
    params = create_projection(params, 'FTOC');
    disp('Finding ectopics...')
    params = find_ectopics(params);
    params = triangulation(params,'CTOF');
    params = triangulation(params,'FTOC');
    disp('Finding crossings...')
    params = find_crossings(params, 'CTOF');
    params = find_crossings(params, 'FTOC');
    disp('Finding largest subgraph...')
    params = find_largest_subgraph(params,'CTOF');
    params = find_largest_subgraph(params,'FTOC');
    disp('Calculating stats...')
    disp('--> orientation...')
    params = find_link_angles(params,'FTOC');
    params = find_link_angles(params,'CTOF');
    params = find_subgraph_angle(params, 'FTOC');
    params = find_subgraph_angle(params, 'CTOF');
    disp('--> scatters...')
    params = get_subgraph_scatters(params,'FTOC');
    params = get_subgraph_scatters(params,'CTOF');
    disp('--> baseline...')
%    params = find_baseline(params, 'FTOC', 5);
%    params = find_baseline(params, 'CTOF', 5);
    disp('-->lower bound...')
 %   params = find_prob_subgraph(params,'FTOC');
 %   params = find_prob_subgraph(params,'CTOF');
    if params.stats.num_ectopics >= 5
        disp('--> ectopics...')
        params = ectopic_order_stats(params);
    end
    
    params = plot_figure3(params, plotting);
    
    if plotting == 1
        plot_figure2(params)
        
        plot_figure6(params, 'FTOC')
        figure
        plot_ectopics(params)
        %plot_indiv_scatters(params)
    end
