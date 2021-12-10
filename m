Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0DD746FACA
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 07:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233180AbhLJGxd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 01:53:33 -0500
Received: from mga02.intel.com ([134.134.136.20]:7972 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229853AbhLJGxc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Dec 2021 01:53:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639118998; x=1670654998;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=57a+ZxEpF+eixFLveE/FDp2IPxxQzn4NOPop9WRAF9E=;
  b=L6k20qezQqxPp+7fEXP7TRaZ/T+wwekuwicMGR4Vx1V1dt3OzTKrqY2o
   8cCi0gr/Gb0CNtiN7Drj8xffYs1YDj2wqU0MEsuHlFT/+XkQkLxTCPFVZ
   axDj+EqiWEJ++pYlCAgPBwBGZLdERzpqpb4Ypjscsh3AQAmH+79GXe4UX
   N1TrgLfnc6Tfhdu7ef+3CrYgxb2CgYRWfg64M4P2y++A/CazU7M0RPbVC
   TwBQ1uM4SWLhm9xtZmJAlvUbjXAEA2nl89sM/OJR9Gr7yGRGRl3jA2eEx
   /qNIVm3PUSd938TMtSKHWyyJGzD4lb8aiPOpU1TNC2hSZSER+8gI3kk1k
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="225561872"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; 
   d="scan'208";a="225561872"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2021 22:49:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; 
   d="scan'208";a="612832726"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 09 Dec 2021 22:49:57 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mvZjA-0002st-9k; Fri, 10 Dec 2021 06:49:56 +0000
Date:   Fri, 10 Dec 2021 14:49:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 b124c8bd50c7550ed966c09f69ffdbaaedc0aa15
Message-ID: <61b2f880.3MDRBiQO6jTcXj3j%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: b124c8bd50c7550ed966c09f69ffdbaaedc0aa15  pinctrl: Sort Kconfig and Makefile entries alphabetically

elapsed time: 723m

configs tested: 182
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
i386                 randconfig-c001-20211209
i386                 randconfig-c001-20211210
powerpc                    socrates_defconfig
sh                          r7780mp_defconfig
m68k                       m5208evb_defconfig
sh                          sdk7780_defconfig
mips                        qi_lb60_defconfig
powerpc                    sam440ep_defconfig
m68k                        m5307c3_defconfig
arm                           sunxi_defconfig
xtensa                  cadence_csp_defconfig
m68k                          amiga_defconfig
powerpc                           allnoconfig
mips                           ip28_defconfig
sh                          polaris_defconfig
nios2                         10m50_defconfig
powerpc                     asp8347_defconfig
mips                        vocore2_defconfig
powerpc                      tqm8xx_defconfig
arm                             mxs_defconfig
sh                        apsh4ad0a_defconfig
alpha                            allyesconfig
powerpc                 mpc834x_mds_defconfig
powerpc                     kilauea_defconfig
powerpc                      makalu_defconfig
sh                          lboxre2_defconfig
nios2                            alldefconfig
sh                          landisk_defconfig
powerpc                         wii_defconfig
arm                           tegra_defconfig
powerpc                        icon_defconfig
mips                        bcm63xx_defconfig
sh                           se7712_defconfig
arm                             rpc_defconfig
sparc                       sparc32_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                 xes_mpc85xx_defconfig
nds32                             allnoconfig
sh                           se7705_defconfig
powerpc                      mgcoge_defconfig
sh                          sdk7786_defconfig
arm                           sama7_defconfig
sh                          rsk7201_defconfig
mips                         cobalt_defconfig
arm                        multi_v5_defconfig
powerpc                     redwood_defconfig
sh                          rsk7269_defconfig
arm                           sama5_defconfig
sh                        sh7763rdp_defconfig
powerpc                     rainier_defconfig
arm                            dove_defconfig
nds32                               defconfig
m68k                         apollo_defconfig
arm                     am200epdkit_defconfig
mips                         mpc30x_defconfig
powerpc                 canyonlands_defconfig
powerpc                      pcm030_defconfig
arm                        keystone_defconfig
xtensa                              defconfig
powerpc                     ppa8548_defconfig
m68k                             alldefconfig
arm                      jornada720_defconfig
arm                             pxa_defconfig
m68k                        m5407c3_defconfig
powerpc                        warp_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                 mpc836x_mds_defconfig
arm                     davinci_all_defconfig
powerpc                     taishan_defconfig
sh                             shx3_defconfig
mips                     loongson1b_defconfig
sh                             sh03_defconfig
mips                         db1xxx_defconfig
arm                      integrator_defconfig
powerpc                      chrp32_defconfig
um                           x86_64_defconfig
arm                       spear13xx_defconfig
arm                          pxa168_defconfig
openrisc                 simple_smp_defconfig
powerpc                      ppc44x_defconfig
arm                  randconfig-c002-20211210
arm                  randconfig-c002-20211209
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a001-20211209
x86_64               randconfig-a002-20211209
x86_64               randconfig-a003-20211209
x86_64               randconfig-a004-20211209
i386                 randconfig-a001-20211210
i386                 randconfig-a002-20211210
i386                 randconfig-a005-20211210
i386                 randconfig-a003-20211210
i386                 randconfig-a006-20211210
i386                 randconfig-a004-20211210
i386                 randconfig-a001-20211209
i386                 randconfig-a005-20211209
i386                 randconfig-a003-20211209
i386                 randconfig-a002-20211209
i386                 randconfig-a006-20211209
i386                 randconfig-a004-20211209
x86_64               randconfig-a006-20211209
x86_64               randconfig-a005-20211209
x86_64               randconfig-a006-20211210
x86_64               randconfig-a005-20211210
x86_64               randconfig-a001-20211210
x86_64               randconfig-a002-20211210
x86_64               randconfig-a003-20211210
x86_64               randconfig-a004-20211210
arc                  randconfig-r043-20211209
riscv                    nommu_k210_defconfig
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
x86_64               randconfig-a011-20211209
x86_64               randconfig-a013-20211209
x86_64               randconfig-a015-20211209
x86_64               randconfig-a012-20211209
x86_64               randconfig-a014-20211209
x86_64               randconfig-a016-20211209
x86_64               randconfig-a011-20211210
x86_64               randconfig-a012-20211210
x86_64               randconfig-a014-20211210
x86_64               randconfig-a013-20211210
x86_64               randconfig-a016-20211210
x86_64               randconfig-a015-20211210
i386                 randconfig-a013-20211210
i386                 randconfig-a011-20211210
i386                 randconfig-a016-20211210
i386                 randconfig-a014-20211210
i386                 randconfig-a015-20211210
i386                 randconfig-a012-20211210
hexagon              randconfig-r041-20211209
s390                 randconfig-r044-20211209
hexagon              randconfig-r045-20211209
riscv                randconfig-r042-20211209
hexagon              randconfig-r045-20211210
riscv                randconfig-r042-20211210
s390                 randconfig-r044-20211210
hexagon              randconfig-r041-20211210

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
