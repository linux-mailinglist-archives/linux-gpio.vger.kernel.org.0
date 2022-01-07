Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A0D487308
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jan 2022 07:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbiAGGVv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jan 2022 01:21:51 -0500
Received: from mga18.intel.com ([134.134.136.126]:61622 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229658AbiAGGVs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 7 Jan 2022 01:21:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641536508; x=1673072508;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xWwaVILDbsDll76Xm8IjqXhXVSI6ReXROORfcc2udUI=;
  b=cf1MB6pKeJXl114uqdAWzU7drELWzytkV15fdNPCTHDAM4FmUiP3lRAL
   17gohlm/Yy9UGSzFTK2lrc2wncS2EAmfP2T+QomyZh1pYN/r48bb+LGp1
   jR0ssXb6FZoVJFIXh9n2Pm/IO25ykKGl7Gs9TtDrwCNG9AzpHOWG/mPnG
   l5ljDIjsfhzL+cKMe4lMhIWQyU4STEgkMIzDRgs3uE11a/oWjv22H6Lv8
   jsic4a9+Ip2eIJxp7xr81Uk0OY/C40utF3KBUOLeh6VG2zBbLxDvI5rMW
   B/cNHH2aN5fO7yECG+/layJtRukRWeSXLKzZHfHpl81Wc3z03BX905Krt
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="229626646"
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; 
   d="scan'208";a="229626646"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2022 22:21:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; 
   d="scan'208";a="473216304"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Jan 2022 22:21:42 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n5idB-000IK1-MJ; Fri, 07 Jan 2022 06:21:41 +0000
Date:   Fri, 07 Jan 2022 14:20:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:arm-fix] BUILD SUCCESS
 1984c7e88a380d33fa845344f8b535358fc783d2
Message-ID: <61d7dbb7.K83IvcFmm/CAEu9j%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git arm-fix
branch HEAD: 1984c7e88a380d33fa845344f8b535358fc783d2  ARM: dts: gpio-ranges property is now required

elapsed time: 754m

configs tested: 111
configs skipped: 106

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
i386                 randconfig-c001-20220106
parisc                           alldefconfig
arm                           stm32_defconfig
mips                        bcm47xx_defconfig
powerpc                      ppc40x_defconfig
s390                       zfcpdump_defconfig
arm                     eseries_pxa_defconfig
powerpc                    adder875_defconfig
sh                        sh7785lcr_defconfig
sh                        sh7763rdp_defconfig
sh                            shmin_defconfig
sh                          r7780mp_defconfig
mips                      loongson3_defconfig
ia64                      gensparse_defconfig
openrisc                    or1ksim_defconfig
xtensa                  cadence_csp_defconfig
sh                         ap325rxa_defconfig
mips                            gpr_defconfig
arm                  randconfig-c002-20220106
arm                  randconfig-c002-20220107
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
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a012-20220106
x86_64               randconfig-a015-20220106
x86_64               randconfig-a014-20220106
x86_64               randconfig-a013-20220106
x86_64               randconfig-a011-20220106
x86_64               randconfig-a016-20220106
i386                 randconfig-a012-20220106
i386                 randconfig-a016-20220106
i386                 randconfig-a014-20220106
i386                 randconfig-a015-20220106
i386                 randconfig-a011-20220106
i386                 randconfig-a013-20220106
s390                 randconfig-r044-20220106
arc                  randconfig-r043-20220106
riscv                randconfig-r042-20220106
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
mips                 randconfig-c004-20220106
arm                  randconfig-c002-20220106
i386                 randconfig-c001-20220106
riscv                randconfig-c006-20220106
powerpc              randconfig-c003-20220106
x86_64               randconfig-c007-20220106
s390                 randconfig-c005-20220106
mips                      bmips_stb_defconfig
i386                 randconfig-a003-20220106
i386                 randconfig-a005-20220106
i386                 randconfig-a004-20220106
i386                 randconfig-a006-20220106
i386                 randconfig-a002-20220106
i386                 randconfig-a001-20220106
x86_64               randconfig-a012-20220107
x86_64               randconfig-a015-20220107
x86_64               randconfig-a014-20220107
x86_64               randconfig-a013-20220107
x86_64               randconfig-a011-20220107
x86_64               randconfig-a016-20220107
s390                 randconfig-r044-20220107
hexagon              randconfig-r041-20220107
hexagon              randconfig-r045-20220107
riscv                randconfig-r042-20220107

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
