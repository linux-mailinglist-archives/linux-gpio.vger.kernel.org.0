Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B86304A36C2
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jan 2022 15:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238650AbiA3Ohm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Jan 2022 09:37:42 -0500
Received: from mga01.intel.com ([192.55.52.88]:61893 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239952AbiA3Ohl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 30 Jan 2022 09:37:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643553461; x=1675089461;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qdj38q87flDto5J9ovwf/lNIQndtnLgMX+uJ0EgXsVI=;
  b=N0x7U0MIofejUw0ZnHey2cAfN/cvGAawNDlGFhVWVyzhbmhqAR/bWihc
   8XjZ+OAnlYsWVREhEJS91aclDjwtbn+p3uFQ+0BSPVKDKe3J8vt36ZygN
   pfVHJhDrgRRtP8RKyUMdMQf5bXb7b+TE5GFvli5ZKojXsReaMVnO10q2l
   /SD269AaTCi2EPlE+6E5gLQ02ugfIKSMGuhTQF/EgNX3hJFVfAtY14SLP
   cxYR/XJdFnsv9fJ6R24C1BRSJqmWV3SE77HJpMmENJ0rvLYW3uWnRYp32
   QPp0DxYvg8IEHoLQWn8yVpMPSP6KDEzromSx2kukZtCLbLbJVhC7ay3nk
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="271817242"
X-IronPort-AV: E=Sophos;i="5.88,328,1635231600"; 
   d="scan'208";a="271817242"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2022 06:37:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,328,1635231600"; 
   d="scan'208";a="522274075"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Jan 2022 06:37:39 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nEBKk-000QcR-QB; Sun, 30 Jan 2022 14:37:38 +0000
Date:   Sun, 30 Jan 2022 22:36:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 3a5286955bf5febc3d151bcb2c5e272e383b64aa
Message-ID: <61f6a27f./gvXj+kF2CDZwzCg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 3a5286955bf5febc3d151bcb2c5e272e383b64aa  pinctrl: bcm63xx: fix unmet dependency on REGMAP for GPIO_REGMAP

elapsed time: 724m

configs tested: 136
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
m68k                             allmodconfig
powerpc                          allmodconfig
m68k                             allyesconfig
powerpc                          allyesconfig
s390                             allmodconfig
s390                             allyesconfig
sh                  sh7785lcr_32bit_defconfig
arm                           sunxi_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                          amiga_defconfig
arm                           u8500_defconfig
sparc64                             defconfig
powerpc                        cell_defconfig
powerpc                     ep8248e_defconfig
sh                                  defconfig
sh                          r7785rp_defconfig
powerpc                      bamboo_defconfig
mips                        jmr3927_defconfig
arm                           sama5_defconfig
parisc                generic-32bit_defconfig
sh                           se7750_defconfig
arm                         s3c6400_defconfig
mips                             allmodconfig
sh                           se7721_defconfig
powerpc                      arches_defconfig
mips                       capcella_defconfig
arm                         lubbock_defconfig
nds32                               defconfig
nds32                             allnoconfig
arc                    vdk_hs38_smp_defconfig
m68k                         amcore_defconfig
powerpc                     tqm8541_defconfig
arm                        spear6xx_defconfig
xtensa                           alldefconfig
m68k                                defconfig
i386                             alldefconfig
arm                             rpc_defconfig
powerpc                       eiger_defconfig
powerpc                    adder875_defconfig
mips                 decstation_r4k_defconfig
powerpc                      pcm030_defconfig
sh                               allmodconfig
mips                         tb0226_defconfig
sh                        edosk7705_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                          polaris_defconfig
sh                         microdev_defconfig
arm                        cerfcube_defconfig
h8300                    h8300h-sim_defconfig
sh                      rts7751r2d1_defconfig
arm                         lpc18xx_defconfig
powerpc                      ep88xc_defconfig
mips                  maltasmvp_eva_defconfig
riscv                    nommu_k210_defconfig
sh                           se7206_defconfig
powerpc                      ppc6xx_defconfig
powerpc                 mpc834x_mds_defconfig
sh                          rsk7264_defconfig
sh                             espt_defconfig
sh                           se7712_defconfig
i386                                defconfig
arm                  randconfig-c002-20220130
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220130
arc                  randconfig-r043-20220130
s390                 randconfig-r044-20220130
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220130
x86_64                        randconfig-c007
arm                  randconfig-c002-20220130
powerpc              randconfig-c003-20220130
mips                 randconfig-c004-20220130
i386                          randconfig-c001
arm                        multi_v5_defconfig
arm                          ixp4xx_defconfig
arm                        spear3xx_defconfig
hexagon                             defconfig
powerpc                 mpc8315_rdb_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220130
hexagon              randconfig-r041-20220130

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
