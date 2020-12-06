Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683742D084E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 00:56:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728606AbgLFX4o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Dec 2020 18:56:44 -0500
Received: from mga02.intel.com ([134.134.136.20]:29323 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728657AbgLFX4o (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 6 Dec 2020 18:56:44 -0500
IronPort-SDR: 4SSfS5W7xI1vUqLdL5c1X8n4zvvBDeppq9h1UWPqhmafRO/4wAxqj4eEoyiNWKlE7aLG0DoW5e
 MDesi9in4FgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9827"; a="160666498"
X-IronPort-AV: E=Sophos;i="5.78,398,1599548400"; 
   d="scan'208";a="160666498"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2020 15:56:02 -0800
IronPort-SDR: ++8ye5MbYxxyOwYa09bQhZ8hj3rtf79G/svxsHyxet49F1pSxZH1FOovl8ZgBv6C8cU/dd2dTC
 tXCl0T2+GcOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,398,1599548400"; 
   d="scan'208";a="316875363"
Received: from lkp-server01.sh.intel.com (HELO 47754f1311fc) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Dec 2020 15:56:00 -0800
Received: from kbuild by 47754f1311fc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1km3sl-00010r-Ov; Sun, 06 Dec 2020 23:55:59 +0000
Date:   Mon, 07 Dec 2020 07:55:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:for-next] BUILD SUCCESS
 0f8d9ac8978bc4b12ef523c4fc1732226c7ddbdf
Message-ID: <5fcd6f67.JW0YNoAdgQ0Z0XSv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  for-next
branch HEAD: 0f8d9ac8978bc4b12ef523c4fc1732226c7ddbdf  Merge branch 'devel' into for-next

elapsed time: 722m

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
