Return-Path: <linux-gpio+bounces-24070-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5C7B1E029
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 03:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E78C53BD8AE
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 01:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E86E5FB95;
	Fri,  8 Aug 2025 01:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXTmjHax"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32358BEC
	for <linux-gpio@vger.kernel.org>; Fri,  8 Aug 2025 01:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754616325; cv=none; b=dP00dYotAvlV1kvcdfWNmqW8j/zWt0g2JMZlxnhya+yKFDt4ANInXDOkUco1yW5LmSRDla1zkNCXrnr2PUg2T21GBMfLboiIQsp9k8J+m+J44OkKnIKf7BRhhio6wtZZ75WgkpQ0O0aOYLRfqYHocc6KDxuFA1Hynq7QqJnh4zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754616325; c=relaxed/simple;
	bh=Bf9b245zs0ptf+U2FMyZ1pII7AAgV6L/UCJ/BILKpcY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jBpWekm0voXX2gjITSIwEyi9DoXK2IiTa4OwoBRFPwIITbiJt59v+ldYod+UWCWM7DzJtRGj3++nBxH1MKylzAIp+TDH29csL8TFW2gVGEOmt3NHFfvsbJKuMWHFxB8oTPh7PxhvGWrreQPZQJTFTMbSyMAAjXlyoW/3RvvGeTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXTmjHax; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754616324; x=1786152324;
  h=date:from:to:cc:subject:message-id;
  bh=Bf9b245zs0ptf+U2FMyZ1pII7AAgV6L/UCJ/BILKpcY=;
  b=EXTmjHaxmp0V1N2GbYXELghquKVo15qf5+0PTJv1X/o4WdGiN8XUOs+e
   MnJu0kcbMBOAB/urZa0nP1Zz7R/P+GJOOtKA0Q4Cd4Z9dh6lyda72r/Os
   +dZFssboomkUl3mGv0+4coZPlE4p3xSy5I3BzVys3UGE005ZwH6W1iclN
   TX7AvSI5wp9Z1rdskoux6UHssv7C1ibg8Ri3VTTn37eeXQDYD8vOMW69L
   SbSau1dIGyWQgupAM8NOJ0FxUMX0/EAGfl6i4JK09HZs1x16FSWCwkmdF
   /b/KkYJzYOliVEpZLixSa9Qb5RpuRr0RY9a8dOZZbiXtsefIjOp1D6ae3
   Q==;
X-CSE-ConnectionGUID: Qn2heqRKTHqZ+9eHaad5PQ==
X-CSE-MsgGUID: 82pKLeuGSnWaJHfMMRhTIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="82408839"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="82408839"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 18:22:59 -0700
X-CSE-ConnectionGUID: YKvXmvnSQJuEQMuxREM93Q==
X-CSE-MsgGUID: 08r0XpANSKSZzVmVhjcy2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="164430496"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 07 Aug 2025 18:22:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukBot-0003Pu-1I;
	Fri, 08 Aug 2025 01:22:55 +0000
Date: Fri, 08 Aug 2025 09:22:43 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD REGRESSION
 d9d87d90cc0b10cd56ae353f50b11417e7d21712
Message-ID: <202508080931.7nqzEeI8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: d9d87d90cc0b10cd56ae353f50b11417e7d21712  treewide: rename GPIO set callbacks back to their original names

Unverified Error/Warning (likely false positive, kindly check if interested):

    ERROR: modpost: __ex_table+0x1590 references non-executable section '.rodata.mlxfw_firmware_flash.str1.4'
    ERROR: modpost: __ex_table+0x1594 references non-executable section '.rodata.mlxfw_mfa2_comp_magic'
    ERROR: modpost: __ex_table+0x15ac references non-executable section '.data.rel.local.iomem_resource'
    ERROR: modpost: __ex_table+0x1870 references non-executable section '.bss.pcpu_async_enabled'
    ERROR: modpost: __ex_table+0x1878 references non-executable section '.bss.pcpu_nr_populated'
    ERROR: modpost: __ex_table+0x187c references non-executable section '.data..once'
    ERROR: modpost: __ex_table+0x1890 references non-executable section '.data..ro_after_init'
    ERROR: modpost: __ex_table+0x18b4 references non-executable section '.data..unlikely'
    ERROR: modpost: __ex_table+0x18c0 references non-executable section '.data.print_fmt_percpu_create_chunk'
    ERROR: modpost: __ex_table+0x18cc references non-executable section '.data.rel.local.event_percpu_alloc_percpu'
    ERROR: modpost: __ex_table+0x18d8 references non-executable section '.data.rel.local.event_percpu_alloc_percpu_fail'
    ERROR: modpost: __ex_table+0x18e4 references non-executable section '.data.rel.local.event_percpu_create_chunk'

Error/Warning ids grouped by kconfigs:

recent_errors
`-- riscv-randconfig-002-20250807
    |-- ERROR:__ex_table-references-non-executable-section-.bss.pcpu_async_enabled
    |-- ERROR:__ex_table-references-non-executable-section-.bss.pcpu_nr_populated
    |-- ERROR:__ex_table-references-non-executable-section-.data..once
    |-- ERROR:__ex_table-references-non-executable-section-.data..ro_after_init
    |-- ERROR:__ex_table-references-non-executable-section-.data..unlikely
    |-- ERROR:__ex_table-references-non-executable-section-.data.print_fmt_percpu_create_chunk
    |-- ERROR:__ex_table-references-non-executable-section-.data.rel.local.event_percpu_alloc_percpu
    |-- ERROR:__ex_table-references-non-executable-section-.data.rel.local.event_percpu_alloc_percpu_fail
    |-- ERROR:__ex_table-references-non-executable-section-.data.rel.local.event_percpu_create_chunk
    |-- ERROR:__ex_table-references-non-executable-section-.data.rel.local.iomem_resource
    |-- ERROR:__ex_table-references-non-executable-section-.rodata.mlxfw_firmware_flash.str1.
    `-- ERROR:__ex_table-references-non-executable-section-.rodata.mlxfw_mfa2_comp_magic

elapsed time: 1010m

configs tested: 119
configs skipped: 4

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250807    gcc-13.4.0
arc                   randconfig-002-20250807    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250807    clang-22
arm                   randconfig-002-20250807    gcc-10.5.0
arm                   randconfig-003-20250807    clang-22
arm                   randconfig-004-20250807    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250807    gcc-8.5.0
arm64                 randconfig-002-20250807    gcc-8.5.0
arm64                 randconfig-003-20250807    clang-22
arm64                 randconfig-004-20250807    gcc-14.3.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250807    gcc-15.1.0
csky                  randconfig-002-20250807    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250807    clang-22
hexagon               randconfig-002-20250807    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250807    clang-20
i386        buildonly-randconfig-002-20250807    clang-20
i386        buildonly-randconfig-003-20250807    gcc-12
i386        buildonly-randconfig-004-20250807    gcc-11
i386        buildonly-randconfig-005-20250807    gcc-12
i386        buildonly-randconfig-006-20250807    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250807    clang-22
loongarch             randconfig-002-20250807    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250807    gcc-11.5.0
nios2                 randconfig-002-20250807    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250807    gcc-8.5.0
parisc                randconfig-002-20250807    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250807    gcc-12.5.0
powerpc               randconfig-002-20250807    gcc-10.5.0
powerpc               randconfig-003-20250807    gcc-11.5.0
powerpc64             randconfig-001-20250807    gcc-11.5.0
powerpc64             randconfig-002-20250807    clang-22
powerpc64             randconfig-003-20250807    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250807    gcc-12.5.0
riscv                 randconfig-002-20250807    gcc-8.5.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250807    clang-22
s390                  randconfig-002-20250807    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250807    gcc-14.3.0
sh                    randconfig-002-20250807    gcc-9.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250807    gcc-14.3.0
sparc                 randconfig-002-20250807    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250807    clang-22
sparc64               randconfig-002-20250807    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250807    gcc-12
um                    randconfig-002-20250807    gcc-11
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250807    clang-20
x86_64      buildonly-randconfig-002-20250807    gcc-12
x86_64      buildonly-randconfig-003-20250807    clang-20
x86_64      buildonly-randconfig-004-20250807    clang-20
x86_64      buildonly-randconfig-005-20250807    gcc-11
x86_64      buildonly-randconfig-006-20250807    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250807    gcc-15.1.0
xtensa                randconfig-002-20250807    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

