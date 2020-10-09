Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B40A42885DA
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 11:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733069AbgJIJRe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Oct 2020 05:17:34 -0400
Received: from mga03.intel.com ([134.134.136.65]:38333 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732712AbgJIJRe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Oct 2020 05:17:34 -0400
IronPort-SDR: bbg9uZvuxBxbqkCkBnIVbd7OaiCqL/n7xUVBcLnvOjLmDseGShsRPuANSfKsma5BmYGz+tD/cB
 J5ps4GRgZ2zg==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="165524412"
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; 
   d="scan'208";a="165524412"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 02:17:33 -0700
IronPort-SDR: G8BEXkpNuneUT8/FZv5BvylDbY83a8Dpqhlx9wEe7kXgXXxJM2GoMnCnmanCFTxpoi1njCOVmr
 iVJNbEEm9agg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; 
   d="scan'208";a="528853438"
Received: from lkp-server02.sh.intel.com (HELO 80eb06af76cf) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 09 Oct 2020 02:17:31 -0700
Received: from kbuild by 80eb06af76cf with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kQoWp-0000MW-5N; Fri, 09 Oct 2020 09:17:31 +0000
Date:   Fri, 09 Oct 2020 17:16:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel] BUILD SUCCESS
 fc709df553a34fd18010f52e6b47652268d83e7d
Message-ID: <5f802a80.3085lvqkU2bRQJ3g%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel
branch HEAD: fc709df553a34fd18010f52e6b47652268d83e7d  gpiolib: Update header block in gpiolib-cdev.h

elapsed time: 720m

configs tested: 126
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                  colibri_pxa300_defconfig
m68k                       m5475evb_defconfig
mips                      fuloong2e_defconfig
arm                          exynos_defconfig
powerpc                 mpc832x_mds_defconfig
arm                        mvebu_v5_defconfig
arm                           omap1_defconfig
s390                                defconfig
mips                   sb1250_swarm_defconfig
powerpc                  mpc885_ads_defconfig
sh                          rsk7203_defconfig
sh                 kfr2r09-romimage_defconfig
c6x                        evmc6678_defconfig
powerpc                      ppc64e_defconfig
powerpc                        warp_defconfig
arm                       mainstone_defconfig
mips                             allyesconfig
powerpc                     ep8248e_defconfig
powerpc                        fsp2_defconfig
sh                           se7343_defconfig
arm                        clps711x_defconfig
arm                       aspeed_g5_defconfig
arm                              zx_defconfig
sh                          r7785rp_defconfig
powerpc                     kilauea_defconfig
mips                     cu1830-neo_defconfig
powerpc                 mpc832x_rdb_defconfig
m68k                             allmodconfig
sh                   rts7751r2dplus_defconfig
powerpc                        icon_defconfig
m68k                        m5307c3_defconfig
m68k                       m5275evb_defconfig
powerpc                     ppa8548_defconfig
openrisc                    or1ksim_defconfig
sh                          rsk7201_defconfig
riscv                             allnoconfig
sh                   secureedge5410_defconfig
arm                         mv78xx0_defconfig
arm                         assabet_defconfig
mips                          ath25_defconfig
mips                           rs90_defconfig
powerpc                       holly_defconfig
arm                      pxa255-idp_defconfig
sh                        edosk7705_defconfig
openrisc                            defconfig
powerpc                      cm5200_defconfig
powerpc                       eiger_defconfig
sh                        sh7757lcr_defconfig
arm                          imote2_defconfig
arm                       aspeed_g4_defconfig
sh                             shx3_defconfig
sh                           se7721_defconfig
arm                        spear3xx_defconfig
ia64                             alldefconfig
arm                        oxnas_v6_defconfig
arm                        trizeps4_defconfig
ia64                             allmodconfig
ia64                                defconfig
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
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20201009
i386                 randconfig-a005-20201009
i386                 randconfig-a001-20201009
i386                 randconfig-a004-20201009
i386                 randconfig-a002-20201009
i386                 randconfig-a003-20201009
x86_64               randconfig-a012-20201009
x86_64               randconfig-a015-20201009
x86_64               randconfig-a013-20201009
x86_64               randconfig-a014-20201009
x86_64               randconfig-a011-20201009
x86_64               randconfig-a016-20201009
i386                 randconfig-a015-20201009
i386                 randconfig-a013-20201009
i386                 randconfig-a014-20201009
i386                 randconfig-a016-20201009
i386                 randconfig-a011-20201009
i386                 randconfig-a012-20201009
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
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
x86_64               randconfig-a004-20201009
x86_64               randconfig-a003-20201009
x86_64               randconfig-a005-20201009
x86_64               randconfig-a001-20201009
x86_64               randconfig-a002-20201009
x86_64               randconfig-a006-20201009

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
