Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26DF7349C34
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 23:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbhCYWYU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 18:24:20 -0400
Received: from mga02.intel.com ([134.134.136.20]:16044 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230341AbhCYWXv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 25 Mar 2021 18:23:51 -0400
IronPort-SDR: aFpHc3xn0Q0d+eIu9klxdv0fLuw2joO2OFE+MOyRWvXB0WKjBRn0+k5mNUzxXu+2zi+gaWVFLI
 7Qb8qn9MKHDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="178151797"
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; 
   d="scan'208";a="178151797"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2021 15:23:50 -0700
IronPort-SDR: mFfy0ogCG+1lC5dHLTLvUzN25Ye1HoZYguj0ETnDCSRVJxA05E+xYRuGMJY4vSCRu00U+swYSW
 c98Mexf4SyAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; 
   d="scan'208";a="453256159"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Mar 2021 15:23:49 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lPYOK-0002In-Fi; Thu, 25 Mar 2021 22:23:48 +0000
Date:   Fri, 26 Mar 2021 06:23:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 58b5ada8c465b5f1300bc021ebd3d3b8149124b4
Message-ID: <605d0d59.+i68DOdVmlG50irC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 58b5ada8c465b5f1300bc021ebd3d3b8149124b4  pinctrl: qcom: fix unintentional string concatenation

elapsed time: 729m

configs tested: 182
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                            allmodconfig
x86_64                           allyesconfig
i386                             allyesconfig
riscv                            allyesconfig
mips                           ip28_defconfig
powerpc                   lite5200b_defconfig
arm                         s5pv210_defconfig
powerpc                   currituck_defconfig
h8300                            alldefconfig
powerpc                     ksi8560_defconfig
powerpc                  mpc885_ads_defconfig
xtensa                         virt_defconfig
arm                           corgi_defconfig
powerpc64                           defconfig
sh                            titan_defconfig
powerpc                       maple_defconfig
powerpc                      obs600_defconfig
sparc64                             defconfig
arm                         assabet_defconfig
xtensa                              defconfig
sh                         ecovec24_defconfig
m68k                        m5407c3_defconfig
mips                        qi_lb60_defconfig
mips                         tb0226_defconfig
arm                              alldefconfig
sh                               alldefconfig
m68k                       m5475evb_defconfig
sh                   secureedge5410_defconfig
arm                        cerfcube_defconfig
powerpc                     mpc5200_defconfig
arm                          pxa3xx_defconfig
sh                          rsk7264_defconfig
csky                                defconfig
sh                     sh7710voipgw_defconfig
m68k                        stmark2_defconfig
arm                       mainstone_defconfig
mips                       bmips_be_defconfig
arm                        multi_v7_defconfig
s390                          debug_defconfig
arc                      axs103_smp_defconfig
arm                        keystone_defconfig
sh                           se7619_defconfig
arm                        spear3xx_defconfig
mips                         db1xxx_defconfig
powerpc                      cm5200_defconfig
arm                       cns3420vb_defconfig
parisc                           alldefconfig
arm                        shmobile_defconfig
arm                            pleb_defconfig
sh                   sh7770_generic_defconfig
mips                         tb0287_defconfig
um                                allnoconfig
m68k                          atari_defconfig
arm                          pcm027_defconfig
microblaze                      mmu_defconfig
mips                           ip27_defconfig
mips                       rbtx49xx_defconfig
ia64                      gensparse_defconfig
arm                      jornada720_defconfig
mips                     loongson1c_defconfig
powerpc                     sequoia_defconfig
powerpc                      katmai_defconfig
arm                       aspeed_g5_defconfig
microblaze                          defconfig
mips                  cavium_octeon_defconfig
powerpc                       ppc64_defconfig
m68k                           sun3_defconfig
xtensa                  cadence_csp_defconfig
mips                           gcw0_defconfig
powerpc                 mpc834x_mds_defconfig
arc                          axs103_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                     tqm8548_defconfig
arm                        multi_v5_defconfig
sh                           sh2007_defconfig
powerpc                        fsp2_defconfig
mips                          malta_defconfig
arm                            xcep_defconfig
m68k                        mvme147_defconfig
xtensa                    xip_kc705_defconfig
mips                  maltasmvp_eva_defconfig
mips                          rm200_defconfig
arm                         lpc32xx_defconfig
mips                      maltaaprp_defconfig
sh                          lboxre2_defconfig
arm                         axm55xx_defconfig
ia64                        generic_defconfig
m68k                            mac_defconfig
nds32                            alldefconfig
arm                           spitz_defconfig
powerpc                        icon_defconfig
powerpc                   motionpro_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                            dove_defconfig
arm                          gemini_defconfig
sh                           se7751_defconfig
powerpc                    klondike_defconfig
sh                           se7343_defconfig
openrisc                    or1ksim_defconfig
m68k                                defconfig
powerpc                      pasemi_defconfig
arm64                            alldefconfig
arm                       multi_v4t_defconfig
arm                          ixp4xx_defconfig
arc                        nsimosci_defconfig
sh                          polaris_defconfig
arm                       imx_v6_v7_defconfig
mips                       lemote2f_defconfig
powerpc                     powernv_defconfig
mips                 decstation_r4k_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210325
x86_64               randconfig-a003-20210325
x86_64               randconfig-a006-20210325
x86_64               randconfig-a001-20210325
x86_64               randconfig-a005-20210325
x86_64               randconfig-a004-20210325
i386                 randconfig-a003-20210325
i386                 randconfig-a004-20210325
i386                 randconfig-a001-20210325
i386                 randconfig-a002-20210325
i386                 randconfig-a006-20210325
i386                 randconfig-a005-20210325
i386                 randconfig-a014-20210325
i386                 randconfig-a011-20210325
i386                 randconfig-a015-20210325
i386                 randconfig-a016-20210325
i386                 randconfig-a013-20210325
i386                 randconfig-a012-20210325
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210325
x86_64               randconfig-a015-20210325
x86_64               randconfig-a014-20210325
x86_64               randconfig-a013-20210325
x86_64               randconfig-a011-20210325
x86_64               randconfig-a016-20210325

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
