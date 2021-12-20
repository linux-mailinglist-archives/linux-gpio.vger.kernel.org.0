Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0BA847ADD2
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Dec 2021 15:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235900AbhLTOzz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Dec 2021 09:55:55 -0500
Received: from mga12.intel.com ([192.55.52.136]:61008 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237544AbhLTOwe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Dec 2021 09:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640011954; x=1671547954;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=l//8ZlnseTYf7+AwSBUaweB9AE0YEXAgVSMb3EvK3hM=;
  b=V+A6dcD/mW3IBZsbyNzZPJztQlQLoqsJ9Ie/KsSg5jm1HvP5q6Vw7b8U
   Z6h8XTVX3kLc8qOVxoduh+jM32VqbvgCY0gD/M2Jd9cTKwmQEw2yK8362
   rYPWNayopb7BhEgTCyHSNTEyP1KQE5tDKcFwbug3UP/DJnQdKfZKocVmT
   LI/uQFeGbjCk8+wKoXwcCinBoy25x9DCquhCgznxok1FynPozp3d1hl+r
   4bVGudUnyQ3L06aT9QyvUKZj3OWS8YGqyVJa11wHi4ev/gcgXcVVr4ztE
   yLcHcmMo7x3i7v6qqIvru1Sv24KU/lDJCMRu3GMLJAFBft3Fj5AzXWaP+
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="220190727"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="220190727"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 06:46:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="663633323"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 20 Dec 2021 06:46:09 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mzJvU-0007sl-Vj; Mon, 20 Dec 2021 14:46:08 +0000
Date:   Mon, 20 Dec 2021 22:45:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 facb4e40e4a2f379160ba15c355279206a3d88c5
Message-ID: <61c09706.x6EuRqyfTgS24lVQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: facb4e40e4a2f379160ba15c355279206a3d88c5  Merge tag 'renesas-pinctrl-for-v5.17-tag2' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into devel

elapsed time: 725m

configs tested: 146
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc834x_itx_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                    adder875_defconfig
m68k                       m5249evb_defconfig
powerpc                     sequoia_defconfig
arm                           viper_defconfig
powerpc                    sam440ep_defconfig
mips                        maltaup_defconfig
sparc64                          alldefconfig
powerpc                        warp_defconfig
mips                         mpc30x_defconfig
arm                             pxa_defconfig
powerpc                        fsp2_defconfig
arm                         s5pv210_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                          ath25_defconfig
mips                         db1xxx_defconfig
arm                            lart_defconfig
riscv                    nommu_virt_defconfig
mips                        vocore2_defconfig
mips                           ci20_defconfig
mips                      pic32mzda_defconfig
arm                            hisi_defconfig
arm                         palmz72_defconfig
powerpc                      chrp32_defconfig
arm                         axm55xx_defconfig
arm                         lubbock_defconfig
arm                           tegra_defconfig
sh                            hp6xx_defconfig
arm                       imx_v4_v5_defconfig
mips                     loongson2k_defconfig
m68k                        m5272c3_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     tqm8548_defconfig
arm                        oxnas_v6_defconfig
arm                          collie_defconfig
sh                           se7712_defconfig
powerpc                      walnut_defconfig
powerpc64                        alldefconfig
sh                           se7206_defconfig
sh                          landisk_defconfig
mips                      fuloong2e_defconfig
mips                     cu1000-neo_defconfig
arm                        mvebu_v5_defconfig
powerpc                      pcm030_defconfig
powerpc                      cm5200_defconfig
arm                             rpc_defconfig
arm                         s3c2410_defconfig
ia64                            zx1_defconfig
s390                       zfcpdump_defconfig
openrisc                  or1klitex_defconfig
sh                        sh7763rdp_defconfig
arm                       versatile_defconfig
powerpc                      ppc44x_defconfig
m68k                        m5307c3_defconfig
arm                       cns3420vb_defconfig
powerpc                 canyonlands_defconfig
sh                         apsh4a3a_defconfig
powerpc                         wii_defconfig
nios2                         10m50_defconfig
mips                            ar7_defconfig
powerpc                        cell_defconfig
openrisc                 simple_smp_defconfig
arm                  randconfig-c002-20211220
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
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
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20211220
x86_64               randconfig-a003-20211220
x86_64               randconfig-a005-20211220
x86_64               randconfig-a006-20211220
x86_64               randconfig-a004-20211220
x86_64               randconfig-a002-20211220
i386                 randconfig-a006-20211220
i386                 randconfig-a004-20211220
i386                 randconfig-a002-20211220
i386                 randconfig-a003-20211220
i386                 randconfig-a005-20211220
i386                 randconfig-a001-20211220
arc                  randconfig-r043-20211220
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
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
x86_64               randconfig-a013-20211220
x86_64               randconfig-a014-20211220
x86_64               randconfig-a012-20211220
x86_64               randconfig-a011-20211220
x86_64               randconfig-a015-20211220
x86_64               randconfig-a016-20211220
i386                 randconfig-a012-20211220
i386                 randconfig-a011-20211220
i386                 randconfig-a013-20211220
i386                 randconfig-a015-20211220
i386                 randconfig-a014-20211220
i386                 randconfig-a016-20211220
hexagon              randconfig-r041-20211220
hexagon              randconfig-r045-20211220
riscv                randconfig-r042-20211220
s390                 randconfig-r044-20211220

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
