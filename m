Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 878E63D4711
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jul 2021 12:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234786AbhGXJn4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Jul 2021 05:43:56 -0400
Received: from mga17.intel.com ([192.55.52.151]:9391 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235065AbhGXJng (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 24 Jul 2021 05:43:36 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="192286455"
X-IronPort-AV: E=Sophos;i="5.84,266,1620716400"; 
   d="scan'208";a="192286455"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2021 03:24:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,266,1620716400"; 
   d="scan'208";a="496843019"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 24 Jul 2021 03:24:06 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m7EpB-0003EF-OG; Sat, 24 Jul 2021 10:24:05 +0000
Date:   Sat, 24 Jul 2021 18:23:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 af0ca06f8781499bd889658b47df75ee2da8ca8f
Message-ID: <60fbea3e.UWuxyPcUA5Bgk2NX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: af0ca06f8781499bd889658b47df75ee2da8ca8f  pinctrl: imx8ulp: Initialize pin_reg

elapsed time: 743m

configs tested: 96
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210724
i386                 randconfig-c001-20210723
openrisc                  or1klitex_defconfig
sh                          r7785rp_defconfig
h8300                            alldefconfig
powerpc                 mpc85xx_cds_defconfig
parisc                generic-64bit_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                     sequoia_defconfig
m68k                       m5275evb_defconfig
arc                           tb10x_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
x86_64               randconfig-a003-20210724
x86_64               randconfig-a006-20210724
x86_64               randconfig-a001-20210724
x86_64               randconfig-a005-20210724
x86_64               randconfig-a004-20210724
x86_64               randconfig-a002-20210724
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
