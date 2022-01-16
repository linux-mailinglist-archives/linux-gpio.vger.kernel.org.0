Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE4D548FD6F
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 15:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbiAPO3C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Jan 2022 09:29:02 -0500
Received: from mga11.intel.com ([192.55.52.93]:20580 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229785AbiAPO3C (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 16 Jan 2022 09:29:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642343342; x=1673879342;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ThYPFkPxSU6TCPahUJdqmzKQwAk9ZzrAmt+RN3gzN4Y=;
  b=g42WHN1sPLvtGlBriowgIijmTi/m65ruWhfj7NP46sf73qKZJDDy9f+2
   XTgMvO1hRTyWzlSdLKMmgsISvmf4L4C97wh0GSKcq46hWe9YB69BYIDT7
   yr5rchqiYHhAdJyX/JstHf/AmXmyUXEi//xg9p6c+TeT0NE44uRsalT1p
   XT1SL8WvuZnSqkNwEwJ/n0hLwMVp2yT9lpVIlaL0mBkBdqS9jIN17wkMJ
   w8O2Tx6Exjv7vmcnjkCnhrAwBUtKJXr+sHTWVfXJoT/vc4R+npNTjDY53
   9UvY0wYJwJPbqVqmytexByofylPlQu2tr2bIrgIVvGLAvjtyur/FCQe7x
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10228"; a="242051337"
X-IronPort-AV: E=Sophos;i="5.88,293,1635231600"; 
   d="scan'208";a="242051337"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2022 06:29:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,293,1635231600"; 
   d="scan'208";a="692797171"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Jan 2022 06:29:00 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n96Wi-000Am8-8b; Sun, 16 Jan 2022 14:29:00 +0000
Date:   Sun, 16 Jan 2022 22:28:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 650d15f26aaa8aad030a8d57dfe0bbcd70c327d8
Message-ID: <61e42b8c.TmATSRFMrqjV1f4A%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 650d15f26aaa8aad030a8d57dfe0bbcd70c327d8  pinctrl: sunxi: Fix H616 I2S3 pin data

elapsed time: 721m

configs tested: 109
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
m68k                          hp300_defconfig
sh                   sh7770_generic_defconfig
sparc64                          alldefconfig
arm                          simpad_defconfig
openrisc                  or1klitex_defconfig
powerpc                      bamboo_defconfig
arm                          exynos_defconfig
mips                      fuloong2e_defconfig
um                             i386_defconfig
sh                           se7343_defconfig
openrisc                 simple_smp_defconfig
xtensa                  nommu_kc705_defconfig
riscv             nommu_k210_sdcard_defconfig
h8300                            alldefconfig
powerpc                      ppc6xx_defconfig
sh                          urquell_defconfig
arc                     haps_hs_smp_defconfig
arm                       omap2plus_defconfig
powerpc                 mpc8540_ads_defconfig
arm                         s3c6400_defconfig
sh                         apsh4a3a_defconfig
sh                              ul2_defconfig
powerpc                       maple_defconfig
sh                               j2_defconfig
xtensa                          iss_defconfig
sh                            hp6xx_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                        trizeps4_defconfig
arm                  randconfig-c002-20220116
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
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
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                               defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220116
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220116
x86_64                        randconfig-c007
riscv                randconfig-c006-20220116
powerpc              randconfig-c003-20220116
i386                          randconfig-c001
mips                 randconfig-c004-20220116
arm                      tct_hammer_defconfig
mips                          ath79_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220116
riscv                randconfig-r042-20220116
hexagon              randconfig-r041-20220116
s390                 randconfig-r044-20220116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
