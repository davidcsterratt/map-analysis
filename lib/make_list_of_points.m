function params = make_list_of_points(params)

    [full_coll_y full_coll_x] = find(params.active_pixels);
    full_coll = [full_coll_x, full_coll_y];
    full_coll_ind = sub2ind(size(params.active_pixels),full_coll_y,full_coll_x);
    full_field_x = params.elev_phase(full_coll_ind);
    full_field_y = params.azim_phase(full_coll_ind);
    full_field = [full_field_x, full_field_y];
    params.full_coll = full_coll;
    params.full_field = full_field;

    