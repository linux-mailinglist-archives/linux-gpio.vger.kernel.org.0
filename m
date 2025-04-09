Return-Path: <linux-gpio+bounces-18550-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2407CA8215F
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 11:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8158316A4A3
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 09:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEFB25D8E8;
	Wed,  9 Apr 2025 09:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZN3hvs6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EFD155389
	for <linux-gpio@vger.kernel.org>; Wed,  9 Apr 2025 09:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744192409; cv=none; b=Wojj8pFXFJ3aSeSdsF777QacO1HHuwD6/1Ld2lQY7xpBaS1qI/jMnEE8VMgJ/zsnf+Kw3gyKiu3pm318brUlJC9NuoFV6S9880h0vcq+x3hF5xYVKqzkpKV3oeok/R5jp8NtgSA9/FP3FNgahGo/3OLPEfOZhUAsjShxLF6Nk8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744192409; c=relaxed/simple;
	bh=JFnsYUGhKe8ADGFywVRxKE56ncH3AUpHJwKfNGqbyBU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pyq2R2nrusvs6rmnas8cs7wvXrWI68zeYsFrQKWTEfwZcMzEI+geD45v0dA8UXXGzf2V7RbBNOwiwRuEw2wmjsrBEE0LuQUeDWubQIRNXvZcgbD6aaNvcNdmMU4gfxCfhdrSqGVBTnAhCfIzMRojbX412GrzncKffcuVtPK8OPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZN3hvs6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744192407; x=1775728407;
  h=date:from:to:cc:subject:message-id;
  bh=JFnsYUGhKe8ADGFywVRxKE56ncH3AUpHJwKfNGqbyBU=;
  b=kZN3hvs6oHpfcUOkHngiDMmXFTrgd8MkgEfwfz0kaxaWenX5fTFX+Pgn
   MSrcOWWg03573qtn+ap8MSynyIOf491KegVKw+ypnYl5gYOTiW40BAUIy
   rgJFLVmff0xVJcQ44BNCIZH+xBT5bV8mZYb5Vs+5CAmvTMfTvAU1xToGg
   L0UXPV6Jl/5q3H/hAm0MhXAfPVAm60kJPs2QoVxK3XgKiVedcYBqYfrk6
   p2AKClPUC+/10SCY33K04TnDcFBnWCB70Dgbsh2LRLNJMFu4Tv3+auSua
   TRs0jT+GoW5YlwxxdbiCFz0xQsFYtU84jmXrTEKqbq+04VVVJZDvYUSBh
   w==;
X-CSE-ConnectionGUID: 5L3+pj+SSv2AbqjZtM+cbA==
X-CSE-MsgGUID: 8lPZI4e9S4mGYjpudwYsgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45546880"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45546880"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 02:53:26 -0700
X-CSE-ConnectionGUID: ad0ocrFlTb6ZMyy3bvqjpQ==
X-CSE-MsgGUID: 9ZR1hqfHR5e/NPDNXinodA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133750117"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Apr 2025 02:53:26 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2S7X-0008dr-1u;
	Wed, 09 Apr 2025 09:53:23 +0000
Date: Wed, 09 Apr 2025 17:52:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 b8c7a1ac884cc267d1031f8de07f1a689a69fbab
Message-ID: <202504091741.mBQUqQwL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: b8c7a1ac884cc267d1031f8de07f1a689a69fbab  gpiolib: of: Move Atmel HSMCI quirk up out of the regulator comment

elapsed time: 1478m

configs tested: 112
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250408    gcc-14.2.0
arc                   randconfig-002-20250408    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-21
arm                           omap1_defconfig    gcc-14.2.0
arm                   randconfig-001-20250408    clang-21
arm                   randconfig-002-20250408    gcc-10.5.0
arm                   randconfig-003-20250408    clang-17
arm                   randconfig-004-20250408    gcc-6.5.0
arm                        spear3xx_defconfig    clang-17
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250408    clang-21
arm64                 randconfig-002-20250408    gcc-9.5.0
arm64                 randconfig-003-20250408    gcc-9.5.0
arm64                 randconfig-004-20250408    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250408    gcc-14.2.0
csky                  randconfig-002-20250408    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250408    clang-21
hexagon               randconfig-002-20250408    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250408    clang-20
i386        buildonly-randconfig-002-20250408    clang-20
i386        buildonly-randconfig-003-20250408    gcc-12
i386        buildonly-randconfig-004-20250408    gcc-12
i386        buildonly-randconfig-005-20250408    gcc-12
i386        buildonly-randconfig-006-20250408    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250408    gcc-14.2.0
loongarch             randconfig-002-20250408    gcc-13.3.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.2.0
mips                        vocore2_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250408    gcc-13.3.0
nios2                 randconfig-002-20250408    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250408    gcc-6.5.0
parisc                randconfig-002-20250408    gcc-8.5.0
parisc64                         alldefconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                      arches_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250408    gcc-5.5.0
powerpc               randconfig-002-20250408    gcc-9.3.0
powerpc               randconfig-003-20250408    gcc-5.5.0
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250408    clang-21
powerpc64             randconfig-002-20250408    gcc-5.5.0
powerpc64             randconfig-003-20250408    gcc-7.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250408    gcc-9.3.0
riscv                 randconfig-002-20250408    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250408    gcc-8.5.0
s390                  randconfig-002-20250408    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250408    gcc-13.3.0
sh                    randconfig-002-20250408    gcc-13.3.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250408    gcc-10.3.0
sparc                 randconfig-002-20250408    gcc-6.5.0
sparc64               randconfig-001-20250408    gcc-6.5.0
sparc64               randconfig-002-20250408    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250408    clang-21
um                    randconfig-002-20250408    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250408    clang-20
x86_64      buildonly-randconfig-002-20250408    clang-20
x86_64      buildonly-randconfig-003-20250408    clang-20
x86_64      buildonly-randconfig-004-20250408    gcc-12
x86_64      buildonly-randconfig-005-20250408    clang-20
x86_64      buildonly-randconfig-006-20250408    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250408    gcc-6.5.0
xtensa                randconfig-002-20250408    gcc-6.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

