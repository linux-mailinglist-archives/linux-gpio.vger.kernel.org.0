Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A705350BF3
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Apr 2021 03:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbhDAB0o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 21:26:44 -0400
Received: from mga07.intel.com ([134.134.136.100]:62043 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230073AbhDAB0N (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 31 Mar 2021 21:26:13 -0400
IronPort-SDR: 40a5FJQmZRnxaoiXbHahHVl9v4ch/dOv9JmFXyYq+8luyT1va6xdJYMldnF2OPu7ub3R2PnbpU
 ln8XDqpekraw==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="256112013"
X-IronPort-AV: E=Sophos;i="5.81,295,1610438400"; 
   d="scan'208";a="256112013"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 18:26:12 -0700
IronPort-SDR: BbsEryPMnknVDPOk2wOCrcGkPGKWqdLlXEcbZLfsNdQwkor7+Ho/TgsNGN9psnfv1Z2aGNXvIg
 WvdYnu1B0q2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,295,1610438400"; 
   d="scan'208";a="379107956"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 31 Mar 2021 18:26:11 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lRm66-0006Dx-PN; Thu, 01 Apr 2021 01:26:10 +0000
Date:   Thu, 01 Apr 2021 09:25:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 26ea7ac92836ba616f75a1ab57e64ffc21da7758
Message-ID: <60652115.YNK8tHSoreYTa8iG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 26ea7ac92836ba616f75a1ab57e64ffc21da7758  pinctrl: bcm63xx: Fix dependencies

elapsed time: 725m

configs tested: 80
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
m68k                        m5307c3_defconfig
mips                            gpr_defconfig
mips                        nlm_xlp_defconfig
mips                        workpad_defconfig
sh                           se7722_defconfig
arm                         lpc32xx_defconfig
xtensa                       common_defconfig
sh                        sh7757lcr_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20210330
i386                 randconfig-a006-20210330
i386                 randconfig-a003-20210330
i386                 randconfig-a002-20210330
i386                 randconfig-a001-20210330
i386                 randconfig-a005-20210330
i386                 randconfig-a015-20210330
i386                 randconfig-a011-20210330
i386                 randconfig-a014-20210330
i386                 randconfig-a013-20210330
i386                 randconfig-a016-20210330
i386                 randconfig-a012-20210330
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210330
x86_64               randconfig-a015-20210330
x86_64               randconfig-a014-20210330
x86_64               randconfig-a016-20210330
x86_64               randconfig-a013-20210330
x86_64               randconfig-a011-20210330

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
