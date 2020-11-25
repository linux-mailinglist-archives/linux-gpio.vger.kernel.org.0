Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B43C12C37D5
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Nov 2020 05:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727238AbgKYDxX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 22:53:23 -0500
Received: from mga18.intel.com ([134.134.136.126]:59425 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727057AbgKYDxX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Nov 2020 22:53:23 -0500
IronPort-SDR: Dkn0m30sOm/McQvIkvlds74GelnFVTd+2JwB5DbHVPCtNmrDwBsjlIoLR22KrluYziV/uRb+cb
 KqimKT9/ZDmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="159827647"
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; 
   d="scan'208";a="159827647"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 19:53:21 -0800
IronPort-SDR: KM8O4mwY14yVGd1peGj+UaD3FTrcaVAcdCkiLlCj4ktV9Ucgxmt4/jXid5RwUBWRevjzygMGiY
 sM0XHuWT47jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; 
   d="scan'208";a="547110135"
Received: from lkp-server01.sh.intel.com (HELO d5aceba519b7) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Nov 2020 19:53:20 -0800
Received: from kbuild by d5aceba519b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1khlrr-00000q-Hp; Wed, 25 Nov 2020 03:53:19 +0000
Date:   Wed, 25 Nov 2020 11:52:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-leds] BUILD SUCCESS
 c90c0e28964cad54a6596daad64b8ac474ca3ebc
Message-ID: <5fbdd4fb.3l/c09Kh76JsA82U%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-leds
branch HEAD: c90c0e28964cad54a6596daad64b8ac474ca3ebc  x86/platform/geode: Convert alix LED to GPIO machine descriptor

elapsed time: 730m

configs tested: 165
configs skipped: 51

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc8540_ads_defconfig
arm                        spear6xx_defconfig
powerpc                    mvme5100_defconfig
parisc                generic-32bit_defconfig
c6x                        evmc6472_defconfig
arm                       multi_v4t_defconfig
m68k                       m5249evb_defconfig
sparc                            alldefconfig
arm                  colibri_pxa270_defconfig
arm                          ixp4xx_defconfig
sh                                  defconfig
arm                          gemini_defconfig
csky                             alldefconfig
arm                          tango4_defconfig
xtensa                       common_defconfig
m68k                           sun3_defconfig
arm                       aspeed_g4_defconfig
powerpc                    ge_imp3a_defconfig
mips                           ip27_defconfig
powerpc                    socrates_defconfig
arm                    vt8500_v6_v7_defconfig
arc                          axs101_defconfig
powerpc                      pcm030_defconfig
mips                      bmips_stb_defconfig
arm                            xcep_defconfig
h8300                    h8300h-sim_defconfig
mips                         cobalt_defconfig
sh                   sh7724_generic_defconfig
powerpc                     tqm5200_defconfig
arm                        mvebu_v5_defconfig
mips                        qi_lb60_defconfig
arm                           h5000_defconfig
sh                           se7343_defconfig
m68k                        m5307c3_defconfig
sh                          sdk7780_defconfig
x86_64                           alldefconfig
arm                           omap1_defconfig
m68k                       m5275evb_defconfig
arm                        shmobile_defconfig
arm                           h3600_defconfig
arm                        magician_defconfig
sh                          rsk7201_defconfig
arm                            pleb_defconfig
arm                        neponset_defconfig
sh                            migor_defconfig
mips                      maltaaprp_defconfig
parisc                           alldefconfig
mips                          rm200_defconfig
sh                   sh7770_generic_defconfig
powerpc                    gamecube_defconfig
arm                        trizeps4_defconfig
powerpc                 mpc836x_mds_defconfig
arm                       imx_v4_v5_defconfig
arm                         ebsa110_defconfig
powerpc                        fsp2_defconfig
mips                         tb0287_defconfig
powerpc                   bluestone_defconfig
mips                         tb0219_defconfig
m68k                            q40_defconfig
arm                             rpc_defconfig
arm                       omap2plus_defconfig
um                           x86_64_defconfig
sh                            hp6xx_defconfig
arm                        cerfcube_defconfig
sh                          rsk7203_defconfig
mips                  decstation_64_defconfig
sh                   rts7751r2dplus_defconfig
sh                        sh7757lcr_defconfig
m68k                          multi_defconfig
mips                     cu1000-neo_defconfig
arm                   milbeaut_m10v_defconfig
sh                               j2_defconfig
parisc                generic-64bit_defconfig
ia64                            zx1_defconfig
sh                              ul2_defconfig
powerpc                      obs600_defconfig
arm                         palmz72_defconfig
powerpc                     mpc83xx_defconfig
mips                           ci20_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
x86_64               randconfig-a006-20201124
x86_64               randconfig-a003-20201124
x86_64               randconfig-a004-20201124
x86_64               randconfig-a005-20201124
x86_64               randconfig-a001-20201124
x86_64               randconfig-a002-20201124
i386                 randconfig-a004-20201124
i386                 randconfig-a003-20201124
i386                 randconfig-a002-20201124
i386                 randconfig-a005-20201124
i386                 randconfig-a001-20201124
i386                 randconfig-a006-20201124
x86_64               randconfig-a015-20201125
x86_64               randconfig-a011-20201125
x86_64               randconfig-a014-20201125
x86_64               randconfig-a016-20201125
x86_64               randconfig-a012-20201125
x86_64               randconfig-a013-20201125
i386                 randconfig-a012-20201124
i386                 randconfig-a013-20201124
i386                 randconfig-a011-20201124
i386                 randconfig-a016-20201124
i386                 randconfig-a014-20201124
i386                 randconfig-a015-20201124
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
x86_64               randconfig-a006-20201125
x86_64               randconfig-a003-20201125
x86_64               randconfig-a004-20201125
x86_64               randconfig-a005-20201125
x86_64               randconfig-a002-20201125
x86_64               randconfig-a001-20201125
x86_64               randconfig-a015-20201124
x86_64               randconfig-a011-20201124
x86_64               randconfig-a014-20201124
x86_64               randconfig-a016-20201124
x86_64               randconfig-a012-20201124
x86_64               randconfig-a013-20201124

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
