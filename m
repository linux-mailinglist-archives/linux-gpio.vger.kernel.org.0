Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7232C34EB23
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 16:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbhC3OxP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 10:53:15 -0400
Received: from mga03.intel.com ([134.134.136.65]:31065 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231998AbhC3Owu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Mar 2021 10:52:50 -0400
IronPort-SDR: 2RG1taShuCt7K1KZxPEySdTOFPEuPZh2eS1BNvNQtoD4w2MQ+z569iyBCfW2w6IhTdUOzji99h
 oZqRgeBGOLmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="191812667"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; 
   d="scan'208";a="191812667"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 07:52:49 -0700
IronPort-SDR: 4DNewzWfWK9kDsaOIUz2HOJIW9cuWpywNALLMZczsOQ0u3BQwRr3Ek/m06FgKH7XF2udeGVeFj
 4/0LkS5siBnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; 
   d="scan'208";a="527364774"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 Mar 2021 07:52:48 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lRFjb-0005KU-LF; Tue, 30 Mar 2021 14:52:47 +0000
Date:   Tue, 30 Mar 2021 22:52:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 762bee3e3e9f42cafdb3ead64b7aee37f9b7369f
Message-ID: <60633b3d.uXLzQHbGSL2ji2hb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 762bee3e3e9f42cafdb3ead64b7aee37f9b7369f  Merge branch 'ib-bcm63xx' into devel

elapsed time: 947m

configs tested: 168
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
powerpc               mpc834x_itxgp_defconfig
mips                         bigsur_defconfig
parisc                generic-64bit_defconfig
sh                   secureedge5410_defconfig
m68k                            q40_defconfig
mips                     loongson1c_defconfig
sh                   sh7770_generic_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                            migor_defconfig
mips                         cobalt_defconfig
m68k                       m5208evb_defconfig
powerpc                 mpc832x_mds_defconfig
arm                         vf610m4_defconfig
arm                        cerfcube_defconfig
arm                          lpd270_defconfig
m68k                        stmark2_defconfig
powerpc                      pasemi_defconfig
xtensa                  audio_kc705_defconfig
arm                        magician_defconfig
arm                       spear13xx_defconfig
powerpc                           allnoconfig
nios2                         3c120_defconfig
sh                          polaris_defconfig
sh                 kfr2r09-romimage_defconfig
mips                        maltaup_defconfig
arc                     nsimosci_hs_defconfig
mips                   sb1250_swarm_defconfig
arc                        vdk_hs38_defconfig
mips                       capcella_defconfig
arm                         lubbock_defconfig
powerpc                       ppc64_defconfig
arm                           h5000_defconfig
arm                         orion5x_defconfig
powerpc                    klondike_defconfig
mips                      loongson3_defconfig
xtensa                  cadence_csp_defconfig
powerpc                 mpc836x_mds_defconfig
mips                             allyesconfig
arm                         shannon_defconfig
powerpc                     akebono_defconfig
arm                         socfpga_defconfig
m68k                          atari_defconfig
arc                    vdk_hs38_smp_defconfig
sparc64                             defconfig
arm                         hackkit_defconfig
m68k                             alldefconfig
riscv                    nommu_virt_defconfig
alpha                               defconfig
arc                          axs101_defconfig
powerpc                      chrp32_defconfig
mips                           xway_defconfig
arm                      pxa255-idp_defconfig
powerpc                 canyonlands_defconfig
arm                       omap2plus_defconfig
arm                          gemini_defconfig
arm                          exynos_defconfig
sh                            shmin_defconfig
sh                        edosk7705_defconfig
sh                               alldefconfig
sh                          r7780mp_defconfig
arm                        spear6xx_defconfig
arc                         haps_hs_defconfig
mips                          malta_defconfig
arm                         cm_x300_defconfig
arm                      footbridge_defconfig
arm                          iop32x_defconfig
mips                      pistachio_defconfig
s390                       zfcpdump_defconfig
arm                      tct_hammer_defconfig
x86_64                           alldefconfig
m68k                        mvme147_defconfig
powerpc                      ppc64e_defconfig
powerpc                      ppc6xx_defconfig
powerpc                         wii_defconfig
arc                        nsimosci_defconfig
powerpc                 mpc836x_rdk_defconfig
nios2                            alldefconfig
arm                          collie_defconfig
arm                             pxa_defconfig
arm                       mainstone_defconfig
sh                         ap325rxa_defconfig
sh                           se7724_defconfig
arm                            lart_defconfig
arm                         lpc32xx_defconfig
sh                     magicpanelr2_defconfig
sparc64                          alldefconfig
openrisc                 simple_smp_defconfig
mips                        nlm_xlp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
parisc                              defconfig
s390                             allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20210330
x86_64               randconfig-a003-20210330
x86_64               randconfig-a002-20210330
x86_64               randconfig-a001-20210330
x86_64               randconfig-a005-20210330
x86_64               randconfig-a006-20210330
i386                 randconfig-a004-20210330
i386                 randconfig-a006-20210330
i386                 randconfig-a003-20210330
i386                 randconfig-a002-20210330
i386                 randconfig-a001-20210330
i386                 randconfig-a005-20210330
i386                 randconfig-a003-20210329
i386                 randconfig-a004-20210329
i386                 randconfig-a002-20210329
i386                 randconfig-a006-20210329
i386                 randconfig-a005-20210329
i386                 randconfig-a001-20210329
i386                 randconfig-a015-20210330
i386                 randconfig-a011-20210330
i386                 randconfig-a014-20210330
i386                 randconfig-a013-20210330
i386                 randconfig-a016-20210330
i386                 randconfig-a012-20210330
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
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
x86_64               randconfig-a012-20210330
x86_64               randconfig-a015-20210330
x86_64               randconfig-a014-20210330
x86_64               randconfig-a016-20210330
x86_64               randconfig-a013-20210330
x86_64               randconfig-a011-20210330

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
