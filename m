Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A640A3DC5BF
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jul 2021 13:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232828AbhGaLli (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 31 Jul 2021 07:41:38 -0400
Received: from mga17.intel.com ([192.55.52.151]:61559 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232263AbhGaLli (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 31 Jul 2021 07:41:38 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10061"; a="193512587"
X-IronPort-AV: E=Sophos;i="5.84,284,1620716400"; 
   d="scan'208";a="193512587"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2021 04:41:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,284,1620716400"; 
   d="scan'208";a="500877057"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 Jul 2021 04:41:29 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m9nMv-000B5e-7m; Sat, 31 Jul 2021 11:41:29 +0000
Date:   Sat, 31 Jul 2021 19:41:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 dc715ae993c5468b389f5f9a4bea5e7e82cc5520
Message-ID: <610536d8.BSMBxnT7Gy77jwAT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: dc715ae993c5468b389f5f9a4bea5e7e82cc5520  Merge branch 'devel' into for-next

elapsed time: 724m

configs tested: 137
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210730
nds32                            alldefconfig
m68k                       m5249evb_defconfig
sh                          r7785rp_defconfig
powerpc                 mpc832x_mds_defconfig
arm                            xcep_defconfig
nios2                         3c120_defconfig
powerpc                 mpc8540_ads_defconfig
mips                     loongson1b_defconfig
m68k                          amiga_defconfig
powerpc                        cell_defconfig
arm                       aspeed_g5_defconfig
powerpc                        warp_defconfig
m68k                                defconfig
mips                      pic32mzda_defconfig
mips                          malta_defconfig
h8300                            alldefconfig
arm                          collie_defconfig
powerpc                     ppa8548_defconfig
arm                           sunxi_defconfig
arm                     eseries_pxa_defconfig
m68k                           sun3_defconfig
arm                          simpad_defconfig
mips                   sb1250_swarm_defconfig
h8300                     edosk2674_defconfig
arm                       mainstone_defconfig
arm                            dove_defconfig
sh                        edosk7705_defconfig
m68k                       bvme6000_defconfig
arm                         assabet_defconfig
arm                           viper_defconfig
m68k                            q40_defconfig
m68k                        m5307c3_defconfig
arm                         s3c6400_defconfig
arm                        keystone_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                   secureedge5410_defconfig
csky                             alldefconfig
powerpc                     sbc8548_defconfig
riscv                    nommu_virt_defconfig
powerpc                      mgcoge_defconfig
nios2                         10m50_defconfig
arm                           h3600_defconfig
powerpc                       eiger_defconfig
powerpc                      chrp32_defconfig
mips                      fuloong2e_defconfig
sh                ecovec24-romimage_defconfig
mips                           rs90_defconfig
arm                      footbridge_defconfig
x86_64                            allnoconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210730
i386                 randconfig-a004-20210730
i386                 randconfig-a003-20210730
i386                 randconfig-a002-20210730
i386                 randconfig-a006-20210730
i386                 randconfig-a001-20210730
i386                 randconfig-a005-20210731
i386                 randconfig-a004-20210731
i386                 randconfig-a003-20210731
i386                 randconfig-a002-20210731
i386                 randconfig-a006-20210731
i386                 randconfig-a001-20210731
x86_64               randconfig-a015-20210730
x86_64               randconfig-a014-20210730
x86_64               randconfig-a013-20210730
x86_64               randconfig-a011-20210730
x86_64               randconfig-a012-20210730
x86_64               randconfig-a016-20210730
i386                 randconfig-a013-20210730
i386                 randconfig-a016-20210730
i386                 randconfig-a012-20210730
i386                 randconfig-a011-20210730
i386                 randconfig-a014-20210730
i386                 randconfig-a015-20210730
x86_64               randconfig-a001-20210731
x86_64               randconfig-a006-20210731
x86_64               randconfig-a005-20210731
x86_64               randconfig-a004-20210731
x86_64               randconfig-a002-20210731
x86_64               randconfig-a003-20210731
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210731
x86_64               randconfig-c001-20210730
x86_64               randconfig-a001-20210730
x86_64               randconfig-a006-20210730
x86_64               randconfig-a005-20210730
x86_64               randconfig-a004-20210730
x86_64               randconfig-a002-20210730
x86_64               randconfig-a003-20210730

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
