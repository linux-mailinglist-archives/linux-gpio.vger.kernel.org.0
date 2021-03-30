Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20F734E0EC
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 07:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhC3F50 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 01:57:26 -0400
Received: from mga05.intel.com ([192.55.52.43]:57890 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229468AbhC3F5Q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Mar 2021 01:57:16 -0400
IronPort-SDR: LvrjzlhBELn1NiLmGj6PAvTDmAiMuya/bNF6Ny+cwWLS3Pt8Ftdo+/vfaMPN6jrluotcDk/EAv
 M8C2w5kqsXGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="276862244"
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; 
   d="scan'208";a="276862244"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 22:57:15 -0700
IronPort-SDR: hPUKH4TLttzFkiPoetA1WGY27dt6qRbcbMb5Uln6yiT1IcLmpNi8jsw/vtRJoGuSOP1cy1vWt2
 tHB30cV6c5Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; 
   d="scan'208";a="595347033"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Mar 2021 22:57:14 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lR7NJ-00054n-Cp; Tue, 30 Mar 2021 05:57:13 +0000
Date:   Tue, 30 Mar 2021 13:56:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:ib-bcm63xx] BUILD SUCCESS
 d28039fccf948a407de69106465caa465b1dcf32
Message-ID: <6062bd8e.u8Jo0+pOjjGmYQ/v%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-bcm63xx
branch HEAD: d28039fccf948a407de69106465caa465b1dcf32  pinctrl: add a pincontrol driver for BCM6318

elapsed time: 1155m

configs tested: 188
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
arm64                            alldefconfig
xtensa                              defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                      pcm030_defconfig
powerpc                    socrates_defconfig
mips                       lemote2f_defconfig
powerpc                      ppc44x_defconfig
powerpc               mpc834x_itxgp_defconfig
arc                            hsdk_defconfig
sh                            hp6xx_defconfig
powerpc                      makalu_defconfig
powerpc                      walnut_defconfig
parisc                generic-32bit_defconfig
sh                         ecovec24_defconfig
powerpc                    sam440ep_defconfig
powerpc                  storcenter_defconfig
parisc                           allyesconfig
arm                          simpad_defconfig
m68k                        stmark2_defconfig
arm                          pxa3xx_defconfig
mips                       capcella_defconfig
arm                          exynos_defconfig
sh                        dreamcast_defconfig
powerpc                     tqm8540_defconfig
xtensa                generic_kc705_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                        mvme16x_defconfig
mips                    maltaup_xpa_defconfig
powerpc                      ppc40x_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                 mpc834x_itx_defconfig
mips                         tb0219_defconfig
mips                            ar7_defconfig
arm                     am200epdkit_defconfig
arm                          pxa910_defconfig
arm                          collie_defconfig
sh                           se7722_defconfig
parisc                generic-64bit_defconfig
m68k                        mvme147_defconfig
h8300                    h8300h-sim_defconfig
m68k                       m5475evb_defconfig
sh                ecovec24-romimage_defconfig
m68k                          atari_defconfig
sh                            titan_defconfig
powerpc                        cell_defconfig
riscv                    nommu_virt_defconfig
powerpc                   motionpro_defconfig
mips                           gcw0_defconfig
arm                          gemini_defconfig
nios2                            allyesconfig
powerpc                     ppa8548_defconfig
mips                         cobalt_defconfig
powerpc                  mpc885_ads_defconfig
arm                       aspeed_g4_defconfig
arm                       cns3420vb_defconfig
sh                           sh2007_defconfig
arm                      tct_hammer_defconfig
powerpc                       holly_defconfig
m68k                            mac_defconfig
powerpc64                        alldefconfig
arm                         hackkit_defconfig
m68k                             alldefconfig
alpha                               defconfig
xtensa                  cadence_csp_defconfig
powerpc                     tqm8541_defconfig
i386                             alldefconfig
sparc                       sparc64_defconfig
arm                  colibri_pxa300_defconfig
arm                        vexpress_defconfig
powerpc                 mpc85xx_cds_defconfig
arc                          axs101_defconfig
powerpc                      chrp32_defconfig
mips                           xway_defconfig
arm                      pxa255-idp_defconfig
powerpc                 canyonlands_defconfig
sh                           se7724_defconfig
m68k                        m5407c3_defconfig
arm                          pcm027_defconfig
mips                           rs90_defconfig
arm                        clps711x_defconfig
arm                  colibri_pxa270_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                 mpc836x_mds_defconfig
arm                        mini2440_defconfig
arm                           tegra_defconfig
mips                      pistachio_defconfig
openrisc                 simple_smp_defconfig
mips                        nlm_xlp_defconfig
powerpc                     mpc5200_defconfig
mips                     loongson1b_defconfig
mips                     decstation_defconfig
sh                         apsh4a3a_defconfig
arm                         assabet_defconfig
sh                               alldefconfig
arm                         s3c6400_defconfig
xtensa                       common_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                       ebony_defconfig
powerpc                      bamboo_defconfig
powerpc                        warp_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                         bigsur_defconfig
csky                             alldefconfig
powerpc                         ps3_defconfig
arm                       mainstone_defconfig
arm                           omap1_defconfig
arc                      axs103_smp_defconfig
powerpc                      ppc6xx_defconfig
arm                           spitz_defconfig
arm                         s3c2410_defconfig
arm                      jornada720_defconfig
mips                      pic32mzda_defconfig
mips                        jmr3927_defconfig
m68k                       m5275evb_defconfig
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
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210329
x86_64               randconfig-a003-20210329
x86_64               randconfig-a006-20210329
x86_64               randconfig-a001-20210329
x86_64               randconfig-a005-20210329
x86_64               randconfig-a004-20210329
i386                 randconfig-a003-20210329
i386                 randconfig-a004-20210329
i386                 randconfig-a001-20210329
i386                 randconfig-a002-20210329
i386                 randconfig-a006-20210329
i386                 randconfig-a005-20210329
i386                 randconfig-a014-20210329
i386                 randconfig-a011-20210329
i386                 randconfig-a015-20210329
i386                 randconfig-a016-20210329
i386                 randconfig-a013-20210329
i386                 randconfig-a012-20210329
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210329
x86_64               randconfig-a012-20210329
x86_64               randconfig-a013-20210329
x86_64               randconfig-a014-20210329
x86_64               randconfig-a011-20210329
x86_64               randconfig-a016-20210329

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
