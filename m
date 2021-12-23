Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B847C47E748
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 18:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244509AbhLWRxx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 12:53:53 -0500
Received: from mga14.intel.com ([192.55.52.115]:15632 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233620AbhLWRxx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Dec 2021 12:53:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640282033; x=1671818033;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sZKE+M3uT1UeZztoBDiobgyMghqd68F0ghxtRfuS+Qo=;
  b=kR5bYaGJ/0KFkbqQvluVmmPevP/zeqZta+aSvgn5SU96NbcJjsmWq128
   l9sMzIsAOFZbm2DK7MPS+JFwb82Gvhxbn+y6mc7igj3RGPQWt5o7pA1DG
   GDZvMbjyufOO49WjeAActlCfL6zJLysqihXazjx1imHKGPXOEzS7VnFR5
   dBdLrSqQ7p//N1WfzKKvkawRFTjV4Oj0ucWfKU2YQtiJQ2htFZEHV68/5
   M2wtpYiHPoC7o+YetNX1aVRpnILMl4/IdcPpL9QGLEXzNK26fcjmVhJpL
   LU+X4HG3qPa9tLnDHS2uKU23ND7x7TTTtLCIo95SSPJnD86v5Vy1MU6RE
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="241085359"
X-IronPort-AV: E=Sophos;i="5.88,230,1635231600"; 
   d="scan'208";a="241085359"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2021 09:53:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,230,1635231600"; 
   d="scan'208";a="508921855"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Dec 2021 09:53:51 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n0SHm-00027M-TN; Thu, 23 Dec 2021 17:53:50 +0000
Date:   Fri, 24 Dec 2021 01:53:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 ce852837335abc874e4d943ebbbe7432465a413b
Message-ID: <61c4b795.6fLnQNL7BubdOuvG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: ce852837335abc874e4d943ebbbe7432465a413b  pinctrl: Propagate firmware node from a parent device

elapsed time: 2208m

configs tested: 276
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211223
arm                          moxart_defconfig
powerpc               mpc834x_itxgp_defconfig
sparc                       sparc64_defconfig
powerpc                         wii_defconfig
powerpc64                        alldefconfig
powerpc                      ppc44x_defconfig
xtensa                         virt_defconfig
m68k                        m5307c3_defconfig
csky                             alldefconfig
sh                              ul2_defconfig
mips                         tb0287_defconfig
sh                          sdk7786_defconfig
arm                      pxa255-idp_defconfig
mips                          ath25_defconfig
arc                        nsimosci_defconfig
arm                       mainstone_defconfig
powerpc                     ep8248e_defconfig
sh                         microdev_defconfig
arm                         s5pv210_defconfig
mips                        vocore2_defconfig
sh                     magicpanelr2_defconfig
openrisc                  or1klitex_defconfig
powerpc                     pq2fads_defconfig
arm                        spear6xx_defconfig
arm                        mvebu_v7_defconfig
sh                           sh2007_defconfig
arm                          pxa3xx_defconfig
sh                          r7780mp_defconfig
sh                            titan_defconfig
arm                          pcm027_defconfig
parisc                generic-32bit_defconfig
riscv                               defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      pcm030_defconfig
arc                     nsimosci_hs_defconfig
arm                       aspeed_g4_defconfig
m68k                         apollo_defconfig
parisc                              defconfig
powerpc                     pseries_defconfig
powerpc                     tqm5200_defconfig
mips                     loongson1b_defconfig
mips                         bigsur_defconfig
powerpc                  storcenter_defconfig
powerpc                     taishan_defconfig
arm                         shannon_defconfig
mips                            gpr_defconfig
ia64                            zx1_defconfig
arm                          ixp4xx_defconfig
microblaze                          defconfig
sh                          polaris_defconfig
powerpc                      katmai_defconfig
mips                         tb0226_defconfig
microblaze                      mmu_defconfig
sh                        sh7757lcr_defconfig
sh                          landisk_defconfig
arm                           sama5_defconfig
ia64                          tiger_defconfig
sh                           se7343_defconfig
ia64                      gensparse_defconfig
powerpc                     tqm8541_defconfig
sh                         apsh4a3a_defconfig
arm                           stm32_defconfig
sh                           se7206_defconfig
arc                     haps_hs_smp_defconfig
arm                           omap1_defconfig
arm                      integrator_defconfig
powerpc                      makalu_defconfig
mips                      bmips_stb_defconfig
sparc64                             defconfig
arm                             ezx_defconfig
m68k                            q40_defconfig
arc                      axs103_smp_defconfig
mips                            e55_defconfig
arm                             pxa_defconfig
sh                          rsk7203_defconfig
m68k                       m5249evb_defconfig
arm64                            alldefconfig
powerpc                   motionpro_defconfig
arm                        clps711x_defconfig
h8300                     edosk2674_defconfig
arc                        vdk_hs38_defconfig
m68k                       m5208evb_defconfig
powerpc                     tqm8555_defconfig
arm                         lpc32xx_defconfig
mips                   sb1250_swarm_defconfig
alpha                            alldefconfig
arm                       spear13xx_defconfig
arm                          simpad_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                           rs90_defconfig
xtensa                           allyesconfig
sh                          kfr2r09_defconfig
powerpc                 mpc832x_mds_defconfig
ia64                             allyesconfig
powerpc                     skiroot_defconfig
powerpc                      ep88xc_defconfig
mips                     decstation_defconfig
arc                            hsdk_defconfig
powerpc                      pmac32_defconfig
arm                        oxnas_v6_defconfig
powerpc                     ppa8548_defconfig
arm                  colibri_pxa300_defconfig
xtensa                  audio_kc705_defconfig
sh                            shmin_defconfig
sh                          rsk7264_defconfig
powerpc64                           defconfig
sh                        edosk7760_defconfig
powerpc                     kilauea_defconfig
mips                     cu1830-neo_defconfig
mips                     loongson2k_defconfig
mips                             allyesconfig
arm                            dove_defconfig
arm                         cm_x300_defconfig
powerpc                       ebony_defconfig
arm                            pleb_defconfig
xtensa                          iss_defconfig
mips                           ip32_defconfig
m68k                             allyesconfig
arm                          pxa168_defconfig
arm                        trizeps4_defconfig
arm                         mv78xx0_defconfig
arm                          lpd270_defconfig
arm                            zeus_defconfig
sh                           se7722_defconfig
m68k                       m5475evb_defconfig
xtensa                    smp_lx200_defconfig
arm                        vexpress_defconfig
powerpc                          allmodconfig
arm                           corgi_defconfig
arm                         lubbock_defconfig
arm                          iop32x_defconfig
powerpc                 mpc836x_mds_defconfig
mips                          rm200_defconfig
mips                       bmips_be_defconfig
mips                        bcm47xx_defconfig
sh                             shx3_defconfig
arm                           sunxi_defconfig
mips                           ip22_defconfig
sh                      rts7751r2d1_defconfig
s390                             allyesconfig
openrisc                            defconfig
m68k                       bvme6000_defconfig
alpha                               defconfig
riscv             nommu_k210_sdcard_defconfig
parisc                           alldefconfig
sh                           se7705_defconfig
mips                           ip27_defconfig
sh                          sdk7780_defconfig
powerpc                     mpc83xx_defconfig
powerpc                         ps3_defconfig
arm                            mmp2_defconfig
mips                         rt305x_defconfig
powerpc                       maple_defconfig
arm                            qcom_defconfig
powerpc                      obs600_defconfig
mips                  cavium_octeon_defconfig
arm                         lpc18xx_defconfig
m68k                          atari_defconfig
powerpc                 canyonlands_defconfig
arm                        neponset_defconfig
sh                            migor_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                       capcella_defconfig
xtensa                           alldefconfig
arm                     davinci_all_defconfig
powerpc                      walnut_defconfig
sh                        sh7763rdp_defconfig
powerpc                       holly_defconfig
m68k                            mac_defconfig
arc                          axs101_defconfig
openrisc                         alldefconfig
powerpc                    adder875_defconfig
arm                     eseries_pxa_defconfig
powerpc                     redwood_defconfig
um                             i386_defconfig
arm                           h3600_defconfig
m68k                          amiga_defconfig
arm                       aspeed_g5_defconfig
riscv                             allnoconfig
powerpc                 mpc8313_rdb_defconfig
h8300                            alldefconfig
sh                          lboxre2_defconfig
arm                        shmobile_defconfig
mips                          rb532_defconfig
powerpc                        icon_defconfig
arm                  randconfig-c002-20211222
arm                  randconfig-c002-20211223
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20211222
x86_64               randconfig-a003-20211222
x86_64               randconfig-a005-20211222
x86_64               randconfig-a006-20211222
x86_64               randconfig-a004-20211222
x86_64               randconfig-a002-20211222
i386                 randconfig-a006-20211222
i386                 randconfig-a004-20211222
i386                 randconfig-a002-20211222
i386                 randconfig-a003-20211222
i386                 randconfig-a005-20211222
i386                 randconfig-a001-20211222
x86_64               randconfig-a013-20211223
x86_64               randconfig-a015-20211223
x86_64               randconfig-a014-20211223
x86_64               randconfig-a011-20211223
x86_64               randconfig-a012-20211223
x86_64               randconfig-a016-20211223
i386                 randconfig-a012-20211223
i386                 randconfig-a011-20211223
i386                 randconfig-a014-20211223
i386                 randconfig-a016-20211223
i386                 randconfig-a015-20211223
i386                 randconfig-a013-20211223
arc                  randconfig-r043-20211223
riscv                randconfig-r042-20211223
s390                 randconfig-r044-20211223
arc                  randconfig-r043-20211222
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20211222
x86_64               randconfig-a012-20211222
x86_64               randconfig-a011-20211222
x86_64               randconfig-a015-20211222
x86_64               randconfig-a014-20211222
x86_64               randconfig-a016-20211222
i386                 randconfig-a012-20211222
i386                 randconfig-a011-20211222
i386                 randconfig-a014-20211222
i386                 randconfig-a016-20211222
i386                 randconfig-a015-20211222
i386                 randconfig-a013-20211222
hexagon              randconfig-r041-20211222
hexagon              randconfig-r045-20211222
riscv                randconfig-r042-20211222
s390                 randconfig-r044-20211222

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
