Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE87B359302
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 05:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbhDID3A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 23:29:00 -0400
Received: from mga09.intel.com ([134.134.136.24]:12003 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232918AbhDID26 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Apr 2021 23:28:58 -0400
IronPort-SDR: osYV2Um9YuNAm7TsxlIJKSTAWBIKVCj4+Ilqw2rAGxxKIjlnTPOzhPrSQUWICYOqUscwDrnXIJ
 2qEsRL721FTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="193792953"
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; 
   d="scan'208";a="193792953"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 20:28:46 -0700
IronPort-SDR: KoX5kdoETqHT52QjnMv7stNFi+qoo08rB6aNr4NHar+oGR57IRmI/Sk+p7FTGcM6Syu+bN7BTi
 8qRW9w/vo5cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; 
   d="scan'208";a="422542949"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Apr 2021 20:28:45 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lUhp6-000G9h-AC; Fri, 09 Apr 2021 03:28:44 +0000
Date:   Fri, 09 Apr 2021 11:27:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 775c93a7c5b4d31f716db21fd097a64e9b5bf3b7
Message-ID: <606fc9bc.C0GMIwigj9P60/QC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 775c93a7c5b4d31f716db21fd097a64e9b5bf3b7  docs: pin-control: Fix error path for control state example

elapsed time: 727m

configs tested: 101
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
s390                          debug_defconfig
arc                        vdk_hs38_defconfig
sh                           se7751_defconfig
mips                      pic32mzda_defconfig
arm                   milbeaut_m10v_defconfig
arm                           h5000_defconfig
powerpc                     mpc5200_defconfig
powerpc                      ep88xc_defconfig
m68k                          amiga_defconfig
arm                  colibri_pxa270_defconfig
mips                           ip22_defconfig
mips                         rt305x_defconfig
arm                            xcep_defconfig
riscv                               defconfig
ia64                            zx1_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                         shannon_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                         at91_dt_defconfig
mips                  decstation_64_defconfig
powerpc                         ps3_defconfig
arm                          gemini_defconfig
arm                        realview_defconfig
arm                          iop32x_defconfig
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
x86_64               randconfig-a004-20210408
x86_64               randconfig-a005-20210408
x86_64               randconfig-a003-20210408
x86_64               randconfig-a001-20210408
x86_64               randconfig-a002-20210408
x86_64               randconfig-a006-20210408
i386                 randconfig-a006-20210408
i386                 randconfig-a003-20210408
i386                 randconfig-a001-20210408
i386                 randconfig-a004-20210408
i386                 randconfig-a005-20210408
i386                 randconfig-a002-20210408
i386                 randconfig-a014-20210408
i386                 randconfig-a011-20210408
i386                 randconfig-a012-20210408
i386                 randconfig-a013-20210408
i386                 randconfig-a015-20210408
i386                 randconfig-a016-20210408
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210408
x86_64               randconfig-a015-20210408
x86_64               randconfig-a012-20210408
x86_64               randconfig-a011-20210408
x86_64               randconfig-a013-20210408
x86_64               randconfig-a016-20210408

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
