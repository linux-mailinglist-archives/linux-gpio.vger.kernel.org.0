Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C510839E804
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 22:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbhFGUHX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 16:07:23 -0400
Received: from mga09.intel.com ([134.134.136.24]:49564 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230353AbhFGUHW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Jun 2021 16:07:22 -0400
IronPort-SDR: DdzrbekKzHjLTLXEOa/cDsvGDRHdIIZg0+oj/etwWsc/cE8j/vAus4hUR0VaXsdwCpy2fzOj4i
 vzlca+XYy5Hw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204668503"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="204668503"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 13:05:29 -0700
IronPort-SDR: R6z+RTcZoFCJzMR1G6d2nKsuRTBcxuDjSwt3dfBj1ya9SK/MPpD8TmI/7Hd8AiEr94RoaBygUB
 30jgJwIaeIDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="552006592"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2021 13:05:27 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lqLV0-0008UO-Em; Mon, 07 Jun 2021 20:05:26 +0000
Date:   Tue, 08 Jun 2021 04:04:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 a49a8717d8693b339fb2b62e5846286d6126de7d
Message-ID: <60be7bde.fZ7Ai9wHfq4toFrT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: a49a8717d8693b339fb2b62e5846286d6126de7d  pinctrl: ralink: move RT288X SoC pinmux config into a new 'pinctrl-rt288x.c' file

elapsed time: 730m

configs tested: 188
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                   motionpro_defconfig
arm                          moxart_defconfig
sh                             sh03_defconfig
powerpc                     pseries_defconfig
m68k                        mvme147_defconfig
um                               alldefconfig
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
arc                            hsdk_defconfig
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
riscv                    nommu_virt_defconfig
arm                        mvebu_v7_defconfig
mips                       rbtx49xx_defconfig
powerpc                   currituck_defconfig
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
mips                           gcw0_defconfig
arc                     haps_hs_smp_defconfig
sh                               alldefconfig
powerpc                      pmac32_defconfig
arm                          collie_defconfig
powerpc64                        alldefconfig
mips                  maltasmvp_eva_defconfig
sh                             espt_defconfig
x86_64                           alldefconfig
powerpc                  iss476-smp_defconfig
powerpc                      pasemi_defconfig
sh                          r7780mp_defconfig
mips                           ci20_defconfig
sh                          rsk7264_defconfig
arm                             mxs_defconfig
powerpc                      ppc6xx_defconfig
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
powerpc                     tqm8541_defconfig
mips                           rs90_defconfig
mips                        jmr3927_defconfig
arm                         assabet_defconfig
sh                              ul2_defconfig
arc                      axs103_smp_defconfig
powerpc                   lite5200b_defconfig
mips                         tb0226_defconfig
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
powerpc                 canyonlands_defconfig
arm                          lpd270_defconfig
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
arc                              allyesconfig
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
i386                 randconfig-a013-20210607
i386                 randconfig-a011-20210607
i386                 randconfig-a016-20210607
i386                 randconfig-a014-20210607
i386                 randconfig-a012-20210607
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
um                             i386_defconfig
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
