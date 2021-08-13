Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE243EAFB9
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 07:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237146AbhHMFju (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 01:39:50 -0400
Received: from mga17.intel.com ([192.55.52.151]:22934 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229654AbhHMFjt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Aug 2021 01:39:49 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="195777317"
X-IronPort-AV: E=Sophos;i="5.84,318,1620716400"; 
   d="scan'208";a="195777317"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2021 22:39:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,318,1620716400"; 
   d="scan'208";a="508029132"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 Aug 2021 22:39:13 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mEPuT-000NMG-1R; Fri, 13 Aug 2021 05:39:13 +0000
Date:   Fri, 13 Aug 2021 13:38:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 c4b68e513953c3370ce02c3208c1c628c0b86fd3
Message-ID: <6116056d.FvW8iWK8T/W9E4LN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: c4b68e513953c3370ce02c3208c1c628c0b86fd3  pinctrl: amd: Fix an issue with shutdown when system set to s0ix

elapsed time: 1215m

configs tested: 130
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210812
i386                 randconfig-c001-20210813
arm                    vt8500_v6_v7_defconfig
openrisc                            defconfig
powerpc                     taishan_defconfig
ia64                             alldefconfig
powerpc                     ppa8548_defconfig
sh                          polaris_defconfig
powerpc                      bamboo_defconfig
powerpc                       holly_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                        cell_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                        workpad_defconfig
parisc                generic-32bit_defconfig
xtensa                  audio_kc705_defconfig
arc                     nsimosci_hs_defconfig
sh                        sh7757lcr_defconfig
mips                        bcm63xx_defconfig
sh                   sh7724_generic_defconfig
powerpc                 mpc8540_ads_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          simpad_defconfig
riscv                    nommu_k210_defconfig
m68k                       m5208evb_defconfig
x86_64                           alldefconfig
powerpc                     pseries_defconfig
mips                            gpr_defconfig
mips                      maltaaprp_defconfig
m68k                        mvme147_defconfig
mips                         tb0226_defconfig
mips                  decstation_64_defconfig
arm                      jornada720_defconfig
s390                          debug_defconfig
openrisc                  or1klitex_defconfig
arc                    vdk_hs38_smp_defconfig
csky                                defconfig
mips                           ip32_defconfig
xtensa                              defconfig
arm                         socfpga_defconfig
mips                      malta_kvm_defconfig
arm                            hisi_defconfig
x86_64                            allnoconfig
m68k                        m5272c3_defconfig
m68k                                defconfig
sh                          landisk_defconfig
arm                             mxs_defconfig
mips                           ci20_defconfig
mips                           ip22_defconfig
arc                        vdk_hs38_defconfig
riscv                    nommu_virt_defconfig
arm                      pxa255-idp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
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
x86_64               randconfig-a006-20210812
x86_64               randconfig-a004-20210812
x86_64               randconfig-a003-20210812
x86_64               randconfig-a005-20210812
x86_64               randconfig-a002-20210812
x86_64               randconfig-a001-20210812
i386                 randconfig-a004-20210812
i386                 randconfig-a003-20210812
i386                 randconfig-a002-20210812
i386                 randconfig-a001-20210812
i386                 randconfig-a006-20210812
i386                 randconfig-a005-20210812
i386                 randconfig-a004-20210811
i386                 randconfig-a001-20210811
i386                 randconfig-a002-20210811
i386                 randconfig-a003-20210811
i386                 randconfig-a006-20210811
i386                 randconfig-a005-20210811
i386                 randconfig-a011-20210812
i386                 randconfig-a015-20210812
i386                 randconfig-a013-20210812
i386                 randconfig-a014-20210812
i386                 randconfig-a016-20210812
i386                 randconfig-a012-20210812
riscv                            allyesconfig
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
x86_64               randconfig-c001-20210812
x86_64               randconfig-a011-20210812
x86_64               randconfig-a013-20210812
x86_64               randconfig-a012-20210812
x86_64               randconfig-a016-20210812
x86_64               randconfig-a015-20210812
x86_64               randconfig-a014-20210812

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
