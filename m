Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 107E02CCAC3
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 01:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbgLBX4E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Dec 2020 18:56:04 -0500
Received: from mga14.intel.com ([192.55.52.115]:2368 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726735AbgLBX4D (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 2 Dec 2020 18:56:03 -0500
IronPort-SDR: gS2hUEnxD7kXS1lt0fr36tJnwy4TIKiO1L3SX4QdSVI3QCfT+PQlYnpDNiw7XYFSsOhtVy/B+h
 b1fuHix0FOVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="172325840"
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; 
   d="scan'208";a="172325840"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 15:55:23 -0800
IronPort-SDR: QQDX8lZyRJaUhQNZYsgb0dpUBwk5HQxd9tGjkoG7UCIRLqDoXcrFctL7kExQFxkPcQxOCf1YdI
 OKK600at/aIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; 
   d="scan'208";a="373689071"
Received: from lkp-server01.sh.intel.com (HELO 54133fc185c3) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Dec 2020 15:55:21 -0800
Received: from kbuild by 54133fc185c3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kkbxx-0000Q5-AK; Wed, 02 Dec 2020 23:55:21 +0000
Date:   Thu, 03 Dec 2020 07:55:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 be100b6604d1e01960577b0f628d75bab6ea8c21
Message-ID: <5fc82965.sjL2PBFKZnI40mwl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  for-next
branch HEAD: be100b6604d1e01960577b0f628d75bab6ea8c21  Merge branch 'devel' into for-next

elapsed time: 724m

configs tested: 167
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7206_defconfig
sh                          sdk7786_defconfig
sparc64                          alldefconfig
arm                          exynos_defconfig
mips                           ip32_defconfig
mips                      loongson3_defconfig
mips                      fuloong2e_defconfig
arm                        spear6xx_defconfig
m68k                        m5407c3_defconfig
powerpc                      ppc64e_defconfig
arm                   milbeaut_m10v_defconfig
arm                        clps711x_defconfig
arm                        shmobile_defconfig
powerpc64                        alldefconfig
mips                 decstation_r4k_defconfig
nios2                         3c120_defconfig
mips                         bigsur_defconfig
mips                malta_qemu_32r6_defconfig
mips                         mpc30x_defconfig
microblaze                      mmu_defconfig
sh                     sh7710voipgw_defconfig
sh                          rsk7264_defconfig
powerpc                        fsp2_defconfig
sh                             shx3_defconfig
sh                        sh7785lcr_defconfig
powerpc                      ep88xc_defconfig
powerpc                     sbc8548_defconfig
arm                        mini2440_defconfig
sh                        apsh4ad0a_defconfig
h8300                               defconfig
powerpc                 mpc836x_mds_defconfig
parisc                           alldefconfig
arm                      tct_hammer_defconfig
arm                        spear3xx_defconfig
sh                            titan_defconfig
csky                             alldefconfig
m68k                          sun3x_defconfig
arm                          ep93xx_defconfig
powerpc                     powernv_defconfig
powerpc                      walnut_defconfig
arm                         s3c6400_defconfig
arm                       aspeed_g5_defconfig
sparc                       sparc32_defconfig
mips                         tb0287_defconfig
m68k                          hp300_defconfig
mips                     cu1830-neo_defconfig
sh                           se7343_defconfig
arm                            u300_defconfig
m68k                             alldefconfig
arm                         assabet_defconfig
sh                              ul2_defconfig
xtensa                  nommu_kc705_defconfig
mips                         rt305x_defconfig
sh                 kfr2r09-romimage_defconfig
arm                       cns3420vb_defconfig
m68k                       m5275evb_defconfig
microblaze                    nommu_defconfig
nds32                             allnoconfig
sh                           se7724_defconfig
arm                       versatile_defconfig
sh                            hp6xx_defconfig
arm                           sunxi_defconfig
arm                       mainstone_defconfig
m68k                            q40_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                ecovec24-romimage_defconfig
mips                        nlm_xlr_defconfig
arc                     nsimosci_hs_defconfig
powerpc                     mpc5200_defconfig
powerpc                 mpc8272_ads_defconfig
openrisc                            defconfig
powerpc                       holly_defconfig
arm                            mmp2_defconfig
arm                        mvebu_v5_defconfig
sparc                            alldefconfig
xtensa                  audio_kc705_defconfig
sh                           sh2007_defconfig
arm                          prima2_defconfig
arc                           tb10x_defconfig
m68k                                defconfig
arm                        keystone_defconfig
xtensa                              defconfig
powerpc                     stx_gp3_defconfig
arm                           omap1_defconfig
mips                       rbtx49xx_defconfig
arm                         s3c2410_defconfig
arm                         nhk8815_defconfig
powerpc                     akebono_defconfig
arm                     eseries_pxa_defconfig
mips                        maltaup_defconfig
h8300                    h8300h-sim_defconfig
arm                           corgi_defconfig
powerpc                     ep8248e_defconfig
sh                   sh7770_generic_defconfig
powerpc                 mpc85xx_cds_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
x86_64               randconfig-a004-20201202
x86_64               randconfig-a006-20201202
x86_64               randconfig-a001-20201202
x86_64               randconfig-a002-20201202
x86_64               randconfig-a005-20201202
x86_64               randconfig-a003-20201202
i386                 randconfig-a004-20201202
i386                 randconfig-a005-20201202
i386                 randconfig-a001-20201202
i386                 randconfig-a002-20201202
i386                 randconfig-a006-20201202
i386                 randconfig-a003-20201202
i386                 randconfig-a014-20201202
i386                 randconfig-a013-20201202
i386                 randconfig-a011-20201202
i386                 randconfig-a015-20201202
i386                 randconfig-a012-20201202
i386                 randconfig-a016-20201202
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
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
x86_64               randconfig-a016-20201202
x86_64               randconfig-a012-20201202
x86_64               randconfig-a014-20201202
x86_64               randconfig-a013-20201202
x86_64               randconfig-a015-20201202
x86_64               randconfig-a011-20201202

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
