Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D62F210DD5
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 16:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731347AbgGAOfU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jul 2020 10:35:20 -0400
Received: from mga14.intel.com ([192.55.52.115]:37338 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731344AbgGAOfT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 1 Jul 2020 10:35:19 -0400
IronPort-SDR: Dm073GUlybyUuEOM/xK8veOYnlnGO4HQZPuz/hY6hjx2k2ErtWTJ+ZVkMIeZeh4GlzBInK6yC/
 fN0lesaLNrjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="145663822"
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; 
   d="scan'208";a="145663822"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 07:35:17 -0700
IronPort-SDR: lnIY+N9+n2gaO0xE4yQLD15OS5UBYn9Nl4yOd5VcAqqfT1WlnoRvyhRMUN8Iw3cLPbRPINdqsl
 g2BWIS5XTxiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; 
   d="scan'208";a="303864376"
Received: from lkp-server01.sh.intel.com (HELO 28879958b202) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Jul 2020 07:35:16 -0700
Received: from kbuild by 28879958b202 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jqdpT-00037P-Rq; Wed, 01 Jul 2020 14:35:15 +0000
Date:   Wed, 01 Jul 2020 22:34:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-usb] BUILD SUCCESS
 01ebb87a729090f2a821dc87f4b66cb3c0e37a8e
Message-ID: <5efc9eea.m0k7uiRcxu6Xfioy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-usb
branch HEAD: 01ebb87a729090f2a821dc87f4b66cb3c0e37a8e  usb: gadget: pch_udc: Convert to use GPIO descriptors

elapsed time: 725m

configs tested: 120
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
xtensa                generic_kc705_defconfig
sh                ecovec24-romimage_defconfig
powerpc                      ppc6xx_defconfig
arm                  colibri_pxa270_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                   rts7751r2dplus_defconfig
riscv                    nommu_k210_defconfig
i386                             alldefconfig
mips                        vocore2_defconfig
powerpc                         ps3_defconfig
arm                         ebsa110_defconfig
sparc64                          allmodconfig
sh                          sdk7780_defconfig
m68k                          amiga_defconfig
arm                         lpc32xx_defconfig
m68k                            mac_defconfig
arm                            dove_defconfig
mips                          ath79_defconfig
alpha                            alldefconfig
arc                         haps_hs_defconfig
powerpc                    gamecube_defconfig
arm                           tegra_defconfig
arm                         orion5x_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200701
i386                 randconfig-a001-20200701
i386                 randconfig-a006-20200701
i386                 randconfig-a005-20200701
i386                 randconfig-a004-20200701
i386                 randconfig-a003-20200701
x86_64               randconfig-a012-20200701
x86_64               randconfig-a016-20200701
x86_64               randconfig-a014-20200701
x86_64               randconfig-a011-20200701
x86_64               randconfig-a015-20200701
x86_64               randconfig-a013-20200701
i386                 randconfig-a011-20200701
i386                 randconfig-a015-20200701
i386                 randconfig-a014-20200701
i386                 randconfig-a016-20200701
i386                 randconfig-a012-20200701
i386                 randconfig-a013-20200701
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
