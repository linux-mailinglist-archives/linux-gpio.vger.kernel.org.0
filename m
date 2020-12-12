Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDDE42D86C3
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 14:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393375AbgLLNJj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Dec 2020 08:09:39 -0500
Received: from mga14.intel.com ([192.55.52.115]:8135 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439076AbgLLNJf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 12 Dec 2020 08:09:35 -0500
IronPort-SDR: 9kDY6KXWbDhRQY6GrDuidppLHi3kZDaKsqu1q/ti+U0WP5E+jggLpqjTUKrFu7uFtPA3swC1FF
 XB+66ALyHUUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9832"; a="173778485"
X-IronPort-AV: E=Sophos;i="5.78,414,1599548400"; 
   d="scan'208";a="173778485"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2020 05:08:48 -0800
IronPort-SDR: tghZQ6IR8tkgARdGk2eCSXZyJnI8W/u8eGgrvByJklHUIw/qFR23GN0/4UvFI83znTU+H8yqiN
 Y3RmAvLV+LAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,414,1599548400"; 
   d="scan'208";a="339825757"
Received: from lkp-server01.sh.intel.com (HELO ecc0cebe68d1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Dec 2020 05:08:46 -0800
Received: from kbuild by ecc0cebe68d1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ko4di-0001LG-2m; Sat, 12 Dec 2020 13:08:46 +0000
Date:   Sat, 12 Dec 2020 21:07:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-disallow-double-linenames] BUILD SUCCESS
 2ba2b2b64b9741cec704abd3c13c9c245db871ef
Message-ID: <5fd4c0ac.By6lTJRj271F7Xnt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-disallow-double-linenames
branch HEAD: 2ba2b2b64b9741cec704abd3c13c9c245db871ef  gpiolib: Disallow identical line names in the same chip

elapsed time: 721m

configs tested: 115
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
parisc                generic-32bit_defconfig
m68k                       m5275evb_defconfig
arm                          exynos_defconfig
sh                           se7343_defconfig
arm                      integrator_defconfig
arm                            qcom_defconfig
sh                          rsk7264_defconfig
mips                     cu1000-neo_defconfig
powerpc                        cell_defconfig
arm                      jornada720_defconfig
powerpc                 mpc832x_rdb_defconfig
parisc                              defconfig
xtensa                    smp_lx200_defconfig
arm                        mvebu_v7_defconfig
sh                             shx3_defconfig
arm                          gemini_defconfig
sh                          rsk7269_defconfig
sh                        apsh4ad0a_defconfig
m68k                        m5272c3_defconfig
mips                   sb1250_swarm_defconfig
nios2                         10m50_defconfig
parisc                generic-64bit_defconfig
arm                        mvebu_v5_defconfig
powerpc                      bamboo_defconfig
riscv                               defconfig
powerpc                     ppa8548_defconfig
sh                             sh03_defconfig
powerpc                        warp_defconfig
nds32                               defconfig
parisc                           alldefconfig
ia64                                defconfig
powerpc                    klondike_defconfig
powerpc                 mpc8560_ads_defconfig
arm                         assabet_defconfig
xtensa                         virt_defconfig
xtensa                generic_kc705_defconfig
sparc                            allyesconfig
powerpc                          g5_defconfig
m68k                       bvme6000_defconfig
powerpc                      pasemi_defconfig
sh                           se7619_defconfig
sh                           se7724_defconfig
c6x                                 defconfig
sh                   secureedge5410_defconfig
sh                            hp6xx_defconfig
m68k                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
riscv                             allnoconfig
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
