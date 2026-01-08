Return-Path: <linux-gpio+bounces-30265-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B83D02992
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 13:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F47431D69F7
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 12:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975F13EDD5F;
	Thu,  8 Jan 2026 11:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWCuXq2S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF073ECBFF
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 11:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767871966; cv=none; b=oTRjUQSvhow/wPihMqCdrDhito/qkKKxu4TS0LA6zjrscmuNbeOVkjtFia5gL3z3NSpsmRDR+Ccnjv3IhFMI0g4jfBM31t21CuRlqWbLYQDcu2UqO8tHCEMTiovVQQ97+RUvLJ8vY9xhyTB4hGPRS753QH+xr333DtPhMROuUHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767871966; c=relaxed/simple;
	bh=0anntOqrekxMcWlJfuKYPhS3wgwKnanSmvVlPsmbRWk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pvRa0b2VRrqEpWddtsmefansq9FIJq1tZNaYOI0H7xlJc36BKjgaAxgAeBn9+av8E3NABb6+NUgTlUzQdw2xJEkC6sNjq3YOMAi9ZF8K9vvmM1bPT7LQktuuyPE6j1eIJwIBtguQM9JfAxXRz8bL3KZvTDZnFsfcACh8KKQeVpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AWCuXq2S; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767871962; x=1799407962;
  h=date:from:to:cc:subject:message-id;
  bh=0anntOqrekxMcWlJfuKYPhS3wgwKnanSmvVlPsmbRWk=;
  b=AWCuXq2SHYJ+4IhaU+3e5pnn5oHxn6zCbWE0b74BfLv1J8QyI+Uqnhl4
   ZGB9hQcOzBcYCjkAD85QUdRNBbz18DcjwITfsCEBvRSlxfxp7pgUYY5Mx
   K9GD1NqCIVhlwNFPClRabFOv0ReSiX3Z52yT4X1yHgTv9p8l6XvM64ryq
   vYA7jREXmGQUushOKs7n9t+03iZSoI1E6T1jJOwE5T+Eu42cL4A8T40r6
   NLmI3GeWyzDszskHbigiRK2pxLpVZYqGjZ2dpRmEWfnvBpNeyUia5t19u
   Or/wE21EwXBiE0+/hV6uG+mBye2/9dmuQnjq6fiRVPwczcEXwwdqtom9i
   A==;
X-CSE-ConnectionGUID: 69+wa5q2TtSlHq6PNDlniA==
X-CSE-MsgGUID: wA3ERoJ5QoGylaNyMY6Ixg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56806430"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="56806430"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 03:32:40 -0800
X-CSE-ConnectionGUID: X/uYHSydR3udHXDbABMjfQ==
X-CSE-MsgGUID: qtFe4o/JQAGGfWwLDb5XVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233894384"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Jan 2026 03:32:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdoFo-000000004eO-1zuc;
	Thu, 08 Jan 2026 11:32:36 +0000
Date: Thu, 08 Jan 2026 19:31:54 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 a80208072df8f4ceb53cd905c1f4362f84ce397f
Message-ID: <202601081946.6oXZwv7T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: a80208072df8f4ceb53cd905c1f4362f84ce397f  gpio: shared: don't allocate the lookup table until we really need it

elapsed time: 1600m

configs tested: 199
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                     haps_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20260108    gcc-9.5.0
arc                   randconfig-002-20260108    gcc-8.5.0
arc                   randconfig-002-20260108    gcc-9.5.0
arm                               allnoconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                         at91_dt_defconfig    clang-22
arm                                 defconfig    clang-22
arm                          ep93xx_defconfig    clang-22
arm                            hisi_defconfig    gcc-15.1.0
arm                      integrator_defconfig    clang-22
arm                           omap1_defconfig    gcc-15.1.0
arm                   randconfig-001-20260108    gcc-8.5.0
arm                   randconfig-001-20260108    gcc-9.5.0
arm                   randconfig-002-20260108    gcc-13.4.0
arm                   randconfig-002-20260108    gcc-9.5.0
arm                   randconfig-003-20260108    clang-17
arm                   randconfig-003-20260108    gcc-9.5.0
arm                   randconfig-004-20260108    clang-22
arm                   randconfig-004-20260108    gcc-9.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20260108    gcc-10.5.0
arm64                 randconfig-001-20260108    gcc-15.1.0
arm64                 randconfig-002-20260108    clang-22
arm64                 randconfig-002-20260108    gcc-10.5.0
arm64                 randconfig-003-20260108    clang-22
arm64                 randconfig-003-20260108    gcc-10.5.0
arm64                 randconfig-004-20260108    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20260108    gcc-10.5.0
csky                  randconfig-001-20260108    gcc-9.5.0
csky                  randconfig-002-20260108    gcc-10.5.0
csky                  randconfig-002-20260108    gcc-11.5.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20260108    clang-22
hexagon               randconfig-001-20260108    gcc-8.5.0
hexagon               randconfig-002-20260108    clang-22
hexagon               randconfig-002-20260108    gcc-8.5.0
i386                              allnoconfig    gcc-15.1.0
i386        buildonly-randconfig-001-20260108    clang-20
i386        buildonly-randconfig-002-20260108    clang-20
i386        buildonly-randconfig-003-20260108    clang-20
i386        buildonly-randconfig-003-20260108    gcc-13
i386        buildonly-randconfig-004-20260108    clang-20
i386        buildonly-randconfig-005-20260108    clang-20
i386        buildonly-randconfig-006-20260108    clang-20
i386        buildonly-randconfig-006-20260108    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20260108    gcc-13
i386                  randconfig-001-20260108    gcc-14
i386                  randconfig-002-20260108    gcc-13
i386                  randconfig-002-20260108    gcc-14
i386                  randconfig-003-20260108    clang-20
i386                  randconfig-003-20260108    gcc-14
i386                  randconfig-004-20260108    clang-20
i386                  randconfig-004-20260108    gcc-14
i386                  randconfig-005-20260108    clang-20
i386                  randconfig-005-20260108    gcc-14
i386                  randconfig-006-20260108    gcc-14
i386                  randconfig-007-20260108    gcc-14
i386                  randconfig-011-20260108    gcc-12
i386                  randconfig-011-20260108    gcc-14
i386                  randconfig-012-20260108    gcc-14
i386                  randconfig-013-20260108    gcc-14
i386                  randconfig-014-20260108    gcc-12
i386                  randconfig-014-20260108    gcc-14
i386                  randconfig-015-20260108    gcc-14
i386                  randconfig-016-20260108    gcc-14
i386                  randconfig-017-20260108    gcc-14
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260108    clang-22
loongarch             randconfig-001-20260108    gcc-8.5.0
loongarch             randconfig-002-20260108    clang-22
loongarch             randconfig-002-20260108    gcc-8.5.0
m68k                              allnoconfig    gcc-15.1.0
m68k                       bvme6000_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
m68k                       m5475evb_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  decstation_64_defconfig    gcc-15.1.0
mips                      loongson3_defconfig    gcc-15.1.0
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260108    gcc-8.5.0
nios2                 randconfig-002-20260108    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.1.0
openrisc                    or1ksim_defconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20260108    clang-22
parisc                randconfig-001-20260108    gcc-13.4.0
parisc                randconfig-002-20260108    clang-22
parisc                randconfig-002-20260108    gcc-12.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                      bamboo_defconfig    clang-22
powerpc                  mpc866_ads_defconfig    gcc-15.1.0
powerpc               randconfig-001-20260108    clang-22
powerpc               randconfig-001-20260108    gcc-13.4.0
powerpc               randconfig-002-20260108    clang-22
powerpc64             randconfig-001-20260108    clang-22
powerpc64             randconfig-002-20260108    clang-22
riscv                             allnoconfig    clang-22
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20260108    gcc-15.1.0
riscv                 randconfig-002-20260108    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20260108    gcc-13.4.0
sh                                allnoconfig    clang-22
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20260108    gcc-9.5.0
sh                    randconfig-002-20260108    gcc-13.4.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20260108    gcc-8.5.0
sparc                 randconfig-002-20260108    gcc-15.1.0
sparc                 randconfig-002-20260108    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260108    gcc-8.5.0
sparc64               randconfig-002-20260108    clang-20
sparc64               randconfig-002-20260108    gcc-8.5.0
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260108    clang-18
um                    randconfig-001-20260108    gcc-8.5.0
um                    randconfig-002-20260108    clang-22
um                    randconfig-002-20260108    gcc-8.5.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20260108    clang-20
x86_64      buildonly-randconfig-001-20260108    gcc-14
x86_64      buildonly-randconfig-002-20260108    clang-20
x86_64      buildonly-randconfig-002-20260108    gcc-14
x86_64      buildonly-randconfig-003-20260108    clang-20
x86_64      buildonly-randconfig-003-20260108    gcc-14
x86_64      buildonly-randconfig-004-20260108    clang-20
x86_64      buildonly-randconfig-004-20260108    gcc-14
x86_64      buildonly-randconfig-005-20260108    gcc-14
x86_64      buildonly-randconfig-006-20260108    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260108    clang-20
x86_64                randconfig-002-20260108    clang-20
x86_64                randconfig-003-20260108    gcc-12
x86_64                randconfig-004-20260108    gcc-14
x86_64                randconfig-005-20260108    gcc-14
x86_64                randconfig-006-20260108    gcc-14
x86_64                randconfig-011-20260108    clang-20
x86_64                randconfig-012-20260108    clang-20
x86_64                randconfig-013-20260108    clang-20
x86_64                randconfig-014-20260108    clang-20
x86_64                randconfig-014-20260108    gcc-14
x86_64                randconfig-015-20260108    clang-20
x86_64                randconfig-015-20260108    gcc-14
x86_64                randconfig-016-20260108    clang-20
x86_64                randconfig-016-20260108    gcc-14
x86_64                randconfig-071-20260108    gcc-14
x86_64                randconfig-072-20260108    gcc-14
x86_64                randconfig-073-20260108    gcc-14
x86_64                randconfig-074-20260108    gcc-14
x86_64                randconfig-075-20260108    clang-20
x86_64                randconfig-075-20260108    gcc-14
x86_64                randconfig-076-20260108    clang-20
x86_64                randconfig-076-20260108    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    clang-22
xtensa                randconfig-001-20260108    gcc-11.5.0
xtensa                randconfig-001-20260108    gcc-8.5.0
xtensa                randconfig-002-20260108    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

