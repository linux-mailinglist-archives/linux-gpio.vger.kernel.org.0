Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28C932C803
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355754AbhCDAd2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:33:28 -0500
Received: from mga18.intel.com ([134.134.136.126]:60709 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352309AbhCCVmp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Mar 2021 16:42:45 -0500
IronPort-SDR: kHOJLTXPqRDM1FM9wKq7eHakHDjUMe+3+3CpRohwzmJHevOXtDe+CPYfArxIuk58NvAyLHEhlZ
 xWkKRhxJvKBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="174922478"
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; 
   d="scan'208";a="174922478"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2021 13:40:33 -0800
IronPort-SDR: D7C28B/nYZrGkLzd5RPaGLCd5irkb8E33ao7Tip+6rZWwJas5F1flPc2GA5y/utGi5Jopl40AU
 K9Rx/G1HC3HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; 
   d="scan'208";a="435393765"
Received: from lkp-server02.sh.intel.com (HELO 2482ff9f8ac0) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Mar 2021 13:40:28 -0800
Received: from kbuild by 2482ff9f8ac0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lHZEI-0001lw-Uy; Wed, 03 Mar 2021 21:40:26 +0000
Date:   Thu, 04 Mar 2021 05:39:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 ff84f5d132d47d897918acdbf4eeb4fe4e825581
Message-ID: <60400219.YHGhB/+KeE5dUOwh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: ff84f5d132d47d897918acdbf4eeb4fe4e825581  pinctrl: ingenic: add missing call to of_node_put()

elapsed time: 722m

configs tested: 117
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         at91_dt_defconfig
powerpc                 mpc832x_mds_defconfig
sh                              ul2_defconfig
powerpc                       maple_defconfig
xtensa                         virt_defconfig
sh                          rsk7203_defconfig
csky                             alldefconfig
powerpc                  iss476-smp_defconfig
arm                       aspeed_g4_defconfig
mips                      fuloong2e_defconfig
x86_64                           alldefconfig
arm                   milbeaut_m10v_defconfig
powerpc                      acadia_defconfig
mips                     loongson1b_defconfig
arm                             mxs_defconfig
sh                        sh7763rdp_defconfig
riscv                            allmodconfig
mips                           ip27_defconfig
arm                            pleb_defconfig
ia64                        generic_defconfig
powerpc                         wii_defconfig
sh                           sh2007_defconfig
arm                        shmobile_defconfig
arm                          exynos_defconfig
microblaze                      mmu_defconfig
arm                        oxnas_v6_defconfig
nds32                             allnoconfig
mips                malta_kvm_guest_defconfig
arm                      footbridge_defconfig
alpha                            allyesconfig
powerpc                        cell_defconfig
arm                         orion5x_defconfig
arc                          axs101_defconfig
arm                          pxa3xx_defconfig
mips                     cu1830-neo_defconfig
arc                        vdk_hs38_defconfig
nds32                               defconfig
c6x                              allyesconfig
xtensa                           allyesconfig
sh                         ap325rxa_defconfig
powerpc                     ep8248e_defconfig
arm                        multi_v5_defconfig
arm                        trizeps4_defconfig
alpha                            alldefconfig
powerpc                  storcenter_defconfig
m68k                           sun3_defconfig
arm                          collie_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210303
i386                 randconfig-a003-20210303
i386                 randconfig-a002-20210303
i386                 randconfig-a004-20210303
i386                 randconfig-a006-20210303
i386                 randconfig-a001-20210303
x86_64               randconfig-a013-20210303
x86_64               randconfig-a016-20210303
x86_64               randconfig-a015-20210303
x86_64               randconfig-a014-20210303
x86_64               randconfig-a012-20210303
x86_64               randconfig-a011-20210303
i386                 randconfig-a016-20210303
i386                 randconfig-a012-20210303
i386                 randconfig-a014-20210303
i386                 randconfig-a013-20210303
i386                 randconfig-a011-20210303
i386                 randconfig-a015-20210303
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210303
x86_64               randconfig-a001-20210303
x86_64               randconfig-a004-20210303
x86_64               randconfig-a002-20210303
x86_64               randconfig-a005-20210303
x86_64               randconfig-a003-20210303

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
