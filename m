Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68927256458
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Aug 2020 05:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgH2D3K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 23:29:10 -0400
Received: from mga11.intel.com ([192.55.52.93]:13199 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726748AbgH2D3E (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Aug 2020 23:29:04 -0400
IronPort-SDR: WgJHX4WeytSxmz9m0k9UX3bRLhCp3nIpnlNSEm/ByazeMqwzEQgERliucHDYtlF8e9Wt1qHbOR
 FIWU/CrAva4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="154313657"
X-IronPort-AV: E=Sophos;i="5.76,366,1592895600"; 
   d="scan'208";a="154313657"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 20:29:04 -0700
IronPort-SDR: +ZXXUPSnld+kBr1QSU0cFTdAK7CF+dp31eOlIxI7Ci7yD9iyPLm5vOfKG4HqruzBu9fRNypmzs
 jtsTxHXM4ljw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,366,1592895600"; 
   d="scan'208";a="337676400"
Received: from lkp-server02.sh.intel.com (HELO 301dc1beeb51) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2020 20:29:02 -0700
Received: from kbuild by 301dc1beeb51 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kBrY6-0000Ko-7z; Sat, 29 Aug 2020 03:29:02 +0000
Date:   Sat, 29 Aug 2020 11:28:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-backlight] BUILD SUCCESS
 d978b87fffa3024ef0c261c693cbe030f5ab02fb
Message-ID: <5f49cb67.DvpQ7rsX2OWhW++O%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-backlight
branch HEAD: d978b87fffa3024ef0c261c693cbe030f5ab02fb  backlight: tosa_lcd: Include the right header

elapsed time: 726m

configs tested: 113
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                           gcw0_defconfig
nios2                         3c120_defconfig
sh                          sdk7786_defconfig
arm                        multi_v5_defconfig
arm                      integrator_defconfig
mips                        nlm_xlp_defconfig
m68k                             alldefconfig
mips                      malta_kvm_defconfig
sh                   secureedge5410_defconfig
microblaze                    nommu_defconfig
mips                     cu1830-neo_defconfig
arm                              zx_defconfig
arm                         s3c6400_defconfig
arm                        vexpress_defconfig
mips                   sb1250_swarm_defconfig
sh                        edosk7760_defconfig
arm                        realview_defconfig
mips                          rb532_defconfig
ia64                         bigsur_defconfig
arm                           viper_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                     mpc512x_defconfig
sh                   rts7751r2dplus_defconfig
arm64                            alldefconfig
arm                          tango4_defconfig
arm                      jornada720_defconfig
sh                           se7780_defconfig
xtensa                generic_kc705_defconfig
um                           x86_64_defconfig
sh                           se7750_defconfig
mips                         bigsur_defconfig
arm                          badge4_defconfig
arm                        spear3xx_defconfig
arm                        magician_defconfig
arm                        multi_v7_defconfig
s390                       zfcpdump_defconfig
arc                     haps_hs_smp_defconfig
xtensa                    xip_kc705_defconfig
m68k                       m5275evb_defconfig
arm                             pxa_defconfig
sh                          sdk7780_defconfig
arm                          ixp4xx_defconfig
arm                           sunxi_defconfig
powerpc                         wii_defconfig
arm                            dove_defconfig
sh                ecovec24-romimage_defconfig
m68k                          sun3x_defconfig
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
powerpc                             defconfig
i386                 randconfig-a002-20200828
i386                 randconfig-a005-20200828
i386                 randconfig-a003-20200828
i386                 randconfig-a004-20200828
i386                 randconfig-a001-20200828
i386                 randconfig-a006-20200828
x86_64               randconfig-a015-20200828
x86_64               randconfig-a012-20200828
x86_64               randconfig-a016-20200828
x86_64               randconfig-a014-20200828
x86_64               randconfig-a011-20200828
x86_64               randconfig-a013-20200828
i386                 randconfig-a013-20200828
i386                 randconfig-a012-20200828
i386                 randconfig-a011-20200828
i386                 randconfig-a016-20200828
i386                 randconfig-a014-20200828
i386                 randconfig-a015-20200828
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
