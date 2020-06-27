Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAF1F20C2EC
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2020 18:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgF0QDL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Jun 2020 12:03:11 -0400
Received: from mga07.intel.com ([134.134.136.100]:21127 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbgF0QDL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 27 Jun 2020 12:03:11 -0400
IronPort-SDR: w19FmOqZmoJJ9/3zHCZH3TlxXoZIWC2D1ZqMY56fgO/Z1iBkySPIKMPvrVvicDlwn7aesOFdcA
 xqIcHvCCO9NA==
X-IronPort-AV: E=McAfee;i="6000,8403,9664"; a="210766537"
X-IronPort-AV: E=Sophos;i="5.75,287,1589266800"; 
   d="scan'208";a="210766537"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2020 09:03:10 -0700
IronPort-SDR: +txJFWre3j+LdxuxpBNDbiXySBQHsQfXYw4mMWLcZe8CxThY90jU1lcy8GIpBvNN1qVlMeqMyU
 xwiYsQq98pPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,287,1589266800"; 
   d="scan'208";a="264463136"
Received: from lkp-server01.sh.intel.com (HELO 538b5e3c8319) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Jun 2020 09:03:09 -0700
Received: from kbuild by 538b5e3c8319 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jpDIK-0002qF-N9; Sat, 27 Jun 2020 16:03:08 +0000
Date:   Sun, 28 Jun 2020 00:02:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-backlight] BUILD SUCCESS
 2bdb915873de8d7ebf12cbfcf218efcb4a7e0d7f
Message-ID: <5ef76d7e.Co0BNRp9JZ70wY0b%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-backlight
branch HEAD: 2bdb915873de8d7ebf12cbfcf218efcb4a7e0d7f  backlight: sky81452: Privatize platform data

elapsed time: 724m

configs tested: 109
configs skipped: 7

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
powerpc                      chrp32_defconfig
arc                 nsimosci_hs_smp_defconfig
arm64                            alldefconfig
sh                          sdk7786_defconfig
m68k                          sun3x_defconfig
arc                     haps_hs_smp_defconfig
s390                             allyesconfig
powerpc                          g5_defconfig
mips                        jmr3927_defconfig
sh                           se7751_defconfig
arm                       imx_v6_v7_defconfig
arm                            xcep_defconfig
arm                      pxa255-idp_defconfig
arm                          tango4_defconfig
nios2                               defconfig
m68k                       m5475evb_defconfig
arc                         haps_hs_defconfig
h8300                               defconfig
arm                             pxa_defconfig
arm                         lpc18xx_defconfig
mips                           ip27_defconfig
arm                     eseries_pxa_defconfig
mips                      loongson3_defconfig
arm                         axm55xx_defconfig
ia64                              allnoconfig
mips                      pistachio_defconfig
arm                          ixp4xx_defconfig
arm                       spear13xx_defconfig
parisc                            allnoconfig
arm                            lart_defconfig
arm                         bcm2835_defconfig
powerpc                       ppc64_defconfig
sh                  sh7785lcr_32bit_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
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
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allyesconfig
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
