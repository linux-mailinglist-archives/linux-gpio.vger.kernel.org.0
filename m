Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76536458E5D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 13:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233240AbhKVMd5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 07:33:57 -0500
Received: from mga02.intel.com ([134.134.136.20]:39579 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234228AbhKVMd5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Nov 2021 07:33:57 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="221997301"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; 
   d="scan'208";a="221997301"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2021 04:30:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; 
   d="scan'208";a="674048912"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 22 Nov 2021 04:30:49 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mp8TA-0000AE-EW; Mon, 22 Nov 2021 12:30:48 +0000
Date:   Mon, 22 Nov 2021 20:30:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 dc8df6523eceb189e7205873aa6307f16515fac8
Message-ID: <619b8d60.G2va4ORpAhNlUuBM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: dc8df6523eceb189e7205873aa6307f16515fac8  pinctrl: mediatek: fix global-out-of-bounds issue

elapsed time: 727m

configs tested: 192
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211122
mips                 randconfig-c004-20211122
parisc                           alldefconfig
m68k                       m5208evb_defconfig
arm                            pleb_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                  mpc885_ads_defconfig
sh                           se7705_defconfig
mips                         tb0219_defconfig
mips                       bmips_be_defconfig
powerpc                     mpc83xx_defconfig
sh                             shx3_defconfig
sh                           se7722_defconfig
arm                          iop32x_defconfig
powerpc                      ppc40x_defconfig
mips                  cavium_octeon_defconfig
sh                           se7750_defconfig
mips                malta_qemu_32r6_defconfig
ia64                        generic_defconfig
mips                           ci20_defconfig
powerpc                     mpc5200_defconfig
powerpc                   bluestone_defconfig
arm                         at91_dt_defconfig
arm                           stm32_defconfig
parisc                generic-32bit_defconfig
arm                         axm55xx_defconfig
i386                             alldefconfig
arm                            mmp2_defconfig
arm                           u8500_defconfig
um                             i386_defconfig
arc                         haps_hs_defconfig
sh                          sdk7786_defconfig
powerpc                      ppc44x_defconfig
arm                        multi_v7_defconfig
m68k                          multi_defconfig
powerpc                 mpc8540_ads_defconfig
arc                            hsdk_defconfig
m68k                         amcore_defconfig
alpha                               defconfig
arm                        neponset_defconfig
sh                            hp6xx_defconfig
powerpc                      arches_defconfig
arm                           tegra_defconfig
sh                     sh7710voipgw_defconfig
sh                        sh7785lcr_defconfig
sh                             sh03_defconfig
sh                        dreamcast_defconfig
openrisc                 simple_smp_defconfig
arm                        trizeps4_defconfig
sh                           se7206_defconfig
sh                   sh7724_generic_defconfig
powerpc                 mpc8313_rdb_defconfig
m68k                        m5272c3_defconfig
xtensa                         virt_defconfig
powerpc               mpc834x_itxgp_defconfig
ia64                             alldefconfig
arm                          lpd270_defconfig
arm                         orion5x_defconfig
m68k                                defconfig
powerpc                      pasemi_defconfig
powerpc                     ep8248e_defconfig
m68k                       bvme6000_defconfig
arm                     am200epdkit_defconfig
arm                        spear6xx_defconfig
riscv                             allnoconfig
nios2                               defconfig
mips                           ip28_defconfig
arm                             rpc_defconfig
mips                            e55_defconfig
arc                                 defconfig
m68k                       m5475evb_defconfig
powerpc                      mgcoge_defconfig
powerpc                     tqm8548_defconfig
sh                   rts7751r2dplus_defconfig
i386                             allyesconfig
powerpc                    ge_imp3a_defconfig
sh                         ap325rxa_defconfig
openrisc                  or1klitex_defconfig
arm                            xcep_defconfig
x86_64                              defconfig
sh                                  defconfig
mips                     cu1830-neo_defconfig
m68k                       m5275evb_defconfig
arm                         vf610m4_defconfig
sh                        edosk7705_defconfig
mips                         rt305x_defconfig
arm                       imx_v4_v5_defconfig
arm                           corgi_defconfig
powerpc                     pq2fads_defconfig
mips                            ar7_defconfig
arc                          axs103_defconfig
mips                        workpad_defconfig
arm                         bcm2835_defconfig
sh                               j2_defconfig
riscv                            alldefconfig
mips                 decstation_r4k_defconfig
sh                          rsk7264_defconfig
mips                           xway_defconfig
arm                         nhk8815_defconfig
powerpc                 mpc836x_rdk_defconfig
m68k                        mvme16x_defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                           alldefconfig
parisc                generic-64bit_defconfig
arm                       netwinder_defconfig
powerpc                      ppc6xx_defconfig
xtensa                       common_defconfig
mips                      maltaaprp_defconfig
sh                          urquell_defconfig
arm                      tct_hammer_defconfig
sh                         apsh4a3a_defconfig
powerpc                     asp8347_defconfig
powerpc                      makalu_defconfig
arm                  randconfig-c002-20211122
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a014-20211122
x86_64               randconfig-a011-20211122
x86_64               randconfig-a012-20211122
x86_64               randconfig-a016-20211122
x86_64               randconfig-a013-20211122
x86_64               randconfig-a015-20211122
i386                 randconfig-a016-20211122
i386                 randconfig-a015-20211122
i386                 randconfig-a012-20211122
i386                 randconfig-a013-20211122
i386                 randconfig-a014-20211122
i386                 randconfig-a011-20211122
arc                  randconfig-r043-20211122
s390                 randconfig-r044-20211122
riscv                randconfig-r042-20211122
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20211122
i386                 randconfig-c001-20211122
powerpc              randconfig-c003-20211122
riscv                randconfig-c006-20211122
arm                  randconfig-c002-20211122
x86_64               randconfig-c007-20211122
mips                 randconfig-c004-20211122
x86_64               randconfig-a001-20211122
x86_64               randconfig-a003-20211122
x86_64               randconfig-a006-20211122
x86_64               randconfig-a004-20211122
x86_64               randconfig-a005-20211122
x86_64               randconfig-a002-20211122
i386                 randconfig-a001-20211122
i386                 randconfig-a002-20211122
i386                 randconfig-a005-20211122
i386                 randconfig-a006-20211122
i386                 randconfig-a004-20211122
i386                 randconfig-a003-20211122
hexagon              randconfig-r041-20211122
hexagon              randconfig-r045-20211122

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
