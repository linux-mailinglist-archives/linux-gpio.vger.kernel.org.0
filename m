Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE3D43D450D
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jul 2021 07:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbhGXE2p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Jul 2021 00:28:45 -0400
Received: from mga11.intel.com ([192.55.52.93]:55942 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229730AbhGXE2o (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 24 Jul 2021 00:28:44 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="208877834"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; 
   d="scan'208";a="208877834"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2021 22:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; 
   d="scan'208";a="660425708"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jul 2021 22:09:16 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m79uV-0002xX-Jk; Sat, 24 Jul 2021 05:09:15 +0000
Date:   Sat, 24 Jul 2021 13:08:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 798a315fc359aa6dbe48e09d802aa59b7e158ffc
Message-ID: <60fba03c.I7th/SfwF0J+OUhq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 798a315fc359aa6dbe48e09d802aa59b7e158ffc  pinctrl: mediatek: Fix fallback behavior for bias_set_combo

elapsed time: 722m

configs tested: 138
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210723
arc                     haps_hs_smp_defconfig
powerpc                    klondike_defconfig
arm                         vf610m4_defconfig
mips                       rbtx49xx_defconfig
sh                        dreamcast_defconfig
m68k                          sun3x_defconfig
arm                          collie_defconfig
powerpc                      makalu_defconfig
powerpc                 mpc834x_itx_defconfig
mips                         bigsur_defconfig
sh                ecovec24-romimage_defconfig
powerpc                      bamboo_defconfig
arm                           tegra_defconfig
powerpc                 mpc837x_mds_defconfig
sh                           se7750_defconfig
mips                  maltasmvp_eva_defconfig
arm                       imx_v6_v7_defconfig
mips                           ip22_defconfig
powerpc                     redwood_defconfig
mips                      bmips_stb_defconfig
arc                           tb10x_defconfig
powerpc                 mpc836x_rdk_defconfig
sh                         ap325rxa_defconfig
powerpc                      pasemi_defconfig
arm                         s3c6400_defconfig
powerpc                      acadia_defconfig
um                                  defconfig
arm                          moxart_defconfig
powerpc               mpc834x_itxgp_defconfig
sparc64                             defconfig
arc                        nsim_700_defconfig
powerpc                     ppa8548_defconfig
openrisc                  or1klitex_defconfig
sh                          r7785rp_defconfig
h8300                            alldefconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                      ep88xc_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                 linkstation_defconfig
m68k                          amiga_defconfig
arm                         orion5x_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                      katmai_defconfig
powerpc                     tqm8548_defconfig
powerpc                      walnut_defconfig
sh                           se7619_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
x86_64                            allnoconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210723
i386                 randconfig-a003-20210723
i386                 randconfig-a004-20210723
i386                 randconfig-a002-20210723
i386                 randconfig-a001-20210723
i386                 randconfig-a006-20210723
i386                 randconfig-a005-20210724
i386                 randconfig-a003-20210724
i386                 randconfig-a004-20210724
i386                 randconfig-a002-20210724
i386                 randconfig-a001-20210724
i386                 randconfig-a006-20210724
x86_64               randconfig-a011-20210723
x86_64               randconfig-a016-20210723
x86_64               randconfig-a013-20210723
x86_64               randconfig-a014-20210723
x86_64               randconfig-a012-20210723
x86_64               randconfig-a015-20210723
i386                 randconfig-a016-20210723
i386                 randconfig-a013-20210723
i386                 randconfig-a012-20210723
i386                 randconfig-a011-20210723
i386                 randconfig-a014-20210723
i386                 randconfig-a015-20210723
i386                 randconfig-a016-20210724
i386                 randconfig-a013-20210724
i386                 randconfig-a012-20210724
i386                 randconfig-a014-20210724
i386                 randconfig-a011-20210724
i386                 randconfig-a015-20210724
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210723
x86_64               randconfig-c001-20210724
x86_64               randconfig-b001-20210723
x86_64               randconfig-a003-20210723
x86_64               randconfig-a006-20210723
x86_64               randconfig-a001-20210723
x86_64               randconfig-a005-20210723
x86_64               randconfig-a004-20210723
x86_64               randconfig-a002-20210723

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
