Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F5128EC56
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 06:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbgJOEks (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Oct 2020 00:40:48 -0400
Received: from mga12.intel.com ([192.55.52.136]:45767 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725208AbgJOEkr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Oct 2020 00:40:47 -0400
IronPort-SDR: KK86g/q4833TKkXInAW/DRRYjAv8SaH2bIUUHeO83/LzfKU3j7xPzqzSJX/2wSDQ5xrL746gCT
 L7OkI5Xruy8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9774"; a="145563630"
X-IronPort-AV: E=Sophos;i="5.77,377,1596524400"; 
   d="scan'208";a="145563630"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 21:40:47 -0700
IronPort-SDR: SlEP6Dyst2DqpyMECLqT3LJixC4cwnoWbJBXynU/Yb33b6em+0367rWmECls+DmFXSsHlCvWT3
 vqfD2SvEVf1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,377,1596524400"; 
   d="scan'208";a="356863398"
Received: from lkp-server02.sh.intel.com (HELO 99945dcb4a44) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Oct 2020 21:40:45 -0700
Received: from kbuild by 99945dcb4a44 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kSv4H-000015-67; Thu, 15 Oct 2020 04:40:45 +0000
Date:   Thu, 15 Oct 2020 12:40:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 55596c5445566cf43b83238198fd038d21172d99
Message-ID: <5f87d2a1.lIUBhb7vQQriJTya%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  devel
branch HEAD: 55596c5445566cf43b83238198fd038d21172d99  pinctrl: amd: Add missing pins to the pin group list

elapsed time: 721m

configs tested: 148
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
mips                         tb0287_defconfig
sh                   sh7724_generic_defconfig
arm                       netwinder_defconfig
xtensa                              defconfig
mips                            e55_defconfig
s390                             allyesconfig
arm                          pxa3xx_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                 mpc832x_mds_defconfig
sh                        apsh4ad0a_defconfig
mips                          ath79_defconfig
arm                  colibri_pxa300_defconfig
arm                            xcep_defconfig
alpha                               defconfig
powerpc                       eiger_defconfig
mips                           ip32_defconfig
mips                     decstation_defconfig
ia64                                defconfig
powerpc                     sbc8548_defconfig
powerpc                       holly_defconfig
powerpc                   motionpro_defconfig
mips                          malta_defconfig
arm                         lpc32xx_defconfig
arm                          simpad_defconfig
sh                               allmodconfig
riscv                    nommu_k210_defconfig
mips                           ip28_defconfig
i386                             alldefconfig
arc                        vdk_hs38_defconfig
powerpc                      pmac32_defconfig
arm                            zeus_defconfig
powerpc                      ep88xc_defconfig
sh                               alldefconfig
powerpc                      cm5200_defconfig
arm                          collie_defconfig
powerpc                 linkstation_defconfig
ia64                          tiger_defconfig
mips                    maltaup_xpa_defconfig
arm                        multi_v7_defconfig
powerpc                      mgcoge_defconfig
arm                      tct_hammer_defconfig
arm                        vexpress_defconfig
powerpc                     tqm8540_defconfig
arm                         nhk8815_defconfig
arm                             pxa_defconfig
arm                         bcm2835_defconfig
m68k                         amcore_defconfig
powerpc                     mpc5200_defconfig
arm                       imx_v4_v5_defconfig
powerpc                       ebony_defconfig
arm                            pleb_defconfig
sh                   sh7770_generic_defconfig
sh                          lboxre2_defconfig
powerpc                  mpc885_ads_defconfig
sh                          polaris_defconfig
powerpc                     powernv_defconfig
sh                ecovec24-romimage_defconfig
powerpc                      ppc6xx_defconfig
m68k                            q40_defconfig
arm                             rpc_defconfig
arm                           tegra_defconfig
arm                        trizeps4_defconfig
arm                         shannon_defconfig
powerpc                    sam440ep_defconfig
m68k                        m5307c3_defconfig
sh                             sh03_defconfig
sh                        edosk7705_defconfig
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
arc                                 defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                              defconfig
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
i386                 randconfig-a005-20201015
i386                 randconfig-a006-20201015
i386                 randconfig-a001-20201015
i386                 randconfig-a003-20201015
i386                 randconfig-a004-20201015
i386                 randconfig-a002-20201015
i386                 randconfig-a005-20201014
i386                 randconfig-a006-20201014
i386                 randconfig-a001-20201014
i386                 randconfig-a003-20201014
i386                 randconfig-a004-20201014
i386                 randconfig-a002-20201014
x86_64               randconfig-a016-20201014
x86_64               randconfig-a012-20201014
x86_64               randconfig-a015-20201014
x86_64               randconfig-a013-20201014
x86_64               randconfig-a014-20201014
x86_64               randconfig-a011-20201014
i386                 randconfig-a016-20201014
i386                 randconfig-a013-20201014
i386                 randconfig-a015-20201014
i386                 randconfig-a011-20201014
i386                 randconfig-a012-20201014
i386                 randconfig-a014-20201014
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201014
x86_64               randconfig-a002-20201014
x86_64               randconfig-a006-20201014
x86_64               randconfig-a001-20201014
x86_64               randconfig-a005-20201014
x86_64               randconfig-a003-20201014
x86_64               randconfig-a016-20201015
x86_64               randconfig-a012-20201015
x86_64               randconfig-a015-20201015
x86_64               randconfig-a013-20201015
x86_64               randconfig-a014-20201015
x86_64               randconfig-a011-20201015

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
