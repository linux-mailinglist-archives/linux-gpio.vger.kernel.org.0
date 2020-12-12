Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59E4E2D86BF
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 14:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394160AbgLLNJo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Dec 2020 08:09:44 -0500
Received: from mga03.intel.com ([134.134.136.65]:41826 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439079AbgLLNJk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 12 Dec 2020 08:09:40 -0500
IronPort-SDR: DYkxmNGKzq4CF3xEvE9Rs5GQqbMGIgyc4bb52Mkw6duovT8oFZVdcaBu6RxoZsRTYGNqSQeyzI
 mAeLXXk3sAqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9832"; a="174658825"
X-IronPort-AV: E=Sophos;i="5.78,414,1599548400"; 
   d="scan'208";a="174658825"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2020 05:08:49 -0800
IronPort-SDR: FaY5FOf+1mdLq4kRXsCzEBovVU+yr9gYJWZMhKvIGotqbq6JhVVnK8t2/T0OZnWttUAOPNMqhQ
 aTWD3HOSRHUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,414,1599548400"; 
   d="scan'208";a="334807188"
Received: from lkp-server01.sh.intel.com (HELO ecc0cebe68d1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Dec 2020 05:08:46 -0800
Received: from kbuild by ecc0cebe68d1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ko4dh-0001LB-Ds; Sat, 12 Dec 2020 13:08:45 +0000
Date:   Sat, 12 Dec 2020 21:07:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel] BUILD SUCCESS
 9777d0bfdae796de3f8d73879a43bc00145dc8ee
Message-ID: <5fd4c0a7.VSDKpw4KVadeheVr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel
branch HEAD: 9777d0bfdae796de3f8d73879a43bc00145dc8ee  gpio: cs5535: Simplify the return expression of cs5535_gpio_probe()

elapsed time: 721m

configs tested: 174
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nios2                         3c120_defconfig
sh                 kfr2r09-romimage_defconfig
sh                          r7785rp_defconfig
mips                             allmodconfig
powerpc                     tqm8548_defconfig
m68k                           sun3_defconfig
openrisc                            defconfig
arm                            pleb_defconfig
arm                          collie_defconfig
arm                           sunxi_defconfig
parisc                generic-32bit_defconfig
m68k                       m5275evb_defconfig
arm                          exynos_defconfig
sh                           se7343_defconfig
arm                      integrator_defconfig
arm                            qcom_defconfig
sh                          rsk7264_defconfig
mips                     cu1000-neo_defconfig
powerpc                        cell_defconfig
arm                      jornada720_defconfig
powerpc                     tqm8541_defconfig
sh                          landisk_defconfig
powerpc                       holly_defconfig
s390                                defconfig
powerpc                 mpc832x_rdb_defconfig
parisc                              defconfig
xtensa                    smp_lx200_defconfig
arm                        mvebu_v7_defconfig
sh                             shx3_defconfig
arm                          gemini_defconfig
sh                          rsk7269_defconfig
sh                        apsh4ad0a_defconfig
m68k                        m5272c3_defconfig
mips                   sb1250_swarm_defconfig
arm                         socfpga_defconfig
arm                          moxart_defconfig
arc                                 defconfig
arm                         s3c6400_defconfig
arm                       aspeed_g4_defconfig
arc                         haps_hs_defconfig
powerpc                        warp_defconfig
nios2                         10m50_defconfig
parisc                generic-64bit_defconfig
arm                        mvebu_v5_defconfig
powerpc                      bamboo_defconfig
powerpc                     ppa8548_defconfig
riscv                               defconfig
sh                             sh03_defconfig
xtensa                generic_kc705_defconfig
m68k                        mvme147_defconfig
arm                        multi_v5_defconfig
arm                          pxa910_defconfig
nds32                               defconfig
parisc                           alldefconfig
ia64                                defconfig
powerpc                    klondike_defconfig
powerpc                 mpc8560_ads_defconfig
arm                         assabet_defconfig
arm                     eseries_pxa_defconfig
arm                         lubbock_defconfig
arm                   milbeaut_m10v_defconfig
arm                         s3c2410_defconfig
arm                       spear13xx_defconfig
powerpc                        icon_defconfig
s390                          debug_defconfig
powerpc                    ge_imp3a_defconfig
mips                      bmips_stb_defconfig
xtensa                         virt_defconfig
sparc                            allyesconfig
powerpc                          g5_defconfig
m68k                       bvme6000_defconfig
xtensa                           allyesconfig
arm                         mv78xx0_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          simpad_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                      maltasmvp_defconfig
powerpc                      makalu_defconfig
riscv                    nommu_virt_defconfig
ia64                             allmodconfig
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
h8300                            allyesconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20201212
i386                 randconfig-a004-20201212
i386                 randconfig-a003-20201212
i386                 randconfig-a002-20201212
i386                 randconfig-a005-20201212
i386                 randconfig-a006-20201212
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
x86_64               randconfig-a016-20201212
x86_64               randconfig-a012-20201212
x86_64               randconfig-a013-20201212
x86_64               randconfig-a015-20201212
x86_64               randconfig-a014-20201212
x86_64               randconfig-a011-20201212
i386                 randconfig-a014-20201210
i386                 randconfig-a013-20201210
i386                 randconfig-a012-20201210
i386                 randconfig-a011-20201210
i386                 randconfig-a016-20201210
i386                 randconfig-a015-20201210
i386                 randconfig-a013-20201209
i386                 randconfig-a014-20201209
i386                 randconfig-a011-20201209
i386                 randconfig-a015-20201209
i386                 randconfig-a012-20201209
i386                 randconfig-a016-20201209
i386                 randconfig-a014-20201212
i386                 randconfig-a013-20201212
i386                 randconfig-a012-20201212
i386                 randconfig-a011-20201212
i386                 randconfig-a016-20201212
i386                 randconfig-a015-20201212
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20201212
x86_64               randconfig-a006-20201212
x86_64               randconfig-a002-20201212
x86_64               randconfig-a005-20201212
x86_64               randconfig-a004-20201212
x86_64               randconfig-a001-20201212
x86_64               randconfig-a004-20201209
x86_64               randconfig-a006-20201209
x86_64               randconfig-a005-20201209
x86_64               randconfig-a001-20201209
x86_64               randconfig-a002-20201209
x86_64               randconfig-a003-20201209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
