Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA33C468B5A
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Dec 2021 15:13:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234493AbhLEOQ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Dec 2021 09:16:59 -0500
Received: from mga01.intel.com ([192.55.52.88]:24022 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234681AbhLEOQ7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 5 Dec 2021 09:16:59 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10188"; a="261214431"
X-IronPort-AV: E=Sophos;i="5.87,289,1631602800"; 
   d="scan'208";a="261214431"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2021 06:13:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,289,1631602800"; 
   d="scan'208";a="542129519"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Dec 2021 06:13:30 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mtsGf-000KCh-Ms; Sun, 05 Dec 2021 14:13:29 +0000
Date:   Sun, 05 Dec 2021 22:13:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 bef873daf84f451472cd42c6b83e0acda8076be7
Message-ID: <61acc8f1.ctwlt7eEyqJMgS2y%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: bef873daf84f451472cd42c6b83e0acda8076be7  Merge tag 'renesas-pinctrl-for-v5.17-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into devel

elapsed time: 720m

configs tested: 119
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                        clps711x_defconfig
sh                            hp6xx_defconfig
mips                          ath79_defconfig
riscv                    nommu_k210_defconfig
openrisc                         alldefconfig
sh                        sh7785lcr_defconfig
powerpc                     tqm8541_defconfig
arm                          ep93xx_defconfig
m68k                            mac_defconfig
arm                          badge4_defconfig
arc                     nsimosci_hs_defconfig
powerpc                    ge_imp3a_defconfig
m68k                         apollo_defconfig
sh                           se7712_defconfig
powerpc                      cm5200_defconfig
arm                         lubbock_defconfig
s390                       zfcpdump_defconfig
um                           x86_64_defconfig
sh                        sh7757lcr_defconfig
sh                           se7721_defconfig
mips                          ath25_defconfig
arm                         cm_x300_defconfig
powerpc                    amigaone_defconfig
powerpc                     mpc83xx_defconfig
m68k                           sun3_defconfig
sh                              ul2_defconfig
sh                         apsh4a3a_defconfig
m68k                          atari_defconfig
powerpc                          g5_defconfig
sh                            migor_defconfig
mips                        vocore2_defconfig
arm                  randconfig-c002-20211205
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
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211205
x86_64               randconfig-a005-20211205
x86_64               randconfig-a001-20211205
x86_64               randconfig-a002-20211205
x86_64               randconfig-a004-20211205
x86_64               randconfig-a003-20211205
i386                 randconfig-a001-20211205
i386                 randconfig-a005-20211205
i386                 randconfig-a003-20211205
i386                 randconfig-a002-20211205
i386                 randconfig-a006-20211205
i386                 randconfig-a004-20211205
arc                  randconfig-r043-20211205
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211205
arm                  randconfig-c002-20211205
riscv                randconfig-c006-20211205
mips                 randconfig-c004-20211205
i386                 randconfig-c001-20211205
powerpc              randconfig-c003-20211205
s390                 randconfig-c005-20211205
x86_64               randconfig-a011-20211205
x86_64               randconfig-a013-20211205
x86_64               randconfig-a015-20211205
x86_64               randconfig-a012-20211205
x86_64               randconfig-a014-20211205
x86_64               randconfig-a016-20211205
i386                 randconfig-a011-20211205
i386                 randconfig-a014-20211205
i386                 randconfig-a012-20211205
i386                 randconfig-a013-20211205
i386                 randconfig-a016-20211205
i386                 randconfig-a015-20211205
hexagon              randconfig-r045-20211205
s390                 randconfig-r044-20211205
hexagon              randconfig-r041-20211205
riscv                randconfig-r042-20211205

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
