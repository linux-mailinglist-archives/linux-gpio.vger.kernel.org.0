Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D47B8228E36
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 04:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731630AbgGVCdM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 22:33:12 -0400
Received: from mga07.intel.com ([134.134.136.100]:61695 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731595AbgGVCdM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Jul 2020 22:33:12 -0400
IronPort-SDR: 6KXXB4wjEr4EhcJ6RUvBRuIhIjBqWl91Pg8kMDtDbuFMCI38riO4xY2Xl7CIhp2+nBnue/6QNT
 UaYC02k1zybg==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="214904719"
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; 
   d="scan'208";a="214904719"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2020 19:33:11 -0700
IronPort-SDR: rUyI199OPhCbOWcru/ZPv7m825wDcpUbcrmSW1oK0UTlFYhuqDEFVKXwWkUvwVhBemNCMoa1Jb
 r+O0dWkl3oPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; 
   d="scan'208";a="432221376"
Received: from lkp-server02.sh.intel.com (HELO 7dd7ac9fbea4) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Jul 2020 19:33:09 -0700
Received: from kbuild by 7dd7ac9fbea4 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jy4ZB-0000K3-AU; Wed, 22 Jul 2020 02:33:09 +0000
Date:   Wed, 22 Jul 2020 10:32:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:no-irqchip-nested-threading] BUILD SUCCESS
 fefc8bd07b1eaaa958ab759c9af8dcda928686eb
Message-ID: <5f17a530.U3huhua/KignR10N%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  no-irqchip-nested-threading
branch HEAD: fefc8bd07b1eaaa958ab759c9af8dcda928686eb  gpio: Retire the explicit gpio irqchip code

elapsed time: 729m

configs tested: 115
configs skipped: 3

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
mips                  cavium_octeon_defconfig
mips                malta_qemu_32r6_defconfig
arm                        vexpress_defconfig
sh                             shx3_defconfig
arm                      integrator_defconfig
sh                               alldefconfig
mips                         bigsur_defconfig
arm                           sama5_defconfig
arm                           omap1_defconfig
mips                            e55_defconfig
c6x                         dsk6455_defconfig
m68k                         amcore_defconfig
arm                          simpad_defconfig
openrisc                         allyesconfig
mips                   sb1250_swarm_defconfig
arm                         shannon_defconfig
arm                      footbridge_defconfig
s390                             alldefconfig
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
i386                 randconfig-a001-20200719
i386                 randconfig-a006-20200719
i386                 randconfig-a002-20200719
i386                 randconfig-a005-20200719
i386                 randconfig-a003-20200719
i386                 randconfig-a004-20200719
i386                 randconfig-a003-20200721
i386                 randconfig-a005-20200721
i386                 randconfig-a004-20200721
i386                 randconfig-a006-20200721
i386                 randconfig-a002-20200721
i386                 randconfig-a001-20200721
i386                 randconfig-a015-20200719
i386                 randconfig-a011-20200719
i386                 randconfig-a016-20200719
i386                 randconfig-a012-20200719
i386                 randconfig-a013-20200719
i386                 randconfig-a014-20200719
x86_64               randconfig-a005-20200719
x86_64               randconfig-a002-20200719
x86_64               randconfig-a006-20200719
x86_64               randconfig-a001-20200719
x86_64               randconfig-a003-20200719
x86_64               randconfig-a004-20200719
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
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
