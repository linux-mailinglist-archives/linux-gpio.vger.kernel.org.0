Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB5C33CCA2
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Mar 2021 05:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235054AbhCPEkU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Mar 2021 00:40:20 -0400
Received: from mga11.intel.com ([192.55.52.93]:63016 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235050AbhCPEkC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Mar 2021 00:40:02 -0400
IronPort-SDR: 44zBl6myCKCN24RCem6KDBHvJxWdlGB1JNvhYt205ylh9hHIlHeIwE+372TMWvBYlnn3ITZUly
 rDTAKGKFBFXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="185837859"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="185837859"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 21:40:01 -0700
IronPort-SDR: DB4mxf6wAISPgPNICKxYKR+vw8VKaBg9NSgh3+JTnzk2dUM4Kfa6A6i3c4LTmBeAmJXcxu2uFv
 OnUjRsdnduqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="373662776"
Received: from lkp-server02.sh.intel.com (HELO 1dc5e1a854f4) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Mar 2021 21:40:00 -0700
Received: from kbuild by 1dc5e1a854f4 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lM1Ut-0000mQ-5W; Tue, 16 Mar 2021 04:39:59 +0000
Date:   Tue, 16 Mar 2021 12:39:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 a5d5c33246eb60ba3a04af571ee59449ea7f794b
Message-ID: <6050367f.qW5QOPGqrAXOVp0+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: a5d5c33246eb60ba3a04af571ee59449ea7f794b  Merge branch 'devel' into for-next

elapsed time: 721m

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
x86_64                           allyesconfig
h8300                     edosk2674_defconfig
powerpc                    amigaone_defconfig
powerpc                 linkstation_defconfig
m68k                        m5407c3_defconfig
arc                 nsimosci_hs_smp_defconfig
openrisc                 simple_smp_defconfig
mips                      malta_kvm_defconfig
arm                          exynos_defconfig
ia64                         bigsur_defconfig
arm                            dove_defconfig
arm                       mainstone_defconfig
m68k                        mvme16x_defconfig
arm                         mv78xx0_defconfig
mips                       rbtx49xx_defconfig
h8300                    h8300h-sim_defconfig
h8300                               defconfig
ia64                      gensparse_defconfig
arm                       spear13xx_defconfig
powerpc                     skiroot_defconfig
sh                         ecovec24_defconfig
powerpc                  iss476-smp_defconfig
powerpc                      chrp32_defconfig
openrisc                         alldefconfig
arm                     am200epdkit_defconfig
arm                         palmz72_defconfig
arm                       versatile_defconfig
mips                         rt305x_defconfig
mips                           xway_defconfig
powerpc                      ppc6xx_defconfig
powerpc                     tqm8555_defconfig
parisc                           alldefconfig
arm                         lubbock_defconfig
x86_64                              defconfig
sh                   rts7751r2dplus_defconfig
arc                     haps_hs_smp_defconfig
powerpc                     mpc512x_defconfig
ia64                             alldefconfig
powerpc                      arches_defconfig
sh                           se7712_defconfig
arm                          pcm027_defconfig
xtensa                           alldefconfig
mips                          ath79_defconfig
mips                       lemote2f_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210315
x86_64               randconfig-a001-20210315
x86_64               randconfig-a005-20210315
x86_64               randconfig-a004-20210315
x86_64               randconfig-a002-20210315
x86_64               randconfig-a003-20210315
i386                 randconfig-a001-20210315
i386                 randconfig-a005-20210315
i386                 randconfig-a003-20210315
i386                 randconfig-a002-20210315
i386                 randconfig-a004-20210315
i386                 randconfig-a006-20210315
i386                 randconfig-a013-20210315
i386                 randconfig-a016-20210315
i386                 randconfig-a011-20210315
i386                 randconfig-a012-20210315
i386                 randconfig-a014-20210315
i386                 randconfig-a015-20210315
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20210315
x86_64               randconfig-a016-20210315
x86_64               randconfig-a013-20210315
x86_64               randconfig-a015-20210315
x86_64               randconfig-a014-20210315
x86_64               randconfig-a012-20210315

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
