Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7058A2D0836
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 00:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbgLFXun (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Dec 2020 18:50:43 -0500
Received: from mga14.intel.com ([192.55.52.115]:49384 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726400AbgLFXum (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 6 Dec 2020 18:50:42 -0500
IronPort-SDR: Kpfkez5GS5Y5pRy+cNAGIpcYybuSjeiRlNb+6foj+S4vk55Jz0f1mBxjsA1C688gY4JWSU72tY
 lrcif2U6TnTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9827"; a="172849271"
X-IronPort-AV: E=Sophos;i="5.78,398,1599548400"; 
   d="scan'208";a="172849271"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2020 15:50:00 -0800
IronPort-SDR: qumchLw+sAvPuhXFiP/jIHS4ErzSYhqtnPNOIjWgaFT57ERAdmIrYOdhhov+HKW3fhVHp5ST+2
 xhP/HUUJk95w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,398,1599548400"; 
   d="scan'208";a="374532460"
Received: from lkp-server01.sh.intel.com (HELO 47754f1311fc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Dec 2020 15:49:58 -0800
Received: from kbuild by 47754f1311fc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1km3mw-000105-7G; Sun, 06 Dec 2020 23:49:58 +0000
Date:   Mon, 07 Dec 2020 07:49:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 9b185cd4fdcafa16d6da8224e177f807d7737bd1
Message-ID: <5fcd6e22.J7yHd1sVrFBnIAQG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  for-next
branch HEAD: 9b185cd4fdcafa16d6da8224e177f807d7737bd1  Merge branch 'devel' into for-next

elapsed time: 724m

configs tested: 95
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nds32                            alldefconfig
arm                      pxa255-idp_defconfig
powerpc                     tqm8555_defconfig
m68k                        mvme147_defconfig
arm                      jornada720_defconfig
xtensa                           allyesconfig
arm                         hackkit_defconfig
c6x                        evmc6678_defconfig
mips                         bigsur_defconfig
powerpc                      ppc6xx_defconfig
mips                     cu1830-neo_defconfig
sh                        edosk7760_defconfig
sh                          r7785rp_defconfig
parisc                generic-64bit_defconfig
arm                           u8500_defconfig
arm                            hisi_defconfig
arm                  colibri_pxa300_defconfig
powerpc                 mpc834x_itx_defconfig
sh                   sh7724_generic_defconfig
arm                           tegra_defconfig
powerpc                 canyonlands_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201206
x86_64               randconfig-a006-20201206
x86_64               randconfig-a002-20201206
x86_64               randconfig-a001-20201206
x86_64               randconfig-a005-20201206
x86_64               randconfig-a003-20201206
i386                 randconfig-a005-20201206
i386                 randconfig-a004-20201206
i386                 randconfig-a001-20201206
i386                 randconfig-a002-20201206
i386                 randconfig-a006-20201206
i386                 randconfig-a003-20201206
i386                 randconfig-a014-20201206
i386                 randconfig-a013-20201206
i386                 randconfig-a011-20201206
i386                 randconfig-a015-20201206
i386                 randconfig-a012-20201206
i386                 randconfig-a016-20201206
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a016-20201206
x86_64               randconfig-a012-20201206
x86_64               randconfig-a014-20201206
x86_64               randconfig-a013-20201206
x86_64               randconfig-a015-20201206
x86_64               randconfig-a011-20201206

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
