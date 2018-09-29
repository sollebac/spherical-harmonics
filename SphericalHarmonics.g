##set term postscript eps
##set output "SphericalHarmonics.eps"
set autoscale                    # scale axes automatically
    unset log                    # remove any log-scaling
    unset label                  # remove any previous labels
    set xtic auto                # set xtics automatically
    set ytic auto                # set ytics automatically
splot "fort.30" w d
pause -1 "Hit return to continue..."

# archivo que necesita ylm_exe
# /home/jl/UTILS/mywork/src_sphericalharmonics_exe/src_sphericalharmonics.f# 90 
# sin este no puede dibujar
