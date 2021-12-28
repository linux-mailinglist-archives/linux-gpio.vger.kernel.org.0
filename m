Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A504806A9
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Dec 2021 07:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235033AbhL1GKz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Dec 2021 01:10:55 -0500
Received: from mga17.intel.com ([192.55.52.151]:56925 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235007AbhL1GKy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Dec 2021 01:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640671854; x=1672207854;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DwlqR21P5zRNaxKU59QcVskIubdF2/jLOCAlJtGd0qg=;
  b=VNq9kD0tYnJjttst/eUzzP7rQ7gSy/MrdHBVLRZkXlcV/zZ54oYwrhG6
   vPxQllGtshBpVx1qorBWNN7Y9SF8U23dSScZQerQFhCSNKBVcWcV2SREF
   0Payi913ji8d+B2pSPTTm63izUZ9ekdWStGBou9pdugImp9srX/7yWXXj
   HIjZCMvepv8J13FIBqT1zLh+C3bWbTM0rsrbH2Be1o+3y+69r2sYOcVNy
   UsM9hZUwcNvsXWyImN62oLoeQaA9LHPOikynOgZbBevVwEbY+QNY6rUAF
   263eXAsocTEv3e9z3G7yPiMQdAsNqQBPwnwp+J7QAJZW/DktI+ZXpPIm2
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="221991041"
X-IronPort-AV: E=Sophos;i="5.88,241,1635231600"; 
   d="scan'208";a="221991041"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2021 22:10:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,241,1635231600"; 
   d="scan'208";a="686501393"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Dec 2021 22:10:52 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n25hE-0007Ir-9Y; Tue, 28 Dec 2021 06:10:52 +0000
Date:   Tue, 28 Dec 2021 14:09:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 c9c838d55ed17c1f9b45ed03a5880145b7ab118d
Message-ID: <61caaa2f.brwjPaUwkkjxSRdb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: c9c838d55ed17c1f9b45ed03a5880145b7ab118d  Merge branch 'devel' into for-next

elapsed time: 3019m

configs tested: 286
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211228
mips                  cavium_octeon_defconfig
h8300                     edosk2674_defconfig
powerpc                        fsp2_defconfig
riscv                    nommu_virt_defconfig
powerpc                 mpc834x_mds_defconfig
arc                        nsimosci_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                      obs600_defconfig
mips                        jmr3927_defconfig
powerpc                   microwatt_defconfig
sh                            shmin_defconfig
arm64                            alldefconfig
ia64                            zx1_defconfig
arm                      integrator_defconfig
arm                        multi_v7_defconfig
powerpc                       eiger_defconfig
m68k                       m5475evb_defconfig
m68k                       m5275evb_defconfig
mips                            gpr_defconfig
arm                         shannon_defconfig
arm                          moxart_defconfig
arc                         haps_hs_defconfig
arm                       netwinder_defconfig
parisc                           alldefconfig
mips                           rs90_defconfig
powerpc                    gamecube_defconfig
mips                           ip32_defconfig
powerpc                 mpc8272_ads_defconfig
arm                         vf610m4_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                            hp6xx_defconfig
powerpc                     stx_gp3_defconfig
powerpc                         ps3_defconfig
nios2                         10m50_defconfig
arm                         lpc32xx_defconfig
sh                          rsk7203_defconfig
arm                       mainstone_defconfig
arm                           stm32_defconfig
powerpc                     taishan_defconfig
ia64                         bigsur_defconfig
x86_64                           alldefconfig
mips                        bcm47xx_defconfig
sh                           se7343_defconfig
powerpc                     kilauea_defconfig
arm                            zeus_defconfig
csky                                defconfig
mips                          rb532_defconfig
arm                         s3c2410_defconfig
sh                              ul2_defconfig
powerpc                      ppc44x_defconfig
arm                             rpc_defconfig
arm                        neponset_defconfig
arm                          imote2_defconfig
arm                            qcom_defconfig
sh                               allmodconfig
powerpc                      ppc64e_defconfig
arm                         lubbock_defconfig
arm                         lpc18xx_defconfig
arm                        mvebu_v7_defconfig
powerpc                   bluestone_defconfig
powerpc                    adder875_defconfig
sparc                       sparc64_defconfig
arm                        multi_v5_defconfig
mips                      maltaaprp_defconfig
sh                         ap325rxa_defconfig
m68k                           sun3_defconfig
powerpc                      ep88xc_defconfig
sparc64                             defconfig
microblaze                      mmu_defconfig
powerpc                     ppa8548_defconfig
m68k                        mvme16x_defconfig
arm                         s5pv210_defconfig
mips                         cobalt_defconfig
sh                           se7721_defconfig
sh                          kfr2r09_defconfig
arm                             mxs_defconfig
powerpc                 mpc837x_mds_defconfig
sh                  sh7785lcr_32bit_defconfig
xtensa                generic_kc705_defconfig
powerpc                   lite5200b_defconfig
powerpc                 canyonlands_defconfig
arm                        spear3xx_defconfig
sh                          rsk7201_defconfig
sh                          polaris_defconfig
powerpc                      arches_defconfig
powerpc                   currituck_defconfig
um                                  defconfig
arm                         orion5x_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     redwood_defconfig
m68k                        m5307c3_defconfig
nds32                             allnoconfig
i386                                defconfig
arm                            pleb_defconfig
powerpc                       holly_defconfig
mips                       capcella_defconfig
arm                      pxa255-idp_defconfig
m68k                          hp300_defconfig
nios2                            alldefconfig
arm                           u8500_defconfig
powerpc                  iss476-smp_defconfig
arc                          axs103_defconfig
m68k                       m5208evb_defconfig
sh                   secureedge5410_defconfig
arc                        nsim_700_defconfig
arm                            xcep_defconfig
arm                          pxa168_defconfig
arm                          pxa3xx_defconfig
arc                     nsimosci_hs_defconfig
powerpc                  mpc866_ads_defconfig
arm                       omap2plus_defconfig
arm                           corgi_defconfig
sh                          rsk7264_defconfig
powerpc                         wii_defconfig
i386                             alldefconfig
sh                          rsk7269_defconfig
powerpc                 linkstation_defconfig
mips                           ip22_defconfig
powerpc64                           defconfig
sh                           sh2007_defconfig
powerpc                        icon_defconfig
arm                         nhk8815_defconfig
powerpc                    ge_imp3a_defconfig
parisc                              defconfig
powerpc                     asp8347_defconfig
arm                        mini2440_defconfig
arm                       multi_v4t_defconfig
sh                      rts7751r2d1_defconfig
openrisc                  or1klitex_defconfig
mips                     loongson1c_defconfig
powerpc                      ppc6xx_defconfig
powerpc                      acadia_defconfig
mips                         rt305x_defconfig
arm                        clps711x_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                          r7785rp_defconfig
ia64                             allyesconfig
arc                        vdk_hs38_defconfig
sh                        sh7757lcr_defconfig
powerpc                 mpc8315_rdb_defconfig
m68k                             allyesconfig
sh                          landisk_defconfig
mips                           jazz_defconfig
mips                            ar7_defconfig
arc                            hsdk_defconfig
sh                         microdev_defconfig
powerpc                  storcenter_defconfig
riscv                    nommu_k210_defconfig
sh                               alldefconfig
riscv             nommu_k210_sdcard_defconfig
arc                          axs101_defconfig
arm                           omap1_defconfig
arm                        cerfcube_defconfig
riscv                            alldefconfig
mips                         mpc30x_defconfig
arm                           h5000_defconfig
sh                        sh7785lcr_defconfig
sh                            migor_defconfig
mips                        bcm63xx_defconfig
xtensa                  cadence_csp_defconfig
um                           x86_64_defconfig
arm                  randconfig-c002-20211227
arm                  randconfig-c002-20211228
arm                  randconfig-c002-20211226
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20211228
x86_64               randconfig-a001-20211228
x86_64               randconfig-a003-20211228
x86_64               randconfig-a006-20211228
x86_64               randconfig-a004-20211228
x86_64               randconfig-a002-20211228
x86_64               randconfig-a003-20211226
x86_64               randconfig-a001-20211226
x86_64               randconfig-a005-20211226
x86_64               randconfig-a006-20211226
x86_64               randconfig-a004-20211226
x86_64               randconfig-a002-20211226
i386                 randconfig-a006-20211226
i386                 randconfig-a004-20211226
i386                 randconfig-a002-20211226
i386                 randconfig-a003-20211226
i386                 randconfig-a005-20211226
i386                 randconfig-a001-20211226
x86_64               randconfig-a013-20211227
x86_64               randconfig-a014-20211227
x86_64               randconfig-a015-20211227
x86_64               randconfig-a011-20211227
x86_64               randconfig-a012-20211227
x86_64               randconfig-a016-20211227
i386                 randconfig-a012-20211227
i386                 randconfig-a011-20211227
i386                 randconfig-a014-20211227
i386                 randconfig-a016-20211227
i386                 randconfig-a015-20211227
i386                 randconfig-a013-20211227
arc                  randconfig-r043-20211227
s390                 randconfig-r044-20211227
riscv                randconfig-r042-20211227
arc                  randconfig-r043-20211226
riscv                            allyesconfig
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
x86_64               randconfig-a003-20211227
x86_64               randconfig-a001-20211227
x86_64               randconfig-a005-20211227
x86_64               randconfig-a006-20211227
x86_64               randconfig-a004-20211227
x86_64               randconfig-a002-20211227
i386                 randconfig-a006-20211227
i386                 randconfig-a004-20211227
i386                 randconfig-a002-20211227
i386                 randconfig-a003-20211227
i386                 randconfig-a005-20211227
i386                 randconfig-a001-20211227
x86_64               randconfig-a015-20211228
x86_64               randconfig-a014-20211228
x86_64               randconfig-a013-20211228
x86_64               randconfig-a012-20211228
x86_64               randconfig-a011-20211228
x86_64               randconfig-a016-20211228
x86_64               randconfig-a013-20211226
x86_64               randconfig-a014-20211226
x86_64               randconfig-a015-20211226
x86_64               randconfig-a012-20211226
x86_64               randconfig-a011-20211226
x86_64               randconfig-a016-20211226
i386                 randconfig-a012-20211228
i386                 randconfig-a011-20211228
i386                 randconfig-a014-20211228
i386                 randconfig-a016-20211228
i386                 randconfig-a013-20211228
i386                 randconfig-a015-20211228
i386                 randconfig-a012-20211226
i386                 randconfig-a011-20211226
i386                 randconfig-a014-20211226
i386                 randconfig-a016-20211226
i386                 randconfig-a015-20211226
i386                 randconfig-a013-20211226
hexagon              randconfig-r041-20211226
hexagon              randconfig-r045-20211226
riscv                randconfig-r042-20211226
hexagon              randconfig-r041-20211228
riscv                randconfig-r042-20211228
hexagon              randconfig-r045-20211228
s390                 randconfig-r044-20211226

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
