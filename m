Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0592D21AC7A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 03:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgGJB0M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 21:26:12 -0400
Received: from mga07.intel.com ([134.134.136.100]:53498 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726265AbgGJB0M (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Jul 2020 21:26:12 -0400
IronPort-SDR: m2X+EpEJ47040F0kmjGWoZb9J17VGmib0kdLfYPzw+f78nzMoRJbmugpxCWuebZ3vE6//gjmtI
 JJ1VBpbaW7Gw==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="213025007"
X-IronPort-AV: E=Sophos;i="5.75,334,1589266800"; 
   d="scan'208";a="213025007"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2020 18:26:11 -0700
IronPort-SDR: eipLQiGDILPh9mSXH1FKbyt05Vv9y0TYqzpa4Kfy8tehpalWE9y4KeWPAazo+FaGCzuU7PAQis
 WwP85MbpfdFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,334,1589266800"; 
   d="scan'208";a="389319732"
Received: from lkp-server01.sh.intel.com (HELO 5019aad283e6) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2020 18:26:10 -0700
Received: from kbuild by 5019aad283e6 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jthnl-0000Fq-CX; Fri, 10 Jul 2020 01:26:09 +0000
Date:   Fri, 10 Jul 2020 09:26:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-usb] BUILD SUCCESS
 ae8d72dbd0ececc3e516a14ea479552b6633bf70
Message-ID: <5f07c3ab./bliP+ZXtEZybbBt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-usb
branch HEAD: ae8d72dbd0ececc3e516a14ea479552b6633bf70  usb: ohci-omap: Convert to use GPIO descriptors

elapsed time: 770m

configs tested: 120
configs skipped: 9

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
s390                          debug_defconfig
csky                             allyesconfig
m68k                          amiga_defconfig
powerpc                     ep8248e_defconfig
arm                   milbeaut_m10v_defconfig
mips                       rbtx49xx_defconfig
arm                        spear6xx_defconfig
m68k                       m5249evb_defconfig
arm                        multi_v7_defconfig
arm                            mmp2_defconfig
powerpc                         wii_defconfig
powerpc                       holly_defconfig
x86_64                              defconfig
sh                          rsk7264_defconfig
ia64                                defconfig
mips                      bmips_stb_defconfig
arm                        vexpress_defconfig
s390                                defconfig
powerpc                      tqm8xx_defconfig
powerpc                      ep88xc_defconfig
arm                         at91_dt_defconfig
alpha                               defconfig
alpha                            allyesconfig
m68k                          hp300_defconfig
powerpc                  mpc866_ads_defconfig
um                             i386_defconfig
openrisc                         allyesconfig
sh                        edosk7705_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
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
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
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
i386                 randconfig-a002-20200709
i386                 randconfig-a001-20200709
i386                 randconfig-a006-20200709
i386                 randconfig-a005-20200709
i386                 randconfig-a004-20200709
i386                 randconfig-a003-20200709
x86_64               randconfig-a012-20200709
x86_64               randconfig-a016-20200709
x86_64               randconfig-a011-20200709
x86_64               randconfig-a014-20200709
x86_64               randconfig-a013-20200709
x86_64               randconfig-a015-20200709
i386                 randconfig-a011-20200709
i386                 randconfig-a015-20200709
i386                 randconfig-a014-20200709
i386                 randconfig-a016-20200709
i386                 randconfig-a012-20200709
i386                 randconfig-a013-20200709
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allyesconfig
um                               allmodconfig
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
