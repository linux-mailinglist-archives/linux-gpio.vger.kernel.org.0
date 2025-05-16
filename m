Return-Path: <linux-gpio+bounces-20260-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4D5ABA006
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 17:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93072174849
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 15:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15711D54FE;
	Fri, 16 May 2025 15:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnOEM4kB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA721C5D4E
	for <linux-gpio@vger.kernel.org>; Fri, 16 May 2025 15:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747409881; cv=none; b=OP0G2hEMCLFxHMi9/xI2W09sGicqhgcUh7WROaB06mEmR1OQJ5zt11CgYmwXn7ASp6eChwLwWWL5eJGWKF+jAD/fkxqoHJeySvhq0ZZzpw6uuaNLefIIoKbpy3qOR7QOel9MOyqka7NFtxpBINuGrZpFuKgSSrmWh2yNCQHHGdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747409881; c=relaxed/simple;
	bh=FQ8MbgtCEqsTZl8P9vLomlaXqxB02oqMvamPH5c7q4M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dAMogA8905arpCkbRStnzKVTV4MIIgDqITmkj1r6IIE4cT1pGljOd3e83OGe+ConlbCCzetZWWuETa2SANSS6mUmCR3VMR8ltoi63NR0zA47FKhSHB9T/ICsS4DG9qxJfkoRYsevCpJZzhmLuWZ1Wq8ut5bQJq7+KiLb9bP4OFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cnOEM4kB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747409879; x=1778945879;
  h=date:from:to:cc:subject:message-id;
  bh=FQ8MbgtCEqsTZl8P9vLomlaXqxB02oqMvamPH5c7q4M=;
  b=cnOEM4kBI98X11uuahhP34bhtvhihpZQ7h2eK6QREuFR+TS2557T6z/L
   I5fvslub+B578atLvgdNsQs+OjpA3E2RHtBcZqJ3oJxo+55NmUKMIoLdC
   S305cKDYYDtkX1/bm8AQwae0wHG2zKVLH4Ka4P5qEGu2+sNLEffrcvxoA
   nMAlZbLImdx55qZuHZoCpy9nwvIuYPoduN9bsbq2rKs5DncCMoxhNgg9v
   f91mDw47iRYiaK/3YH9VZRGMCXYHBXseZjzVd5S9qhVT0fzQ3K4r+k8F2
   LZPOOt99sFr/yiGvVk1YU5v/tzC+o8rpZHiQ0vYtSnTS3mz1guCQ4nhTH
   w==;
X-CSE-ConnectionGUID: heAwskpcTK+yVbIpdv7iBQ==
X-CSE-MsgGUID: pwUKm33rQQ2cpzBixBY5xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60776791"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="60776791"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 08:37:58 -0700
X-CSE-ConnectionGUID: gS3m/V6nRku6jIKXRvdhPA==
X-CSE-MsgGUID: egXrI8BnQbqaYd5sYtU7fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="169765055"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 08:37:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFx8E-000JT3-3B;
	Fri, 16 May 2025 15:37:54 +0000
Date: Fri, 16 May 2025 23:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 20117cf426b677e7aced4e7a1b2b37f6080a46dc
Message-ID: <202505162304.CUtQNl5a-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 20117cf426b677e7aced4e7a1b2b37f6080a46dc  gpio: pxa: Make irq_chip immutable

elapsed time: 1444m

configs tested: 110
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                         haps_hs_defconfig    gcc-14.2.0
arc                   randconfig-001-20250516    gcc-13.3.0
arc                   randconfig-002-20250516    gcc-13.3.0
arm                               allnoconfig    clang-21
arm                           imxrt_defconfig    clang-21
arm                   randconfig-001-20250516    gcc-7.5.0
arm                   randconfig-002-20250516    clang-21
arm                   randconfig-003-20250516    clang-21
arm                   randconfig-004-20250516    clang-21
arm                           sama5_defconfig    gcc-14.2.0
arm                           sama7_defconfig    clang-21
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250516    gcc-9.5.0
arm64                 randconfig-002-20250516    gcc-9.5.0
arm64                 randconfig-003-20250516    gcc-5.5.0
arm64                 randconfig-004-20250516    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250516    gcc-14.2.0
csky                  randconfig-002-20250516    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250516    clang-19
hexagon               randconfig-002-20250516    clang-21
i386                             alldefconfig    gcc-12
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250516    clang-20
i386        buildonly-randconfig-002-20250516    gcc-12
i386        buildonly-randconfig-003-20250516    clang-20
i386        buildonly-randconfig-004-20250516    clang-20
i386        buildonly-randconfig-005-20250516    clang-20
i386        buildonly-randconfig-006-20250516    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250516    gcc-14.2.0
loongarch             randconfig-002-20250516    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
m68k                           sun3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250516    gcc-13.3.0
nios2                 randconfig-002-20250516    gcc-13.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250516    gcc-10.5.0
parisc                randconfig-002-20250516    gcc-12.4.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                   currituck_defconfig    clang-21
powerpc               randconfig-001-20250516    gcc-5.5.0
powerpc               randconfig-002-20250516    gcc-5.5.0
powerpc               randconfig-003-20250516    clang-17
powerpc                     tqm8541_defconfig    clang-21
powerpc64             randconfig-001-20250516    clang-21
powerpc64             randconfig-002-20250516    clang-21
powerpc64             randconfig-003-20250516    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250516    gcc-7.5.0
riscv                 randconfig-002-20250516    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250516    gcc-7.5.0
s390                  randconfig-002-20250516    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                          polaris_defconfig    gcc-14.2.0
sh                    randconfig-001-20250516    gcc-7.5.0
sh                    randconfig-002-20250516    gcc-9.3.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250516    gcc-8.5.0
sparc                 randconfig-002-20250516    gcc-8.5.0
sparc64               randconfig-001-20250516    gcc-12.4.0
sparc64               randconfig-002-20250516    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250516    clang-21
um                    randconfig-002-20250516    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250516    clang-20
x86_64      buildonly-randconfig-002-20250516    gcc-12
x86_64      buildonly-randconfig-003-20250516    clang-20
x86_64      buildonly-randconfig-004-20250516    clang-20
x86_64      buildonly-randconfig-005-20250516    gcc-12
x86_64      buildonly-randconfig-006-20250516    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250516    gcc-10.5.0
xtensa                randconfig-002-20250516    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

