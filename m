Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFEF39E802
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 22:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbhFGUHU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 16:07:20 -0400
Received: from mga05.intel.com ([192.55.52.43]:38694 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230353AbhFGUHU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Jun 2021 16:07:20 -0400
IronPort-SDR: p5zuoTlPmCPRWmp812nc6ej9zKVW76pTaMEHcRcgf3PVOrOwCojW283bmp+jx5lAoW7YW37KFB
 G2LbwjiTjC2A==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="290328587"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="290328587"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 13:05:28 -0700
IronPort-SDR: 59jw/2QbBI8WKdg9phxYRB1+MBXpsslxtSTjknm7mDEXHanOH5ufPp1Bt+N58nlB8sRGnc9e+z
 fZkR+56vo9aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="634830252"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 07 Jun 2021 13:05:27 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lqLV0-0008UH-DW; Mon, 07 Jun 2021 20:05:26 +0000
Date:   Tue, 08 Jun 2021 04:04:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 eb367d875f94a228c17c8538e3f2efcf2eb07ead
Message-ID: <60be7be3.w5H9ymdXu+QXscDd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: eb367d875f94a228c17c8538e3f2efcf2eb07ead  pinctrl: ralink: rt2880: avoid to error in calls is pin is already enabled

elapsed time: 730m

configs tested: 206
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7705_defconfig
um                             i386_defconfig
arc                            hsdk_defconfig
arm                          lpd270_defconfig
mips                  cavium_octeon_defconfig
arm                         lpc18xx_defconfig
mips                     decstation_defconfig
arm                          iop32x_defconfig
powerpc                   currituck_defconfig
powerpc                 canyonlands_defconfig
powerpc                   motionpro_defconfig
arm                          moxart_defconfig
sh                             sh03_defconfig
powerpc                     pseries_defconfig
m68k                        mvme147_defconfig
um                               alldefconfig
m68k                        m5407c3_defconfig
powerpc                     rainier_defconfig
arm                             rpc_defconfig
arm                            xcep_defconfig
sh                           sh2007_defconfig
h8300                            alldefconfig
arm                         s5pv210_defconfig
arm                         mv78xx0_defconfig
powerpc                     ksi8560_defconfig
openrisc                 simple_smp_defconfig
um                           x86_64_defconfig
powerpc                    sam440ep_defconfig
m68k                         amcore_defconfig
arm                           viper_defconfig
sh                     sh7710voipgw_defconfig
s390                          debug_defconfig
mips                             allyesconfig
mips                            e55_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                  mpc885_ads_defconfig
arm                         axm55xx_defconfig
powerpc                      katmai_defconfig
arm                        cerfcube_defconfig
sh                             shx3_defconfig
m68k                           sun3_defconfig
mips                     loongson2k_defconfig
mips                          rm200_defconfig
powerpc                 mpc8560_ads_defconfig
arm                           omap1_defconfig
sh                          sdk7780_defconfig
sparc64                          alldefconfig
h8300                    h8300h-sim_defconfig
s390                                defconfig
arm                           stm32_defconfig
ia64                         bigsur_defconfig
mips                            gpr_defconfig
xtensa                              defconfig
sh                        sh7785lcr_defconfig
openrisc                         alldefconfig
powerpc                    mvme5100_defconfig
mips                  decstation_64_defconfig
mips                          ath79_defconfig
powerpc                      ppc44x_defconfig
sh                   sh7724_generic_defconfig
powerpc                     tqm8555_defconfig
mips                       bmips_be_defconfig
um                            kunit_defconfig
arm                        mvebu_v7_defconfig
mips                       rbtx49xx_defconfig
microblaze                      mmu_defconfig
arm                     davinci_all_defconfig
mips                      malta_kvm_defconfig
arm                          ep93xx_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                        sh7757lcr_defconfig
alpha                            allyesconfig
powerpc                  mpc866_ads_defconfig
sh                 kfr2r09-romimage_defconfig
x86_64                           allyesconfig
arm                            lart_defconfig
mips                           ip32_defconfig
riscv                          rv32_defconfig
arm                        realview_defconfig
m68k                            mac_defconfig
x86_64                            allnoconfig
powerpc                     tqm8548_defconfig
powerpc                     tqm8540_defconfig
arm                           sunxi_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                    adder875_defconfig
x86_64                           alldefconfig
arm                            hisi_defconfig
mips                           gcw0_defconfig
arc                     haps_hs_smp_defconfig
sh                               alldefconfig
powerpc                      pmac32_defconfig
arm                          collie_defconfig
powerpc64                        alldefconfig
mips                  maltasmvp_eva_defconfig
sh                             espt_defconfig
powerpc                  iss476-smp_defconfig
powerpc                      pasemi_defconfig
sh                          r7780mp_defconfig
mips                           ci20_defconfig
sh                          rsk7264_defconfig
arm                             mxs_defconfig
powerpc                      ppc6xx_defconfig
riscv                    nommu_k210_defconfig
arc                              allyesconfig
h8300                     edosk2674_defconfig
mips                      pic32mzda_defconfig
arm                      jornada720_defconfig
nds32                             allnoconfig
mips                           jazz_defconfig
arm                        mvebu_v5_defconfig
arc                        nsimosci_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                    ge_imp3a_defconfig
arm                             ezx_defconfig
mips                           mtx1_defconfig
powerpc                          g5_defconfig
powerpc                     tqm8541_defconfig
mips                           rs90_defconfig
mips                        jmr3927_defconfig
arm                         assabet_defconfig
sh                              ul2_defconfig
mips                          rb532_defconfig
mips                         tb0226_defconfig
powerpc                     ppa8548_defconfig
arc                      axs103_smp_defconfig
powerpc                   lite5200b_defconfig
mips                       lemote2f_defconfig
s390                       zfcpdump_defconfig
arm                      footbridge_defconfig
sh                            hp6xx_defconfig
arm                         socfpga_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                        fsp2_defconfig
mips                   sb1250_swarm_defconfig
powerpc                     akebono_defconfig
powerpc                          allmodconfig
powerpc                 xes_mpc85xx_defconfig
powerpc               mpc834x_itxgp_defconfig
arc                           tb10x_defconfig
x86_64                              defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210607
i386                 randconfig-a006-20210607
i386                 randconfig-a004-20210607
i386                 randconfig-a001-20210607
i386                 randconfig-a002-20210607
i386                 randconfig-a005-20210607
x86_64               randconfig-a015-20210607
x86_64               randconfig-a011-20210607
x86_64               randconfig-a014-20210607
x86_64               randconfig-a012-20210607
x86_64               randconfig-a016-20210607
x86_64               randconfig-a013-20210607
i386                 randconfig-a015-20210607
i386                 randconfig-a011-20210607
i386                 randconfig-a012-20210607
i386                 randconfig-a013-20210607
i386                 randconfig-a016-20210607
i386                 randconfig-a014-20210607
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210607
x86_64               randconfig-a002-20210607
x86_64               randconfig-a004-20210607
x86_64               randconfig-a003-20210607
x86_64               randconfig-a006-20210607
x86_64               randconfig-a005-20210607
x86_64               randconfig-a001-20210607

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
