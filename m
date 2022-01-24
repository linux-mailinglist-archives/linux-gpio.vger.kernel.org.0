Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9510498269
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jan 2022 15:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238715AbiAXObE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jan 2022 09:31:04 -0500
Received: from mga17.intel.com ([192.55.52.151]:60951 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230045AbiAXOaj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Jan 2022 09:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643034639; x=1674570639;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hyCrBOy0v0sW5ev9sdLSkc1kkuBvE68goT6mB5/IwQ4=;
  b=Aqryksfst8SbexgYFpUAwZWGc/zqsFL2DDOfwV8Va25hJzzeQ1cgFPIL
   VoWz7ng/9PeTKv/Qdg6r8BtI8Quq8p6gtHo20WpqaHIuoHxy7XbGDW06m
   A063tQnUO3umxsAN8TfN+6GQD6Q0ok8R/VEdeV6tLeyIUwb3MHmEEErZM
   wH9vKPQsycPVD9jNPz4XEJZNlCq7RvdWfJa2LX1BGv/hza4ovibINR/1P
   Lj7f78hedQCTYvxmWNORABUz+XbX08516AiSx+aTc6L64HlDDaSq2fLSi
   fWJi7tu4tihH3ikhxXKSz84uoFz+oN/bp8x1w/XQOIJw2KG9aW9qVxTAl
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="226728130"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="226728130"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 06:29:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="617249362"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2022 06:29:44 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nC0Lo-000ISO-6u; Mon, 24 Jan 2022 14:29:44 +0000
Date:   Mon, 24 Jan 2022 22:29:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 c00cdc32e7272673ef3c6504c6d0b0be53759ddc
Message-ID: <61eeb7c0.8Xw7/+gG30Uk2eXQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: c00cdc32e7272673ef3c6504c6d0b0be53759ddc  pinctrl: at91-pio4: Use platform_get_irq() to get the interrupt

elapsed time: 728m

configs tested: 185
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
arc                 nsimosci_hs_smp_defconfig
arm                       imx_v6_v7_defconfig
i386                                defconfig
xtensa                       common_defconfig
m68k                          multi_defconfig
arc                         haps_hs_defconfig
arm                            xcep_defconfig
arm                           tegra_defconfig
ia64                            zx1_defconfig
arm                       aspeed_g5_defconfig
powerpc64                        alldefconfig
openrisc                 simple_smp_defconfig
sh                          urquell_defconfig
sh                          landisk_defconfig
sh                          r7780mp_defconfig
parisc                              defconfig
powerpc                       eiger_defconfig
sh                          rsk7264_defconfig
m68k                        mvme16x_defconfig
sh                          lboxre2_defconfig
sh                           se7751_defconfig
sh                         microdev_defconfig
powerpc                     stx_gp3_defconfig
arm                         cm_x300_defconfig
powerpc                     tqm8548_defconfig
powerpc                 mpc837x_mds_defconfig
sh                          rsk7269_defconfig
arm                         vf610m4_defconfig
sh                            shmin_defconfig
powerpc                         ps3_defconfig
m68k                        m5407c3_defconfig
xtensa                    smp_lx200_defconfig
x86_64                           alldefconfig
sparc                       sparc32_defconfig
s390                          debug_defconfig
nios2                            alldefconfig
h8300                       h8s-sim_defconfig
alpha                               defconfig
xtensa                              defconfig
xtensa                           allyesconfig
mips                     loongson1b_defconfig
i386                             alldefconfig
arc                        vdk_hs38_defconfig
sh                           se7780_defconfig
sh                           se7705_defconfig
sh                          rsk7201_defconfig
ia64                        generic_defconfig
mips                         cobalt_defconfig
arm                           sunxi_defconfig
sh                         ap325rxa_defconfig
powerpc                     mpc83xx_defconfig
h8300                            alldefconfig
nds32                            alldefconfig
sh                          sdk7786_defconfig
arm                            mps2_defconfig
mips                        vocore2_defconfig
powerpc                    adder875_defconfig
mips                       capcella_defconfig
m68k                        mvme147_defconfig
powerpc                       maple_defconfig
m68k                          amiga_defconfig
mips                            ar7_defconfig
arm                           u8500_defconfig
powerpc                     tqm8541_defconfig
sh                          sdk7780_defconfig
mips                            gpr_defconfig
microblaze                      mmu_defconfig
m68k                             alldefconfig
arc                    vdk_hs38_smp_defconfig
arc                     haps_hs_smp_defconfig
parisc                generic-32bit_defconfig
sh                      rts7751r2d1_defconfig
sh                          rsk7203_defconfig
sh                           se7343_defconfig
arm                  randconfig-c002-20220123
arm                  randconfig-c002-20220124
ia64                                defconfig
ia64                             allmodconfig
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
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allmodconfig
s390                                defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a002-20220124
x86_64               randconfig-a003-20220124
x86_64               randconfig-a001-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
i386                 randconfig-a002-20220124
i386                 randconfig-a005-20220124
i386                 randconfig-a003-20220124
i386                 randconfig-a004-20220124
i386                 randconfig-a001-20220124
i386                 randconfig-a006-20220124
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
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
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220124
riscv                randconfig-c006-20220124
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
mips                 randconfig-c004-20220124
x86_64               randconfig-c007-20220124
powerpc                   bluestone_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                     tqm8540_defconfig
powerpc                       ebony_defconfig
mips                       rbtx49xx_defconfig
arm                        spear3xx_defconfig
arm                                 defconfig
arm                     am200epdkit_defconfig
mips                          ath79_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                      ppc44x_defconfig
mips                     loongson2k_defconfig
arm                             mxs_defconfig
mips                        bcm63xx_defconfig
arm                            dove_defconfig
arm                        magician_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                     mpc512x_defconfig
mips                           ip22_defconfig
mips                   sb1250_swarm_defconfig
mips                         tb0287_defconfig
arm                        vexpress_defconfig
mips                            e55_defconfig
mips                      maltaaprp_defconfig
arm                          ixp4xx_defconfig
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220123
hexagon              randconfig-r045-20220124
hexagon              randconfig-r041-20220124
hexagon              randconfig-r041-20220123

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
