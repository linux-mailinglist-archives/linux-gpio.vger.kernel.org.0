Return-Path: <linux-gpio+bounces-3538-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3AA85CF65
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 06:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77BDB1C2255D
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 05:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2D63987B;
	Wed, 21 Feb 2024 05:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHT8BoHd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518D928382
	for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 05:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708491947; cv=none; b=IE1VZ/r9mhad/6EakfImAgAkWjWnEteai1q1KNdJa3j8wUcJEeRleIULqPCpLnxIlRKUgohrYA8GndqyVEDyDLjNU+u7FN2YbVzjYJNmD1fR9AXALApYTs1Ad1Lwr0inNEWe4XKHMK4Kt1o2yXIovnWVHOEvsyuZL3ux6EpOcAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708491947; c=relaxed/simple;
	bh=MmqjjkNvaJ2g7/MXsAAoPb5Bcn+nCIlb9Sll1Ez8n1w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sK/mx1GGVvY10hWrX0qNFxK8Yn0sV+Yc5GPy1sNw5xpt/bDsSiKWJx5T51dfcBPuMcBD3evTqFMszzQnSrs3CNQwJOkVjw2Xknsj+JkvTB+WRKgLUN3S6xjYluwQ0cNF0Ohza7l5iwFf/2mPlNxfq2SwbX4wShK84rA6XOry46Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHT8BoHd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708491944; x=1740027944;
  h=date:from:to:cc:subject:message-id;
  bh=MmqjjkNvaJ2g7/MXsAAoPb5Bcn+nCIlb9Sll1Ez8n1w=;
  b=IHT8BoHdEC9mEYysMJj0aEP/cngRdlXMIeBvTrbq8zvl4n75eVy5ruG2
   6y3V+EGqQkvvlqJrb74CbH1MAa0DW9hCL46Ozx5gIe8WZy/XGEiyxL3G7
   c5autfNeAfAxhZBeoSfBDWbNFTKVx722jWUpOoFP4LRSsJHcyyn8m5tRz
   qQT98kmVruUSd91ffMXPaEFI4bUI/ITsMj1Jq57MxA/aRq6gEcxAc/ieO
   EmmVATN0B0rexskSTc2eaSw6vSDdzNTaCa6dCtuREFcqM7IGjg9EdnKcS
   oQwt+wkGpIbgmsdCET/Ts96eiisEm7gcnQWXGLb1pCr4i602eclJxURgt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="6449600"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="6449600"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 21:05:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="9584863"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 Feb 2024 21:05:42 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcenc-00054D-09;
	Wed, 21 Feb 2024 05:05:40 +0000
Date: Wed, 21 Feb 2024 13:05:14 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/descriptors-regulators] BUILD SUCCESS
 6c9bd621a7d8762a434ecbe20597d2c0b291f320
Message-ID: <202402211311.tsyFX5dy-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-regulators
branch HEAD: 6c9bd621a7d8762a434ecbe20597d2c0b291f320  regulator: max8998: Convert to GPIO descriptors

elapsed time: 1185m

configs tested: 250
configs skipped: 3

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
arc                   randconfig-001-20240220   gcc  
arc                   randconfig-001-20240221   gcc  
arc                   randconfig-002-20240220   gcc  
arc                   randconfig-002-20240221   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                           h3600_defconfig   gcc  
arm                   randconfig-001-20240220   clang
arm                   randconfig-002-20240220   gcc  
arm                   randconfig-003-20240220   gcc  
arm                   randconfig-003-20240221   gcc  
arm                   randconfig-004-20240220   gcc  
arm                       spear13xx_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240220   clang
arm64                 randconfig-001-20240221   gcc  
arm64                 randconfig-002-20240220   clang
arm64                 randconfig-002-20240221   gcc  
arm64                 randconfig-003-20240220   clang
arm64                 randconfig-003-20240221   gcc  
arm64                 randconfig-004-20240220   clang
arm64                 randconfig-004-20240221   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240220   gcc  
csky                  randconfig-001-20240221   gcc  
csky                  randconfig-002-20240220   gcc  
csky                  randconfig-002-20240221   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240220   clang
hexagon               randconfig-002-20240220   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240220   gcc  
i386         buildonly-randconfig-001-20240221   gcc  
i386         buildonly-randconfig-002-20240220   gcc  
i386         buildonly-randconfig-002-20240221   clang
i386         buildonly-randconfig-003-20240220   clang
i386         buildonly-randconfig-003-20240221   gcc  
i386         buildonly-randconfig-004-20240220   clang
i386         buildonly-randconfig-004-20240221   gcc  
i386         buildonly-randconfig-005-20240220   gcc  
i386         buildonly-randconfig-005-20240221   gcc  
i386         buildonly-randconfig-006-20240220   gcc  
i386         buildonly-randconfig-006-20240221   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240220   gcc  
i386                  randconfig-001-20240221   gcc  
i386                  randconfig-002-20240220   gcc  
i386                  randconfig-002-20240221   clang
i386                  randconfig-003-20240220   clang
i386                  randconfig-003-20240221   clang
i386                  randconfig-004-20240220   clang
i386                  randconfig-004-20240221   gcc  
i386                  randconfig-005-20240220   gcc  
i386                  randconfig-005-20240221   gcc  
i386                  randconfig-006-20240220   clang
i386                  randconfig-006-20240221   clang
i386                  randconfig-011-20240220   clang
i386                  randconfig-011-20240221   gcc  
i386                  randconfig-012-20240220   gcc  
i386                  randconfig-012-20240221   clang
i386                  randconfig-013-20240220   gcc  
i386                  randconfig-013-20240221   gcc  
i386                  randconfig-014-20240220   clang
i386                  randconfig-014-20240221   clang
i386                  randconfig-015-20240220   clang
i386                  randconfig-015-20240221   gcc  
i386                  randconfig-016-20240220   clang
i386                  randconfig-016-20240221   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240220   gcc  
loongarch             randconfig-001-20240221   gcc  
loongarch             randconfig-002-20240220   gcc  
loongarch             randconfig-002-20240221   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       alldefconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240220   gcc  
nios2                 randconfig-001-20240221   gcc  
nios2                 randconfig-002-20240220   gcc  
nios2                 randconfig-002-20240221   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240220   gcc  
parisc                randconfig-001-20240221   gcc  
parisc                randconfig-002-20240220   gcc  
parisc                randconfig-002-20240221   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240220   gcc  
powerpc               randconfig-001-20240221   gcc  
powerpc               randconfig-002-20240220   clang
powerpc               randconfig-002-20240221   gcc  
powerpc               randconfig-003-20240220   clang
powerpc               randconfig-003-20240221   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240220   gcc  
powerpc64             randconfig-001-20240221   gcc  
powerpc64             randconfig-002-20240220   gcc  
powerpc64             randconfig-002-20240221   gcc  
powerpc64             randconfig-003-20240220   clang
powerpc64             randconfig-003-20240221   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240220   clang
riscv                 randconfig-002-20240220   clang
riscv                 randconfig-002-20240221   gcc  
s390                             alldefconfig   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240220   gcc  
s390                  randconfig-002-20240220   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240220   gcc  
sh                    randconfig-001-20240221   gcc  
sh                    randconfig-002-20240220   gcc  
sh                    randconfig-002-20240221   gcc  
sh                          sdk7786_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240220   gcc  
sparc64               randconfig-001-20240221   gcc  
sparc64               randconfig-002-20240220   gcc  
sparc64               randconfig-002-20240221   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240220   gcc  
um                    randconfig-001-20240221   gcc  
um                    randconfig-002-20240220   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240220   clang
x86_64       buildonly-randconfig-002-20240220   clang
x86_64       buildonly-randconfig-002-20240221   gcc  
x86_64       buildonly-randconfig-003-20240220   gcc  
x86_64       buildonly-randconfig-003-20240221   gcc  
x86_64       buildonly-randconfig-004-20240220   clang
x86_64       buildonly-randconfig-005-20240220   gcc  
x86_64       buildonly-randconfig-006-20240220   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240220   gcc  
x86_64                randconfig-001-20240221   gcc  
x86_64                randconfig-002-20240220   gcc  
x86_64                randconfig-002-20240221   gcc  
x86_64                randconfig-003-20240220   gcc  
x86_64                randconfig-003-20240221   gcc  
x86_64                randconfig-004-20240220   clang
x86_64                randconfig-004-20240221   gcc  
x86_64                randconfig-005-20240220   clang
x86_64                randconfig-005-20240221   gcc  
x86_64                randconfig-006-20240221   gcc  
x86_64                randconfig-012-20240220   clang
x86_64                randconfig-012-20240221   gcc  
x86_64                randconfig-013-20240220   clang
x86_64                randconfig-014-20240221   gcc  
x86_64                randconfig-015-20240220   clang
x86_64                randconfig-015-20240221   gcc  
x86_64                randconfig-016-20240221   gcc  
x86_64                randconfig-071-20240220   clang
x86_64                randconfig-071-20240221   gcc  
x86_64                randconfig-072-20240220   clang
x86_64                randconfig-072-20240221   gcc  
x86_64                randconfig-073-20240220   clang
x86_64                randconfig-073-20240221   gcc  
x86_64                randconfig-074-20240220   clang
x86_64                randconfig-074-20240221   gcc  
x86_64                randconfig-075-20240220   clang
x86_64                randconfig-076-20240220   clang
x86_64                randconfig-076-20240221   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240220   gcc  
xtensa                randconfig-001-20240221   gcc  
xtensa                randconfig-002-20240220   gcc  
xtensa                randconfig-002-20240221   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

