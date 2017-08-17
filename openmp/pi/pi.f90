! This program will numerically compute the integral of
!
!                  4/(1+x*x) 
!				  
!from 0 to 1.  The value of this integral is pi -- which 
!is great since it gives us an easy way to check the answer.
!
!The is the original sequential program.  It uses the timer
!from the OpenMP runtime library
!

program calculatepi
  use omp_lib
  
  implicit none

  integer :: i, num_steps, pid, p 
  double precision :: estimate, sum2, x, step, start_time, run_time, first, last
  double precision, allocatable :: local_sum(:)

  sum2 = 0.0D+00
  num_steps = 100000000
  
  start_time = omp_get_wtime()
  step = 1/ dble(num_steps)
  allocate(local_sum(64))

  !$omp parallel private(pid, i,x,first,last) shared(p, local_sum,step, num_steps)
   pid = omp_get_thread_num() 
   
   p = omp_get_num_threads() 
   
   !if (pid == 0) then
   !  allocate(local_sum(p))
   !  write(*,*) 'local_sum allocated', pid, p
   !end if
   !!!$omp barrier
   
   first = (num_steps/p) * pid
   last =  (num_steps/p) * (pid+1) -1
   
   local_sum(pid) = 0.0;
    do i = first, last
      x = (i-0.5)*step
      local_sum(pid) = local_sum(pid) + 4.0D+00 / ( 1.0D+00 + x**2 )
    end do
   write(*,*) 'local_sum', pid, 'is', local_sum(pid)
  
  !$omp end parallel 
  

  estimate =  step* sum(local_sum(:))
  run_time = omp_get_wtime() - start_time
  write (*,*) 'pi with ', num_steps, 'steps is ', estimate, 'in ', run_time, ' seconds'
 

end program calculatepi
