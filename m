Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC9542C8C4
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Oct 2021 20:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238512AbhJMShi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 14:37:38 -0400
Received: from mga01.intel.com ([192.55.52.88]:26396 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238539AbhJMShi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Oct 2021 14:37:38 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="250928363"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="250928363"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 11:35:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="480918303"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 13 Oct 2021 11:35:33 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1maj6C-0004yf-CH; Wed, 13 Oct 2021 18:35:32 +0000
Date:   Thu, 14 Oct 2021 02:34:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 b0b2303c02fee27662149153fba1f0e7de775b45
Message-ID: <616726d2.rXnk3OGgmh2Dsmo3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: b0b2303c02fee27662149153fba1f0e7de775b45  pinctrl: uniphier: Add UniPhier NX1 pinctrl driver

elapsed time: 1044m

configs tested: 173
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                              allyesconfig
i386                 randconfig-c001-20211013
um                           x86_64_defconfig
riscv                            allyesconfig
mips                             allyesconfig
um                             i386_defconfig
mips                             allmodconfig
riscv                            allmodconfig
sparc                            allyesconfig
sh                   sh7724_generic_defconfig
powerpc                     pseries_defconfig
xtensa                          iss_defconfig
arm                           sunxi_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                       m5249evb_defconfig
csky                             alldefconfig
mips                            e55_defconfig
arm                  colibri_pxa300_defconfig
powerpc                       maple_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                              ul2_defconfig
powerpc                      tqm8xx_defconfig
arm                        clps711x_defconfig
powerpc                        cell_defconfig
mips                 decstation_r4k_defconfig
arm                        multi_v7_defconfig
h8300                            allyesconfig
sh                             sh03_defconfig
powerpc                     asp8347_defconfig
riscv                    nommu_virt_defconfig
powerpc                      ppc6xx_defconfig
xtensa                  audio_kc705_defconfig
powerpc               mpc834x_itxgp_defconfig
m68k                          amiga_defconfig
mips                           xway_defconfig
m68k                         amcore_defconfig
arm                        mini2440_defconfig
arm                     eseries_pxa_defconfig
sh                           se7751_defconfig
arm                        spear6xx_defconfig
parisc                generic-32bit_defconfig
arm                          iop32x_defconfig
mips                        bcm47xx_defconfig
ia64                          tiger_defconfig
mips                        jmr3927_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                     mpc5200_defconfig
arm                      tct_hammer_defconfig
arm                         lpc32xx_defconfig
arm                       multi_v4t_defconfig
sh                        sh7785lcr_defconfig
powerpc                    sam440ep_defconfig
mips                           ip28_defconfig
sh                           se7724_defconfig
sparc                       sparc64_defconfig
mips                          ath25_defconfig
arc                    vdk_hs38_smp_defconfig
arc                              alldefconfig
arm                           tegra_defconfig
mips                   sb1250_swarm_defconfig
arm                         s3c6400_defconfig
powerpc                    klondike_defconfig
arm                        magician_defconfig
mips                           ip32_defconfig
powerpc                     tqm5200_defconfig
powerpc                 linkstation_defconfig
sh                   secureedge5410_defconfig
powerpc                       ppc64_defconfig
mips                         cobalt_defconfig
arm                         lpc18xx_defconfig
arc                        vdk_hs38_defconfig
mips                     loongson2k_defconfig
arm                           u8500_defconfig
powerpc                       holly_defconfig
um                                  defconfig
arc                          axs101_defconfig
arm                         at91_dt_defconfig
sh                        edosk7705_defconfig
arm                  randconfig-c002-20211012
i386                 randconfig-c001-20211012
x86_64               randconfig-c001-20211012
arm                  randconfig-c002-20211013
x86_64               randconfig-c001-20211013
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
xtensa                           allyesconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20211012
i386                 randconfig-a003-20211012
i386                 randconfig-a004-20211012
i386                 randconfig-a005-20211012
i386                 randconfig-a002-20211012
i386                 randconfig-a006-20211012
x86_64               randconfig-a015-20211013
x86_64               randconfig-a012-20211013
x86_64               randconfig-a016-20211013
x86_64               randconfig-a014-20211013
x86_64               randconfig-a013-20211013
x86_64               randconfig-a011-20211013
i386                 randconfig-a016-20211013
i386                 randconfig-a014-20211013
i386                 randconfig-a011-20211013
i386                 randconfig-a015-20211013
i386                 randconfig-a012-20211013
i386                 randconfig-a013-20211013
arc                  randconfig-r043-20211012
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
arm                  randconfig-c002-20211013
mips                 randconfig-c004-20211013
i386                 randconfig-c001-20211013
s390                 randconfig-c005-20211013
x86_64               randconfig-c007-20211013
powerpc              randconfig-c003-20211013
riscv                randconfig-c006-20211013
x86_64               randconfig-a004-20211013
x86_64               randconfig-a006-20211013
x86_64               randconfig-a001-20211013
x86_64               randconfig-a005-20211013
x86_64               randconfig-a002-20211013
x86_64               randconfig-a003-20211013
i386                 randconfig-a001-20211013
i386                 randconfig-a003-20211013
i386                 randconfig-a004-20211013
i386                 randconfig-a005-20211013
i386                 randconfig-a002-20211013
i386                 randconfig-a006-20211013
x86_64               randconfig-a015-20211012
x86_64               randconfig-a012-20211012
x86_64               randconfig-a016-20211012
x86_64               randconfig-a014-20211012
x86_64               randconfig-a013-20211012
x86_64               randconfig-a011-20211012
hexagon              randconfig-r041-20211012
s390                 randconfig-r044-20211012
riscv                randconfig-r042-20211012
hexagon              randconfig-r045-20211012
hexagon              randconfig-r041-20211013
hexagon              randconfig-r045-20211013

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
