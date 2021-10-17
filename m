Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0673C430867
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Oct 2021 13:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245541AbhJQLj7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Oct 2021 07:39:59 -0400
Received: from mga05.intel.com ([192.55.52.43]:55484 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245539AbhJQLj6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 17 Oct 2021 07:39:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10139"; a="314303760"
X-IronPort-AV: E=Sophos;i="5.85,380,1624345200"; 
   d="scan'208";a="314303760"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2021 04:37:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,380,1624345200"; 
   d="scan'208";a="443742988"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Oct 2021 04:37:47 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mc4U6-000AHK-QS; Sun, 17 Oct 2021 11:37:46 +0000
Date:   Sun, 17 Oct 2021 19:37:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 c3efe04533a900cef767f680a525f48f2f642ede
Message-ID: <616c0ae2.g16Qq42HnsArvJyI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: c3efe04533a900cef767f680a525f48f2f642ede  dt-bindings: pinctrl: convert rockchip,pinctrl.txt to YAML

elapsed time: 722m

configs tested: 152
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
h8300                       h8s-sim_defconfig
arc                     haps_hs_smp_defconfig
powerpc                     tqm5200_defconfig
sh                             sh03_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                         axm55xx_defconfig
sh                          landisk_defconfig
arm                           tegra_defconfig
arm                        oxnas_v6_defconfig
arm                         orion5x_defconfig
riscv                    nommu_k210_defconfig
nios2                         10m50_defconfig
sh                   sh7770_generic_defconfig
mips                          rb532_defconfig
arc                          axs103_defconfig
powerpc                       ebony_defconfig
s390                             alldefconfig
sh                        dreamcast_defconfig
openrisc                 simple_smp_defconfig
sh                          sdk7786_defconfig
m68k                       bvme6000_defconfig
arm                     am200epdkit_defconfig
powerpc                      chrp32_defconfig
mips                     loongson1b_defconfig
mips                           xway_defconfig
ia64                        generic_defconfig
arm                           h5000_defconfig
mips                        workpad_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                      ppc6xx_defconfig
h8300                               defconfig
ia64                      gensparse_defconfig
arc                         haps_hs_defconfig
arm                        keystone_defconfig
arm                  colibri_pxa270_defconfig
sh                        edosk7705_defconfig
sh                         ap325rxa_defconfig
sh                           se7751_defconfig
m68k                        m5272c3_defconfig
arm                           viper_defconfig
powerpc                          allyesconfig
sparc64                             defconfig
mips                            e55_defconfig
powerpc                     kmeter1_defconfig
powerpc                    adder875_defconfig
arm                             mxs_defconfig
m68k                          hp300_defconfig
powerpc                   bluestone_defconfig
powerpc                    mvme5100_defconfig
arm                          ep93xx_defconfig
arm                            zeus_defconfig
arm                         s5pv210_defconfig
mips                             allmodconfig
m68k                                defconfig
powerpc                     ep8248e_defconfig
powerpc                     sequoia_defconfig
sh                     magicpanelr2_defconfig
riscv                               defconfig
microblaze                      mmu_defconfig
mips                     cu1000-neo_defconfig
arm                          pcm027_defconfig
arc                           tb10x_defconfig
h8300                            allyesconfig
mips                           gcw0_defconfig
powerpc                  iss476-smp_defconfig
powerpc                  mpc866_ads_defconfig
sh                 kfr2r09-romimage_defconfig
arc                 nsimosci_hs_smp_defconfig
ia64                          tiger_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                  randconfig-c002-20211017
i386                 randconfig-c001-20211017
x86_64               randconfig-c001-20211017
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a012-20211017
x86_64               randconfig-a015-20211017
x86_64               randconfig-a016-20211017
x86_64               randconfig-a014-20211017
x86_64               randconfig-a011-20211017
x86_64               randconfig-a013-20211017
i386                 randconfig-a016-20211017
i386                 randconfig-a014-20211017
i386                 randconfig-a011-20211017
i386                 randconfig-a015-20211017
i386                 randconfig-a012-20211017
i386                 randconfig-a013-20211017
arc                  randconfig-r043-20211017
s390                 randconfig-r044-20211017
riscv                randconfig-r042-20211017
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
mips                 randconfig-c004-20211017
arm                  randconfig-c002-20211017
i386                 randconfig-c001-20211017
s390                 randconfig-c005-20211017
x86_64               randconfig-c007-20211017
powerpc              randconfig-c003-20211017
riscv                randconfig-c006-20211017
x86_64               randconfig-a006-20211017
x86_64               randconfig-a004-20211017
x86_64               randconfig-a001-20211017
x86_64               randconfig-a005-20211017
x86_64               randconfig-a002-20211017
x86_64               randconfig-a003-20211017
i386                 randconfig-a003-20211017
i386                 randconfig-a001-20211017
i386                 randconfig-a005-20211017
i386                 randconfig-a004-20211017
i386                 randconfig-a002-20211017
i386                 randconfig-a006-20211017
hexagon              randconfig-r041-20211017
hexagon              randconfig-r045-20211017

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
