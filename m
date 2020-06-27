Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 469AC20C2ED
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2020 18:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgF0QDM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Jun 2020 12:03:12 -0400
Received: from mga07.intel.com ([134.134.136.100]:21127 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725975AbgF0QDM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 27 Jun 2020 12:03:12 -0400
IronPort-SDR: MbrNUs96sd0nhrE8GHSXualf6YTmAUEpAHuRJWTFL2onB2YZVBkBL8QyhNKZAmTuT1pEVyG9ei
 csteNEpubRtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9664"; a="210766542"
X-IronPort-AV: E=Sophos;i="5.75,287,1589266800"; 
   d="scan'208";a="210766542"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2020 09:03:11 -0700
IronPort-SDR: AYEk1Os6AnUO/w0Zw/OLN2GxZhAz2BU2b9lAz6puJZjB+ssTq4ho21n+ay+bXtS6/9kvOG3FMi
 /4TWc1jQpLTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,287,1589266800"; 
   d="scan'208";a="294471935"
Received: from lkp-server01.sh.intel.com (HELO 538b5e3c8319) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Jun 2020 09:03:09 -0700
Received: from kbuild by 538b5e3c8319 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jpDIL-0002qI-1z; Sat, 27 Jun 2020 16:03:09 +0000
Date:   Sun, 28 Jun 2020 00:02:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-extcon-cleanup] BUILD REGRESSION
 d6cb89d185311c4f5f3847afa77ce99b189da4ff
Message-ID: <5ef76d7a.nsnHDoAz6C1dE7JQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-extcon-cleanup
branch HEAD: d6cb89d185311c4f5f3847afa77ce99b189da4ff  extcon: gpio: Always check state on resume

Error/Warning in current branch:

drivers/extcon/extcon-gpio.c:85:10: error: 'struct gpio_extcon_data' has no member named 'extcon_id'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- arc-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- arc-randconfig-c003-20200627
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- arc-randconfig-c004-20200627
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- arc-randconfig-c021-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- arc-randconfig-c022-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- arc-randconfig-c024-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- arm-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- arm-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- arm64-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- arm64-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- arm64-randconfig-c022-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- c6x-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- c6x-randconfig-c022-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- c6x-randconfig-c023-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- c6x-randconfig-r034-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- h8300-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- h8300-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- h8300-randconfig-c004-20200627
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- h8300-randconfig-m031-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-randconfig-c001-20200626
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-randconfig-c001-20200627
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-randconfig-c003-20200627
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-randconfig-c021-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-randconfig-c024-20200627
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- i386-randconfig-m021-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- ia64-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- ia64-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- m68k-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- m68k-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- m68k-randconfig-c004-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- m68k-randconfig-c022-20200627
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- microblaze-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- microblaze-randconfig-c022-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- mips-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- mips-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- nds32-randconfig-c004-20200627
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- nds32-randconfig-c023-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- nds32-randconfig-s032-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- nios2-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- nios2-randconfig-c004-20200627
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- nios2-randconfig-c021-20200626
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- openrisc-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- openrisc-randconfig-c021-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- openrisc-randconfig-c024-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- parisc-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- parisc-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- parisc-randconfig-c023-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- powerpc-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- powerpc-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- riscv-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- riscv-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- riscv-randconfig-c023-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- s390-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- s390-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- sh-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- sparc-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- sparc-randconfig-c021-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- sparc64-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- sparc64-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- sparc64-randconfig-c004-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- sparc64-randconfig-c022-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- sparc64-randconfig-c024-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- um-allmodconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- um-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- x86_64-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- x86_64-randconfig-c002-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- x86_64-randconfig-c002-20200626
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- x86_64-randconfig-c004-20200627
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- x86_64-randconfig-m001-20200624
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- xtensa-allyesconfig
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
|-- xtensa-randconfig-c003-20200627
|   `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id
`-- xtensa-randconfig-c021-20200627
    `-- drivers-extcon-extcon-gpio.c:error:struct-gpio_extcon_data-has-no-member-named-extcon_id

elapsed time: 724m

configs tested: 108
configs skipped: 7

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
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
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
