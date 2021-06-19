Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1693AD672
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jun 2021 03:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbhFSBPz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Jun 2021 21:15:55 -0400
Received: from mga06.intel.com ([134.134.136.31]:62164 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233887AbhFSBPy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 18 Jun 2021 21:15:54 -0400
IronPort-SDR: nulyaH7biBZSDk8QJ3CMCIU0X3oEc/0lS0cxMv8RrqBWd63srQVOxJobQZOBaye5rvtdS18HGf
 2SW+d1fl3czQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10019"; a="267785568"
X-IronPort-AV: E=Sophos;i="5.83,284,1616482800"; 
   d="scan'208";a="267785568"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2021 18:13:44 -0700
IronPort-SDR: rCFSyd9/2bOecJa7G7ADBSWfCEMmh5MBDYPuB5xJ9yJMvXqNg0UBtvajUrzOAnVN1ymKjWG7LH
 yhmuZbboGShA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,284,1616482800"; 
   d="scan'208";a="405442696"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Jun 2021 18:13:43 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1luPYM-0003Eg-CZ; Sat, 19 Jun 2021 01:13:42 +0000
Date:   Sat, 19 Jun 2021 09:13:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 0c3ae641a27a41e4998663b34c133d6ff3131df7
Message-ID: <60cd44a6.w7QFkJzjp9fO9NYC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 0c3ae641a27a41e4998663b34c133d6ff3131df7  drivers: qcom: pinctrl: Add pinctrl driver for sm6125

elapsed time: 723m

configs tested: 136
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         bcm2835_defconfig
powerpc                    klondike_defconfig
mips                          rb532_defconfig
powerpc                     tqm8540_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          polaris_defconfig
x86_64                            allnoconfig
xtensa                       common_defconfig
arm                          pxa168_defconfig
nios2                         3c120_defconfig
arm                           sama5_defconfig
arm                       imx_v6_v7_defconfig
mips                     loongson1c_defconfig
m68k                            mac_defconfig
powerpc                     taishan_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                   currituck_defconfig
xtensa                  nommu_kc705_defconfig
um                           x86_64_defconfig
powerpc                        fsp2_defconfig
arm                          badge4_defconfig
sh                           se7619_defconfig
powerpc                      pmac32_defconfig
arm                             pxa_defconfig
sh                                  defconfig
arm                            pleb_defconfig
m68k                        m5272c3_defconfig
mips                      maltaaprp_defconfig
arm                         axm55xx_defconfig
arc                        vdk_hs38_defconfig
m68k                        mvme16x_defconfig
microblaze                          defconfig
m68k                        stmark2_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                          pxa3xx_defconfig
powerpc                      cm5200_defconfig
sparc                            alldefconfig
powerpc                        icon_defconfig
arm                     davinci_all_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                          iop32x_defconfig
arm                          lpd270_defconfig
arm                          collie_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                  storcenter_defconfig
s390                             alldefconfig
sh                     magicpanelr2_defconfig
arm                        realview_defconfig
ia64                             alldefconfig
s390                                defconfig
arm                        clps711x_defconfig
sh                             espt_defconfig
arm                     am200epdkit_defconfig
mips                  decstation_64_defconfig
arm                       mainstone_defconfig
m68k                       m5475evb_defconfig
powerpc                         wii_defconfig
xtensa                              defconfig
sh                            migor_defconfig
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
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20210618
i386                 randconfig-a006-20210618
i386                 randconfig-a004-20210618
i386                 randconfig-a001-20210618
i386                 randconfig-a005-20210618
i386                 randconfig-a003-20210618
x86_64               randconfig-a015-20210618
x86_64               randconfig-a011-20210618
x86_64               randconfig-a012-20210618
x86_64               randconfig-a014-20210618
x86_64               randconfig-a016-20210618
x86_64               randconfig-a013-20210618
i386                 randconfig-a015-20210618
i386                 randconfig-a016-20210618
i386                 randconfig-a013-20210618
i386                 randconfig-a014-20210618
i386                 randconfig-a012-20210618
i386                 randconfig-a011-20210618
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210618
x86_64               randconfig-a002-20210618
x86_64               randconfig-a001-20210618
x86_64               randconfig-a004-20210618
x86_64               randconfig-a003-20210618
x86_64               randconfig-a006-20210618
x86_64               randconfig-a005-20210618

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
