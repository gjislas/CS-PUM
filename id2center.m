function center = id2center(id)

switch id
    case 1
        center = [0, 0];
    case 2
        center = [pi/2, 0];
    case 3
        center = [pi, 0];
    case 4
        center = [-pi/2, 0];
    case 5
        center = [0, -pi/2];
    case 6
        center = [0, pi/2];
end
