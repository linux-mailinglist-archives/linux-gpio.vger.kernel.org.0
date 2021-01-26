Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 846943034C1
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 06:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731521AbhAZF04 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 00:26:56 -0500
Received: from mga11.intel.com ([192.55.52.93]:61709 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731548AbhAZCWn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 Jan 2021 21:22:43 -0500
IronPort-SDR: W05Les5IUxnB1gluilov4/L1PpiVwVoqEEKQ0tkQtXHSK1Mx4fiujHDVuo6IoUqwI5PvZIrTpk
 ke+T6XsL4UVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="176325127"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="176325127"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 18:21:58 -0800
IronPort-SDR: cA+uy4J05h0bPfJFd28GVaUAgwMkXXAG5Od8WrCOOflda6oYIFSNyU5h+MUE1KFSKS9faMt0ev
 WZF8pFTi4N4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="572784991"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 25 Jan 2021 18:21:57 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l4DzQ-0000Uk-T0; Tue, 26 Jan 2021 02:21:56 +0000
Date:   Tue, 26 Jan 2021 10:21:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD REGRESSION
 3bbf9b89592d18c391eafd7a5e0e7429ae2dc767
Message-ID: <600f7c9e.etsND/801bOik9S6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 3bbf9b89592d18c391eafd7a5e0e7429ae2dc767  pinctrl: pinmux: add function selector to pinmux-functions

Error/Warning reports:

https://lore.kernel.org/linux-gpio/202101260734.haBuNSsB-lkp@intel.com

Error/Warning in current branch:

drivers/pinctrl/samsung/pinctrl-s3c64xx.c:289:20: error: passing argument 1 of 'spinlock_check' from incompatible pointer type [-Werror=incompatible-pointer-types]
drivers/pinctrl/samsung/pinctrl-s3c64xx.c:296:25: error: passing argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type [-Werror=incompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- c6x-randconfig-r021-20210125
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
`-- x86_64-allyesconfig
    |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
    `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type

elapsed time: 727m

configs tested: 130
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     redwood_defconfig
arm                        shmobile_defconfig
m68k                          sun3x_defconfig
arm                         s5pv210_defconfig
sh                           se7722_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                   sh7770_generic_defconfig
arm                          badge4_defconfig
sh                        sh7757lcr_defconfig
c6x                                 defconfig
powerpc                   bluestone_defconfig
arm                  colibri_pxa270_defconfig
riscv                             allnoconfig
powerpc                    klondike_defconfig
arm                         palmz72_defconfig
m68k                        stmark2_defconfig
mips                         tb0287_defconfig
arm                         assabet_defconfig
powerpc                       eiger_defconfig
sh                           sh2007_defconfig
powerpc                     stx_gp3_defconfig
s390                             allyesconfig
powerpc                       holly_defconfig
arm                        keystone_defconfig
arm                            u300_defconfig
powerpc                     ppa8548_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                      ep88xc_defconfig
i386                                defconfig
h8300                    h8300h-sim_defconfig
arm                       multi_v4t_defconfig
sh                 kfr2r09-romimage_defconfig
arm                            mmp2_defconfig
ia64                      gensparse_defconfig
arm                              alldefconfig
mips                   sb1250_swarm_defconfig
arm                         lpc18xx_defconfig
mips                         db1xxx_defconfig
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
