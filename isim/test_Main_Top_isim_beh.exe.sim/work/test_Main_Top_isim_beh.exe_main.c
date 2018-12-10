/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000000856108620_2162769083_init();
    work_m_00000000003287673238_1646321858_init();
    work_m_00000000000991166831_1443368077_init();
    work_m_00000000000603778462_2416430527_init();
    work_m_00000000000343774634_4192863159_init();
    work_m_00000000000343774634_1881146988_init();
    work_m_00000000001121772468_1814517970_init();
    work_m_00000000001121772468_3357928012_init();
    work_m_00000000003266776945_3207835014_init();
    work_m_00000000004158152784_3476124008_init();
    work_m_00000000002272322796_3100618303_init();
    work_m_00000000000138931144_2051745690_init();
    work_m_00000000000589322914_0268338090_init();
    work_m_00000000003497813658_1677880028_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003497813658_1677880028");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
