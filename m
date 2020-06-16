Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8455C1FBBB3
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 18:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730419AbgFPQ21 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 12:28:27 -0400
Received: from mga14.intel.com ([192.55.52.115]:54699 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730125AbgFPQ20 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Jun 2020 12:28:26 -0400
IronPort-SDR: z65o9ytiJd1gbjOsp6oZ5VvAt7tWDBLyZsCuM0iDv4Zf0Ub7OxGiNYvFArsL6G6WCcDUrnT/1s
 sdA/eArKM6zA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 09:28:24 -0700
IronPort-SDR: FkytKU8W3W/KEZDZ9yEtMkWkE967HGh7gVZEaH0cAuJWrJ6sq9FeUqKRqwVL4ToeYMRcNVQwmV
 8UR9vFOB0XfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; 
   d="scan'208";a="420823156"
Received: from lkp-server01.sh.intel.com (HELO b4e26a9a4e5e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Jun 2020 09:28:23 -0700
Received: from kbuild by b4e26a9a4e5e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jlERi-0000Ai-LA; Tue, 16 Jun 2020 16:28:22 +0000
Date:   Wed, 17 Jun 2020 00:27:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 c5a8086cab38fffd0414588f39c552427979a608
Message-ID: <5ee8f30d.SgMwVn8iQpOhv7aS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  fixes
branch HEAD: c5a8086cab38fffd0414588f39c552427979a608  Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()' to avoid a resource leak in case of error in 'imx_pinctrl_probe()'"

elapsed time: 484m

configs tested: 117
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
arm                         axm55xx_defconfig
mips                         bigsur_defconfig
mips                      bmips_stb_defconfig
c6x                              allyesconfig
sh                            migor_defconfig
sh                   secureedge5410_defconfig
mips                       capcella_defconfig
sparc64                          alldefconfig
arm                         s3c2410_defconfig
arc                          axs103_defconfig
arm                             pxa_defconfig
um                           x86_64_defconfig
mips                      pic32mzda_defconfig
arm                       versatile_defconfig
ia64                      gensparse_defconfig
mips                           ip28_defconfig
mips                           ip27_defconfig
c6x                        evmc6678_defconfig
arm                       netwinder_defconfig
sh                           se7721_defconfig
i386                              allnoconfig
i386                                defconfig
i386                              debian-10.3
i386                             allyesconfig
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
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a006-20200615
i386                 randconfig-a002-20200615
i386                 randconfig-a001-20200615
i386                 randconfig-a004-20200615
i386                 randconfig-a005-20200615
i386                 randconfig-a003-20200615
x86_64               randconfig-a015-20200615
x86_64               randconfig-a011-20200615
x86_64               randconfig-a016-20200615
x86_64               randconfig-a012-20200615
x86_64               randconfig-a014-20200615
x86_64               randconfig-a013-20200615
i386                 randconfig-a015-20200615
i386                 randconfig-a011-20200615
i386                 randconfig-a014-20200615
i386                 randconfig-a013-20200615
i386                 randconfig-a016-20200615
i386                 randconfig-a012-20200615
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
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
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
