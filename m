Return-Path: <linux-gpio+bounces-1939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3C482092A
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Dec 2023 00:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07BEA283B44
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 23:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5BE125CA;
	Sat, 30 Dec 2023 23:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCqkm8YB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82E4F9E9
	for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 23:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703980587; x=1735516587;
  h=date:from:to:cc:subject:message-id;
  bh=tU3XT6GXz5SMpMYbktySCemkCyJfwN32d4uWmTBC4+M=;
  b=hCqkm8YBQK6XX4VKvKWlStT4SXwVQsll+IofcPv2jVLy49qL2X687SYf
   kWphvL10+UPBME6vxCftT4n0QnJFSsX3qrvPxWWlT4vzomGaddvSK0p+a
   +0KosOhrxGwrwxJF/qdH5ZqOsmBpp6wxI8bAHRNJHFiIoKyxfmJKhfXrM
   yfR7EpGvT8zMij7fnw+sMiTlzBqRvP6pwbB7jA+ehsrksrAzehD3oCw7s
   PC1M8oaby3zSb5jkltTMmNVEhjATE9cQKdAV1gLlW3sHVRneuT9UvNyAi
   Qm/08sCL2Bw4BdZmc1MBuNUX1oujYljpXzN6NkkxKEkpR8hdCfDHIeTOO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="3506040"
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="3506040"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 15:56:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="782606059"
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="782606059"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 30 Dec 2023 15:56:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJjBm-000IqP-0v;
	Sat, 30 Dec 2023 23:56:22 +0000
Date: Sun, 31 Dec 2023 07:55:43 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 0ef4b05e2dfbed0f9ca8e8973f467998f96abdc1
Message-ID: <202312310738.Fzna1W6D-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 0ef4b05e2dfbed0f9ca8e8973f467998f96abdc1  Merge branch 'devel' into for-next

elapsed time: 1454m

configs tested: 179
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
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20231230   gcc  
arc                   randconfig-002-20231230   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                         orion5x_defconfig   clang
arm                   randconfig-001-20231230   clang
arm                   randconfig-002-20231230   clang
arm                   randconfig-003-20231230   clang
arm                   randconfig-004-20231230   clang
arm                        realview_defconfig   gcc  
arm                           sama7_defconfig   clang
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231230   clang
arm64                 randconfig-002-20231230   clang
arm64                 randconfig-003-20231230   clang
arm64                 randconfig-004-20231230   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231230   gcc  
csky                  randconfig-002-20231230   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231230   clang
hexagon               randconfig-002-20231230   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231230   clang
i386         buildonly-randconfig-002-20231230   clang
i386         buildonly-randconfig-003-20231230   clang
i386         buildonly-randconfig-004-20231230   clang
i386         buildonly-randconfig-005-20231230   clang
i386         buildonly-randconfig-006-20231230   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231230   clang
i386                  randconfig-002-20231230   clang
i386                  randconfig-003-20231230   clang
i386                  randconfig-004-20231230   clang
i386                  randconfig-005-20231230   clang
i386                  randconfig-006-20231230   clang
i386                  randconfig-011-20231230   gcc  
i386                  randconfig-012-20231230   gcc  
i386                  randconfig-013-20231230   gcc  
i386                  randconfig-014-20231230   gcc  
i386                  randconfig-015-20231230   gcc  
i386                  randconfig-016-20231230   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231230   gcc  
loongarch             randconfig-002-20231230   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                     cu1830-neo_defconfig   clang
mips                     loongson1c_defconfig   clang
mips                          rm200_defconfig   gcc  
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231230   gcc  
nios2                 randconfig-002-20231230   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231230   gcc  
parisc                randconfig-002-20231230   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      chrp32_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                      pasemi_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc               randconfig-001-20231230   clang
powerpc               randconfig-002-20231230   clang
powerpc               randconfig-003-20231230   clang
powerpc64             randconfig-001-20231230   clang
powerpc64             randconfig-002-20231230   clang
powerpc64             randconfig-003-20231230   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231230   clang
riscv                 randconfig-002-20231230   clang
riscv                          rv32_defconfig   clang
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231230   gcc  
s390                  randconfig-002-20231230   gcc  
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231230   gcc  
sh                    randconfig-002-20231230   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231230   gcc  
sparc64               randconfig-002-20231230   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231230   clang
um                    randconfig-002-20231230   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231230   clang
x86_64       buildonly-randconfig-002-20231230   clang
x86_64       buildonly-randconfig-003-20231230   clang
x86_64       buildonly-randconfig-004-20231230   clang
x86_64       buildonly-randconfig-005-20231230   clang
x86_64       buildonly-randconfig-006-20231230   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231230   gcc  
x86_64                randconfig-002-20231230   gcc  
x86_64                randconfig-003-20231230   gcc  
x86_64                randconfig-004-20231230   gcc  
x86_64                randconfig-005-20231230   gcc  
x86_64                randconfig-006-20231230   gcc  
x86_64                randconfig-011-20231230   clang
x86_64                randconfig-012-20231230   clang
x86_64                randconfig-013-20231230   clang
x86_64                randconfig-014-20231230   clang
x86_64                randconfig-015-20231230   clang
x86_64                randconfig-016-20231230   clang
x86_64                randconfig-071-20231230   clang
x86_64                randconfig-072-20231230   clang
x86_64                randconfig-073-20231230   clang
x86_64                randconfig-074-20231230   clang
x86_64                randconfig-075-20231230   clang
x86_64                randconfig-076-20231230   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231230   gcc  
xtensa                randconfig-002-20231230   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

