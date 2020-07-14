Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADAF821EE05
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 12:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbgGNKcM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 06:32:12 -0400
Received: from mga11.intel.com ([192.55.52.93]:19156 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbgGNKcK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Jul 2020 06:32:10 -0400
IronPort-SDR: BGWc8aa7vi1zAoZvhlP8ydaW/Rk+v9N3+xGmCpw1rOEydTz4eTCsYRwDAF2K4zYUrgrapoDBVy
 OkGlRNPvQi9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="146872107"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="146872107"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2020 03:31:57 -0700
IronPort-SDR: +gPg2/hGhywZXsBaY8RUrhfJAJEFhnYqhVoIcTsMXcbMMZxmuUVTLg+u9QO2YjTMbyqKbH8Bs3
 axZl2mFQeCRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="299492534"
Received: from lkp-server02.sh.intel.com (HELO 393d9bdf0d5c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Jul 2020 03:31:56 -0700
Received: from kbuild by 393d9bdf0d5c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jvIE7-00003z-Td; Tue, 14 Jul 2020 10:31:55 +0000
Date:   Tue, 14 Jul 2020 18:29:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel] BUILD SUCCESS
 1752911c6d10675154f1c8c8ba54331604cdbca7
Message-ID: <5f0d891c.RXTWjvOgdu1VFybP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel
branch HEAD: 1752911c6d10675154f1c8c8ba54331604cdbca7  Merge tag 'gpio-updates-for-v5.9-part2' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into devel

elapsed time: 755m

configs tested: 111
configs skipped: 8

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
m68k                            mac_defconfig
mips                            gpr_defconfig
sh                          rsk7201_defconfig
riscv                             allnoconfig
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
arm                     am200epdkit_defconfig
xtensa                       common_defconfig
parisc                           allmodconfig
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
csky                             allyesconfig
alpha                            allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
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
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                               rhel-7.6
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
