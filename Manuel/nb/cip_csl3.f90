!  cip_csl3.f90
!
!  FUNCTIONS:
!       cip_csl3      - Entry point of console application.
!
!****************************************************************************
!
!  PROGRAM: cip_csl3
!
!  PURPOSE:  Entry point for the console application.
!
!****************************************************************************

program cip_csl3

!USE numerical_libraries
!used for array visualizer
!use AVDef
!use DFLIB

implicit none

! Variables
integer,parameter :: N=4*80;!grid sub-divisions
integer,parameter :: t_stps=1800;
real(8),parameter :: x_min=0.0;
real(8),parameter :: x_max=10.0;
real(8),parameter :: C=10.0;!wave speed
real(8),parameter :: t_max=0.7*(x_max-x_min)/abs(C);
real(8),parameter :: dt=t_max/t_stps;
real(8),parameter :: dx=(x_max-x_min)/N;
real(8),parameter :: dt_ov_dx=dt/dx;
real(8),parameter :: ov_dx=1.0/dx;
real(8),parameter :: ov_dx2=ov_dx*ov_dx;
real(8),parameter :: C_dt_ov_dx=C*dt/dx;!CFL number
!real(8),parameter :: x_l=x_min+(x_max-x_min)*0.4375;!initial wave left limit
!real(8),parameter :: x_r=x_min+(x_max-x_min)*0.5625;!initial wave right limit
!real(8),parameter :: x_l=x_min+4*dx
!real(8),parameter :: x_r=x_min+(x_max-x_min)*0.15;!initial wave right limit
real(8),parameter :: x_l=x_min+(x_max-x_min)*0.1;
real(8),parameter :: x_r=x_min+(x_max-x_min)*0.2;!initial wave right limit

real(8):: x_w_l_c=x_l;!current wave left x limit
real(8):: x_w_r_c=x_r;!current wave right x limit

! the computation vectors
real(8) ::  f(0:N+2);!the solution vector at t=tn
real(8) ::  f_new(0:N+2);!the solution vector at t=tn+1
real(8) ::  f_mid(0:N+1);!the solution at i+1/2
real(8) ::  f_bar(0:N+1);!average at cell i+1/2
real(8) ::  d_drv(0:N+1);!derivative at cell i+1/2
real(8) ::  f_exact(0:N+2);!the solution vector at t=tn
real(8) ::  u(0:N+2);!velocity at point i
real(8) ::  u_bar(0:N+1);!velocity at point i+1/2
real(8) ::  x_pts(0:N+2);!location of each point on x-axis
real(8) ::  c1_L(1:N+1);!1st order cof for left of point i
real(8) ::  c2_L(1:N+1);;!2nd order cof for left of point i
real(8) ::  c3_L(1:N+1);;!3rd order cof for left of point i
real(8) ::  c1_R(1:N+1);!1st order cof for right of point i
real(8) ::  c2_R(1:N+1);;!2nd order cof for right of point i
real(8) ::  c3_R(1:N+1);;!3rd order cof for right of point i
real(8) :: g(1:N+1);!flux vector
real(8) ::  test_var=C_dt_ov_dx;!used to test something

real a_i(N+1);real b_i(N+1);
real cip0_f_old(N+1);real cip0_f_x_old(N+1);
real cip0_f_new(N+1);real cip0_f_x_new(N+1);
real cip0_x_pts(N+1);real C_cip0(N+1);

real(8) ::  plot_mat(0:N+2,3);!to be plot

	!computation counters
        integer ::i,t_itr;

	!used for array visualizer
        integer :: lbnd(2) = 0
        integer status;
        character(1) :: key;

	! Used for output to text file
        character (len = 14) :: file_name='cip_csl.txt'

	!calculate x_pts
        x_pts(0)=-dx+x_min;
        do i = 1,N+2
            x_pts(i)=x_pts(i-1)+dx;
        end do

    !calculate u_exact
        do i = 1,N+2
        x_pts(i)=x_pts(i-1)+dx;
        if((x_pts(i).gt.x_w_l_c).and.(x_pts(i).lt.x_w_r_c)) then
        f_exact(i)=1.0;
        end if
        end do

        !initialize f
        f(:)=0;f_bar(:)=0;
        u(:)=C;u_bar(:)=C;
        do i = 0,N+1
        if((x_pts(i).gt.x_l).and.(x_pts(i).lt.x_r)) then
        f(i)=1.0;
        end if

        if(((x_pts(i)+0.5*dx).gt.x_l).and.((x_pts(i)+0.5*dx).lt.x_r)) then
            f_bar(i)=1.0;f_mid(i)=1.0;
        end if

        end do
        plot_mat(:,1)=f;plot_mat(:,2)=f_exact;

    !initialize cip0 data vectors
    C_cip0(:)=C;cip0_x_pts(1:N+1)=x_pts(1:N+1);
    cip0_f_old(1:N+1)=f_exact(1:N+1);cip0_f_x_old(N+1)=0;cip0_f_x_old(1)=0;
    do i = 2,N
    cip0_f_x_old(i)=0.5*(cip0_f_old(i+1)-cip0_f_old(i-1))/dx;
    end do

    ! a format to use upon writing to the text file
    100 format (es12.4,' ',es12.4,' ',es12.4,' ',es12.4,' ',es12.4);
    ! write data to the file
    open (unit=5,file=file_name,action="write",status="unknown")
    write (unit=5,fmt=*) 't x u'
        do i = 1,N/2
    write (unit=5,fmt=100) 0,x_pts(2*i),f_exact(2*i) ;
    end do

        call faglStartWatch(plot_mat, status)
    ! Set lbnd to the lower bound values of M
    ! (This is not really needed if we are using the default Fortran array
    ! indexing value  of 1)
    lbnd(1:size(shape(plot_mat))) = lbound(plot_mat)
    call faglLBound(u, lbnd, status)
    ! View M (Brings up Array Viewer)
    print *, "Starting Array Viewer"
    call faglShow(plot_mat, status)
    print *, "press any key to continue"
    key = GETCHARQQ()

!Begin computations
do t_itr=1,t_stps
    x_w_l_c=x_w_l_c+C*dt;x_w_r_c=x_w_r_c+C*dt;!new values for wave limits
    if(x_w_l_c.gt.x_max) then
        x_w_l_c=mod(x_w_l_c,x_max);
    end if
    if(x_w_r_c.gt.x_max) then
        x_w_r_c=mod(x_w_r_c,x_max);
    end if
    f_exact(:)=0;
    do i = 1,N+2
    x_pts(i)=x_pts(i-1)+dx;
    if((x_pts(i).gt.x_w_l_c).and.(x_pts(i).lt.x_w_r_c)) then
        f_exact(i)=1.0;
    end if
end do

call cip_csl3_1d(N,dx,dt,f,f_new,f_mid,f_bar,d_drv,c1_L,c2_L,c3_L,c1_R,c2_R,c3_R,u,u_bar);

call cip0_1d(a_i,b_i,cip0_f_old,cip0_f_x_old,cip0_f_new,cip0_f_x_new,cip0_x_pts,dx,dt,C_cip0,N+1);

!update
f(:)=f_new(:);

plot_mat(0:N+1,1)=f_bar;
plot_mat(1:N+1,2)=cip0_f_new;
plot_mat(:,3)=f_exact;

cip0_f_old=cip0_f_new;
cip0_f_x_old=cip0_f_x_new;


!update display
if (mod(t_itr,100).eq.0) then
call faglUpdate(plot_mat, status);!update the array display
end if


if (mod(t_itr,300).eq.0) then
WRITE (unit=5, fmt=*) '';
    do i = 1,N/2
        write (unit=5,fmt=100) t_itr*dt,x_pts(2*i),f(2*i),cip0_f_new(2*i),f_exact(2*i);
    end do
end if

end do

! end display
print *, "press any key to continue"
key = GETCHARQQ();
call faglEndWatch(plot_mat, status);
close(unit=5);

end program cip_csl3
!***********************************************************!

!***********************************************************!
SUBROUTINE cip_d_calc(N,dx,f,f_mid,d_drv)

integer::N;!grid sub-divisions
real(8)::dx;!grid spacing
real(8)::dt;!time step

real(8) ::  f(0:N+2);!the solution vector at t=tn
real(8) ::  f_mid(0:N+1);!the solution at i+1/2
real(8) ::  d_drv(0:N+1);!derivative at cell i+1/2

integer::i;
real(8):: S,S_p,d_tld,ov_dx;

ov_dx=1.0/dx;

i=1;
S=ov_dx*(f_mid(i)-f_mid(i-1));
do i=1,N
S_p=ov_dx*(f_mid(i+1)-f_mid(i));
!d_tld=ov_dx*(f(i+1)-f(i));
d_tld=0.5*(S_p+S);
call minmod(d_tld,2.0*S_p,2.0*S,d_drv(i));
d_drv(i)=1.2*d_drv(i);
S=S_p;
end do

!extrapolation b.c., change outside algorithm if something else is required
d_drv(0)=d_drv(1);d_drv(N+1)=d_drv(N);

end SUBROUTINE cip_d_calc

!***********************************************************!
SUBROUTINE cip_cs_calc(N,dx,f,f_bar,d_drv,c1_L,c2_L,c3_L,c1_R,c2_R,c3_R)
!calculate constants for cip_csl3 algorithm
integer::N;!grid sub-divisions
real(8)::dx;!grid spacing

        real(8) ::  f(0:N+2);!the solution vector at t=tn
        real(8) ::  f_bar(0:N+1);!average at cell i+1/2
        real(8) ::  d_drv(0:N+1);!derivative at cell i+1/2
real(8) ::  c1_L(1:N+1);!1st order cof for left of point i
real(8) ::  c2_L(1:N+1);;!2nd order cof for left of point i
real(8) ::  c3_L(1:N+1);;!3rd order cof for left of point i
real(8) ::  c1_R(1:N+1);!1st order cof for right of point i
real(8) ::  c2_R(1:N+1);;!2nd order cof for right of point i
real(8) ::  c3_R(1:N+1);;!3rd order cof for right of point i

integer::i;!counter
real(8)::ov_dx,ov_dx61,ov_dx62,ov_dx63,ov_dx32,ov_dx43,ov_dx42;

ov_dx=1.0/dx;
ov_dx61=6.0*ov_dx;ov_dx62=ov_dx61*ov_dx;ov_dx63=ov_dx62*ov_dx;
ov_dx32=ov_dx62*0.5;ov_dx42=4.0*ov_dx*ov_dx;ov_dx43=ov_dx42*ov_dx;

do i=1,N+1
c1_L(i)=-ov_dx61*f_bar(i-1)+ov_dx61*f(i)-2*d_drv(i-1);
c2_L(i)=-ov_dx62*f_bar(i-1)+ov_dx32*(3.0*f(i)-f(i-1))-ov_dx61*d_drv(i-1);
c3_L(i)=ov_dx43*(f(i)-f(i-1))-ov_dx42*d_drv(i-1);

c1_R(i)=ov_dx61*f_bar(i)-ov_dx61*f(i)-2*d_drv(i);
c2_R(i)=-ov_dx62*f_bar(i)+ov_dx32*(3.0*f(i)-f(i+1))+ov_dx61*d_drv(i);
c3_R(i)=-ov_dx43*(f(i)-f(i+1))-ov_dx42*d_drv(i);

end do

end SUBROUTINE cip_cs_calc
!*****************************************************************!

!*****************************************************************!
SUBROUTINE cip_f_calc(N,dx,dt,f,f_new,f_mid,f_bar,c1_L,c2_L,c3_L,c1_R,c2_R,c3_R,u,u_bar)
!calculate f using 3rd order polynomial using cip_csl3 algorithm
integer::N;!grid sub-divisions
real(8)::dx;!grid spacing
real(8)::dt;!time step

real(8) ::  f(0:N+2);!the solution vector at t=tn
real(8) ::  f_new(0:N+2);!the solution vector at t=tn
real(8) ::  f_mid(0:N+1);!the solution at i+1/2
real(8) ::  f_bar(0:N+1);!average at cell i+1/2
real(8) ::  c1_L(1:N+1);!1st order cof for left of point i
real(8) ::  c2_L(1:N+1);;!2nd order cof for left of point i
real(8) ::  c3_L(1:N+1);;!3rd order cof for left of point i
real(8) ::  c1_R(1:N+1);!1st order cof for right of point i
real(8) ::  c2_R(1:N+1);;!2nd order cof for right of point i
real(8) ::  c3_R(1:N+1);;!3rd order cof for right of point i
real(8) ::  u(0:N+2);!velocity at point i
real(8) ::  u_bar(0:N+1);!velocity at point i+1/2

integer::i;!counter
real(8)::zeta;!-u*dt
real(8)::zeta2,zeta3;
real(8)::dt_ov_dx;
real(8)::g_i,g_i_p1;
real(8)::zeta_p;!-u*dt
real(8)::zeta2_p,zeta3_p;

ov_dx=1.0/dx;
dt_ov_dx=dt*ov_dx;

! calculate new fi and g vector
do i=1,N+1
zeta=-u(i)*dt;zeta2=zeta*zeta;zeta3=zeta2*zeta;
if(u(i).gt.0) then
f_new(i)=f(i)+c1_L(i)*zeta+c2_L(i)*zeta2+c3_L(i)*zeta3;
else
f_new(i)=f(i)+c1_R(i)*zeta+c2_R(i)*zeta2+c3_R(i)*zeta3;
end if


f_new(i)=f_new(i)-dt_ov_dx*f_new(i)*(u_bar(i)-u_bar(i-1));
end do

!update mass
i=1;zeta=-u(i)*dt;zeta2=zeta*zeta;zeta3=zeta2*zeta;
g_i=-min(0.0,zeta)*(f(i)+0.5*c1_R(i)*zeta+0.333333333*c2_R(i)*zeta2+0.25*c3_R(i)*zeta3)&
     -max(0.0,zeta)*(f(i)+0.5*c1_L(i)*zeta+0.333333333*c2_L(i)*zeta2+0.25*c3_L(i)*zeta3);
do i=1,N
zeta_p=-u(i+1)*dt;zeta2_p=zeta_p*zeta_p;zeta3_p=zeta2_p*zeta_p;
g_i_p1=-min(0.0,zeta_p)*(f(i+1)+0.5*c1_R(i+1)*zeta_p+0.333333333*c2_R(i+1)*zeta2_p+0.25*c3_R(i+1)*zeta3_p)&
     -max(0.0,zeta_p)*(f(i+1)+0.5*c1_L(i+1)*zeta_p+0.333333333*c2_L(i+1)*zeta2_p+0.25*c3_L(i+1)*zeta3_p);
f_bar(i)=f_bar(i)-(g_i_p1-g_i)*ov_dx;
g_i=g_i_p1;
end do

!calculate the mid point values using mass
do i=1,N
    f_mid(i)=1.5*f_bar(i)-0.25*(f_new(i)+f_new(i+1));
end do

!extrapolation b.c., change outside algorithm if something else is required
f_new(0)=f_new(1);f_new(N+2)=f_new(N+1);
f_bar(0)=f_bar(1);f_bar(N+1)=f_bar(N);
f_mid(0)=f_mid(1);f_mid(N+1)=f_mid(N);

end SUBROUTINE cip_f_calc
!*****************************************************************!

!*****************************************************************!
SUBROUTINE cip_csl3_1d(N,dx,dt,f,f_new,f_mid,f_bar,d_drv,c1_L,c2_L,c3_L,c1_R,c2_R,c3_R,u,u_bar)

integer::N;!grid sub-divisions
real(8)::dx;!grid spacing
real(8)::dt;!time step

real(8) ::  f(0:N+2);!the solution vector at t=tn
real(8) ::  f_new(0:N+2);!the solution vector at t=tn
real(8) ::  f_mid(0:N+1);!the solution at i+1/2
real(8) ::  f_bar(0:N+1);!average at cell i+1/2
real(8) ::  d_drv(0:N+1);!derivative at cell i+1/2
real(8) ::  c1_L(1:N+1);!1st order cof for left of point i
real(8) ::  c2_L(1:N+1);;!2nd order cof for left of point i
real(8) ::  c3_L(1:N+1);;!3rd order cof for left of point i
real(8) ::  c1_R(1:N+1);!1st order cof for right of point i
real(8) ::  c2_R(1:N+1);;!2nd order cof for right of point i
real(8) ::  c3_R(1:N+1);;!3rd order cof for right of point i
real(8) ::  u(0:N+2);!velocity at point i
real(8) ::  u_bar(0:N+1);!velocity at point i+1/2

call cip_d_calc(N,dx,f,f_mid,d_drv);
call cip_cs_calc(N,dx,f,f_bar,d_drv,c1_L,c2_L,c3_L,c1_R,c2_R,c3_R);
call cip_f_calc(N,dx,dt,f,f_new,f_mid,f_bar,c1_L,c2_L,c3_L,c1_R,c2_R,c3_R,u,u_bar);

end subroutine cip_csl3_1d
!*****************************************************************!

!*****************************************************************!
SUBROUTINE minmod(a,b,c,r)
real(8)::a;
real(8)::b;
real(8)::c;
real(8)::r;!result of minmod function

real(8):: S;

!if((a.gt.0).and.(b.gt.0).and.(c.gt.0)) then
!r=min(a,b,c);
!else if ((a.lt.0).and.(b.lt.0).and.(c.lt.0)) then
!r=max(a,b,c);
!else
!r=0;
!end if
S=a/(abs(a)+epsilon(a));
r=S*max(0.0,min(abs(a),S*b,S*c))
end SUBROUTINE minmod
!*****************************************************************!


!*****************************************************************!
!CIP explicit solver uses scheme CIP0 described, but with a velocity vector
! in  T.Yabe and T. Aoki: A universal solver for hyperbolic equations
! by cubic polynomial interpolation, I. One-dimensional solver
! Computer Physics Communications, 66 , 219-232 (1991).
! important! periodic space b.c. assumed

SUBROUTINE cip0_1d(a_i,b_i,f_old,f_x_old,f_new,f_x_new,x_pts,dx,dt,C,sys_size)
! to be used in interpolation
! to be used in interpolation
!old solution at t = tn
!old partial derivative at t = tn
!new solution at t = tn
!new partial derivative at t = tn
!a vector for the x coordinate
!grid spacing
!time step
!vector of local velocities, since C is variable at each point
!integer representing length of all vectors passed


integer:: sys_size
real a_i(sys_size);real b_i(sys_size);real f_old(sys_size);real f_x_old(sys_size);
real f_new(sys_size);real f_x_new(sys_size);real x_pts(sys_size);real C(sys_size);

real(8) :: dx;
real(8) ::dt;!try to make consatnt later to make sure not changed

integer:: i,sub_i,int_Val;
real::delt;real::x;

real :: dx_2;!used frequentlty
real :: dx_3;!used frequentlty
real :: ov_dx;!used frequentlty
real :: ov_dx_2;!used frequentlty
real :: ov_dx_3;!used frequentlty
real :: cfl;!local cfl num

dx_2=dx*dx;dx_3=dx_2*dx;ov_dx=1.0/dx;ov_dx_2=1.0/dx_2;ov_dx_3=1.0/dx_3;



! calculate a_i and b_i and skip last point
a_b_loop:do i = 1,sys_size-1
        a_i(i)=(f_x_old(i)+f_x_old(i+1))*(ov_dx_2)+2.0*(f_old(i)-f_old(i+1))*(ov_dx_3);
                b_i(i)=3.0*(f_old(i+1)-f_old(i))*(ov_dx_2)-(2.0*f_x_old(i)+f_x_old(i+1))*(ov_dx);
end do a_b_loop


!now simply make the correct interpolation with the coefficents
new_f_fx:do i=1,sys_size

        cfl=-C(i)*dt*ov_dx;int_Val=floor(cfl);sub_i=i+int_Val;
                        if(sub_i.lt.1) then !inlet b.c. get from periodic condition
                        sub_i=sub_i+sys_size-1;x=x_pts(sub_i+1)-C(i)*dt;delt=x-x_pts(sub_i);

                        else if (sub_i.lt.sys_size) then
                        x=x_pts(i)-C(i)*dt;delt=x-x_pts(sub_i);

                        else
                        sub_i=sub_i-sys_size+1;x=x_pts(sub_i+1)-C(i)*dt;delt=x-x_pts(sub_i);

                        end if

        f_new(i)=((a_i(sub_i)*delt+b_i(sub_i))*delt+f_x_old(sub_i))*delt+f_old(sub_i);
        f_x_new(i)=(3.0*a_i(sub_i)*delt+2.0*b_i(sub_i))*delt+f_x_old(sub_i);

end do new_f_fx

END SUBROUTINE cip0_1d
!*****************************************************************!