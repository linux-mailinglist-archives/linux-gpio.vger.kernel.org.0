Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95E6C4A5545
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Feb 2022 03:38:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232355AbiBACiJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Jan 2022 21:38:09 -0500
Received: from mga09.intel.com ([134.134.136.24]:12514 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232126AbiBACiJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 31 Jan 2022 21:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643683089; x=1675219089;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=T0Bb/6fvDhzGeOGbWQ+f+2Jhq57LCjMh6f/duN8sQNE=;
  b=R90eU3KRp9D1ZfLWzzjf5AAyLvIaONae/9H/9XOFXOs6aJDUDB7OHNK+
   vLp75C/iY0GqjufOY6lSwQrfBvW8ZysCDclXQlCje76motwk7L1J7quh+
   DSqrPdulK0P0zjoJX04X0uTU8sIumlCkrd9J7ZYWJgFMrRRnzDK/yj2Oy
   O7f+HmUoZLqZNBANmCBStndGSGdZQed8uWOT0GwgNi1SrlQq4zW94khUo
   ZfZhM71F/txIh4xzKzkDjv49ylsc0cIho3rYhq4T8z1yhVnXBUU9PqAIS
   TqyM/Nb2ZsM5+jRzAndg8f3wSB9sT8idi3GnYH82AO5OxIqVven0+Wbbh
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247377827"
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; 
   d="scan'208";a="247377827"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 18:38:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; 
   d="scan'208";a="675946256"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 31 Jan 2022 18:38:07 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nEj3X-000SdN-0l; Tue, 01 Feb 2022 02:38:07 +0000
Date:   Tue, 01 Feb 2022 10:37:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 baf927a833ca2c6717795ac131079f485cb7a5dc
Message-ID: <61f89d07.OPfEHVOSDsMGvOeZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: baf927a833ca2c6717795ac131079f485cb7a5dc  pinctrl: microchip-sgpio: Fix support for regmap

elapsed time: 727m

configs tested: 135
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220131
sh                          rsk7203_defconfig
m68k                       m5475evb_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                        sh7763rdp_defconfig
mips                         mpc30x_defconfig
sh                 kfr2r09-romimage_defconfig
sh                               alldefconfig
arm                          pxa910_defconfig
arm                          lpd270_defconfig
m68k                       m5208evb_defconfig
mips                 decstation_r4k_defconfig
powerpc                        warp_defconfig
arm                        oxnas_v6_defconfig
sh                          rsk7269_defconfig
powerpc                    klondike_defconfig
powerpc                      ppc40x_defconfig
powerpc                 mpc837x_rdb_defconfig
parisc                           alldefconfig
xtensa                           allyesconfig
arc                    vdk_hs38_smp_defconfig
powerpc                 mpc837x_mds_defconfig
riscv                    nommu_k210_defconfig
mips                      fuloong2e_defconfig
powerpc                      arches_defconfig
arm                           stm32_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     asp8347_defconfig
arm                      footbridge_defconfig
csky                             alldefconfig
arc                                 defconfig
m68k                          sun3x_defconfig
mips                      maltasmvp_defconfig
powerpc                      bamboo_defconfig
mips                        jmr3927_defconfig
x86_64                           alldefconfig
xtensa                  nommu_kc705_defconfig
arm                       omap2plus_defconfig
mips                       capcella_defconfig
sh                        apsh4ad0a_defconfig
arm                            mps2_defconfig
arm                  randconfig-c002-20220131
arm                  randconfig-c002-20220130
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
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
powerpc                           allnoconfig
x86_64               randconfig-a004-20220131
x86_64               randconfig-a003-20220131
x86_64               randconfig-a001-20220131
x86_64               randconfig-a006-20220131
x86_64               randconfig-a005-20220131
x86_64               randconfig-a002-20220131
i386                 randconfig-a006-20220131
i386                 randconfig-a005-20220131
i386                 randconfig-a003-20220131
i386                 randconfig-a002-20220131
i386                 randconfig-a001-20220131
i386                 randconfig-a004-20220131
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
powerpc                          allyesconfig
arm                             mxs_defconfig
arm                        spear3xx_defconfig
mips                        bcm63xx_defconfig
arm                       versatile_defconfig
arm                         orion5x_defconfig
mips                   sb1250_swarm_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a013-20220131
x86_64               randconfig-a015-20220131
x86_64               randconfig-a014-20220131
x86_64               randconfig-a016-20220131
x86_64               randconfig-a011-20220131
x86_64               randconfig-a012-20220131
i386                 randconfig-a011-20220131
i386                 randconfig-a013-20220131
i386                 randconfig-a014-20220131
i386                 randconfig-a012-20220131
i386                 randconfig-a015-20220131
i386                 randconfig-a016-20220131
riscv                randconfig-r042-20220131
hexagon              randconfig-r045-20220131
hexagon              randconfig-r041-20220131
hexagon              randconfig-r045-20220130
hexagon              randconfig-r041-20220130

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
