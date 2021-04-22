Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C251368887
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 23:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239582AbhDVVZA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Apr 2021 17:25:00 -0400
Received: from mga14.intel.com ([192.55.52.115]:28428 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239359AbhDVVY7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Apr 2021 17:24:59 -0400
IronPort-SDR: wUkDmGRFEVgoSYwvXWJKVc0dFkgetOBiXI4wEl9uNKzoNwtG11AyMKvgqBIZlEt7WzukxtvlGm
 4PqyaVBvBR9A==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="195532508"
X-IronPort-AV: E=Sophos;i="5.82,243,1613462400"; 
   d="scan'208";a="195532508"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2021 14:24:24 -0700
IronPort-SDR: syHkMT4tS8P87ugjsEJMAWdr6OOCS+ABANbY2zeOPXA8QNidfPqJCC69taFAiRGPnA7V+4W/qb
 MB9lfIEqAWBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,243,1613462400"; 
   d="scan'208";a="424022672"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 22 Apr 2021 14:24:22 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lZgo9-0004Le-UL; Thu, 22 Apr 2021 21:24:21 +0000
Date:   Fri, 23 Apr 2021 05:23:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 835109266494b5b5661676a53efa5ea8f77a8c70
Message-ID: <6081e949.CZ+rnvL+QfVxDeyx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 835109266494b5b5661676a53efa5ea8f77a8c70  Merge branch 'devel' into for-next

elapsed time: 723m

configs tested: 170
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
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
arm                            lart_defconfig
mips                malta_qemu_32r6_defconfig
mips                          malta_defconfig
sh                             shx3_defconfig
powerpc                      ppc44x_defconfig
arm                      footbridge_defconfig
h8300                    h8300h-sim_defconfig
xtensa                              defconfig
powerpc                  iss476-smp_defconfig
alpha                               defconfig
powerpc                      ep88xc_defconfig
arc                      axs103_smp_defconfig
powerpc                 linkstation_defconfig
arm                         s5pv210_defconfig
sparc                       sparc32_defconfig
sh                              ul2_defconfig
powerpc                     asp8347_defconfig
ia64                          tiger_defconfig
mips                        nlm_xlr_defconfig
mips                  decstation_64_defconfig
m68k                         apollo_defconfig
sh                   sh7770_generic_defconfig
mips                            e55_defconfig
sh                        sh7757lcr_defconfig
sh                          lboxre2_defconfig
powerpc                  mpc885_ads_defconfig
mips                          rm200_defconfig
arc                           tb10x_defconfig
powerpc                      acadia_defconfig
sh                                  defconfig
powerpc                       eiger_defconfig
arm                           h5000_defconfig
s390                          debug_defconfig
x86_64                           alldefconfig
m68k                         amcore_defconfig
mips                       capcella_defconfig
um                            kunit_defconfig
arm                        oxnas_v6_defconfig
mips                         rt305x_defconfig
powerpc                      chrp32_defconfig
arm                         mv78xx0_defconfig
arc                              alldefconfig
powerpc                      ppc40x_defconfig
xtensa                  cadence_csp_defconfig
mips                        maltaup_defconfig
mips                        bcm47xx_defconfig
powerpc                 canyonlands_defconfig
arm                     eseries_pxa_defconfig
mips                     decstation_defconfig
sh                         microdev_defconfig
powerpc                        fsp2_defconfig
powerpc                      ppc64e_defconfig
arm                          badge4_defconfig
arc                        vdk_hs38_defconfig
powerpc                     tqm5200_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                     loongson1b_defconfig
arc                              allyesconfig
mips                      pistachio_defconfig
arm                          pxa910_defconfig
mips                      maltasmvp_defconfig
mips                         tb0287_defconfig
arm                          pcm027_defconfig
um                             i386_defconfig
arm                           spitz_defconfig
powerpc                     kmeter1_defconfig
arm                         nhk8815_defconfig
powerpc                      walnut_defconfig
powerpc                     rainier_defconfig
arm                           stm32_defconfig
powerpc                     mpc83xx_defconfig
arm                        trizeps4_defconfig
powerpc                         ps3_defconfig
arm                    vt8500_v6_v7_defconfig
nios2                         3c120_defconfig
arm                          gemini_defconfig
arm                            dove_defconfig
arm                        neponset_defconfig
nds32                             allnoconfig
mips                 decstation_r4k_defconfig
mips                      maltaaprp_defconfig
arm                       omap2plus_defconfig
arm                      tct_hammer_defconfig
m68k                        mvme16x_defconfig
sh                           se7722_defconfig
openrisc                         alldefconfig
sh                            migor_defconfig
um                           x86_64_defconfig
arm                           u8500_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210421
x86_64               randconfig-a002-20210421
x86_64               randconfig-a001-20210421
x86_64               randconfig-a005-20210421
x86_64               randconfig-a006-20210421
x86_64               randconfig-a003-20210421
i386                 randconfig-a005-20210421
i386                 randconfig-a002-20210421
i386                 randconfig-a001-20210421
i386                 randconfig-a006-20210421
i386                 randconfig-a004-20210421
i386                 randconfig-a003-20210421
x86_64               randconfig-a015-20210422
x86_64               randconfig-a016-20210422
x86_64               randconfig-a011-20210422
x86_64               randconfig-a014-20210422
x86_64               randconfig-a012-20210422
x86_64               randconfig-a013-20210422
i386                 randconfig-a012-20210421
i386                 randconfig-a014-20210421
i386                 randconfig-a011-20210421
i386                 randconfig-a013-20210421
i386                 randconfig-a015-20210421
i386                 randconfig-a016-20210421
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210421
x86_64               randconfig-a016-20210421
x86_64               randconfig-a011-20210421
x86_64               randconfig-a014-20210421
x86_64               randconfig-a013-20210421
x86_64               randconfig-a012-20210421

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
