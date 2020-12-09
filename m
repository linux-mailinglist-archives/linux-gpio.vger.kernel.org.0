Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C532E2D4B61
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 21:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388274AbgLIUPq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 15:15:46 -0500
Received: from mga02.intel.com ([134.134.136.20]:13009 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388163AbgLIUPY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Dec 2020 15:15:24 -0500
IronPort-SDR: SrXhxwYwPHnI2nCi2ELu0G/mDlhOihkPrshC4cyJCNl6da/O4vo0V4WBmGNv8H9TtCPJ1GtsW0
 hR9s1G6XCG6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="161192157"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="scan'208";a="161192157"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 12:14:41 -0800
IronPort-SDR: l5pONSkzIdN02vqBNVCB+p16RTrAMjJe2tR7/hosbfF3oH0+lzi4UdRSJhKDg6VK3aJySodLOy
 NYsHDT0vrd9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="scan'208";a="484141394"
Received: from lkp-server01.sh.intel.com (HELO 2bbb63443648) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Dec 2020 12:14:40 -0800
Received: from kbuild by 2bbb63443648 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kn5rD-0000Qt-EZ; Wed, 09 Dec 2020 20:14:39 +0000
Date:   Thu, 10 Dec 2020 04:14:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 e8873c0afd34beb67ec492cd648dd0095b911f65
Message-ID: <5fd13015.EZHYr2fM7YGJ7GVU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  fixes
branch HEAD: e8873c0afd34beb67ec492cd648dd0095b911f65  pinctrl: intel: Actually disable Tx and Rx buffers on GPIO request

elapsed time: 722m

configs tested: 135
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                       m5475evb_defconfig
m68k                        m5407c3_defconfig
sh                            titan_defconfig
sh                          r7785rp_defconfig
powerpc                     mpc512x_defconfig
arm                            mps2_defconfig
powerpc                         ps3_defconfig
arm                            qcom_defconfig
sh                             espt_defconfig
alpha                               defconfig
sh                            shmin_defconfig
arm                         orion5x_defconfig
powerpc                    sam440ep_defconfig
alpha                            alldefconfig
mips                        bcm63xx_defconfig
powerpc                     rainier_defconfig
powerpc                     tqm8555_defconfig
ia64                         bigsur_defconfig
mips                      loongson3_defconfig
mips                           gcw0_defconfig
sh                          kfr2r09_defconfig
sh                           se7724_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                           viper_defconfig
arm                         socfpga_defconfig
arm                        vexpress_defconfig
sh                                  defconfig
arm                       imx_v6_v7_defconfig
arm                            mmp2_defconfig
alpha                            allyesconfig
mips                      pistachio_defconfig
sh                           se7751_defconfig
powerpc                       holly_defconfig
arm                           h5000_defconfig
sh                            migor_defconfig
powerpc                    socrates_defconfig
powerpc                    klondike_defconfig
riscv                             allnoconfig
arm                           tegra_defconfig
powerpc                     tqm8541_defconfig
m68k                             alldefconfig
arm                          ep93xx_defconfig
arm                        cerfcube_defconfig
arm                       multi_v4t_defconfig
mips                         bigsur_defconfig
arm                          pxa168_defconfig
powerpc                 xes_mpc85xx_defconfig
m68k                       bvme6000_defconfig
sh                           se7619_defconfig
openrisc                            defconfig
m68k                           sun3_defconfig
arm                        multi_v7_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                             mxs_defconfig
powerpc                      ppc40x_defconfig
powerpc                     mpc83xx_defconfig
m68k                        m5272c3_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                        sh7785lcr_defconfig
sh                      rts7751r2d1_defconfig
mips                           xway_defconfig
mips                         cobalt_defconfig
mips                        nlm_xlp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201209
i386                 randconfig-a005-20201209
i386                 randconfig-a001-20201209
i386                 randconfig-a002-20201209
i386                 randconfig-a006-20201209
i386                 randconfig-a003-20201209
x86_64               randconfig-a016-20201209
x86_64               randconfig-a012-20201209
x86_64               randconfig-a013-20201209
x86_64               randconfig-a014-20201209
x86_64               randconfig-a015-20201209
x86_64               randconfig-a011-20201209
i386                 randconfig-a013-20201209
i386                 randconfig-a014-20201209
i386                 randconfig-a011-20201209
i386                 randconfig-a015-20201209
i386                 randconfig-a012-20201209
i386                 randconfig-a016-20201209
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201209
x86_64               randconfig-a006-20201209
x86_64               randconfig-a005-20201209
x86_64               randconfig-a001-20201209
x86_64               randconfig-a002-20201209
x86_64               randconfig-a003-20201209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
