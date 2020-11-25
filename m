Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44F862C37B1
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Nov 2020 04:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727672AbgKYDhU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 22:37:20 -0500
Received: from mga04.intel.com ([192.55.52.120]:64189 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727669AbgKYDhS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Nov 2020 22:37:18 -0500
IronPort-SDR: EWun1zKahIHIgHo1vES4YF27vz2mNNQc57TJTEuUbUCnEQqQkghrkK9YI4vLbAaATlWeHzegtc
 yQp2k1OgQmWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="169497713"
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; 
   d="scan'208";a="169497713"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 19:37:17 -0800
IronPort-SDR: JUuhrYtNcXXYrW9J0EfD7hBgFFz10WxlHS+3rguPcMklV+v3FLiGh7beJJqTp3xAi38BvQzlHo
 dyW2BKuzahLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; 
   d="scan'208";a="365254456"
Received: from lkp-server01.sh.intel.com (HELO d5aceba519b7) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Nov 2020 19:37:16 -0800
Received: from kbuild by d5aceba519b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1khlcK-00000P-6m; Wed, 25 Nov 2020 03:37:16 +0000
Date:   Wed, 25 Nov 2020 11:36:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 8e5008b1a9a03c06dc259d4b25657caccaccd09f
Message-ID: <5fbdd130.fkSG+UJxUop6rIjQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  for-next
branch HEAD: 8e5008b1a9a03c06dc259d4b25657caccaccd09f  Merge branch 'devel' into for-next

elapsed time: 720m

configs tested: 165
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                            q40_defconfig
powerpc                      walnut_defconfig
powerpc                      katmai_defconfig
mips                         mpc30x_defconfig
arm                         assabet_defconfig
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
arc                     haps_hs_smp_defconfig
mips                           jazz_defconfig
mips                            ar7_defconfig
arm                         lubbock_defconfig
parisc                           allyesconfig
sh                        sh7757lcr_defconfig
sh                                  defconfig
arm                          gemini_defconfig
csky                             alldefconfig
arm                          tango4_defconfig
xtensa                       common_defconfig
m68k                           sun3_defconfig
arc                        vdk_hs38_defconfig
powerpc                      pasemi_defconfig
mips                         db1xxx_defconfig
arm                          prima2_defconfig
powerpc                  storcenter_defconfig
arm                             ezx_defconfig
arm                       aspeed_g4_defconfig
powerpc                    ge_imp3a_defconfig
mips                           ip27_defconfig
powerpc                    socrates_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                      ep88xc_defconfig
parisc                              defconfig
powerpc                     rainier_defconfig
powerpc                      acadia_defconfig
ia64                             alldefconfig
arc                          axs101_defconfig
powerpc                      pcm030_defconfig
mips                      bmips_stb_defconfig
arm                            xcep_defconfig
h8300                    h8300h-sim_defconfig
mips                         cobalt_defconfig
arm                        shmobile_defconfig
arm                           h3600_defconfig
arm                        magician_defconfig
sh                          rsk7201_defconfig
arm                            pleb_defconfig
x86_64                           alldefconfig
arm                        neponset_defconfig
sh                            migor_defconfig
mips                      maltaaprp_defconfig
parisc                           alldefconfig
mips                          rm200_defconfig
sh                   sh7770_generic_defconfig
powerpc                    gamecube_defconfig
arm                        trizeps4_defconfig
powerpc                 mpc836x_mds_defconfig
sh                               alldefconfig
m68k                        m5407c3_defconfig
arm                        cerfcube_defconfig
powerpc                     kmeter1_defconfig
arm                         s3c6400_defconfig
arm                          pcm027_defconfig
arm                          ep93xx_defconfig
mips                            e55_defconfig
arm                        multi_v7_defconfig
sh                          rsk7203_defconfig
mips                  decstation_64_defconfig
sh                   rts7751r2dplus_defconfig
m68k                          multi_defconfig
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
s390                             allyesconfig
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
x86_64               randconfig-a015-20201124
x86_64               randconfig-a011-20201124
x86_64               randconfig-a014-20201124
x86_64               randconfig-a016-20201124
x86_64               randconfig-a012-20201124
x86_64               randconfig-a013-20201124
x86_64               randconfig-a006-20201125
x86_64               randconfig-a003-20201125
x86_64               randconfig-a004-20201125
x86_64               randconfig-a005-20201125
x86_64               randconfig-a002-20201125
x86_64               randconfig-a001-20201125

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
