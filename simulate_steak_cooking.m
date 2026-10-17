clear;
clc;

%% Data
L = 20.32e-2;
H = 5.08e-2;
a = 1.35e-7; %thermal diffusion coefficient:
Ts = 23; %start
Tp = 204; %pan
K = 0.04;
Tc_target = 56; %goal


%% Grid
nx=100;
ny=70;
dx=L/(nx-1);
dy=H/(ny-1);

x = linspace(0,L,nx);
y = linspace(0,H,ny);
N = nx*ny; % total number of nodes

dt = 1;
%% Initial condition
 u = Ts*ones(N,1);

%% 2D laplacian
Ix = speye(nx);
Iy = speye(ny);

Lx = spdiags([ones(nx,1) -2*ones(nx,1) ones(nx,1)],-1:1,nx,nx)/dx^2;
Ly = spdiags([ones(ny,1) -2*ones(ny,1) ones(ny,1)],-1:1,ny,ny)/dy^2;

A = kron(Iy,Lx) + kron(Ly,Ix);

% Implicit backward difference matrix
C = speye(N) - a*dt*A;

%% Boundaries indices
down = 1 + (0:nx-1)*ny; % up line
top = ny + (0:nx-1)*ny; % down line
left = 1:ny; %first column
right = (nx-1)*ny + (1:ny); % left column

%% Boundary conditions matrix
% left boundary
for i = left

    C(i,:) = 0;
    
    C(i,i) = -1;
    C(i,i+ny) = 1;

end
% right boundary
for i = right

    C(i,:) = 0;

    C(i,i) = 1;
    C(i,i-ny) = -1;

end

% top boundary
for i = top
    C(i,:) = 0;
    
    C(i,i) = 1;
    C(i,i-1) = -1;
end
% down boundary
for i = down
    C(i,:) = 0;
    
    C(i,i) = 1;
end
%% Center node
center = sub2ind([ny,nx], round(ny/2), round(nx/2));

%% User flips
flip_times = [120];

%% Time Loop
 % side = 0 - down side of pan 
 % side = 1 - upper side of pan
 
 flip_counter = 1; %which flip we take
 time = 0;
 side = 0;
 
while u(center) < Tc_target
    
    rhs = u;
    %% Check for flip
    if flip_counter <=length(flip_times)
        if time>=flip_times(flip_counter)
            side = 1 - side;
            fprintf('Flip at %.1f seconds\n',time);
            flip_counter = flip_counter + 1;  
        end
    end
    
  %% Boundary conditions RHS
    % left boundary
    rhs(left) = K*dx;
    % rifgt boundary
    rhs(right) = -K*dx;
    
    if side == 0
        % down side of pan
        rhs(down) = Tp;
        % top -k
        rhs(top) = -K*dy;
    else
        % top side of pan
        rhs(top) = Tp;

        % down k
        rhs(down) = -K*dy;
    end
    
    %% Solve system
    u = C\ rhs;
    
    %% add time span
    time = time + dt;
   
    Uplot = reshape(u,ny,nx);
    imagesc(x,y,Uplot);
    axis equal tight;

    set(gca,'YDir','normal');

    colormap hot;
    colorbar;

    caxis([Ts Tp]);

    title(sprintf('Time = %.1f s | Center = %.2f C',time,u(center)));

    xlabel('Length (m)');
    ylabel('Thickness (m)');
       drawnow;
end


fprintf('\nTarget reached in %.2f minutes\n',time/60);
