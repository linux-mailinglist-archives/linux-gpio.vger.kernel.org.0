Return-Path: <linux-gpio+bounces-20150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09741AB6A21
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 13:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5145D4C0AD0
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 11:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE261272E69;
	Wed, 14 May 2025 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpN7w1a9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250E3274FEB
	for <linux-gpio@vger.kernel.org>; Wed, 14 May 2025 11:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222640; cv=none; b=r5thbsc8Tnme3C1XeiOrrRAAb7c8DCXmfieo0TQxuwu/TlaxcxsHOpBKgSaODOw87R0qITSo2lUN3gVELij35AOUcLYqHJO6M2rECbiIJjqQz4hHJxDkQJnPLGka0WRmKqmYAstl6jXjKgQ5b/RQosHO1najrKuAEqvtIMxNUm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222640; c=relaxed/simple;
	bh=W1y5s0pbde1ZL0o/ozr01JbgKOkHCX3S3JaSF9RACwo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P8qnXOGiYokE+o8sPqTLz2/O7QNN8ZZcqF+c3ISczUmGVE6Qey9RdQ5uzImaetDYfJswXGKKJRq6Us8blWxGIKg3C/okUnDa5GLEKWIthW9iI2XDF8iopQ0wrYQtD9lGDflpIA9LsAOttUERokyGV1Dfo4RHG0fzL70pnoVnnVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpN7w1a9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747222638; x=1778758638;
  h=date:from:to:cc:subject:message-id;
  bh=W1y5s0pbde1ZL0o/ozr01JbgKOkHCX3S3JaSF9RACwo=;
  b=fpN7w1a9hWI7r71I12SPG1q922YkZWhuDiZTNcSThyHnL7mQ5keKhjCE
   sxCm1WVaN9nNQvez574jVMGsFmx7Bzn46iRhl4rqIlrv5Tlo3K57HuUEP
   RjGmS4ILmgOPj8kI/DeUH6rQS+ElMK6iBU8TW3atMfA8vztwL528PUdc6
   gpbudRBLSFU9nC5iTXAZbszpCLnYG2yHGc0WYew0FXlgh7kt80fcEWppQ
   Ui+9hYTVUhWnrZfkrYTwNB5GTQfhG9xsFg9FOeN1dPQAPHM+JpVGuE/oy
   /zCxvdbTlCug5FVrwynmPplxcYa5EfTFL58AsESHVhcubcXCNPwe6qX4Z
   g==;
X-CSE-ConnectionGUID: 0eTu+RbgQsuNo2KTmhLA3g==
X-CSE-MsgGUID: Z3WeiDRTTmuHG4wFxzpIpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="71615777"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="71615777"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 04:37:18 -0700
X-CSE-ConnectionGUID: 1HOL8YpeSXmZ8sExRXMjyA==
X-CSE-MsgGUID: YhuS9veARnyCW3T0hE5AaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="169108782"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 May 2025 04:37:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFAQE-000H3f-0e;
	Wed, 14 May 2025 11:37:14 +0000
Date: Wed, 14 May 2025 19:36:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 7118be7c6072f40391923543fdd1563b8d56377c
Message-ID: <202505141946.8zizaicB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 7118be7c6072f40391923543fdd1563b8d56377c  gpio: virtuser: fix potential out-of-bound write

elapsed time: 1450m

configs tested: 256
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250513    gcc-14.2.0
arc                   randconfig-001-20250514    clang-21
arc                   randconfig-002-20250513    gcc-14.2.0
arc                   randconfig-002-20250514    clang-21
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                      footbridge_defconfig    clang-21
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250513    gcc-7.5.0
arm                   randconfig-001-20250514    clang-21
arm                   randconfig-002-20250513    gcc-8.5.0
arm                   randconfig-002-20250514    clang-21
arm                   randconfig-003-20250513    gcc-8.5.0
arm                   randconfig-003-20250514    clang-21
arm                   randconfig-004-20250513    clang-16
arm                   randconfig-004-20250514    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250513    clang-21
arm64                 randconfig-001-20250514    clang-21
arm64                 randconfig-002-20250513    clang-21
arm64                 randconfig-002-20250514    clang-21
arm64                 randconfig-003-20250513    gcc-6.5.0
arm64                 randconfig-003-20250514    clang-21
arm64                 randconfig-004-20250513    clang-21
arm64                 randconfig-004-20250514    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250513    gcc-14.2.0
csky                  randconfig-001-20250514    gcc-10.5.0
csky                  randconfig-002-20250513    gcc-12.4.0
csky                  randconfig-002-20250514    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250513    clang-21
hexagon               randconfig-001-20250514    gcc-10.5.0
hexagon               randconfig-002-20250513    clang-21
hexagon               randconfig-002-20250514    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250513    clang-20
i386        buildonly-randconfig-001-20250514    clang-20
i386        buildonly-randconfig-002-20250513    clang-20
i386        buildonly-randconfig-002-20250514    clang-20
i386        buildonly-randconfig-003-20250513    clang-20
i386        buildonly-randconfig-003-20250514    clang-20
i386        buildonly-randconfig-004-20250513    clang-20
i386        buildonly-randconfig-004-20250514    clang-20
i386        buildonly-randconfig-005-20250513    gcc-12
i386        buildonly-randconfig-005-20250514    clang-20
i386        buildonly-randconfig-006-20250513    gcc-12
i386        buildonly-randconfig-006-20250514    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250514    clang-20
i386                  randconfig-002-20250514    clang-20
i386                  randconfig-003-20250514    clang-20
i386                  randconfig-004-20250514    clang-20
i386                  randconfig-005-20250514    clang-20
i386                  randconfig-006-20250514    clang-20
i386                  randconfig-007-20250514    clang-20
i386                  randconfig-011-20250514    clang-20
i386                  randconfig-012-20250514    clang-20
i386                  randconfig-013-20250514    clang-20
i386                  randconfig-014-20250514    clang-20
i386                  randconfig-015-20250514    clang-20
i386                  randconfig-016-20250514    clang-20
i386                  randconfig-017-20250514    clang-20
loongarch                        alldefconfig    clang-21
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250513    gcc-14.2.0
loongarch             randconfig-001-20250514    gcc-10.5.0
loongarch             randconfig-002-20250513    gcc-14.2.0
loongarch             randconfig-002-20250514    gcc-10.5.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         apollo_defconfig    clang-21
m68k                                defconfig    gcc-14.2.0
m68k                          multi_defconfig    clang-21
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    clang-21
mips                          eyeq5_defconfig    clang-21
mips                          eyeq6_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250513    gcc-10.5.0
nios2                 randconfig-001-20250514    gcc-10.5.0
nios2                 randconfig-002-20250513    gcc-12.4.0
nios2                 randconfig-002-20250514    gcc-10.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250513    gcc-11.5.0
parisc                randconfig-001-20250514    gcc-10.5.0
parisc                randconfig-002-20250513    gcc-11.5.0
parisc                randconfig-002-20250514    gcc-10.5.0
parisc64                            defconfig    gcc-14.2.0
powerpc                     akebono_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     ep8248e_defconfig    clang-21
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc                       holly_defconfig    clang-21
powerpc                     mpc83xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250513    clang-21
powerpc               randconfig-001-20250514    gcc-10.5.0
powerpc               randconfig-002-20250513    gcc-8.5.0
powerpc               randconfig-002-20250514    gcc-10.5.0
powerpc               randconfig-003-20250513    clang-21
powerpc               randconfig-003-20250514    gcc-10.5.0
powerpc                     tqm8560_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250513    clang-21
powerpc64             randconfig-001-20250514    gcc-10.5.0
powerpc64             randconfig-002-20250514    gcc-10.5.0
powerpc64             randconfig-003-20250513    clang-21
powerpc64             randconfig-003-20250514    gcc-10.5.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250513    gcc-14.2.0
riscv                 randconfig-001-20250514    clang-21
riscv                 randconfig-002-20250513    gcc-14.2.0
riscv                 randconfig-002-20250514    clang-21
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250513    clang-21
s390                  randconfig-001-20250514    clang-21
s390                  randconfig-002-20250513    gcc-9.3.0
s390                  randconfig-002-20250514    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                            hp6xx_defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                    randconfig-001-20250513    gcc-12.4.0
sh                    randconfig-001-20250514    clang-21
sh                    randconfig-002-20250513    gcc-14.2.0
sh                    randconfig-002-20250514    clang-21
sh                          sdk7786_defconfig    gcc-14.2.0
sh                   sh7770_generic_defconfig    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250513    gcc-11.5.0
sparc                 randconfig-001-20250514    clang-21
sparc                 randconfig-002-20250513    gcc-13.3.0
sparc                 randconfig-002-20250514    clang-21
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250513    gcc-11.5.0
sparc64               randconfig-001-20250514    clang-21
sparc64               randconfig-002-20250513    gcc-13.3.0
sparc64               randconfig-002-20250514    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250513    clang-19
um                    randconfig-001-20250514    clang-21
um                    randconfig-002-20250513    gcc-12
um                    randconfig-002-20250514    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250513    gcc-12
x86_64      buildonly-randconfig-001-20250514    gcc-12
x86_64      buildonly-randconfig-002-20250513    gcc-12
x86_64      buildonly-randconfig-002-20250514    gcc-12
x86_64      buildonly-randconfig-003-20250513    clang-20
x86_64      buildonly-randconfig-003-20250514    gcc-12
x86_64      buildonly-randconfig-004-20250513    gcc-12
x86_64      buildonly-randconfig-004-20250514    gcc-12
x86_64      buildonly-randconfig-005-20250513    clang-20
x86_64      buildonly-randconfig-005-20250514    gcc-12
x86_64      buildonly-randconfig-006-20250513    gcc-12
x86_64      buildonly-randconfig-006-20250514    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250514    gcc-12
x86_64                randconfig-002-20250514    gcc-12
x86_64                randconfig-003-20250514    gcc-12
x86_64                randconfig-004-20250514    gcc-12
x86_64                randconfig-005-20250514    gcc-12
x86_64                randconfig-006-20250514    gcc-12
x86_64                randconfig-007-20250514    gcc-12
x86_64                randconfig-008-20250514    gcc-12
x86_64                randconfig-071-20250514    clang-20
x86_64                randconfig-072-20250514    clang-20
x86_64                randconfig-073-20250514    clang-20
x86_64                randconfig-074-20250514    clang-20
x86_64                randconfig-075-20250514    clang-20
x86_64                randconfig-076-20250514    clang-20
x86_64                randconfig-077-20250514    clang-20
x86_64                randconfig-078-20250514    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250513    gcc-7.5.0
xtensa                randconfig-001-20250514    clang-21
xtensa                randconfig-002-20250513    gcc-14.2.0
xtensa                randconfig-002-20250514    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

