Return-Path: <linux-gpio+bounces-22030-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F221AE5469
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 00:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2F141BC0E8B
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 22:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A8C4409;
	Mon, 23 Jun 2025 22:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bIhCZcRe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B252236E9
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 22:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750716017; cv=none; b=m5342a/h5yD8WIAupA+t0hSRYAzFU3JbIC53aw0iivGqgTq6uIXptHurqxlbHSDt4uTzi9wbvuuEuZOY43ae+I6EmMza24XjxH4VtyXYhxUlZuTD6tVINA90SCutpW4Cbj3fv2/YoZwk5AtOuMtYR+HOtB3Q3BQ0kqcm1Nd0EAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750716017; c=relaxed/simple;
	bh=3BKmq+58hMI3506fUnn4+1jWtPoEFSDUjiH7Eweuvwc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L/nlIrqPsbiaDqAI0RoXyBPIny/HwBlHj1IEeIqsFdZkoybFEKkk24vcOSI2GvJyNF12rqjihQwByy9NIP6ZzCeB9pqzCvZoaAeI7MBTshTFqQLQz50I6HWsUF8B46mKWVrJ9fX1ooJcjg/ghZrb7lVYtojxcpoWazsAkfjKVno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bIhCZcRe; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750716014; x=1782252014;
  h=date:from:to:cc:subject:message-id;
  bh=3BKmq+58hMI3506fUnn4+1jWtPoEFSDUjiH7Eweuvwc=;
  b=bIhCZcReB1BcdYutJ8u26vsXXHWAOGioRnPsSWcrz6fNDcGdZF14UuYr
   PfT76EytbNpLKjI/kf8UjazCS5RPO/GsECBabB03jnD5y+3//BDKNvmnP
   TBEjTwclHlBDmmMn35EpFzWztujyMdl0xAOBsagR0DePusVj0p89Uz5ly
   3cBKyzHCUt/xXW4vJGXZE2J5iexLsjN65iL+yQbEVnkH/FambmL/lpiXn
   C/POxgycBDEi/RR8wXxnTkJV4leVQDZyIZ/W27gla/2Y/ZLg1SuJfhabZ
   TUIeeL8D9trxv+EkCLQ2ygr2cK5U7mYf5Lca3Q+WGXnxqbdC7t6uQeb4b
   w==;
X-CSE-ConnectionGUID: SM2eZpMGQU2ej/GpzvQqIg==
X-CSE-MsgGUID: +I91JmGcTDmsfZ60zP3Fpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52809758"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="52809758"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 15:00:13 -0700
X-CSE-ConnectionGUID: wc4w9yNBR8eXqUQ6JL2rdw==
X-CSE-MsgGUID: rMYROmIqTZy7ag5Fn3oG1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="152024546"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jun 2025 15:00:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTpCz-000Qfd-3C;
	Mon, 23 Jun 2025 22:00:09 +0000
Date: Tue, 24 Jun 2025 05:59:34 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 cb908f3699fb137e28017a8fdf506c35762b3eb6
Message-ID: <202506240524.giKpEALY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: cb908f3699fb137e28017a8fdf506c35762b3eb6  gpio: sa1100: use new GPIO line value setter callbacks

elapsed time: 808m

configs tested: 107
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250623    gcc-10.5.0
arc                   randconfig-002-20250623    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250623    gcc-10.5.0
arm                   randconfig-002-20250623    clang-21
arm                   randconfig-003-20250623    gcc-8.5.0
arm                   randconfig-004-20250623    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250623    gcc-14.3.0
arm64                 randconfig-002-20250623    gcc-14.3.0
arm64                 randconfig-003-20250623    gcc-9.5.0
arm64                 randconfig-004-20250623    clang-16
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250624    gcc-12
i386        buildonly-randconfig-002-20250624    gcc-12
i386        buildonly-randconfig-003-20250624    gcc-12
i386        buildonly-randconfig-004-20250624    gcc-12
i386        buildonly-randconfig-005-20250624    gcc-12
i386        buildonly-randconfig-006-20250624    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250623    gcc-13.2.0
s390                  randconfig-002-20250623    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250623    clang-20
x86_64      buildonly-randconfig-001-20250624    clang-20
x86_64      buildonly-randconfig-002-20250623    gcc-12
x86_64      buildonly-randconfig-002-20250624    clang-20
x86_64      buildonly-randconfig-003-20250623    gcc-12
x86_64      buildonly-randconfig-003-20250624    clang-20
x86_64      buildonly-randconfig-004-20250623    gcc-12
x86_64      buildonly-randconfig-004-20250624    clang-20
x86_64      buildonly-randconfig-005-20250623    gcc-12
x86_64      buildonly-randconfig-005-20250624    clang-20
x86_64      buildonly-randconfig-006-20250623    clang-20
x86_64      buildonly-randconfig-006-20250624    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

