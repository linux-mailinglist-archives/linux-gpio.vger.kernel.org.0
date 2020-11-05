Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 407832A753D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 03:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbgKECIj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 21:08:39 -0500
Received: from mga17.intel.com ([192.55.52.151]:3213 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733237AbgKECIj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Nov 2020 21:08:39 -0500
IronPort-SDR: MMI8p4e0YBNqlmTb9tv2RRh71t+pHvvR2DPWcp09qgmev52+gVaZqGd9vPv0mgyU06HjoJSV6s
 9EovyI/4UDXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="149168974"
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; 
   d="scan'208";a="149168974"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2020 18:08:37 -0800
IronPort-SDR: VdCbcYFpJG6HrNsmbRFvcK7803n3JgzqJT6i6CYpNbQRjtlVHLnyo0ZKH5/UKg+YZbreRlaxve
 0lGAKHD65BbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; 
   d="scan'208";a="325842782"
Received: from lkp-server02.sh.intel.com (HELO e61783667810) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Nov 2020 18:08:36 -0800
Received: from kbuild by e61783667810 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kaUhX-0001Af-Tf; Thu, 05 Nov 2020 02:08:35 +0000
Date:   Thu, 05 Nov 2020 10:08:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 1f955a68d179cdbad083d85e0fbb6ec7360a03d1
Message-ID: <5fa35ea1.WzsSjuKWa441P5Bx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  for-next
branch HEAD: 1f955a68d179cdbad083d85e0fbb6ec7360a03d1  Merge branch 'devel' into for-next

elapsed time: 725m

configs tested: 158
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                        shmobile_defconfig
sh                           se7751_defconfig
arm                        vexpress_defconfig
mips                          ath25_defconfig
arm                            u300_defconfig
powerpc                  mpc885_ads_defconfig
mips                  maltasmvp_eva_defconfig
sh                   secureedge5410_defconfig
powerpc                 canyonlands_defconfig
xtensa                              defconfig
microblaze                    nommu_defconfig
arm                           efm32_defconfig
arm                     davinci_all_defconfig
riscv                    nommu_k210_defconfig
sh                               alldefconfig
arm                          prima2_defconfig
powerpc                        fsp2_defconfig
sh                          rsk7269_defconfig
mips                        maltaup_defconfig
arm                      pxa255-idp_defconfig
arm                          tango4_defconfig
parisc                           alldefconfig
powerpc               mpc834x_itxgp_defconfig
arm                           tegra_defconfig
mips                         cobalt_defconfig
openrisc                            defconfig
mips                         tb0226_defconfig
alpha                            allyesconfig
powerpc                    sam440ep_defconfig
mips                         db1xxx_defconfig
arm                            pleb_defconfig
arm                        mvebu_v7_defconfig
sh                        sh7785lcr_defconfig
arm                        spear3xx_defconfig
powerpc                 mpc834x_itx_defconfig
ia64                                defconfig
mips                       capcella_defconfig
mips                       rbtx49xx_defconfig
arc                              alldefconfig
um                            kunit_defconfig
powerpc                     mpc5200_defconfig
m68k                       m5475evb_defconfig
m68k                          atari_defconfig
sh                            titan_defconfig
powerpc                  storcenter_defconfig
arm                        clps711x_defconfig
sh                        edosk7760_defconfig
parisc                generic-64bit_defconfig
powerpc                     tqm8555_defconfig
i386                             alldefconfig
sh                           se7722_defconfig
powerpc                       holly_defconfig
mips                        bcm47xx_defconfig
mips                            gpr_defconfig
m68k                          hp300_defconfig
openrisc                         alldefconfig
mips                          malta_defconfig
arc                          axs103_defconfig
arm                             pxa_defconfig
xtensa                         virt_defconfig
powerpc                          allyesconfig
c6x                        evmc6678_defconfig
sh                        apsh4ad0a_defconfig
mips                           ip22_defconfig
mips                         tb0287_defconfig
sh                         ap325rxa_defconfig
powerpc                     stx_gp3_defconfig
sh                     magicpanelr2_defconfig
powerpc                      katmai_defconfig
m68k                       bvme6000_defconfig
sh                     sh7710voipgw_defconfig
arm                         orion5x_defconfig
mips                            ar7_defconfig
riscv                    nommu_virt_defconfig
powerpc                        cell_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                  iss476-smp_defconfig
arm                          moxart_defconfig
m68k                             allmodconfig
arc                           tb10x_defconfig
ia64                        generic_defconfig
arm                         mv78xx0_defconfig
sh                            shmin_defconfig
m68k                          multi_defconfig
arm                          gemini_defconfig
powerpc                     asp8347_defconfig
powerpc                      ppc64e_defconfig
powerpc                     tqm8548_defconfig
powerpc                     ksi8560_defconfig
arc                     nsimosci_hs_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201104
i386                 randconfig-a006-20201104
i386                 randconfig-a005-20201104
i386                 randconfig-a001-20201104
i386                 randconfig-a002-20201104
i386                 randconfig-a003-20201104
x86_64               randconfig-a012-20201104
x86_64               randconfig-a015-20201104
x86_64               randconfig-a013-20201104
x86_64               randconfig-a011-20201104
x86_64               randconfig-a014-20201104
x86_64               randconfig-a016-20201104
i386                 randconfig-a015-20201104
i386                 randconfig-a013-20201104
i386                 randconfig-a014-20201104
i386                 randconfig-a016-20201104
i386                 randconfig-a011-20201104
i386                 randconfig-a012-20201104
riscv                            allyesconfig
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
x86_64               randconfig-a004-20201104
x86_64               randconfig-a003-20201104
x86_64               randconfig-a005-20201104
x86_64               randconfig-a002-20201104
x86_64               randconfig-a006-20201104
x86_64               randconfig-a001-20201104

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
