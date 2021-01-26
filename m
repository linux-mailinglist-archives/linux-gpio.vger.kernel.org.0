Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0760B3034C3
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 06:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbhAZF1C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 00:27:02 -0500
Received: from mga18.intel.com ([134.134.136.126]:26920 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731566AbhAZCWn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Jan 2021 21:22:43 -0500
IronPort-SDR: r7TAgSb1VT7bQpkJiy2czzlboidrdnlhN3as+8iQR+WigsyaNq1+HLTwCMKlVN40NPvT0exLSO
 6kVoH/68jt8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="167510115"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="167510115"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 18:21:58 -0800
IronPort-SDR: fxqL7YB4/imQm2NpOOsPAMuJd9Y3VRFYzEoQdd93OiF42BZUmZuDwEYhcPRO1vM7qWVIqc9WsL
 7nDEP2uUHvYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="353293320"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 25 Jan 2021 18:21:57 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l4DzQ-0000Uf-Rd; Tue, 26 Jan 2021 02:21:56 +0000
Date:   Tue, 26 Jan 2021 10:21:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 317dea99f0b64fc7a176d19f1d59aaee003bc569
Message-ID: <600f7ca4.ZcgCsit82yqZ7U4e%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 317dea99f0b64fc7a176d19f1d59aaee003bc569  pinctrl: mediatek: Fix trigger type setting follow for unexpected interrupt

elapsed time: 727m

configs tested: 139
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                    adder875_defconfig
powerpc                      obs600_defconfig
mips                     decstation_defconfig
mips                          rm200_defconfig
mips                  decstation_64_defconfig
sh                           se7722_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                   sh7770_generic_defconfig
arm                          badge4_defconfig
sh                        sh7757lcr_defconfig
c6x                                 defconfig
powerpc                   bluestone_defconfig
arm                  colibri_pxa270_defconfig
mips                         db1xxx_defconfig
m68k                       m5249evb_defconfig
powerpc                          g5_defconfig
sh                           se7343_defconfig
powerpc                    klondike_defconfig
arm                         palmz72_defconfig
m68k                        stmark2_defconfig
mips                         tb0287_defconfig
arm                         assabet_defconfig
powerpc                       eiger_defconfig
sh                           sh2007_defconfig
powerpc                     stx_gp3_defconfig
powerpc                     rainier_defconfig
arc                    vdk_hs38_smp_defconfig
mips                       capcella_defconfig
mips                            gpr_defconfig
s390                             allyesconfig
powerpc                       holly_defconfig
arm                        keystone_defconfig
arm                            u300_defconfig
powerpc                     ppa8548_defconfig
powerpc                 mpc8315_rdb_defconfig
sh                           se7705_defconfig
mips                  cavium_octeon_defconfig
powerpc                     tqm5200_defconfig
arm                          lpd270_defconfig
sh                 kfr2r09-romimage_defconfig
arm                            mmp2_defconfig
ia64                      gensparse_defconfig
arm                              alldefconfig
mips                   sb1250_swarm_defconfig
arm                         lpc18xx_defconfig
sh                        sh7763rdp_defconfig
powerpc                     tqm8555_defconfig
powerpc                    amigaone_defconfig
mips                      fuloong2e_defconfig
arm                       aspeed_g5_defconfig
arm                         nhk8815_defconfig
mips                  maltasmvp_eva_defconfig
arc                            hsdk_defconfig
powerpc                     mpc83xx_defconfig
arm                          imote2_defconfig
m68k                            q40_defconfig
mips                malta_qemu_32r6_defconfig
arm                        multi_v7_defconfig
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
parisc                           allyesconfig
s390                                defconfig
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
x86_64               randconfig-a003-20210125
x86_64               randconfig-a002-20210125
x86_64               randconfig-a001-20210125
x86_64               randconfig-a005-20210125
x86_64               randconfig-a006-20210125
x86_64               randconfig-a004-20210125
i386                 randconfig-a001-20210125
i386                 randconfig-a002-20210125
i386                 randconfig-a004-20210125
i386                 randconfig-a006-20210125
i386                 randconfig-a005-20210125
i386                 randconfig-a003-20210125
x86_64               randconfig-a012-20210126
x86_64               randconfig-a016-20210126
x86_64               randconfig-a015-20210126
x86_64               randconfig-a011-20210126
x86_64               randconfig-a013-20210126
x86_64               randconfig-a014-20210126
i386                 randconfig-a013-20210125
i386                 randconfig-a011-20210125
i386                 randconfig-a012-20210125
i386                 randconfig-a015-20210125
i386                 randconfig-a014-20210125
i386                 randconfig-a016-20210125
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
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210125
x86_64               randconfig-a016-20210125
x86_64               randconfig-a015-20210125
x86_64               randconfig-a011-20210125
x86_64               randconfig-a013-20210125
x86_64               randconfig-a014-20210125

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
