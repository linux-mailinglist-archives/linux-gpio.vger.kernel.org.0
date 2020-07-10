Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 575F521AD2E
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 04:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgGJC4h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 22:56:37 -0400
Received: from mga09.intel.com ([134.134.136.24]:18025 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726495AbgGJC4h (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Jul 2020 22:56:37 -0400
IronPort-SDR: Kfson5HsrL+p9KZ3HKmzgTQZ3GIegb1i9joAtvTHD6dgm8Zpg5Pn5kZC7MVU9NJ1SI0RBHm2E1
 vQpZT5R0EXfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="149612798"
X-IronPort-AV: E=Sophos;i="5.75,334,1589266800"; 
   d="scan'208";a="149612798"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2020 19:56:31 -0700
IronPort-SDR: x9ANNdOxpQ+1N1XBEJIzW15SldGCpSLAsFXv0vquVSUePR1Zy5Usn3g0V1+YP+TpnOjeLVxTeF
 6gDzP5BIFLBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,334,1589266800"; 
   d="scan'208";a="284366541"
Received: from lkp-server02.sh.intel.com (HELO d197edaadf32) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 09 Jul 2020 19:56:30 -0700
Received: from kbuild by d197edaadf32 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jtjDB-000023-Ap; Fri, 10 Jul 2020 02:56:29 +0000
Date:   Fri, 10 Jul 2020 10:56:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:lee-fixes] BUILD SUCCESS
 a7a9ad232f02e6aa659cc9b58b72b1a30dccd1a6
Message-ID: <5f07d8ce.jRCyCHHdSmTKkGrF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  lee-fixes
branch HEAD: a7a9ad232f02e6aa659cc9b58b72b1a30dccd1a6  gpio: gpio-mlxbf2.c: Provide __releases() annotation to stop confusing Sparse

elapsed time: 860m

configs tested: 125
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
mips                         rt305x_defconfig
sh                                  defconfig
nios2                            alldefconfig
m68k                         apollo_defconfig
mips                        omega2p_defconfig
powerpc                     mpc512x_defconfig
s390                          debug_defconfig
csky                             allyesconfig
m68k                          amiga_defconfig
powerpc                     ep8248e_defconfig
arm                   milbeaut_m10v_defconfig
mips                       rbtx49xx_defconfig
arm                        spear6xx_defconfig
m68k                       m5249evb_defconfig
arm                        multi_v7_defconfig
powerpc                       holly_defconfig
x86_64                              defconfig
arm                         ebsa110_defconfig
ia64                                defconfig
sh                          rsk7264_defconfig
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
um                               allmodconfig
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
