Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE77256456
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Aug 2020 05:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgH2D3H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 23:29:07 -0400
Received: from mga09.intel.com ([134.134.136.24]:32583 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726798AbgH2D3E (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Aug 2020 23:29:04 -0400
IronPort-SDR: o7SJJKISr3xsptIfeXF6jceou5GkNr2wRvUsHjvOksI8rz4Zds3zsGN59lq2TPpJhNJaYb2ZOJ
 Zv8IEwSOUN9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="157790452"
X-IronPort-AV: E=Sophos;i="5.76,366,1592895600"; 
   d="scan'208";a="157790452"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 20:29:04 -0700
IronPort-SDR: WxPO6LBJKsjor4ITsbuy1Dd7WEki3B67ewMZZdNob5ufA53AKlVGEoHMzduwYKGo4D3I5Nba97
 QWNawoONvCEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,366,1592895600"; 
   d="scan'208";a="313787335"
Received: from lkp-server02.sh.intel.com (HELO 301dc1beeb51) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 28 Aug 2020 20:29:02 -0700
Received: from kbuild by 301dc1beeb51 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kBrY6-0000Kc-6P; Sat, 29 Aug 2020 03:29:02 +0000
Date:   Sat, 29 Aug 2020 11:28:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-spi] BUILD SUCCESS
 bd091834778de205fe0f447a3ca95354c868e180
Message-ID: <5f49cb61.05DuJVRktlJ+SN7B%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-spi
branch HEAD: bd091834778de205fe0f447a3ca95354c868e180  spi: mpc512x-psc: Convert to use GPIO descriptors

elapsed time: 726m

configs tested: 120
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         cm_x300_defconfig
arc                        nsim_700_defconfig
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
arm                         hackkit_defconfig
arm                          iop32x_defconfig
arm                         vf610m4_defconfig
sh                              ul2_defconfig
arm64                            alldefconfig
powerpc                          g5_defconfig
arm                          tango4_defconfig
arm                      jornada720_defconfig
sh                           se7780_defconfig
sh                           se7750_defconfig
mips                         bigsur_defconfig
arm                          badge4_defconfig
arm                        spear3xx_defconfig
powerpc                      ppc64e_defconfig
arm                          gemini_defconfig
m68k                       m5208evb_defconfig
um                             i386_defconfig
arm                           h5000_defconfig
sh                            hp6xx_defconfig
s390                       zfcpdump_defconfig
arc                     haps_hs_smp_defconfig
xtensa                    xip_kc705_defconfig
m68k                       m5275evb_defconfig
arm                             pxa_defconfig
sh                          sdk7780_defconfig
arm                          ixp4xx_defconfig
sh                   rts7751r2dplus_defconfig
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
