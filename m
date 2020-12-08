Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A7B2D351D
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 22:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgLHVUW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 16:20:22 -0500
Received: from mga04.intel.com ([192.55.52.120]:65167 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729430AbgLHVUQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Dec 2020 16:20:16 -0500
IronPort-SDR: oTtusDucGlq30DBNzO5T/YrXIjxSbJ3DwFKItoWRvjbTLxltH6YWAmkEyEP6LpWo8mRs04wTOM
 Gc6fkQ13nsig==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="171399318"
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; 
   d="scan'208";a="171399318"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 13:19:35 -0800
IronPort-SDR: uUHGUJSC7ucGFqAzzdx2p/nPrn2uDmuA+/C8JgKfBDpjy1aaYZZ3Tfh1DcEbG/BY8i4f+YRipr
 ftGfFTRneZ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; 
   d="scan'208";a="332673203"
Received: from lkp-server01.sh.intel.com (HELO c88bd47c8831) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Dec 2020 13:19:34 -0800
Received: from kbuild by c88bd47c8831 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kmkOT-0000T6-G8; Tue, 08 Dec 2020 21:19:33 +0000
Date:   Wed, 09 Dec 2020 05:18:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 5f4592bc20c86a8c65a24601d033a3e3f06939e7
Message-ID: <5fcfedb6.KcIJzJL1IBtbBmVm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  fixes
branch HEAD: 5f4592bc20c86a8c65a24601d033a3e3f06939e7  pinctrl: intel: Actually disable Tx and Rx buffers on GPIO request

elapsed time: 723m

configs tested: 93
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
alpha                            alldefconfig
powerpc                     tqm5200_defconfig
arm                         vf610m4_defconfig
arm                      integrator_defconfig
sh                           se7712_defconfig
xtensa                          iss_defconfig
arm                        multi_v7_defconfig
powerpc                      tqm8xx_defconfig
csky                             alldefconfig
ia64                         bigsur_defconfig
arm                  colibri_pxa270_defconfig
powerpc                     tqm8560_defconfig
sh                     sh7710voipgw_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                 linkstation_defconfig
arm                        mini2440_defconfig
powerpc                 canyonlands_defconfig
sh                           sh2007_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
x86_64               randconfig-a004-20201208
x86_64               randconfig-a006-20201208
x86_64               randconfig-a005-20201208
x86_64               randconfig-a001-20201208
x86_64               randconfig-a002-20201208
x86_64               randconfig-a003-20201208
i386                 randconfig-a004-20201208
i386                 randconfig-a005-20201208
i386                 randconfig-a001-20201208
i386                 randconfig-a002-20201208
i386                 randconfig-a006-20201208
i386                 randconfig-a003-20201208
i386                 randconfig-a013-20201208
i386                 randconfig-a014-20201208
i386                 randconfig-a011-20201208
i386                 randconfig-a015-20201208
i386                 randconfig-a012-20201208
i386                 randconfig-a016-20201208
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
x86_64               randconfig-a016-20201208
x86_64               randconfig-a012-20201208
x86_64               randconfig-a013-20201208
x86_64               randconfig-a014-20201208
x86_64               randconfig-a015-20201208
x86_64               randconfig-a011-20201208

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
