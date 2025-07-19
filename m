Return-Path: <linux-gpio+bounces-23506-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F238B0AEEA
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jul 2025 11:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88D021C243A1
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jul 2025 09:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243B8230BEB;
	Sat, 19 Jul 2025 09:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnAwy/lZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2FF18C928
	for <linux-gpio@vger.kernel.org>; Sat, 19 Jul 2025 09:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752915775; cv=none; b=h7g12g6qn9eC7GnBVeh8X/rweylm8ZCKMPRPpgVgMuUbFW1PZNJIrEnvbAqrIYDvwGOX1kkMXpwN9DHc37V/0lmsmzw1wGOKVXYplhNPret3robLavr1osdMod/o2jPsEb0sL30KrFC49un10ecXo1a7ctDGDwlq6CAVtt2g9aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752915775; c=relaxed/simple;
	bh=WA1mC62Er6L99m/ipHxzBoe4vze+PSZX8VK5eeeJYrg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d1pZFsix4QYU8xDDHc/q5IvJVMec0U+YXQI6unfPRy64ZOpeA379n+sTrb4N8wzSAWzRjd4ccPIwFiQKMoPab025FyPUC4QK9Ntm/eNJ1e8xFCbu/GqOuDbPm3h60iLIJfZH6ICn+0jcoUglj++J0QqyYrJlUPxrf7hHyBdMmsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnAwy/lZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752915774; x=1784451774;
  h=date:from:to:cc:subject:message-id;
  bh=WA1mC62Er6L99m/ipHxzBoe4vze+PSZX8VK5eeeJYrg=;
  b=GnAwy/lZ2YoDcBL9jqiQttZMCg82ElTuhtO7hSAob1MAY/pgWVKgDBDD
   8++lHAHJtjICaXNBTTe9/6gT9s1sy5mDaYFQmjrboy6t4seUiUSH7rh26
   v4hvVSPW5HKclfvCwT0MwyCFm7N2w0YKLGAlJoJ4sv3HNQh1AjQKgDI3g
   1x/QKp0TT07WEdCWeOq3YAwBivRE40FDadwutmS4EUuLJLu022l6fxgBO
   NWl8yyaIiwC8HocBG9c7ofcu8JCd9eMutRnUUmT3cNVRrARfg9wYzYeIx
   opOAe3MLMIr/40c6XzSpVV4IIcQl8EDdt5bL1H044GMVxZUr/itfVhiM0
   g==;
X-CSE-ConnectionGUID: M6/g9SS4Sl6P1uvJfrkCWw==
X-CSE-MsgGUID: SaIHUjPgT064W4r4n5mxLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="72653001"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="72653001"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 02:02:54 -0700
X-CSE-ConnectionGUID: y9AbaWwURkGogqdIpHE/Lg==
X-CSE-MsgGUID: 4BHOWBDzSsqlVxt/yrDazg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="195490526"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jul 2025 02:02:52 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud3T0-000FNF-0N;
	Sat, 19 Jul 2025 09:02:50 +0000
Date: Sat, 19 Jul 2025 17:02:00 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 ae455b249449ad6306500324aa76f03b46295599
Message-ID: <202507191747.IYjckkwr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: ae455b249449ad6306500324aa76f03b46295599  dt-bindings: gpio: Convert qca,ar7100-gpio to DT schema

elapsed time: 1451m

configs tested: 128
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                          axs101_defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250718    gcc-10.5.0
arc                   randconfig-002-20250718    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                            mps2_defconfig    clang-21
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20250718    gcc-8.5.0
arm                   randconfig-002-20250718    gcc-8.5.0
arm                   randconfig-003-20250718    gcc-8.5.0
arm                   randconfig-004-20250718    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250718    gcc-13.4.0
arm64                 randconfig-002-20250718    gcc-8.5.0
arm64                 randconfig-003-20250718    clang-21
arm64                 randconfig-004-20250718    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250718    gcc-15.1.0
csky                  randconfig-002-20250718    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250718    clang-21
hexagon               randconfig-002-20250718    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250718    gcc-12
i386        buildonly-randconfig-002-20250718    clang-20
i386        buildonly-randconfig-003-20250718    gcc-12
i386        buildonly-randconfig-004-20250718    gcc-11
i386        buildonly-randconfig-005-20250718    gcc-12
i386        buildonly-randconfig-006-20250718    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250718    gcc-15.1.0
loongarch             randconfig-002-20250718    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        mvme16x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250718    gcc-8.5.0
nios2                 randconfig-002-20250718    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250718    gcc-14.3.0
parisc                randconfig-002-20250718    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250718    gcc-9.5.0
powerpc               randconfig-002-20250718    gcc-11.5.0
powerpc               randconfig-003-20250718    clang-17
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250718    clang-18
powerpc64             randconfig-002-20250718    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250718    clang-21
riscv                 randconfig-002-20250718    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250718    clang-21
s390                  randconfig-002-20250718    clang-21
sh                               alldefconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250718    gcc-15.1.0
sh                    randconfig-002-20250718    gcc-15.1.0
sh                           se7751_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250718    gcc-15.1.0
sparc                 randconfig-002-20250718    gcc-11.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250718    gcc-10.5.0
sparc64               randconfig-002-20250718    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250718    gcc-12
um                    randconfig-002-20250718    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250718    clang-20
x86_64      buildonly-randconfig-002-20250718    gcc-12
x86_64      buildonly-randconfig-003-20250718    gcc-12
x86_64      buildonly-randconfig-004-20250718    clang-20
x86_64      buildonly-randconfig-005-20250718    clang-20
x86_64      buildonly-randconfig-006-20250718    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250718    gcc-8.5.0
xtensa                randconfig-002-20250718    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

