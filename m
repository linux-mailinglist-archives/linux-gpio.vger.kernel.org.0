Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94ECA2D50D8
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 03:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbgLJC0T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 21:26:19 -0500
Received: from mga03.intel.com ([134.134.136.65]:4585 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728649AbgLJC0T (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Dec 2020 21:26:19 -0500
IronPort-SDR: hby4FuH4AMHq8nsebxvLi1bdYMLLGfo8DBDuufvq9eNbmyI497ZE22UaeHlRZbgIfuJWjHzruS
 0UGXpiGOpYzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="174301899"
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; 
   d="scan'208";a="174301899"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 18:25:38 -0800
IronPort-SDR: FQQmMFnCUTTbdbFAr1bsQkAVMVyeQykxudH4tvlIe98ph+xizPgbHYuO1nC70a/3DpBR+44oR4
 8hGsVy8CN0Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; 
   d="scan'208";a="338230244"
Received: from lkp-server01.sh.intel.com (HELO 2bbb63443648) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Dec 2020 18:25:37 -0800
Received: from kbuild by 2bbb63443648 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1knBeC-0000as-Iy; Thu, 10 Dec 2020 02:25:36 +0000
Date:   Thu, 10 Dec 2020 10:24:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel] BUILD SUCCESS
 40b37008eb5a300ea35aa83432c213b6028313d5
Message-ID: <5fd186ee.doEbyEJpsbTsNHKw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel
branch HEAD: 40b37008eb5a300ea35aa83432c213b6028313d5  Merge tag 'gpio-updates-for-v5.11' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into devel

elapsed time: 725m

configs tested: 139
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          kfr2r09_defconfig
x86_64                           alldefconfig
arm                     am200epdkit_defconfig
arm                  colibri_pxa270_defconfig
arm                          lpd270_defconfig
xtensa                generic_kc705_defconfig
s390                             allyesconfig
mips                         mpc30x_defconfig
openrisc                 simple_smp_defconfig
m68k                        stmark2_defconfig
powerpc                   bluestone_defconfig
powerpc                      pcm030_defconfig
arm                      pxa255-idp_defconfig
mips                       bmips_be_defconfig
powerpc                    ge_imp3a_defconfig
arc                     haps_hs_smp_defconfig
powerpc                 mpc832x_mds_defconfig
mips                          malta_defconfig
powerpc                       eiger_defconfig
m68k                        mvme147_defconfig
nds32                             allnoconfig
ia64                        generic_defconfig
arm                            xcep_defconfig
powerpc                     mpc83xx_defconfig
sh                             shx3_defconfig
arm                        neponset_defconfig
m68k                         apollo_defconfig
powerpc                     tqm8555_defconfig
riscv                            allmodconfig
m68k                        mvme16x_defconfig
mips                        omega2p_defconfig
um                             i386_defconfig
mips                           gcw0_defconfig
sh                           se7724_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                           viper_defconfig
arm                         socfpga_defconfig
alpha                            alldefconfig
arm                        vexpress_defconfig
arm                    vt8500_v6_v7_defconfig
sh                        edosk7760_defconfig
arm                       imx_v6_v7_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                         tb0219_defconfig
mips                  maltasmvp_eva_defconfig
mips                     cu1000-neo_defconfig
powerpc                     rainier_defconfig
arm                          pcm027_defconfig
mips                          ath25_defconfig
powerpc                 mpc834x_mds_defconfig
arm                        oxnas_v6_defconfig
s390                                defconfig
arm                        spear6xx_defconfig
arm                         s3c6400_defconfig
mips                         db1xxx_defconfig
mips                            ar7_defconfig
arm                       versatile_defconfig
powerpc                        icon_defconfig
powerpc                     tqm8541_defconfig
m68k                             alldefconfig
arm                          ep93xx_defconfig
arm                        cerfcube_defconfig
arm                       multi_v4t_defconfig
sh                      rts7751r2d1_defconfig
mips                         bigsur_defconfig
mips                           xway_defconfig
mips                         cobalt_defconfig
mips                        nlm_xlp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201209
i386                 randconfig-a005-20201209
i386                 randconfig-a001-20201209
i386                 randconfig-a002-20201209
i386                 randconfig-a006-20201209
i386                 randconfig-a003-20201209
x86_64               randconfig-a016-20201209
x86_64               randconfig-a012-20201209
x86_64               randconfig-a013-20201209
x86_64               randconfig-a014-20201209
x86_64               randconfig-a015-20201209
x86_64               randconfig-a011-20201209
i386                 randconfig-a013-20201209
i386                 randconfig-a014-20201209
i386                 randconfig-a011-20201209
i386                 randconfig-a015-20201209
i386                 randconfig-a012-20201209
i386                 randconfig-a016-20201209
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201209
x86_64               randconfig-a006-20201209
x86_64               randconfig-a005-20201209
x86_64               randconfig-a001-20201209
x86_64               randconfig-a002-20201209
x86_64               randconfig-a003-20201209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
