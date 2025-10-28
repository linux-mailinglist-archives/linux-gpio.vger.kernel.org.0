Return-Path: <linux-gpio+bounces-27769-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4C3C15360
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 15:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 816A34E5F92
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 14:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85945337688;
	Tue, 28 Oct 2025 14:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDuwgRUA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21AB1A9B46
	for <linux-gpio@vger.kernel.org>; Tue, 28 Oct 2025 14:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761662647; cv=none; b=MFRUTviYV1bqD/JhmZz6ZSJ6Fsfp70yBvUxJY3aKL9dnKPTLPvIKSxGuoXRwK5HqRpfqUiXPUq9OQ4UvZ9Z6wYmH58VL41JnnUDsDtJ9MU57eJvpZwNVOvEbNT1uINFOw6B2/UYxOz89ckRDIHm6BZyTw/hVhh8VZyC3Hul/2sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761662647; c=relaxed/simple;
	bh=RgOI5C89UPcbAe9zTI2lqsb7nsrtf5XOA6NjmpdkCc4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rQoPYBN6wza1QpE9IhX86MA8B6At6wfExjNuWLUBbxRjkFW+MLwfiNJWSfvk5jlL9yBCjieMJjMlUpWqzXiTksoPzaiv1Mp72UIJYRY+9RXZPXNXghXoM7SJgM3IAMhK6gCzsy5coNcyW0Ha7b7PVDu5cDEc+Fy3QRf5L6R9kRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDuwgRUA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761662646; x=1793198646;
  h=date:from:to:cc:subject:message-id;
  bh=RgOI5C89UPcbAe9zTI2lqsb7nsrtf5XOA6NjmpdkCc4=;
  b=aDuwgRUAVfR21omguv0quXsnf04LhcFzA1uPYf4yonTLDNm0ptIaC+sB
   H7yZDCR35ef2MKVgBL6R6hOdVF//zcR8beFT8mydfXR/OfWnmtGaufUY7
   x73s0+GBE6xFdsij36empay2bCom7UNnYxT5dPnRjLTIdmXo/WhecRCPC
   sb7uK7hN14FvG+VZeQZPNOF/KWdeb1bPim9Ws1yCPgzO5HhMZeqYpWhIF
   Ho+pqZR7OZyfPrec/NjlTb5KgFiJswqC+wchRghRXiyx7SO2tIb6cjNcw
   5GpUEDfB/vlI0WxCi4P5+wgLX2LAqNsG26EYTmF+1eokWDrUoVGChcFVI
   g==;
X-CSE-ConnectionGUID: ROFYPFKVTNSJDjZZ3lPHxA==
X-CSE-MsgGUID: vRyMkHU9TIGaErj2TTvuEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67406393"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="67406393"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 07:44:05 -0700
X-CSE-ConnectionGUID: 94VOsyBGSES/j6MDJfhRIg==
X-CSE-MsgGUID: K+oujqGiTS+RfN4vJiF5OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="186112465"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 Oct 2025 07:44:03 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDkvZ-000JFi-1g;
	Tue, 28 Oct 2025 14:44:01 +0000
Date: Tue, 28 Oct 2025 22:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 3cde66094575a5b1310a7631d28761bd3dfcea63
Message-ID: <202510282229.8qrhjL1w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 3cde66094575a5b1310a7631d28761bd3dfcea63  gpio: loongson-64bit: Switch to dynamic allocate GPIO base in byte mode

elapsed time: 1464m

configs tested: 107
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251028    gcc-8.5.0
arc                   randconfig-002-20251028    gcc-13.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                         mv78xx0_defconfig    clang-19
arm                          pxa3xx_defconfig    clang-22
arm                   randconfig-001-20251028    clang-22
arm                   randconfig-002-20251028    clang-22
arm                   randconfig-003-20251028    clang-22
arm                   randconfig-004-20251028    gcc-8.5.0
arm                         s5pv210_defconfig    gcc-15.1.0
arm                           stm32_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251028    clang-22
arm64                 randconfig-002-20251028    clang-22
arm64                 randconfig-003-20251028    gcc-11.5.0
arm64                 randconfig-004-20251028    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251028    gcc-15.1.0
csky                  randconfig-002-20251028    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251028    clang-22
hexagon               randconfig-002-20251028    clang-17
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251027    gcc-13
i386        buildonly-randconfig-002-20251027    clang-20
i386        buildonly-randconfig-003-20251027    clang-20
i386        buildonly-randconfig-004-20251027    gcc-14
i386        buildonly-randconfig-005-20251027    clang-20
i386        buildonly-randconfig-006-20251027    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251028    gcc-12.5.0
loongarch             randconfig-002-20251028    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         rt305x_defconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                            allyesconfig    gcc-11.5.0
nios2                 randconfig-001-20251028    gcc-8.5.0
nios2                 randconfig-002-20251028    gcc-9.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251028    gcc-9.5.0
parisc                randconfig-002-20251028    gcc-8.5.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                 mpc837x_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251028    gcc-15.1.0
powerpc               randconfig-002-20251028    gcc-11.5.0
powerpc               randconfig-003-20251028    gcc-8.5.0
powerpc64             randconfig-001-20251028    clang-22
powerpc64             randconfig-002-20251028    clang-22
powerpc64             randconfig-003-20251028    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                           se7750_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251028    gcc-14
x86_64      buildonly-randconfig-002-20251028    gcc-14
x86_64      buildonly-randconfig-003-20251028    clang-20
x86_64      buildonly-randconfig-004-20251028    clang-20
x86_64      buildonly-randconfig-005-20251028    clang-20
x86_64      buildonly-randconfig-006-20251028    clang-20
x86_64                              defconfig    gcc-14
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

