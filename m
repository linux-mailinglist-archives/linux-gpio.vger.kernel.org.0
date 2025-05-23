Return-Path: <linux-gpio+bounces-20517-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D9CAC1F9B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 11:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04FD17BD4AD
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 09:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FBF22652D;
	Fri, 23 May 2025 09:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WE04boJe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2205A226520
	for <linux-gpio@vger.kernel.org>; Fri, 23 May 2025 09:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991797; cv=none; b=jkCITSqJpu3+3jOoZwpZ7XcSWOC7L+HQs/kjCs5vMLHQhLZFxQqEPD5lUu/iTSfU5qQSysJ5LLJVFfeqiQW5Ea696bj95+C7IxjU79Wu6kGaYNPOBwbty0KNnKCp5DNZwwAzSWrihZI2pqIERjApIx5DGedb+dbeY1cC1do9ViA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991797; c=relaxed/simple;
	bh=sAaPndC30bm/P/mHMNKrHjxKBA9W9wVWKBpnu4Y0EwE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mqDTuXCy2nMvOFr6B3SY1b5wgawOnD5H5BKP0+VCssiRbruDTvHraA3IYALGRB/X7WHUwaPi8BvY3rgj4wTUbCiSIj37BlzUYrMURWqzWGvwSQYk/RGCEgiTGdnhSXpvzl/4Fwf/AoGFZ0c5tu+6hJm6zjhLxmtgFZxih8mzn98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WE04boJe; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747991795; x=1779527795;
  h=date:from:to:cc:subject:message-id;
  bh=sAaPndC30bm/P/mHMNKrHjxKBA9W9wVWKBpnu4Y0EwE=;
  b=WE04boJexJN2gxET8LTVdPYFzmAZlO6t0qLn9iwElEfbZBOMa3rAh/Eb
   cwtPADckYPHtGv8E6Mz1OyXZ7XDCsaqUAPwIrClSfkTfERobGA8yDkNXm
   BBTRGrkPZxiTqR7LSzMnsw+To3JGQXjYlpQ+99P2OQCk+JNOEpo9Av2Ct
   t1tpUj5d9xuS+RNAEpvAaYx39Snq4YOW+T7NWSUKkQvRE/wVZIASzHJzo
   traeUFl4KDopX0pAIqoGSUFNuva7GosDu+Kf2oUN4d59Ywui5MyPwzwkR
   8OfZ8hAiXNwifg6Y1FzkG+ILxH5hijvSEcAawQX1ti6kueYyqdS7TRedZ
   w==;
X-CSE-ConnectionGUID: zejthP5ORTSL+NyVQ3q2mQ==
X-CSE-MsgGUID: NyLVDSrtSmy7f8KB0wYL4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49159905"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="49159905"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 02:16:34 -0700
X-CSE-ConnectionGUID: c2RtQeyzQcWVQZ8jvz6q5g==
X-CSE-MsgGUID: kMUZ+DvuTyWsUSuwIYtQcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="141621988"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 May 2025 02:16:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIOVy-000QFG-3D;
	Fri, 23 May 2025 09:16:30 +0000
Date: Fri, 23 May 2025 17:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 8b8ef309093ff196967a21ee51a9cdb404a13bf6
Message-ID: <202505231757.XYrNZohk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 8b8ef309093ff196967a21ee51a9cdb404a13bf6  gpio: timberdale: select GPIOLIB_IRQCHIP

elapsed time: 1452m

configs tested: 118
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250522    gcc-15.1.0
arc                   randconfig-002-20250522    gcc-15.1.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-21
arm                      jornada720_defconfig    clang-21
arm                   randconfig-001-20250522    clang-21
arm                   randconfig-002-20250522    clang-21
arm                   randconfig-003-20250522    clang-18
arm                   randconfig-004-20250522    gcc-7.5.0
arm                         s5pv210_defconfig    gcc-14.2.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250522    clang-21
arm64                 randconfig-002-20250522    gcc-7.5.0
arm64                 randconfig-003-20250522    clang-21
arm64                 randconfig-004-20250522    gcc-5.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250522    gcc-15.1.0
csky                  randconfig-002-20250522    gcc-15.1.0
hexagon                          alldefconfig    clang-21
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250522    clang-17
hexagon               randconfig-002-20250522    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250522    clang-20
i386        buildonly-randconfig-002-20250522    gcc-12
i386        buildonly-randconfig-003-20250522    gcc-12
i386        buildonly-randconfig-004-20250522    gcc-12
i386        buildonly-randconfig-005-20250522    gcc-12
i386        buildonly-randconfig-006-20250522    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250522    gcc-15.1.0
loongarch             randconfig-002-20250522    gcc-15.1.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250522    gcc-9.3.0
nios2                 randconfig-002-20250522    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250522    gcc-6.5.0
parisc                randconfig-002-20250522    gcc-12.4.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc                      katmai_defconfig    clang-21
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250522    gcc-9.3.0
powerpc               randconfig-002-20250522    clang-21
powerpc               randconfig-003-20250522    gcc-7.5.0
powerpc                         wii_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250522    clang-21
powerpc64             randconfig-002-20250522    gcc-10.5.0
powerpc64             randconfig-003-20250522    gcc-7.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250522    gcc-9.3.0
riscv                 randconfig-002-20250522    clang-18
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250522    clang-19
s390                  randconfig-002-20250522    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250522    gcc-13.3.0
sh                    randconfig-002-20250522    gcc-13.3.0
sh                           se7343_defconfig    gcc-14.2.0
sh                   sh7724_generic_defconfig    gcc-14.2.0
sh                             shx3_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250522    gcc-14.2.0
sparc                 randconfig-002-20250522    gcc-6.5.0
sparc64               randconfig-001-20250522    gcc-14.2.0
sparc64               randconfig-002-20250522    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250522    gcc-12
um                    randconfig-002-20250522    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250522    clang-20
x86_64      buildonly-randconfig-002-20250522    gcc-12
x86_64      buildonly-randconfig-003-20250522    gcc-12
x86_64      buildonly-randconfig-004-20250522    gcc-12
x86_64      buildonly-randconfig-005-20250522    gcc-12
x86_64      buildonly-randconfig-006-20250522    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250522    gcc-14.2.0
xtensa                randconfig-002-20250522    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

