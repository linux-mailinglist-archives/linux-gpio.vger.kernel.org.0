Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8AB2AC912
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 00:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729914AbgKIXIU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 18:08:20 -0500
Received: from mga18.intel.com ([134.134.136.126]:60492 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729452AbgKIXIU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 18:08:20 -0500
IronPort-SDR: hNqPVVfqiZ3bWNOTboDoGABGsVOzY2zKrDa6zVc7YU/B6Svj84eHg8v/CG0LMmhrvFT+AJEIIc
 82CwylKLtu0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="157667766"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="157667766"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 15:08:19 -0800
IronPort-SDR: zEzjY+89GtBDRJ+0j8FZHBVTMd5+ZEwxdHyPfnYR+8G4n8WMhPIibnVO4CjF66+Hb57pqyI6MT
 fGL9NRMyIGTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="428163382"
Received: from lkp-server01.sh.intel.com (HELO d0be80f1a028) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2020 15:08:18 -0800
Received: from kbuild by d0be80f1a028 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kcGGn-0000UV-6C; Mon, 09 Nov 2020 23:08:17 +0000
Date:   Tue, 10 Nov 2020 07:08:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 9b92f5c51e9a41352d665f6f956bd95085a56a83
Message-ID: <5fa9cbd9.2Ez1kI+FDKNuOmdl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  fixes
branch HEAD: 9b92f5c51e9a41352d665f6f956bd95085a56a83  pinctrl: aspeed: Fix GPI only function problem.

elapsed time: 1161m

configs tested: 118
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
openrisc                 simple_smp_defconfig
xtensa                  cadence_csp_defconfig
mips                      maltaaprp_defconfig
m68k                         amcore_defconfig
mips                        jmr3927_defconfig
powerpc                     stx_gp3_defconfig
mips                 decstation_r4k_defconfig
powerpc                     ppa8548_defconfig
powerpc                    sam440ep_defconfig
powerpc                     pseries_defconfig
arm                         s5pv210_defconfig
xtensa                  audio_kc705_defconfig
powerpc                      pasemi_defconfig
arm                         nhk8815_defconfig
mips                  cavium_octeon_defconfig
m68k                             alldefconfig
nios2                         10m50_defconfig
powerpc                     tqm8548_defconfig
c6x                        evmc6474_defconfig
sh                          rsk7201_defconfig
arc                                 defconfig
mips                      fuloong2e_defconfig
sh                         microdev_defconfig
arm                            mmp2_defconfig
arm                          collie_defconfig
sh                        sh7757lcr_defconfig
um                           x86_64_defconfig
mips                          rm200_defconfig
powerpc                      bamboo_defconfig
arm                            u300_defconfig
m68k                        m5307c3_defconfig
arm                             rpc_defconfig
m68k                        m5272c3_defconfig
c6x                              alldefconfig
powerpc                      pmac32_defconfig
arm                          imote2_defconfig
arm                         shannon_defconfig
nds32                               defconfig
arm                           corgi_defconfig
arm                          gemini_defconfig
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
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
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
x86_64               randconfig-a004-20201109
x86_64               randconfig-a002-20201109
x86_64               randconfig-a003-20201109
x86_64               randconfig-a005-20201109
x86_64               randconfig-a006-20201109
x86_64               randconfig-a001-20201109
x86_64               randconfig-a003-20201110
x86_64               randconfig-a005-20201110
x86_64               randconfig-a004-20201110
x86_64               randconfig-a002-20201110
x86_64               randconfig-a006-20201110
x86_64               randconfig-a001-20201110
i386                 randconfig-a004-20201109
i386                 randconfig-a006-20201109
i386                 randconfig-a005-20201109
i386                 randconfig-a001-20201109
i386                 randconfig-a003-20201109
i386                 randconfig-a002-20201109
i386                 randconfig-a014-20201109
i386                 randconfig-a015-20201109
i386                 randconfig-a013-20201109
i386                 randconfig-a016-20201109
i386                 randconfig-a011-20201109
i386                 randconfig-a012-20201109
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20201109
x86_64               randconfig-a015-20201109
x86_64               randconfig-a013-20201109
x86_64               randconfig-a011-20201109
x86_64               randconfig-a014-20201109
x86_64               randconfig-a016-20201109

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
