Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E33D91CC093
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2020 12:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgEIK4z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 May 2020 06:56:55 -0400
Received: from mga03.intel.com ([134.134.136.65]:4290 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbgEIK4y (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 9 May 2020 06:56:54 -0400
IronPort-SDR: Z27Gc4PkcG43JNePMpXX7YYqdjl/0itEjtYlff5gzykCtBq+RKfKuxwjPxptGho+xUfcSb0BIF
 n5fz8KBmcmSg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2020 03:56:54 -0700
IronPort-SDR: Np/EVguwn9niHRc1/sz8xi4/Mc1zaHSmcmS+d/9HMlimLZE/EMwGl/wBukUn91YrXHl7HHWlJ6
 ZCEM8U7pzkKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,371,1583222400"; 
   d="scan'208";a="305731355"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 May 2020 03:56:52 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jXNA4-0001nZ-4S; Sat, 09 May 2020 18:56:52 +0800
Date:   Sat, 09 May 2020 18:56:03 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:for-next] BUILD SUCCESS
 aa0334bd4c82739553e96a60c732279e4bc643c5
Message-ID: <5eb68c43.wSTvDSglu57gff0G%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  for-next
branch HEAD: aa0334bd4c82739553e96a60c732279e4bc643c5  Merge branch 'devel' into for-next

elapsed time: 731m

configs tested: 98
configs skipped: 1

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
sparc                            allyesconfig
m68k                             allyesconfig
alpha                            allyesconfig
nds32                               defconfig
sparc64                             defconfig
parisc                              defconfig
csky                                defconfig
nios2                               defconfig
riscv                             allnoconfig
riscv                            allmodconfig
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
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                             allnoconfig
csky                             allyesconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
microblaze                       allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20200509
i386                 randconfig-a004-20200509
i386                 randconfig-a003-20200509
i386                 randconfig-a002-20200509
i386                 randconfig-a001-20200509
i386                 randconfig-a006-20200509
x86_64               randconfig-a015-20200509
x86_64               randconfig-a014-20200509
x86_64               randconfig-a011-20200509
x86_64               randconfig-a013-20200509
x86_64               randconfig-a012-20200509
x86_64               randconfig-a016-20200509
i386                 randconfig-a012-20200509
i386                 randconfig-a014-20200509
i386                 randconfig-a016-20200509
i386                 randconfig-a011-20200509
i386                 randconfig-a013-20200509
i386                 randconfig-a015-20200509
riscv                            allyesconfig
riscv                               defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
sparc                               defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
