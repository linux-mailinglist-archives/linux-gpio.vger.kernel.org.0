Return-Path: <linux-gpio+bounces-1175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E2180B84C
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 02:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA269280E58
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Dec 2023 01:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1992DEA5;
	Sun, 10 Dec 2023 01:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMemrDaZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14C3D0
	for <linux-gpio@vger.kernel.org>; Sat,  9 Dec 2023 17:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702171336; x=1733707336;
  h=date:from:to:cc:subject:message-id;
  bh=cbOyYtMAcKweBHYklRArUnWYegvniiubbyTMV5DUagU=;
  b=jMemrDaZFBXXwBNn1tWl3KeIfW0ESMrn3AyW3+605fpVw1wtnxHVYZTN
   y1WistMiqonJPLw8tet0f9irv5sRxNkj+qkiNBxirT9V9R4AyYMpxQNkf
   eUyz36rYAXreyKlRQX8UX3z1T2Z0Ie4SfQrZS/qnAB/2H2pmmTjxy30+a
   NAH3B+wSehPA+Sce5EG8vUDZVba4o9gI2+ZrQLgW3p8B+GGRCCfYGIb4G
   +zB5Gp7F6Q5O5xVfCPTUHphFs++TS+hW3zHDA7p6q0fvIKZiUKkBkp8Gs
   t7yjpIp9+Xd0W6CHcXfhJ40XVphOcszu7Dl5qfmCCIg95+ak3NU99bpGF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1633290"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="1633290"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 17:22:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="765893329"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="765893329"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 09 Dec 2023 17:22:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC8WJ-000GEJ-2x;
	Sun, 10 Dec 2023 01:22:11 +0000
Date: Sun, 10 Dec 2023 09:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 583b5273a624e7d87b7038404cb1524450abdfbc
Message-ID: <202312100933.mLPbO8hG-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 583b5273a624e7d87b7038404cb1524450abdfbc  pinctrl: nuvoton: Convert to use struct pingroup and PINCTRL_PINGROUP()

elapsed time: 1526m

configs tested: 141
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231210   gcc  
arc                   randconfig-002-20231210   gcc  
arm                               allnoconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                                 defconfig   clang
arm                          exynos_defconfig   gcc  
arm                          ixp4xx_defconfig   clang
arm                         nhk8815_defconfig   gcc  
arm                   randconfig-001-20231210   gcc  
arm                   randconfig-002-20231210   gcc  
arm                   randconfig-003-20231210   gcc  
arm                   randconfig-004-20231210   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231210   gcc  
arm64                 randconfig-002-20231210   gcc  
arm64                 randconfig-003-20231210   gcc  
arm64                 randconfig-004-20231210   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231210   gcc  
csky                  randconfig-002-20231210   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231210   clang
hexagon               randconfig-002-20231210   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231209   gcc  
i386         buildonly-randconfig-002-20231209   gcc  
i386         buildonly-randconfig-003-20231209   gcc  
i386         buildonly-randconfig-004-20231209   gcc  
i386         buildonly-randconfig-005-20231209   gcc  
i386         buildonly-randconfig-006-20231209   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231209   gcc  
i386                  randconfig-002-20231209   gcc  
i386                  randconfig-003-20231209   gcc  
i386                  randconfig-004-20231209   gcc  
i386                  randconfig-005-20231209   gcc  
i386                  randconfig-006-20231209   gcc  
i386                  randconfig-011-20231209   clang
i386                  randconfig-012-20231209   clang
i386                  randconfig-013-20231209   clang
i386                  randconfig-014-20231209   clang
i386                  randconfig-015-20231209   clang
i386                  randconfig-016-20231209   clang
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231210   gcc  
loongarch             randconfig-002-20231210   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                          ath79_defconfig   clang
nios2                             allnoconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231210   gcc  
nios2                 randconfig-002-20231210   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231210   gcc  
parisc                randconfig-002-20231210   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                    amigaone_defconfig   gcc  
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                      pasemi_defconfig   gcc  
powerpc               randconfig-001-20231210   gcc  
powerpc               randconfig-002-20231210   gcc  
powerpc               randconfig-003-20231210   gcc  
powerpc                    socrates_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20231210   gcc  
powerpc64             randconfig-002-20231210   gcc  
powerpc64             randconfig-003-20231210   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231210   gcc  
riscv                 randconfig-002-20231210   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231210   clang
s390                  randconfig-002-20231210   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                    randconfig-001-20231210   gcc  
sh                    randconfig-002-20231210   gcc  
sh                           se7619_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231210   gcc  
sparc64               randconfig-002-20231210   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231210   gcc  
um                    randconfig-002-20231210   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231210   gcc  
x86_64       buildonly-randconfig-002-20231210   gcc  
x86_64       buildonly-randconfig-003-20231210   gcc  
x86_64       buildonly-randconfig-004-20231210   gcc  
x86_64       buildonly-randconfig-005-20231210   gcc  
x86_64       buildonly-randconfig-006-20231210   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231210   clang
x86_64                randconfig-002-20231210   clang
x86_64                randconfig-005-20231210   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231210   gcc  
xtensa                randconfig-002-20231210   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

