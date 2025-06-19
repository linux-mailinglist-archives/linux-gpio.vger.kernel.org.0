Return-Path: <linux-gpio+bounces-21876-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5571FAE0763
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 15:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD2361736D1
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 13:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE6827F015;
	Thu, 19 Jun 2025 13:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGrHJkIx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE28A27EC80
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 13:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750339980; cv=none; b=JmLj9yjk8EVU2zTRjG2lYCnjH+sBvXH9qKp71hUDybLaX7diJa8ERrzVzBv3DTIgfb0Y7PcDfmfzuY4/ovqD7hUcQX16EvADfoJwgWfUPHvcnY3dMhuW2yDsIx4zTeelt12J25umdH9epzB9Xv1EePBKjjCJgWl82/VNzpvGMNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750339980; c=relaxed/simple;
	bh=gVZMAul6KX0yKlaXXHdfEHaKv9o28006s0ha6DOcZLs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aJsIIPIf45++tfbHBrJI+sQsN9gYti4nuZzyQhBXDmcBg6Pp97iDbXgPJF+JbGJGUDBd9NP2X9qji+B+MGOJyoWOg1O6HGSWmWQReLHpznI2Vxgz1RZHEWE8BJfKl7OznmRTDhVmZQ4wda+eG4z61wftUc68bd5Xa/Skn35tGMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGrHJkIx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750339979; x=1781875979;
  h=date:from:to:cc:subject:message-id;
  bh=gVZMAul6KX0yKlaXXHdfEHaKv9o28006s0ha6DOcZLs=;
  b=oGrHJkIx4isM3bEUFBJmrP/it9TitdDR3pC04LXdeJoLT6a/ttIP69tY
   9cvm+pCgLiYid8Di8mcabJH0f1XEjp5Gm87HwEWX/9Q6tdkuxGOkedYkN
   cxJCNlgLb8TycSHDB83eQiEx+UhVdEiJ98khUxCEQRM3+KyCjdVd+dwQn
   POjkRdXkzXbyKKlK0lBpAaDA65/RbSPnFH/yyCtIYYsywjItEGEMEHb4n
   S9Qu3WHHAOwjlkGQe4hcDN7RFqDXbQu4sq7O98iq2snkYhl5hpSN+QhBK
   AQK2E0zyufengaaRHGmYqMUqbko455zautGpgQlaxLGAydksPgwtTfyFW
   g==;
X-CSE-ConnectionGUID: uT+IQowaQ+msM5Z3iYxLaw==
X-CSE-MsgGUID: p3UCqt5PSHSM4nBafWifIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52456879"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52456879"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 06:32:59 -0700
X-CSE-ConnectionGUID: dmA2SeueQKiJiit/WuT0iA==
X-CSE-MsgGUID: hK9wR3jpS5ud1MgLV2Rpeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="156151516"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Jun 2025 06:32:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSFNv-000Kma-0T;
	Thu, 19 Jun 2025 13:32:55 +0000
Date: Thu, 19 Jun 2025 21:32:00 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 46147490b4098e200b7d7d3ac4637a3e4f7b806a
Message-ID: <202506192150.yvPoEGYo-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 46147490b4098e200b7d7d3ac4637a3e4f7b806a  pinctrl: nuvoton: Fix boot on ma35dx platforms

elapsed time: 1455m

configs tested: 218
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20250618    gcc-11.5.0
arc                   randconfig-001-20250619    gcc-15.1.0
arc                   randconfig-002-20250618    gcc-15.1.0
arc                   randconfig-002-20250619    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g4_defconfig    clang-21
arm                         bcm2835_defconfig    gcc-15.1.0
arm                        multi_v7_defconfig    gcc-15.1.0
arm                          pxa910_defconfig    clang-21
arm                   randconfig-001-20250618    gcc-15.1.0
arm                   randconfig-001-20250619    gcc-15.1.0
arm                   randconfig-002-20250618    gcc-10.5.0
arm                   randconfig-002-20250619    gcc-15.1.0
arm                   randconfig-003-20250618    clang-21
arm                   randconfig-003-20250619    gcc-15.1.0
arm                   randconfig-004-20250618    gcc-11.5.0
arm                   randconfig-004-20250619    gcc-15.1.0
arm                        spear3xx_defconfig    clang-17
arm                           stm32_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250618    clang-21
arm64                 randconfig-001-20250619    gcc-15.1.0
arm64                 randconfig-002-20250618    clang-21
arm64                 randconfig-002-20250619    gcc-15.1.0
arm64                 randconfig-003-20250618    gcc-14.3.0
arm64                 randconfig-003-20250619    gcc-15.1.0
arm64                 randconfig-004-20250618    clang-16
arm64                 randconfig-004-20250619    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250619    gcc-11.5.0
csky                  randconfig-001-20250619    gcc-8.5.0
csky                  randconfig-002-20250619    gcc-8.5.0
csky                  randconfig-002-20250619    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250619    clang-21
hexagon               randconfig-001-20250619    gcc-8.5.0
hexagon               randconfig-002-20250619    clang-21
hexagon               randconfig-002-20250619    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250618    clang-20
i386        buildonly-randconfig-001-20250619    clang-20
i386        buildonly-randconfig-002-20250618    gcc-12
i386        buildonly-randconfig-002-20250619    clang-20
i386        buildonly-randconfig-003-20250618    clang-20
i386        buildonly-randconfig-003-20250619    clang-20
i386        buildonly-randconfig-004-20250618    clang-20
i386        buildonly-randconfig-004-20250619    clang-20
i386        buildonly-randconfig-005-20250618    clang-20
i386        buildonly-randconfig-005-20250619    clang-20
i386        buildonly-randconfig-006-20250618    clang-20
i386        buildonly-randconfig-006-20250619    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250619    gcc-12
i386                  randconfig-002-20250619    gcc-12
i386                  randconfig-003-20250619    gcc-12
i386                  randconfig-004-20250619    gcc-12
i386                  randconfig-005-20250619    gcc-12
i386                  randconfig-006-20250619    gcc-12
i386                  randconfig-007-20250619    gcc-12
i386                  randconfig-011-20250619    clang-20
i386                  randconfig-012-20250619    clang-20
i386                  randconfig-013-20250619    clang-20
i386                  randconfig-014-20250619    clang-20
i386                  randconfig-015-20250619    clang-20
i386                  randconfig-016-20250619    clang-20
i386                  randconfig-017-20250619    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250619    gcc-15.1.0
loongarch             randconfig-001-20250619    gcc-8.5.0
loongarch             randconfig-002-20250619    gcc-15.1.0
loongarch             randconfig-002-20250619    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    clang-21
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    clang-21
mips                        bcm63xx_defconfig    clang-21
mips                           ip32_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250619    gcc-8.5.0
nios2                 randconfig-002-20250619    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20250619    gcc-11.5.0
parisc                randconfig-001-20250619    gcc-8.5.0
parisc                randconfig-002-20250619    gcc-8.5.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                       ebony_defconfig    clang-21
powerpc                      katmai_defconfig    clang-21
powerpc                 linkstation_defconfig    clang-20
powerpc                     mpc5200_defconfig    clang-21
powerpc                 mpc8313_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250619    gcc-8.5.0
powerpc               randconfig-001-20250619    gcc-9.3.0
powerpc               randconfig-002-20250619    clang-21
powerpc               randconfig-002-20250619    gcc-8.5.0
powerpc               randconfig-003-20250619    gcc-10.5.0
powerpc               randconfig-003-20250619    gcc-8.5.0
powerpc                    sam440ep_defconfig    gcc-15.1.0
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250619    gcc-11.5.0
powerpc64             randconfig-001-20250619    gcc-8.5.0
powerpc64             randconfig-002-20250619    clang-21
powerpc64             randconfig-002-20250619    gcc-8.5.0
powerpc64             randconfig-003-20250619    gcc-10.5.0
powerpc64             randconfig-003-20250619    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                 randconfig-001-20250618    clang-20
riscv                 randconfig-001-20250619    gcc-9.3.0
riscv                 randconfig-002-20250618    clang-21
riscv                 randconfig-002-20250619    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250618    gcc-8.5.0
s390                  randconfig-001-20250619    gcc-9.3.0
s390                  randconfig-002-20250618    gcc-15.1.0
s390                  randconfig-002-20250619    gcc-9.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250618    gcc-15.1.0
sh                    randconfig-001-20250619    gcc-9.3.0
sh                    randconfig-002-20250618    gcc-15.1.0
sh                    randconfig-002-20250619    gcc-9.3.0
sh                           se7206_defconfig    clang-21
sh                           se7750_defconfig    gcc-15.1.0
sh                   sh7724_generic_defconfig    clang-21
sh                            titan_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250618    gcc-8.5.0
sparc                 randconfig-001-20250619    gcc-9.3.0
sparc                 randconfig-002-20250618    gcc-13.3.0
sparc                 randconfig-002-20250619    gcc-9.3.0
sparc64               randconfig-001-20250618    gcc-13.3.0
sparc64               randconfig-001-20250619    gcc-9.3.0
sparc64               randconfig-002-20250618    gcc-8.5.0
sparc64               randconfig-002-20250619    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250618    clang-21
um                    randconfig-001-20250619    gcc-9.3.0
um                    randconfig-002-20250618    clang-21
um                    randconfig-002-20250619    gcc-9.3.0
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250618    clang-20
x86_64      buildonly-randconfig-001-20250619    gcc-12
x86_64      buildonly-randconfig-002-20250618    clang-20
x86_64      buildonly-randconfig-002-20250619    gcc-12
x86_64      buildonly-randconfig-003-20250618    gcc-12
x86_64      buildonly-randconfig-003-20250619    gcc-12
x86_64      buildonly-randconfig-004-20250618    clang-20
x86_64      buildonly-randconfig-004-20250619    gcc-12
x86_64      buildonly-randconfig-005-20250618    clang-20
x86_64      buildonly-randconfig-005-20250619    gcc-12
x86_64      buildonly-randconfig-006-20250618    gcc-12
x86_64      buildonly-randconfig-006-20250619    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250619    gcc-11
x86_64                randconfig-002-20250619    gcc-11
x86_64                randconfig-003-20250619    gcc-11
x86_64                randconfig-004-20250619    gcc-11
x86_64                randconfig-005-20250619    gcc-11
x86_64                randconfig-006-20250619    gcc-11
x86_64                randconfig-007-20250619    gcc-11
x86_64                randconfig-008-20250619    gcc-11
x86_64                randconfig-071-20250619    clang-20
x86_64                randconfig-072-20250619    clang-20
x86_64                randconfig-073-20250619    clang-20
x86_64                randconfig-074-20250619    clang-20
x86_64                randconfig-075-20250619    clang-20
x86_64                randconfig-076-20250619    clang-20
x86_64                randconfig-077-20250619    clang-20
x86_64                randconfig-078-20250619    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                           alldefconfig    gcc-15.1.0
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250618    gcc-13.3.0
xtensa                randconfig-001-20250619    gcc-9.3.0
xtensa                randconfig-002-20250618    gcc-11.5.0
xtensa                randconfig-002-20250619    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

