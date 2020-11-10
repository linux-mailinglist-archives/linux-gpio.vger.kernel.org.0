Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E16422AC9B5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 01:30:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729336AbgKJAau (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 19:30:50 -0500
Received: from mga02.intel.com ([134.134.136.20]:13573 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729451AbgKJAau (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 19:30:50 -0500
IronPort-SDR: DOqI387yOP00cICnShgpRkOMy1snmrcUGXc41VuZfshOxrne7pb6m9xwuORkmhvgPJ3fDvvAke
 NZdW/ufIj3yQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="156897955"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="156897955"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 16:30:49 -0800
IronPort-SDR: vevFAM8hj8lvDho/74l7WlzT7c6sARkkghIpHMrdabOpzmI83JZPx4eV/agfP40IXcu83kg4NN
 /yKhGC42Z+7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="322640533"
Received: from lkp-server01.sh.intel.com (HELO d0be80f1a028) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Nov 2020 16:30:48 -0800
Received: from kbuild by d0be80f1a028 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kcHYd-0000XD-6b; Tue, 10 Nov 2020 00:30:47 +0000
Date:   Tue, 10 Nov 2020 08:30:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 425f577caf8aece32c66a70537753b86ce0b2214
Message-ID: <5fa9df1d.L4THLRvfg7i/U8+r%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  for-next
branch HEAD: 425f577caf8aece32c66a70537753b86ce0b2214  Merge branch 'devel' into for-next

elapsed time: 1243m

configs tested: 120
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                  mpc885_ads_defconfig
m68k                        mvme16x_defconfig
m68k                       bvme6000_defconfig
arm                        multi_v5_defconfig
mips                            gpr_defconfig
m68k                         amcore_defconfig
mips                        jmr3927_defconfig
powerpc                     stx_gp3_defconfig
mips                 decstation_r4k_defconfig
powerpc                     ppa8548_defconfig
powerpc                    sam440ep_defconfig
powerpc                     pseries_defconfig
arm                         s5pv210_defconfig
xtensa                  audio_kc705_defconfig
mips                         tb0219_defconfig
powerpc                 linkstation_defconfig
powerpc                     sbc8548_defconfig
arm                        oxnas_v6_defconfig
sh                     magicpanelr2_defconfig
powerpc                      pasemi_defconfig
arm                         nhk8815_defconfig
arc                                 defconfig
mips                      fuloong2e_defconfig
sh                         microdev_defconfig
arm                            mmp2_defconfig
arm                          collie_defconfig
sh                        sh7757lcr_defconfig
m68k                        m5307c3_defconfig
arm                             rpc_defconfig
m68k                        m5272c3_defconfig
c6x                              alldefconfig
powerpc                      pmac32_defconfig
arm                          imote2_defconfig
parisc                           alldefconfig
arm                        shmobile_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                     tqm8540_defconfig
powerpc                     skiroot_defconfig
arm                         shannon_defconfig
nds32                               defconfig
arm                           corgi_defconfig
arm                          gemini_defconfig
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
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
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
x86_64               randconfig-a004-20201109
x86_64               randconfig-a002-20201109
x86_64               randconfig-a003-20201109
x86_64               randconfig-a005-20201109
x86_64               randconfig-a006-20201109
x86_64               randconfig-a001-20201109
x86_64               randconfig-a003-20201110
x86_64               randconfig-a005-20201110
x86_64               randconfig-a004-20201110
x86_64               randconfig-a002-20201110
x86_64               randconfig-a006-20201110
x86_64               randconfig-a001-20201110
i386                 randconfig-a004-20201109
i386                 randconfig-a006-20201109
i386                 randconfig-a005-20201109
i386                 randconfig-a001-20201109
i386                 randconfig-a003-20201109
i386                 randconfig-a002-20201109
i386                 randconfig-a014-20201109
i386                 randconfig-a015-20201109
i386                 randconfig-a013-20201109
i386                 randconfig-a016-20201109
i386                 randconfig-a011-20201109
i386                 randconfig-a012-20201109
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
x86_64               randconfig-a012-20201109
x86_64               randconfig-a015-20201109
x86_64               randconfig-a013-20201109
x86_64               randconfig-a011-20201109
x86_64               randconfig-a014-20201109
x86_64               randconfig-a016-20201109

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
