Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C87902D351C
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 22:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729447AbgLHVUQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 16:20:16 -0500
Received: from mga09.intel.com ([134.134.136.24]:3050 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbgLHVUQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Dec 2020 16:20:16 -0500
IronPort-SDR: tqucb/Z/Wg168FsK8l0vACsnSqJuMZaSSLxdDM0230cwY5PNJJ8z0VhlValVh9rHPqv9A10I4r
 9V5YPIteONWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="174119453"
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; 
   d="scan'208";a="174119453"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 13:19:35 -0800
IronPort-SDR: DwL11Hjmhg9recvDgHCvaOwJ8FisQ7DAygMGeT6YyyYylnHqrJhlIsq+FKDR5zeiwZQG+Tj1FU
 TptXXkIDFCPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; 
   d="scan'208";a="376098069"
Received: from lkp-server01.sh.intel.com (HELO c88bd47c8831) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2020 13:19:34 -0800
Received: from kbuild by c88bd47c8831 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kmkOT-0000T8-Gi; Tue, 08 Dec 2020 21:19:33 +0000
Date:   Wed, 09 Dec 2020 05:18:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 09fe5dc62aae1327d98186e1e9299a2e4f62a055
Message-ID: <5fcfedb4.C6gFT1vW20h91yOV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  for-next
branch HEAD: 09fe5dc62aae1327d98186e1e9299a2e4f62a055  Merge branch 'devel' into for-next

elapsed time: 723m

configs tested: 96
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      tqm8xx_defconfig
alpha                            alldefconfig
powerpc                     tqm5200_defconfig
arm                         vf610m4_defconfig
arm                      integrator_defconfig
arm                    vt8500_v6_v7_defconfig
arm                           efm32_defconfig
arm                        clps711x_defconfig
mips                         tb0219_defconfig
m68k                       m5275evb_defconfig
arm                              alldefconfig
powerpc               mpc834x_itxgp_defconfig
ia64                        generic_defconfig
arm                         palmz72_defconfig
arm                             ezx_defconfig
powerpc                        icon_defconfig
sh                          rsk7201_defconfig
sh                      rts7751r2d1_defconfig
arm                         axm55xx_defconfig
nds32                             allnoconfig
powerpc                      arches_defconfig
mips                        qi_lb60_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
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
i386                 randconfig-a004-20201208
i386                 randconfig-a005-20201208
i386                 randconfig-a001-20201208
i386                 randconfig-a002-20201208
i386                 randconfig-a006-20201208
i386                 randconfig-a003-20201208
x86_64               randconfig-a004-20201208
x86_64               randconfig-a006-20201208
x86_64               randconfig-a005-20201208
x86_64               randconfig-a001-20201208
x86_64               randconfig-a002-20201208
x86_64               randconfig-a003-20201208
i386                 randconfig-a013-20201208
i386                 randconfig-a014-20201208
i386                 randconfig-a011-20201208
i386                 randconfig-a015-20201208
i386                 randconfig-a012-20201208
i386                 randconfig-a016-20201208
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
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
x86_64               randconfig-a016-20201208
x86_64               randconfig-a012-20201208
x86_64               randconfig-a013-20201208
x86_64               randconfig-a014-20201208
x86_64               randconfig-a015-20201208
x86_64               randconfig-a011-20201208

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
