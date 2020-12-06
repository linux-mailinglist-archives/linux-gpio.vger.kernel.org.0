Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1139D2D02FD
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Dec 2020 11:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725767AbgLFKwl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Dec 2020 05:52:41 -0500
Received: from mga11.intel.com ([192.55.52.93]:64445 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725822AbgLFKwl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 6 Dec 2020 05:52:41 -0500
IronPort-SDR: 3Jsb8Qx+n+qBe/9SZ6zSL1oIydT3soI9iJOxALzUFZdkBYNt5s8NSqO5Xnh6iTG51MXHwB/BQC
 ADGYQyZaxd0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9826"; a="170067274"
X-IronPort-AV: E=Sophos;i="5.78,397,1599548400"; 
   d="scan'208";a="170067274"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2020 02:52:00 -0800
IronPort-SDR: Wsn8a7cSHdUiAi26u4mXMh2S8qYtX5DdzGcrG8CazyZdDgURL30cWTmdEFda9Ec7qY9cpEJN0p
 Lqd/bm7gEz9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,397,1599548400"; 
   d="scan'208";a="336876440"
Received: from lkp-server01.sh.intel.com (HELO 47754f1311fc) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Dec 2020 02:51:59 -0800
Received: from kbuild by 47754f1311fc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1klre2-0000hH-RB; Sun, 06 Dec 2020 10:51:58 +0000
Date:   Sun, 06 Dec 2020 18:51:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 c3c882898d07157a1b083aaaddf0e8346373d111
Message-ID: <5fccb7c2.35Y90qWeHOQeyI9h%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  fixes
branch HEAD: c3c882898d07157a1b083aaaddf0e8346373d111  pinctrl: aspeed: Fix GPIO requests on pass-through banks

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
riscv                    nommu_k210_defconfig
sh                 kfr2r09-romimage_defconfig
mips                        maltaup_defconfig
csky                                defconfig
s390                             alldefconfig
sh                            hp6xx_defconfig
sh                           se7750_defconfig
powerpc                    adder875_defconfig
sh                         apsh4a3a_defconfig
arm                          pcm027_defconfig
arm                          badge4_defconfig
sh                           se7705_defconfig
arm                          iop32x_defconfig
arc                              alldefconfig
arm                          tango4_defconfig
mips                         cobalt_defconfig
powerpc                     taishan_defconfig
arm                       versatile_defconfig
arm                        magician_defconfig
m68k                          multi_defconfig
powerpc                     sbc8548_defconfig
powerpc                   currituck_defconfig
powerpc                 canyonlands_defconfig
sh                             shx3_defconfig
arm                       aspeed_g4_defconfig
sh                         ap325rxa_defconfig
sh                            titan_defconfig
mips                         tb0226_defconfig
powerpc                      makalu_defconfig
powerpc                    amigaone_defconfig
sh                               j2_defconfig
ia64                          tiger_defconfig
arm                        mini2440_defconfig
arm                           spitz_defconfig
arm                         ebsa110_defconfig
m68k                       m5208evb_defconfig
m68k                        m5407c3_defconfig
arm                         assabet_defconfig
powerpc                     stx_gp3_defconfig
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
