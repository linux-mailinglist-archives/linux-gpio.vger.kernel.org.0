Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0641323BC72
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Aug 2020 16:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728937AbgHDOlw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Aug 2020 10:41:52 -0400
Received: from mga17.intel.com ([192.55.52.151]:45411 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728586AbgHDOlt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 4 Aug 2020 10:41:49 -0400
IronPort-SDR: 4fXMNJyd4zABzr/KdyoRJe25Gy4bZ+tWjOVoNRGBNWDr3QJ8HMW+W2YXDKjOjqpgOY2Oi8coOZ
 wlUKaP9tD1HQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="132380220"
X-IronPort-AV: E=Sophos;i="5.75,434,1589266800"; 
   d="scan'208";a="132380220"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2020 07:41:44 -0700
IronPort-SDR: NHz+4VkB0C18FizAaf1bN3aN7jJpmhseaA/qQlxacYe+7QOyNqxEXCy3wQAMGHYLTzZlsiyRiQ
 f4CgEa3X5ZeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,434,1589266800"; 
   d="scan'208";a="467093745"
Received: from lkp-server02.sh.intel.com (HELO 37a337f97289) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 04 Aug 2020 07:41:44 -0700
Received: from kbuild by 37a337f97289 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k2y8O-00008j-3H; Tue, 04 Aug 2020 14:41:44 +0000
Date:   Tue, 04 Aug 2020 22:40:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel] BUILD SUCCESS
 22cc422070d9a9a399f8a70b89f1b852945444cb
Message-ID: <5f297375.IVm8nyelo5sKMRrl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel
branch HEAD: 22cc422070d9a9a399f8a70b89f1b852945444cb  gpio: wcove: Request IRQ after all initialisation done

elapsed time: 721m

configs tested: 119
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                            lart_defconfig
arc                 nsimosci_hs_smp_defconfig
sparc64                             defconfig
mips                          malta_defconfig
powerpc                      ppc64e_defconfig
sh                           se7206_defconfig
arm                           spitz_defconfig
arm                        neponset_defconfig
sh                          rsk7201_defconfig
arm                    vt8500_v6_v7_defconfig
mips                        omega2p_defconfig
mips                     loongson1c_defconfig
m68k                       bvme6000_defconfig
xtensa                           alldefconfig
arm                       aspeed_g4_defconfig
x86_64                           alldefconfig
arm                       netwinder_defconfig
arm                         lpc18xx_defconfig
m68k                        m5307c3_defconfig
arm                       aspeed_g5_defconfig
ia64                             allyesconfig
sh                   rts7751r2dplus_defconfig
m68k                        stmark2_defconfig
c6x                              alldefconfig
powerpc                           allnoconfig
arm                          gemini_defconfig
powerpc                     pq2fads_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                     skiroot_defconfig
sh                         ecovec24_defconfig
sh                        sh7757lcr_defconfig
powerpc                      chrp32_defconfig
s390                          debug_defconfig
parisc                           alldefconfig
parisc                generic-32bit_defconfig
c6x                        evmc6472_defconfig
mips                           ip32_defconfig
ia64                             allmodconfig
ia64                                defconfig
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
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a006-20200804
x86_64               randconfig-a001-20200804
x86_64               randconfig-a004-20200804
x86_64               randconfig-a005-20200804
x86_64               randconfig-a002-20200804
x86_64               randconfig-a003-20200804
i386                 randconfig-a005-20200804
i386                 randconfig-a004-20200804
i386                 randconfig-a001-20200804
i386                 randconfig-a003-20200804
i386                 randconfig-a002-20200804
i386                 randconfig-a006-20200804
i386                 randconfig-a005-20200803
i386                 randconfig-a006-20200803
i386                 randconfig-a004-20200803
i386                 randconfig-a001-20200803
i386                 randconfig-a002-20200803
i386                 randconfig-a003-20200803
x86_64               randconfig-a013-20200803
x86_64               randconfig-a011-20200803
x86_64               randconfig-a012-20200803
x86_64               randconfig-a016-20200803
x86_64               randconfig-a015-20200803
x86_64               randconfig-a014-20200803
i386                 randconfig-a014-20200804
i386                 randconfig-a015-20200804
i386                 randconfig-a016-20200804
i386                 randconfig-a011-20200803
i386                 randconfig-a012-20200803
i386                 randconfig-a015-20200803
i386                 randconfig-a014-20200803
i386                 randconfig-a013-20200803
i386                 randconfig-a016-20200803
i386                 randconfig-a011-20200804
i386                 randconfig-a012-20200804
i386                 randconfig-a013-20200804
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
