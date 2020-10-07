Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45000286ABC
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Oct 2020 00:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgJGWMA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 18:12:00 -0400
Received: from mga09.intel.com ([134.134.136.24]:38974 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728742AbgJGWMA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Oct 2020 18:12:00 -0400
IronPort-SDR: RhzQpbp/XsFjWpeNJ3o3IrlxRdfLe03F+S1ntwgGEemEOFvaT2eShjMCi/ZQULPYWsMiJzqX6r
 xcyD5kS1EXSg==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="165277674"
X-IronPort-AV: E=Sophos;i="5.77,348,1596524400"; 
   d="scan'208";a="165277674"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2020 15:11:58 -0700
IronPort-SDR: 8+vOlom0StWoemRGpBMn9z3ODM3C9AiHeFFrY54k009O8pPad60ANf384oEDjsYs9HL/e3rQdS
 KvagieaZDTPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,348,1596524400"; 
   d="scan'208";a="343109032"
Received: from lkp-server02.sh.intel.com (HELO b5ae2f167493) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 07 Oct 2020 15:11:57 -0700
Received: from kbuild by b5ae2f167493 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kQHfA-0001qC-BP; Wed, 07 Oct 2020 22:11:56 +0000
Date:   Thu, 08 Oct 2020 06:11:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:for-next] BUILD SUCCESS
 24160a8f7f1380ed064aba8d3d7740d5141ce0ad
Message-ID: <5f7e3d09.QgQ0J90lGy9HlQM9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  for-next
branch HEAD: 24160a8f7f1380ed064aba8d3d7740d5141ce0ad  Merge branch 'devel' into for-next

elapsed time: 721m

configs tested: 220
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                  colibri_pxa300_defconfig
powerpc                    mvme5100_defconfig
sh                             espt_defconfig
powerpc                     mpc512x_defconfig
powerpc                     rainier_defconfig
sh                        apsh4ad0a_defconfig
arm                          ixp4xx_defconfig
mips                        bcm63xx_defconfig
mips                           ip28_defconfig
mips                        omega2p_defconfig
arc                             nps_defconfig
mips                      pistachio_defconfig
sh                           se7721_defconfig
arm                           stm32_defconfig
csky                             alldefconfig
arm                       versatile_defconfig
m68k                        mvme147_defconfig
arm                       aspeed_g4_defconfig
powerpc                      ep88xc_defconfig
xtensa                    xip_kc705_defconfig
powerpc                      arches_defconfig
arm                         palmz72_defconfig
mips                malta_qemu_32r6_defconfig
arm                        magician_defconfig
powerpc                     tqm8540_defconfig
powerpc                     mpc5200_defconfig
arm                            zeus_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                      obs600_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                     sh7710voipgw_defconfig
sh                   sh7724_generic_defconfig
arm64                            alldefconfig
powerpc                          g5_defconfig
arm                           sunxi_defconfig
arm                          moxart_defconfig
sh                          urquell_defconfig
arm                            mmp2_defconfig
m68k                         amcore_defconfig
sparc64                          alldefconfig
microblaze                      mmu_defconfig
powerpc                 mpc8560_ads_defconfig
arc                           tb10x_defconfig
powerpc                         wii_defconfig
riscv                             allnoconfig
h8300                            alldefconfig
mips                        workpad_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                           h3600_defconfig
arm                              zx_defconfig
powerpc                 canyonlands_defconfig
arc                          axs101_defconfig
arm                         lpc18xx_defconfig
alpha                            allyesconfig
arm                          exynos_defconfig
powerpc                     ppa8548_defconfig
h8300                     edosk2674_defconfig
parisc                generic-64bit_defconfig
sh                   secureedge5410_defconfig
mips                           ip32_defconfig
h8300                       h8s-sim_defconfig
powerpc                    ge_imp3a_defconfig
mips                      malta_kvm_defconfig
parisc                generic-32bit_defconfig
sh                           se7705_defconfig
sh                               alldefconfig
arm                      footbridge_defconfig
c6x                        evmc6472_defconfig
sh                         ecovec24_defconfig
s390                          debug_defconfig
s390                             alldefconfig
arm                      integrator_defconfig
c6x                        evmc6474_defconfig
nios2                            alldefconfig
m68k                       m5208evb_defconfig
powerpc                       eiger_defconfig
mips                         tb0226_defconfig
mips                        nlm_xlr_defconfig
powerpc                  mpc885_ads_defconfig
arm                            qcom_defconfig
arm                             rpc_defconfig
c6x                              alldefconfig
sh                        sh7757lcr_defconfig
powerpc                     redwood_defconfig
sh                          rsk7269_defconfig
arm                              alldefconfig
powerpc                 xes_mpc85xx_defconfig
sh                          sdk7786_defconfig
mips                         mpc30x_defconfig
powerpc                     mpc83xx_defconfig
arm                         hackkit_defconfig
powerpc                      pcm030_defconfig
arm                          gemini_defconfig
ia64                        generic_defconfig
arm                          tango4_defconfig
s390                       zfcpdump_defconfig
powerpc                       ebony_defconfig
mips                         bigsur_defconfig
arm                           h5000_defconfig
m68k                       bvme6000_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                       aspeed_g5_defconfig
mips                     cu1000-neo_defconfig
sh                           se7619_defconfig
arm                         nhk8815_defconfig
arm                        clps711x_defconfig
arm                          ep93xx_defconfig
h8300                               defconfig
sh                              ul2_defconfig
nds32                             allnoconfig
powerpc                      cm5200_defconfig
sh                   sh7770_generic_defconfig
arm                           spitz_defconfig
arm                          iop32x_defconfig
sh                          r7780mp_defconfig
microblaze                          defconfig
mips                           ip22_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
c6x                              allyesconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201006
x86_64               randconfig-a002-20201006
x86_64               randconfig-a001-20201006
x86_64               randconfig-a005-20201006
x86_64               randconfig-a003-20201006
x86_64               randconfig-a006-20201006
i386                 randconfig-a006-20201005
i386                 randconfig-a005-20201005
i386                 randconfig-a001-20201005
i386                 randconfig-a004-20201005
i386                 randconfig-a003-20201005
i386                 randconfig-a002-20201005
i386                 randconfig-a006-20201007
i386                 randconfig-a005-20201007
i386                 randconfig-a001-20201007
i386                 randconfig-a004-20201007
i386                 randconfig-a003-20201007
i386                 randconfig-a002-20201007
x86_64               randconfig-a012-20201007
x86_64               randconfig-a015-20201007
x86_64               randconfig-a014-20201007
x86_64               randconfig-a013-20201007
x86_64               randconfig-a011-20201007
x86_64               randconfig-a016-20201007
x86_64               randconfig-a012-20201005
x86_64               randconfig-a015-20201005
x86_64               randconfig-a014-20201005
x86_64               randconfig-a013-20201005
x86_64               randconfig-a011-20201005
x86_64               randconfig-a016-20201005
i386                 randconfig-a015-20201008
i386                 randconfig-a013-20201008
i386                 randconfig-a014-20201008
i386                 randconfig-a016-20201008
i386                 randconfig-a011-20201008
i386                 randconfig-a012-20201008
i386                 randconfig-a014-20201005
i386                 randconfig-a015-20201005
i386                 randconfig-a013-20201005
i386                 randconfig-a016-20201005
i386                 randconfig-a011-20201005
i386                 randconfig-a012-20201005
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20201008
x86_64               randconfig-a015-20201008
x86_64               randconfig-a013-20201008
x86_64               randconfig-a014-20201008
x86_64               randconfig-a011-20201008
x86_64               randconfig-a016-20201008
x86_64               randconfig-a004-20201007
x86_64               randconfig-a002-20201007
x86_64               randconfig-a001-20201007
x86_64               randconfig-a005-20201007
x86_64               randconfig-a003-20201007
x86_64               randconfig-a006-20201007

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
