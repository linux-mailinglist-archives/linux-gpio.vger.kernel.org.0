Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADAC21EFC7
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 13:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbgGNLxH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 07:53:07 -0400
Received: from mga09.intel.com ([134.134.136.24]:22387 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbgGNLxG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Jul 2020 07:53:06 -0400
IronPort-SDR: 7CjunH7L2X3HOfco04UgxaiWofr4OgKHwQNqrDRJ+LNZqdZO5jhf7Lr2XPom7nEaFu4FpI4WA0
 Bp4mgjOsdzgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="150299033"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="150299033"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2020 04:53:05 -0700
IronPort-SDR: d7UH70MhBrtKraYktWyO9jqkNdGwbuAiddcU08B2YhTUkE1ni1xEpdKGq7FjWTQRiZO4PlvtXa
 gBlkcVfuQ13Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="390457399"
Received: from lkp-server02.sh.intel.com (HELO 393d9bdf0d5c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Jul 2020 04:53:04 -0700
Received: from kbuild by 393d9bdf0d5c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jvJUd-00007y-NB; Tue, 14 Jul 2020 11:53:03 +0000
Date:   Tue, 14 Jul 2020 19:52:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-spi] BUILD SUCCESS
 2e15ee1098f8358a9e45bcbd441e888b04af99ce
Message-ID: <5f0d9c6c.cuk+oSiS1PWbpgBz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-spi
branch HEAD: 2e15ee1098f8358a9e45bcbd441e888b04af99ce  spi: ppc4xx: Convert to use GPIO descriptors

elapsed time: 721m

configs tested: 114
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
m68k                            mac_defconfig
riscv                             allnoconfig
mips                            gpr_defconfig
mips                         tb0219_defconfig
powerpc                     pq2fads_defconfig
arm                         bcm2835_defconfig
sh                             espt_defconfig
ia64                        generic_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     mpc5200_defconfig
arm                           sama5_defconfig
sh                        apsh4ad0a_defconfig
parisc                           alldefconfig
ia64                      gensparse_defconfig
sh                           se7721_defconfig
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
i386                 randconfig-a001-20200713
i386                 randconfig-a005-20200713
i386                 randconfig-a006-20200713
i386                 randconfig-a002-20200713
i386                 randconfig-a003-20200713
i386                 randconfig-a004-20200713
i386                 randconfig-a001-20200714
i386                 randconfig-a005-20200714
i386                 randconfig-a002-20200714
i386                 randconfig-a006-20200714
i386                 randconfig-a003-20200714
i386                 randconfig-a004-20200714
x86_64               randconfig-a012-20200714
x86_64               randconfig-a011-20200714
x86_64               randconfig-a016-20200714
x86_64               randconfig-a014-20200714
x86_64               randconfig-a013-20200714
x86_64               randconfig-a015-20200714
i386                 randconfig-a016-20200714
i386                 randconfig-a011-20200714
i386                 randconfig-a015-20200714
i386                 randconfig-a012-20200714
i386                 randconfig-a013-20200714
i386                 randconfig-a014-20200714
riscv                            allyesconfig
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
