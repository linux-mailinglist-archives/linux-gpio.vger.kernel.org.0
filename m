Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85ABF2247F9
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jul 2020 04:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgGRCGc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 22:06:32 -0400
Received: from mga05.intel.com ([192.55.52.43]:5360 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726665AbgGRCGc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 22:06:32 -0400
IronPort-SDR: 2xiBM6KieE4gRZhn2oH7O3gHKvuHhqX2LGUaNtcMoXUlV1m1ryCl1sL+ANS+QtafCbKbG/iiim
 q/H6CiXtGZ0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9685"; a="234557471"
X-IronPort-AV: E=Sophos;i="5.75,365,1589266800"; 
   d="scan'208";a="234557471"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2020 19:06:31 -0700
IronPort-SDR: OnXcCZ6Uf+QdQCtUbBjAT6xrQ2fHADowtMsYfW0u6MLhXyApVrDP2I4WkKuaO7PFfsY4RXhYCK
 vzI5rdJFNUgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,365,1589266800"; 
   d="scan'208";a="269668602"
Received: from lkp-server02.sh.intel.com (HELO 50058c6ee6fc) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 17 Jul 2020 19:06:30 -0700
Received: from kbuild by 50058c6ee6fc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jwcFB-0000aP-Qb; Sat, 18 Jul 2020 02:06:29 +0000
Date:   Sat, 18 Jul 2020 10:05:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:for-next] BUILD SUCCESS
 70d7cd6c82a906bfc45e5043fed5456d46a92662
Message-ID: <5f1258f8.45c5JfhYYAMpO8br%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  for-next
branch HEAD: 70d7cd6c82a906bfc45e5043fed5456d46a92662  Merge branch 'devel' into for-next

elapsed time: 722m

configs tested: 86
configs skipped: 2

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
nds32                             allnoconfig
powerpc                      ppc64e_defconfig
arm                           viper_defconfig
ia64                             alldefconfig
sh                           se7721_defconfig
ia64                          tiger_defconfig
mips                        jmr3927_defconfig
arm                            xcep_defconfig
h8300                            allyesconfig
powerpc                 linkstation_defconfig
sparc                       sparc32_defconfig
arm                          badge4_defconfig
powerpc                      pmac32_defconfig
riscv                          rv32_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
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
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
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
sparc64                          allmodconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
