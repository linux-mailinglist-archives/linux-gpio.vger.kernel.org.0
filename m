Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21F23273FBA
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 12:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgIVKgW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Sep 2020 06:36:22 -0400
Received: from mga09.intel.com ([134.134.136.24]:15857 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbgIVKgW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Sep 2020 06:36:22 -0400
IronPort-SDR: ggDf6SSip3zlYcDMJ4AcwOyKwrjU6xu4Nz76GKlHwc9m5lhSSPiyCiWYlc7wO9syFcrcwFrlSY
 4U/K9/ASDwjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="161501189"
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; 
   d="scan'208";a="161501189"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2020 03:36:17 -0700
IronPort-SDR: r1TKT7jIhHywCvNJ5bEX88v1RNfHLfVYAuoLNcp8ddM9+O518RsPNjwwtaPM9ZBMdSuFh/WIZh
 VCJVT63lf35w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; 
   d="scan'208";a="348443357"
Received: from lkp-server01.sh.intel.com (HELO 928d8e596b58) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 22 Sep 2020 03:36:15 -0700
Received: from kbuild by 928d8e596b58 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kKfeh-0000UO-58; Tue, 22 Sep 2020 10:36:15 +0000
Date:   Tue, 22 Sep 2020 18:35:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 921daeeca91bda2dfb57fcba9f69ff368083be4b
Message-ID: <5f69d364.DzkmVwN2xKQAlVzN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  fixes
branch HEAD: 921daeeca91bda2dfb57fcba9f69ff368083be4b  pinctrl: cherryview: Preserve CHV_PADCTRL1_INVRXTX_TXDATA flag on GPIOs

elapsed time: 721m

configs tested: 173
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7712_defconfig
arm                        mvebu_v5_defconfig
arm                        mvebu_v7_defconfig
arm                          lpd270_defconfig
sh                        sh7757lcr_defconfig
arm                     eseries_pxa_defconfig
arm                            xcep_defconfig
powerpc                      acadia_defconfig
mips                 decstation_r4k_defconfig
arc                     nsimosci_hs_defconfig
powerpc                      ep88xc_defconfig
powerpc                          g5_defconfig
sh                        apsh4ad0a_defconfig
arm                         orion5x_defconfig
c6x                        evmc6474_defconfig
xtensa                  cadence_csp_defconfig
parisc                           alldefconfig
powerpc                      mgcoge_defconfig
arm                         palmz72_defconfig
arm                          pxa168_defconfig
powerpc                     kilauea_defconfig
arm                           sunxi_defconfig
powerpc                         ps3_defconfig
mips                       bmips_be_defconfig
mips                        bcm47xx_defconfig
riscv                               defconfig
arm                          ixp4xx_defconfig
sh                                  defconfig
mips                     cu1000-neo_defconfig
x86_64                           alldefconfig
arm                          badge4_defconfig
powerpc                 mpc834x_mds_defconfig
mips                        bcm63xx_defconfig
powerpc                  mpc866_ads_defconfig
arm                        clps711x_defconfig
powerpc                          allyesconfig
x86_64                              defconfig
ia64                            zx1_defconfig
nios2                            alldefconfig
arm                            lart_defconfig
arm                         vf610m4_defconfig
sh                            shmin_defconfig
mips                        nlm_xlr_defconfig
arm                            mps2_defconfig
arm                  colibri_pxa300_defconfig
mips                      malta_kvm_defconfig
mips                            ar7_defconfig
arc                        nsim_700_defconfig
sh                            hp6xx_defconfig
arm                          exynos_defconfig
sh                           se7343_defconfig
powerpc                     tqm8540_defconfig
arm                          pxa910_defconfig
m68k                             allyesconfig
m68k                             alldefconfig
arm                            pleb_defconfig
arm                      footbridge_defconfig
m68k                         apollo_defconfig
sparc                       sparc64_defconfig
i386                                defconfig
arm                        trizeps4_defconfig
powerpc                 mpc836x_mds_defconfig
sh                          landisk_defconfig
mips                     loongson1b_defconfig
h8300                            allyesconfig
powerpc                     tqm8548_defconfig
powerpc                      makalu_defconfig
parisc                           allyesconfig
powerpc                    klondike_defconfig
arm                       versatile_defconfig
arc                              alldefconfig
mips                      pistachio_defconfig
sh                        edosk7760_defconfig
powerpc                       eiger_defconfig
mips                        vocore2_defconfig
sh                     magicpanelr2_defconfig
ia64                             allmodconfig
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
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20200920
x86_64               randconfig-a003-20200920
x86_64               randconfig-a004-20200920
x86_64               randconfig-a002-20200920
x86_64               randconfig-a006-20200920
x86_64               randconfig-a001-20200920
i386                 randconfig-a002-20200920
i386                 randconfig-a006-20200920
i386                 randconfig-a003-20200920
i386                 randconfig-a004-20200920
i386                 randconfig-a005-20200920
i386                 randconfig-a001-20200920
i386                 randconfig-a002-20200921
i386                 randconfig-a006-20200921
i386                 randconfig-a003-20200921
i386                 randconfig-a004-20200921
i386                 randconfig-a005-20200921
i386                 randconfig-a001-20200921
x86_64               randconfig-a011-20200921
x86_64               randconfig-a013-20200921
x86_64               randconfig-a014-20200921
x86_64               randconfig-a015-20200921
x86_64               randconfig-a012-20200921
x86_64               randconfig-a016-20200921
i386                 randconfig-a012-20200921
i386                 randconfig-a014-20200921
i386                 randconfig-a016-20200921
i386                 randconfig-a013-20200921
i386                 randconfig-a011-20200921
i386                 randconfig-a015-20200921
i386                 randconfig-a012-20200920
i386                 randconfig-a014-20200920
i386                 randconfig-a016-20200920
i386                 randconfig-a013-20200920
i386                 randconfig-a011-20200920
i386                 randconfig-a015-20200920
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a005-20200921
x86_64               randconfig-a003-20200921
x86_64               randconfig-a004-20200921
x86_64               randconfig-a002-20200921
x86_64               randconfig-a006-20200921
x86_64               randconfig-a001-20200921
x86_64               randconfig-a011-20200922
x86_64               randconfig-a013-20200922
x86_64               randconfig-a014-20200922
x86_64               randconfig-a015-20200922
x86_64               randconfig-a012-20200922
x86_64               randconfig-a016-20200922
x86_64               randconfig-a011-20200920
x86_64               randconfig-a013-20200920
x86_64               randconfig-a014-20200920
x86_64               randconfig-a015-20200920
x86_64               randconfig-a012-20200920
x86_64               randconfig-a016-20200920

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
