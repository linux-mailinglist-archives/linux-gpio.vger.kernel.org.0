Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB7543EEB81
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Aug 2021 13:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236772AbhHQLUD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Aug 2021 07:20:03 -0400
Received: from mga04.intel.com ([192.55.52.120]:29182 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231515AbhHQLUD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 17 Aug 2021 07:20:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="214196664"
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; 
   d="scan'208";a="214196664"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2021 04:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; 
   d="scan'208";a="423875161"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Aug 2021 04:19:28 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mFx7v-000Rk0-Sy; Tue, 17 Aug 2021 11:19:27 +0000
Date:   Tue, 17 Aug 2021 19:18:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:ib-rockchip] BUILD SUCCESS
 9ce9a02039de72ec8af1bd4bff14f1780337ffcc
Message-ID: <611b9af6.t6way2KCFFT2XdwZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-rockchip
branch HEAD: 9ce9a02039de72ec8af1bd4bff14f1780337ffcc  pinctrl/rockchip: drop the gpio related codes

elapsed time: 729m

configs tested: 114
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210816
powerpc                      ep88xc_defconfig
sh                   secureedge5410_defconfig
arm                        vexpress_defconfig
xtensa                          iss_defconfig
arm                        shmobile_defconfig
powerpc                       ebony_defconfig
powerpc                      walnut_defconfig
arm                            mmp2_defconfig
xtensa                  audio_kc705_defconfig
arm                         vf610m4_defconfig
arm                         cm_x300_defconfig
arm                             pxa_defconfig
arm                       omap2plus_defconfig
arm                         axm55xx_defconfig
arm                        spear6xx_defconfig
nios2                               defconfig
alpha                            alldefconfig
arm                         s3c6400_defconfig
m68k                        mvme16x_defconfig
arm                      pxa255-idp_defconfig
arc                          axs101_defconfig
mips                     loongson2k_defconfig
arm                        cerfcube_defconfig
powerpc                  mpc885_ads_defconfig
arm                          gemini_defconfig
arm                            hisi_defconfig
mips                  decstation_64_defconfig
mips                        vocore2_defconfig
powerpc                  iss476-smp_defconfig
h8300                            allyesconfig
arc                            hsdk_defconfig
powerpc                     skiroot_defconfig
mips                 decstation_r4k_defconfig
arm                        multi_v7_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                       imx_v4_v5_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                     decstation_defconfig
um                             i386_defconfig
arm                      jornada720_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                             allmodconfig
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
x86_64               randconfig-a006-20210816
x86_64               randconfig-a004-20210816
x86_64               randconfig-a003-20210816
x86_64               randconfig-a001-20210816
x86_64               randconfig-a005-20210816
x86_64               randconfig-a002-20210816
i386                 randconfig-a004-20210816
i386                 randconfig-a003-20210816
i386                 randconfig-a002-20210816
i386                 randconfig-a001-20210816
i386                 randconfig-a006-20210816
i386                 randconfig-a005-20210816
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20210816
x86_64               randconfig-a013-20210816
x86_64               randconfig-a016-20210816
x86_64               randconfig-a012-20210816
x86_64               randconfig-a015-20210816
x86_64               randconfig-a014-20210816
i386                 randconfig-a011-20210816
i386                 randconfig-a015-20210816
i386                 randconfig-a013-20210816
i386                 randconfig-a014-20210816
i386                 randconfig-a016-20210816
i386                 randconfig-a012-20210816

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
