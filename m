Return-Path: <linux-gpio+bounces-1026-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C4E805976
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 17:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71ECD1C20ED9
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 16:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A8363DD6;
	Tue,  5 Dec 2023 16:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fa2Vsz9t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34D9194
	for <linux-gpio@vger.kernel.org>; Tue,  5 Dec 2023 08:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701792308; x=1733328308;
  h=date:from:to:cc:subject:message-id;
  bh=Qi5OE0k9wlqmw4K1uf8bL90Uy9ix8HYnzGGV2dQIPfo=;
  b=Fa2Vsz9tnTUMq3Uoqja5JE2zAfN6+ghPi1wi2Ri47inyPvx8wpzUbaCO
   WhgJOKquRWdLJcexVLnJmf0FVOZO9lpjpkXoKYJb+cRd2U6fHPtL0PQH7
   EybQ9eo857DP61XJZxgUM1+RUmxPRo8Rd9IviXJA2lJTJSUEBzlHFGksn
   sXflnrDTpRAQ3wE0Fvnkdt0cAC5F8MEb6gxG++7FwOEL58eD/+tj/TZOG
   34/NwCXA2NYjZeS3RdOGOGYZ+aWZ7RkOwce9ZreOTfBns/HgZRGhY+jcr
   zLOcgecBSF/OF9Cnl9ycqGroAXeap6LlFrY6jVvz4rfm1Rd66izd/eRId
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="374101161"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="374101161"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 08:04:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="800011332"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="800011332"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Dec 2023 08:04:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAXud-0009IH-14;
	Tue, 05 Dec 2023 16:04:43 +0000
Date: Wed, 06 Dec 2023 00:04:20 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 253bad7f0436284ee0413b1c615a1d4be96893de
Message-ID: <202312060017.mhuYicTl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 253bad7f0436284ee0413b1c615a1d4be96893de  dt-bindings: pinctrl: qcom,sm8550-lpass-lpi: add X1E80100 LPASS LPI

elapsed time: 1460m

configs tested: 177
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20231205   gcc  
arc                   randconfig-002-20231205   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                             mxs_defconfig   clang
arm                          pxa168_defconfig   clang
arm                   randconfig-001-20231205   gcc  
arm                   randconfig-002-20231205   gcc  
arm                   randconfig-003-20231205   gcc  
arm                   randconfig-004-20231205   gcc  
arm                         s5pv210_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231205   gcc  
arm64                 randconfig-002-20231205   gcc  
arm64                 randconfig-003-20231205   gcc  
arm64                 randconfig-004-20231205   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231205   gcc  
csky                  randconfig-002-20231205   gcc  
hexagon                          alldefconfig   clang
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231205   clang
hexagon               randconfig-002-20231205   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231205   gcc  
i386         buildonly-randconfig-002-20231205   gcc  
i386         buildonly-randconfig-003-20231205   gcc  
i386         buildonly-randconfig-004-20231205   gcc  
i386         buildonly-randconfig-005-20231205   gcc  
i386         buildonly-randconfig-006-20231205   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231205   gcc  
i386                  randconfig-002-20231205   gcc  
i386                  randconfig-003-20231205   gcc  
i386                  randconfig-004-20231205   gcc  
i386                  randconfig-005-20231205   gcc  
i386                  randconfig-006-20231205   gcc  
i386                  randconfig-011-20231205   clang
i386                  randconfig-012-20231205   clang
i386                  randconfig-013-20231205   clang
i386                  randconfig-014-20231205   clang
i386                  randconfig-015-20231205   clang
i386                  randconfig-016-20231205   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231205   gcc  
loongarch             randconfig-002-20231205   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                         rt305x_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231205   gcc  
nios2                 randconfig-002-20231205   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231205   gcc  
parisc                randconfig-002-20231205   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      cm5200_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20231205   gcc  
powerpc               randconfig-002-20231205   gcc  
powerpc               randconfig-003-20231205   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc                     tqm8555_defconfig   gcc  
powerpc64             randconfig-001-20231205   gcc  
powerpc64             randconfig-002-20231205   gcc  
powerpc64             randconfig-003-20231205   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231205   gcc  
riscv                 randconfig-002-20231205   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231205   clang
s390                  randconfig-002-20231205   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                    randconfig-001-20231205   gcc  
sh                    randconfig-002-20231205   gcc  
sh                           se7724_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231205   gcc  
sparc64               randconfig-002-20231205   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231205   gcc  
um                    randconfig-002-20231205   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231205   gcc  
x86_64       buildonly-randconfig-002-20231205   gcc  
x86_64       buildonly-randconfig-003-20231205   gcc  
x86_64       buildonly-randconfig-004-20231205   gcc  
x86_64       buildonly-randconfig-005-20231205   gcc  
x86_64       buildonly-randconfig-006-20231205   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231205   clang
x86_64                randconfig-002-20231205   clang
x86_64                randconfig-003-20231205   clang
x86_64                randconfig-004-20231205   clang
x86_64                randconfig-005-20231205   clang
x86_64                randconfig-006-20231205   clang
x86_64                randconfig-011-20231205   gcc  
x86_64                randconfig-012-20231205   gcc  
x86_64                randconfig-013-20231205   gcc  
x86_64                randconfig-014-20231205   gcc  
x86_64                randconfig-015-20231205   gcc  
x86_64                randconfig-016-20231205   gcc  
x86_64                randconfig-071-20231205   gcc  
x86_64                randconfig-072-20231205   gcc  
x86_64                randconfig-073-20231205   gcc  
x86_64                randconfig-074-20231205   gcc  
x86_64                randconfig-075-20231205   gcc  
x86_64                randconfig-076-20231205   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231205   gcc  
xtensa                randconfig-002-20231205   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

