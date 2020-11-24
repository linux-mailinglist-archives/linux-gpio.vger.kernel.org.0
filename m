Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 453C72C1BC5
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 03:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbgKXCxp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 21:53:45 -0500
Received: from mga04.intel.com ([192.55.52.120]:62546 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726529AbgKXCxo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Nov 2020 21:53:44 -0500
IronPort-SDR: 6DY0DM/8ykAqnSnCuQJObLRaxQMfi18RrP+uYwLW89DjCZl3cfRKBlfF4og6esoU98RkI9s2LG
 FdD1sNU7Ayww==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="169318115"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; 
   d="scan'208";a="169318115"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 18:53:43 -0800
IronPort-SDR: LCDzfcWRsWiuwqHhThY2uyRV8Pc9jAoMVDCDTpP5qN7me+L4zK8oDnCWl29Hxcv1ra3u8ZOTT6
 sLpW1IqFZ/7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; 
   d="scan'208";a="536318724"
Received: from lkp-server01.sh.intel.com (HELO 1138cb5768e3) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Nov 2020 18:53:42 -0800
Received: from kbuild by 1138cb5768e3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1khOSb-0000J8-Kv; Tue, 24 Nov 2020 02:53:41 +0000
Date:   Tue, 24 Nov 2020 10:52:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel] BUILD SUCCESS
 6c33287665e093cdf885e700487380b65e402d33
Message-ID: <5fbc7583.sGOXlGjALU0L9P+m%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel
branch HEAD: 6c33287665e093cdf885e700487380b65e402d33  pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO

elapsed time: 724m

configs tested: 150
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      pcm030_defconfig
arm                         s3c6400_defconfig
sh                        sh7763rdp_defconfig
powerpc                        warp_defconfig
arm                             ezx_defconfig
arm                            zeus_defconfig
powerpc                   bluestone_defconfig
sh                         apsh4a3a_defconfig
arm                        mvebu_v7_defconfig
sh                     magicpanelr2_defconfig
arm                         nhk8815_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                           u8500_defconfig
powerpc                     tqm8555_defconfig
c6x                        evmc6472_defconfig
arm                       mainstone_defconfig
arm                          moxart_defconfig
openrisc                         alldefconfig
ia64                                defconfig
arm                        mvebu_v5_defconfig
powerpc                      makalu_defconfig
mips                             allyesconfig
arm                        keystone_defconfig
mips                           ip32_defconfig
arm                            u300_defconfig
sh                           se7724_defconfig
csky                             alldefconfig
arm                            dove_defconfig
m68k                           sun3_defconfig
sh                   rts7751r2dplus_defconfig
sh                          rsk7203_defconfig
arm                          gemini_defconfig
arm                         s5pv210_defconfig
sparc64                          alldefconfig
mips                           ip27_defconfig
powerpc                    mvme5100_defconfig
arm                  colibri_pxa270_defconfig
nios2                         3c120_defconfig
sh                             espt_defconfig
powerpc                      bamboo_defconfig
powerpc                      ppc6xx_defconfig
sh                          landisk_defconfig
mips                           mtx1_defconfig
mips                        nlm_xlr_defconfig
xtensa                       common_defconfig
mips                      maltaaprp_defconfig
nds32                            alldefconfig
arm                         cm_x300_defconfig
arm                        shmobile_defconfig
mips                        jmr3927_defconfig
ia64                      gensparse_defconfig
powerpc                     powernv_defconfig
sh                           se7751_defconfig
mips                     loongson1b_defconfig
arm                          tango4_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                 mpc8540_ads_defconfig
arm                        magician_defconfig
mips                       lemote2f_defconfig
powerpc                      tqm8xx_defconfig
arm                       imx_v4_v5_defconfig
mips                           ip28_defconfig
arm                         lpc18xx_defconfig
powerpc                     tqm8540_defconfig
arc                                 defconfig
sh                          urquell_defconfig
sh                          sdk7780_defconfig
alpha                               defconfig
sh                         ecovec24_defconfig
arm                       omap2plus_defconfig
arm                     eseries_pxa_defconfig
sh                          rsk7269_defconfig
powerpc                      katmai_defconfig
arm                          exynos_defconfig
powerpc                     mpc512x_defconfig
arm                           corgi_defconfig
powerpc                       ppc64_defconfig
powerpc                     taishan_defconfig
mips                           ci20_defconfig
arc                     nsimosci_hs_defconfig
ia64                             allmodconfig
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
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201123
i386                 randconfig-a003-20201123
i386                 randconfig-a002-20201123
i386                 randconfig-a005-20201123
i386                 randconfig-a001-20201123
i386                 randconfig-a006-20201123
x86_64               randconfig-a015-20201123
x86_64               randconfig-a011-20201123
x86_64               randconfig-a014-20201123
x86_64               randconfig-a016-20201123
x86_64               randconfig-a012-20201123
x86_64               randconfig-a013-20201123
i386                 randconfig-a012-20201123
i386                 randconfig-a013-20201123
i386                 randconfig-a011-20201123
i386                 randconfig-a016-20201123
i386                 randconfig-a014-20201123
i386                 randconfig-a015-20201123
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
x86_64               randconfig-a006-20201123
x86_64               randconfig-a003-20201123
x86_64               randconfig-a004-20201123
x86_64               randconfig-a005-20201123
x86_64               randconfig-a002-20201123
x86_64               randconfig-a001-20201123

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
