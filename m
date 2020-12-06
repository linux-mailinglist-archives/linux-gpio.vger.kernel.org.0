Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317B32D0303
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Dec 2020 11:53:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbgLFKwr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Dec 2020 05:52:47 -0500
Received: from mga06.intel.com ([134.134.136.31]:4067 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbgLFKwl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 6 Dec 2020 05:52:41 -0500
IronPort-SDR: WQjQFpSuNWTans77SEvGMNDaNyINCo9M6GVb7SnKwE5minETbPw6dA8O2Na6J5h79S8+2MvLWt
 xwLVgT57rDsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9826"; a="235178658"
X-IronPort-AV: E=Sophos;i="5.78,397,1599548400"; 
   d="scan'208";a="235178658"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2020 02:52:00 -0800
IronPort-SDR: ytQ+8EaRoYu5LH0HBboA7CKvjria86gEl05x+euNhIz++hfwTZmKeGBxVnOYRWv4sgwiz5eM6f
 5SVRJV/iqVmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,397,1599548400"; 
   d="scan'208";a="347120970"
Received: from lkp-server01.sh.intel.com (HELO 47754f1311fc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Dec 2020 02:51:59 -0800
Received: from kbuild by 47754f1311fc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1klre3-0000hQ-0V; Sun, 06 Dec 2020 10:51:59 +0000
Date:   Sun, 06 Dec 2020 18:51:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-debugfs-todo] BUILD SUCCESS
 0dc4d47b86c841d28148ab3897a81d25eb617a48
Message-ID: <5fccb7c0.QRRDZD6z17OwWILZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-debugfs-todo
branch HEAD: 0dc4d47b86c841d28148ab3897a81d25eb617a48  Documentation: gpio: fix typo and unclear legacy API section

elapsed time: 725m

configs tested: 123
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                     haps_hs_smp_defconfig
sh                          sdk7780_defconfig
ia64                        generic_defconfig
mips                          ath79_defconfig
ia64                             alldefconfig
sh                           se7751_defconfig
arm                   milbeaut_m10v_defconfig
microblaze                          defconfig
sh                     sh7710voipgw_defconfig
arm                          pxa910_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     pq2fads_defconfig
mips                          malta_defconfig
powerpc                         wii_defconfig
m68k                            mac_defconfig
powerpc                     tqm8540_defconfig
powerpc                     mpc512x_defconfig
sh                           se7705_defconfig
arm                          iop32x_defconfig
arc                              alldefconfig
arm                          tango4_defconfig
mips                         cobalt_defconfig
powerpc                     taishan_defconfig
arm                       versatile_defconfig
arm                        magician_defconfig
m68k                          multi_defconfig
powerpc                     akebono_defconfig
openrisc                         alldefconfig
sh                        edosk7760_defconfig
powerpc                   lite5200b_defconfig
powerpc                      katmai_defconfig
arm                  colibri_pxa270_defconfig
arm                       aspeed_g4_defconfig
sh                         ap325rxa_defconfig
powerpc                    adder875_defconfig
sh                            titan_defconfig
mips                         tb0226_defconfig
powerpc                      makalu_defconfig
powerpc                    amigaone_defconfig
sh                               j2_defconfig
ia64                          tiger_defconfig
arm                        mini2440_defconfig
arm                           spitz_defconfig
sh                           se7750_defconfig
sh                 kfr2r09-romimage_defconfig
mips                           jazz_defconfig
um                             i386_defconfig
arm                         mv78xx0_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
x86_64               randconfig-a004-20201206
x86_64               randconfig-a006-20201206
x86_64               randconfig-a002-20201206
x86_64               randconfig-a001-20201206
x86_64               randconfig-a005-20201206
x86_64               randconfig-a003-20201206
i386                 randconfig-a005-20201206
i386                 randconfig-a004-20201206
i386                 randconfig-a001-20201206
i386                 randconfig-a002-20201206
i386                 randconfig-a006-20201206
i386                 randconfig-a003-20201206
i386                 randconfig-a014-20201206
i386                 randconfig-a013-20201206
i386                 randconfig-a011-20201206
i386                 randconfig-a015-20201206
i386                 randconfig-a012-20201206
i386                 randconfig-a016-20201206
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
x86_64               randconfig-a016-20201206
x86_64               randconfig-a012-20201206
x86_64               randconfig-a014-20201206
x86_64               randconfig-a013-20201206
x86_64               randconfig-a015-20201206
x86_64               randconfig-a011-20201206

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
