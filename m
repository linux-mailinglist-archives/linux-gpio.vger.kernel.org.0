Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFAD2349C33
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 23:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhCYWYU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 18:24:20 -0400
Received: from mga14.intel.com ([192.55.52.115]:35011 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230285AbhCYWXv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 25 Mar 2021 18:23:51 -0400
IronPort-SDR: i3w+Het3oMODSXrZl4QUrdG1iFiQdlR+H/S4ivGOLmPXeFXbzk6h8j9ziB0Oxey2+hcpmZQM4O
 UkoF1popLj/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="190458449"
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; 
   d="scan'208";a="190458449"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2021 15:23:50 -0700
IronPort-SDR: OUWTnJGbPgix7dRpKVqbXdwGxOar77wzhFrWfncbqkzh51VkbKJlWnqMUChWPQikNYgw+dVF4+
 d0DxBcQHFYwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; 
   d="scan'208";a="414322731"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 25 Mar 2021 15:23:49 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lPYOK-0002If-DU; Thu, 25 Mar 2021 22:23:48 +0000
Date:   Fri, 26 Mar 2021 06:23:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 b9fd814e2c5d51e62ce099b8a23f68b1f6968255
Message-ID: <605d0d55.nMeNuOc8OOQHg1jD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: b9fd814e2c5d51e62ce099b8a23f68b1f6968255  Merge branch 'devel' into for-next

elapsed time: 729m

configs tested: 150
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
powerpc                       maple_defconfig
powerpc                      obs600_defconfig
sparc64                             defconfig
arm                         assabet_defconfig
xtensa                              defconfig
sh                         ecovec24_defconfig
powerpc                     mpc5200_defconfig
arm                          pxa3xx_defconfig
sh                          rsk7264_defconfig
sh                     sh7710voipgw_defconfig
m68k                        stmark2_defconfig
arm                       mainstone_defconfig
mips                       bmips_be_defconfig
arm                        multi_v7_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                          rb532_defconfig
powerpc                 mpc834x_mds_defconfig
s390                          debug_defconfig
arc                      axs103_smp_defconfig
arm                        keystone_defconfig
sh                           se7619_defconfig
arm                        spear3xx_defconfig
arm                       aspeed_g5_defconfig
arm                            pleb_defconfig
arm                            mmp2_defconfig
s390                             alldefconfig
xtensa                  cadence_csp_defconfig
arm                       imx_v6_v7_defconfig
mips                     loongson1c_defconfig
powerpc                     sequoia_defconfig
powerpc                      katmai_defconfig
sh                ecovec24-romimage_defconfig
arm                      pxa255-idp_defconfig
arm                            mps2_defconfig
powerpc                      makalu_defconfig
microblaze                          defconfig
mips                  cavium_octeon_defconfig
sh                          sdk7780_defconfig
powerpc                      acadia_defconfig
ia64                             allyesconfig
mips                           ip28_defconfig
arm                           omap1_defconfig
xtensa                    xip_kc705_defconfig
mips                  maltasmvp_eva_defconfig
sh                           se7712_defconfig
arc                    vdk_hs38_smp_defconfig
arm                        multi_v5_defconfig
mips                         cobalt_defconfig
powerpc                        icon_defconfig
mips                          rm200_defconfig
arm                         lpc32xx_defconfig
mips                      maltaaprp_defconfig
sh                          lboxre2_defconfig
arm                         axm55xx_defconfig
ia64                        generic_defconfig
mips                        qi_lb60_defconfig
m68k                            mac_defconfig
arm                           u8500_defconfig
arm                       netwinder_defconfig
arm                         s5pv210_defconfig
powerpc                       eiger_defconfig
arm                          lpd270_defconfig
powerpc                      pasemi_defconfig
arm64                            alldefconfig
arm                       multi_v4t_defconfig
arm                          ixp4xx_defconfig
arc                        nsimosci_defconfig
arm                         shannon_defconfig
arm                           tegra_defconfig
powerpc                     tqm8560_defconfig
sh                          polaris_defconfig
mips                       lemote2f_defconfig
ia64                             allmodconfig
ia64                                defconfig
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
um                                allnoconfig
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
