program HelloWorld
  use omp_lib
  implicit none 
  integer :: ID , p, TID
  double precision :: t_start, t_end, t
  t_start = omp_get_wtime()
  !$omp parallel 

    p = omp_get_num_threads()
    ID = omp_get_thread_num()
    TID = 0
    write (*,*) 'Hello world from thread ', ID , p
  !$omp end parallel 
  t_end = omp_get_wtime()
  t = t_start - t_end
  write(*,*) 'exec time = ', t
end program HelloWorld
