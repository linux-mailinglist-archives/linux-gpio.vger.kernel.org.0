Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 316BE26E868
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Sep 2020 00:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbgIQWaz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 18:30:55 -0400
Received: from mga06.intel.com ([134.134.136.31]:48059 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726134AbgIQWaz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Sep 2020 18:30:55 -0400
IronPort-SDR: tDMighIM/9q4rLaAUgtGDfbOHFpDn8BM0aSRUw035l0XPhVcjILyfUY1KIcAEL4UzN6vixiige
 LoEnoPAje5Ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="221362594"
X-IronPort-AV: E=Sophos;i="5.77,272,1596524400"; 
   d="scan'208";a="221362594"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 15:30:53 -0700
IronPort-SDR: I2TYBJ7vqfyNeTcd8cLhXANkiUe1xjD6LtFAIQR2RuSCvxC/YJ6jM//KP3ZYtJJ86FWa+/YmsE
 5+qPo2FF6y2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,272,1596524400"; 
   d="scan'208";a="507914019"
Received: from lkp-server01.sh.intel.com (HELO a05db971c861) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Sep 2020 15:30:49 -0700
Received: from kbuild by a05db971c861 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kJ2QT-0000AT-CS; Thu, 17 Sep 2020 22:30:49 +0000
Date:   Fri, 18 Sep 2020 06:30:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 4f7a0cd03de56425e96b0eccb0e9725bae81b557
Message-ID: <5f63e37b.a5N1if4FQS0NvjNT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  for-next
branch HEAD: 4f7a0cd03de56425e96b0eccb0e9725bae81b557  Merge branch 'devel' into for-next

elapsed time: 724m

configs tested: 180
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                        omega2p_defconfig
arm                         lubbock_defconfig
arm                           spitz_defconfig
powerpc                        warp_defconfig
sh                        dreamcast_defconfig
powerpc                      pcm030_defconfig
arm                            lart_defconfig
powerpc                    mvme5100_defconfig
powerpc                     sbc8548_defconfig
sparc                       sparc64_defconfig
arm                   milbeaut_m10v_defconfig
s390                          debug_defconfig
sh                          polaris_defconfig
powerpc                     asp8347_defconfig
arm                        mini2440_defconfig
mips                    maltaup_xpa_defconfig
arm                        mvebu_v7_defconfig
powerpc                       eiger_defconfig
powerpc                     tqm8548_defconfig
sh                         ecovec24_defconfig
nds32                            alldefconfig
powerpc                 linkstation_defconfig
parisc                generic-64bit_defconfig
arm                      pxa255-idp_defconfig
ia64                         bigsur_defconfig
powerpc                      makalu_defconfig
powerpc                       maple_defconfig
m68k                          amiga_defconfig
riscv                            alldefconfig
mips                     loongson1c_defconfig
arc                     nsimosci_hs_defconfig
riscv                          rv32_defconfig
xtensa                           allyesconfig
powerpc                  mpc866_ads_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                        cell_defconfig
mips                        nlm_xlp_defconfig
powerpc                      ppc6xx_defconfig
arc                             nps_defconfig
arm                           h5000_defconfig
mips                        bcm47xx_defconfig
arm                        neponset_defconfig
nios2                         3c120_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                               alldefconfig
sh                               j2_defconfig
powerpc                      acadia_defconfig
sh                             shx3_defconfig
m68k                             alldefconfig
sh                   sh7724_generic_defconfig
mips                          malta_defconfig
m68k                          sun3x_defconfig
powerpc                  storcenter_defconfig
sh                        edosk7705_defconfig
powerpc                    gamecube_defconfig
xtensa                          iss_defconfig
mips                      loongson3_defconfig
mips                         cobalt_defconfig
um                           x86_64_defconfig
c6x                        evmc6678_defconfig
sh                             sh03_defconfig
mips                      malta_kvm_defconfig
sh                          landisk_defconfig
parisc                generic-32bit_defconfig
arm                       omap2plus_defconfig
sh                           se7712_defconfig
powerpc                      katmai_defconfig
mips                  cavium_octeon_defconfig
nios2                         10m50_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                        fsp2_defconfig
mips                       lemote2f_defconfig
arm                         lpc18xx_defconfig
s390                             allyesconfig
mips                           rs90_defconfig
arm                        vexpress_defconfig
sh                          rsk7269_defconfig
sh                          sdk7780_defconfig
mips                       capcella_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                         rt305x_defconfig
mips                           ip28_defconfig
sh                          urquell_defconfig
arm                         s3c6400_defconfig
mips                      maltasmvp_defconfig
m68k                             allyesconfig
sh                                  defconfig
sh                        sh7763rdp_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                            migor_defconfig
parisc                           allyesconfig
powerpc                   motionpro_defconfig
powerpc                      obs600_defconfig
powerpc                     rainier_defconfig
arm                         assabet_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                       imx_v6_v7_defconfig
arc                           tb10x_defconfig
arm                             ezx_defconfig
arm                        multi_v5_defconfig
arm                       spear13xx_defconfig
arc                        vdk_hs38_defconfig
sh                     sh7710voipgw_defconfig
arc                                 defconfig
i386                                defconfig
sh                          r7780mp_defconfig
mips                         tb0226_defconfig
h8300                               defconfig
mips                           ci20_defconfig
ia64                             allmodconfig
openrisc                         alldefconfig
powerpc                       ppc64_defconfig
arm                          iop32x_defconfig
m68k                        m5272c3_defconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20200917
i386                 randconfig-a006-20200917
i386                 randconfig-a003-20200917
i386                 randconfig-a001-20200917
i386                 randconfig-a002-20200917
i386                 randconfig-a005-20200917
x86_64               randconfig-a014-20200917
x86_64               randconfig-a011-20200917
x86_64               randconfig-a016-20200917
x86_64               randconfig-a012-20200917
x86_64               randconfig-a015-20200917
x86_64               randconfig-a013-20200917
i386                 randconfig-a015-20200917
i386                 randconfig-a014-20200917
i386                 randconfig-a011-20200917
i386                 randconfig-a013-20200917
i386                 randconfig-a016-20200917
i386                 randconfig-a012-20200917
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20200917
x86_64               randconfig-a004-20200917
x86_64               randconfig-a003-20200917
x86_64               randconfig-a002-20200917
x86_64               randconfig-a001-20200917
x86_64               randconfig-a005-20200917

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
