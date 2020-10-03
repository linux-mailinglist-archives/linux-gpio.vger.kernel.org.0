Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19AFF282431
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Oct 2020 15:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbgJCNDL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Oct 2020 09:03:11 -0400
Received: from mga02.intel.com ([134.134.136.20]:18410 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgJCNDK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 3 Oct 2020 09:03:10 -0400
IronPort-SDR: 14FVg6Dt3F1N5qu9NdTaBwsT04HE00bJAocEeRAljd8Hwp7MdSQ3tJCOdcTINLQ+PMrGezuA8D
 Vvq9fbbGWTWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9762"; a="150831634"
X-IronPort-AV: E=Sophos;i="5.77,331,1596524400"; 
   d="scan'208";a="150831634"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2020 06:03:06 -0700
IronPort-SDR: BU/WZNdeUPONU+0VrtQ8XkpIj5NdawqVI2C4p39MXxx/v3S++wrFai+hitArM8CHC7njZcIHTp
 lhwnYq/Jh2qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,331,1596524400"; 
   d="scan'208";a="458926508"
Received: from lkp-server02.sh.intel.com (HELO b5ae2f167493) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 03 Oct 2020 06:03:05 -0700
Received: from kbuild by b5ae2f167493 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kOhBp-00005a-1i; Sat, 03 Oct 2020 13:03:05 +0000
Date:   Sat, 03 Oct 2020 21:02:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 f4a2b19c37caf40f3b8487ccb9032b974a84a3a7
Message-ID: <5f787668.1EKVkaZevLc8j1q0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  devel
branch HEAD: f4a2b19c37caf40f3b8487ccb9032b974a84a3a7  pinctrl: single: fix debug output when #pinctrl-cells = 2

elapsed time: 721m

configs tested: 138
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     tqm8541_defconfig
arm                       netwinder_defconfig
sh                        sh7785lcr_defconfig
arm                          moxart_defconfig
mips                           ip32_defconfig
arm                       spear13xx_defconfig
sh                               allmodconfig
powerpc                  mpc885_ads_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                      ppc6xx_defconfig
csky                                defconfig
arm                         s3c2410_defconfig
arm                           viper_defconfig
arm                         lpc18xx_defconfig
powerpc                      ep88xc_defconfig
powerpc                      ppc64e_defconfig
arm                   milbeaut_m10v_defconfig
arm                          ep93xx_defconfig
arm                         palmz72_defconfig
m68k                       m5475evb_defconfig
sh                   secureedge5410_defconfig
arm                           tegra_defconfig
sh                           se7619_defconfig
mips                       lemote2f_defconfig
mips                 decstation_r4k_defconfig
arm                            zeus_defconfig
powerpc                     tqm8555_defconfig
sh                           se7343_defconfig
m68k                        stmark2_defconfig
arm                         axm55xx_defconfig
powerpc                     tqm5200_defconfig
mips                     loongson1b_defconfig
sh                          sdk7786_defconfig
arm                     am200epdkit_defconfig
arm                            lart_defconfig
mips                           jazz_defconfig
c6x                         dsk6455_defconfig
arm                        mini2440_defconfig
c6x                        evmc6474_defconfig
arm                          imote2_defconfig
sh                          urquell_defconfig
openrisc                         alldefconfig
microblaze                    nommu_defconfig
arm                         ebsa110_defconfig
m68k                        m5272c3_defconfig
um                            kunit_defconfig
arc                        nsimosci_defconfig
arm                       omap2plus_defconfig
powerpc                 mpc832x_mds_defconfig
sparc64                          alldefconfig
mips                      pistachio_defconfig
arm                        oxnas_v6_defconfig
mips                        bcm63xx_defconfig
powerpc                 mpc8560_ads_defconfig
sh                   rts7751r2dplus_defconfig
s390                                defconfig
mips                   sb1250_swarm_defconfig
arm                        spear6xx_defconfig
powerpc                          g5_defconfig
mips                         mpc30x_defconfig
arm                  colibri_pxa270_defconfig
m68k                           sun3_defconfig
sh                          lboxre2_defconfig
mips                            ar7_defconfig
arm                            dove_defconfig
powerpc                     stx_gp3_defconfig
powerpc                     mpc512x_defconfig
parisc                              defconfig
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
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201002
x86_64               randconfig-a001-20201002
x86_64               randconfig-a002-20201002
x86_64               randconfig-a005-20201002
x86_64               randconfig-a003-20201002
x86_64               randconfig-a006-20201002
i386                 randconfig-a006-20201002
i386                 randconfig-a005-20201002
i386                 randconfig-a001-20201002
i386                 randconfig-a004-20201002
i386                 randconfig-a003-20201002
i386                 randconfig-a002-20201002
i386                 randconfig-a014-20201002
i386                 randconfig-a013-20201002
i386                 randconfig-a015-20201002
i386                 randconfig-a016-20201002
i386                 randconfig-a011-20201002
i386                 randconfig-a012-20201002
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
x86_64               randconfig-a012-20201002
x86_64               randconfig-a015-20201002
x86_64               randconfig-a014-20201002
x86_64               randconfig-a013-20201002
x86_64               randconfig-a011-20201002
x86_64               randconfig-a016-20201002

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
