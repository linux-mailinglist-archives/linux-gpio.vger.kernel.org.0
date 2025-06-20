Return-Path: <linux-gpio+bounces-21919-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E61AE172C
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 11:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D0D21675BC
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 09:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D157827FB14;
	Fri, 20 Jun 2025 09:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVQ+H02l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E31723312D
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 09:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750410594; cv=none; b=mgSRhnCupw7EiMEWUaCSqDkyPCT7f+0PdOEzEUFwwS/c1enItXWhJLl4ryGMkNGHW/Y3TeQypfSjYDmUpy4ol5n7/enpYZKVA5k0WBH05qg6LYdwJ5OsXWYhzyfSXdO3K44op2TzQO5cadcNzQDbZdgEq+qZr1wDEVstqw7b1Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750410594; c=relaxed/simple;
	bh=G44e59JFAUcxsggaBubt3RnoIGwAc0VQbTd0KzQhQ/U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pZPS5on1H0kM6S3JaypGTz/dcx7dEX7bx6+zRKUIw6eo1prROAZk2RKmw9IiLGUL8rpzvIwcJtwQ6ivujX/T/jZ2u5zf0SfS7q6ucsE3gEg7uvyqmwXZoOcCZ2uYSOaYXHDHvJmB1lSUa5Yp6PxKzp6B9wM8psBCZqqiJfsLuMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVQ+H02l; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750410593; x=1781946593;
  h=date:from:to:cc:subject:message-id;
  bh=G44e59JFAUcxsggaBubt3RnoIGwAc0VQbTd0KzQhQ/U=;
  b=BVQ+H02lvu4K0KfPy/7pIUUS0jFCUVF9255tMpPMU5MWJmvMolE7bLlP
   836CAhzqyrXgDFzAT9pnQYIgTYxKgvDaqCAwG3eIjadDY1TursserPJt4
   IgJmVgir2D2uzjqJF4nG77UEaT9ua4A+h2nZelBAmWPNDTxjw+3Pf7Vzm
   xbIhzFpgJ3Av8ucWervZ99RVUyECM7M0tyYb8KHNNmnoA4fTvl99H5ASx
   lqe1F7qUbYUEERoD9A7vm7Hf0/zUg7AO7GQmV0KQmvjXcynn3P4BZDrzd
   7kY3LS3BOSfWidk/JINCbRbLyUbQRpV6CbVtiDrmjIcitcx1SYrXGn5gX
   Q==;
X-CSE-ConnectionGUID: VY/iSahRQbaBB+0Q5If6eg==
X-CSE-MsgGUID: CWb6/J5URhSzcwMNSZDdjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52595835"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="52595835"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 02:09:52 -0700
X-CSE-ConnectionGUID: rUaITj/GTAWN5JHsml4Rcg==
X-CSE-MsgGUID: 0XreWr9vSumy15LhCpEhvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="150456731"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Jun 2025 02:09:51 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSXkr-000LYQ-1x;
	Fri, 20 Jun 2025 09:09:49 +0000
Date: Fri, 20 Jun 2025 17:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 62be3d6e481122f02364993fee8322a681072918
Message-ID: <202506201702.M0kZKtzH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 62be3d6e481122f02364993fee8322a681072918  Merge tag 'gpio-mmio-bgpiof-no-input-flag-for-v6.17' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into devel

Unverified Warning (likely false positive, kindly check if interested):

    drivers/pinctrl/pinctrl-aw9523.c:658 aw9523_gpio_set_multiple() warn: inconsistent returns '&awi->i2c_lock'.

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-randconfig-161-20250619
    `-- drivers-pinctrl-pinctrl-aw9523.c-aw9523_gpio_set_multiple()-warn:inconsistent-returns-awi-i2c_lock-.

elapsed time: 1452m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250619    gcc-15.1.0
arc                   randconfig-002-20250619    gcc-15.1.0
arc                    vdk_hs38_smp_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                             mxs_defconfig    clang-21
arm                   randconfig-001-20250619    clang-21
arm                   randconfig-002-20250619    gcc-8.5.0
arm                   randconfig-003-20250619    gcc-8.5.0
arm                   randconfig-004-20250619    gcc-10.5.0
arm                       versatile_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250619    gcc-8.5.0
arm64                 randconfig-002-20250619    gcc-9.5.0
arm64                 randconfig-003-20250619    gcc-10.5.0
arm64                 randconfig-004-20250619    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250619    gcc-11.5.0
csky                  randconfig-002-20250619    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250619    clang-21
hexagon               randconfig-002-20250619    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250619    gcc-12
i386        buildonly-randconfig-002-20250619    gcc-12
i386        buildonly-randconfig-003-20250619    clang-20
i386        buildonly-randconfig-004-20250619    clang-20
i386        buildonly-randconfig-005-20250619    clang-20
i386        buildonly-randconfig-006-20250619    clang-20
i386                                defconfig    clang-20
loongarch                        alldefconfig    gcc-15.1.0
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250619    gcc-15.1.0
loongarch             randconfig-002-20250619    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          amiga_defconfig    gcc-15.1.0
m68k                        stmark2_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    clang-21
mips                           ip32_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250619    gcc-8.5.0
nios2                 randconfig-002-20250619    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                  or1klitex_defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250619    gcc-11.5.0
parisc                randconfig-002-20250619    gcc-8.5.0
powerpc                     akebono_defconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     mpc83xx_defconfig    clang-21
powerpc               randconfig-001-20250619    gcc-9.3.0
powerpc               randconfig-002-20250619    clang-21
powerpc               randconfig-003-20250619    gcc-10.5.0
powerpc                     redwood_defconfig    clang-21
powerpc                  storcenter_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250619    gcc-11.5.0
powerpc64             randconfig-002-20250619    clang-21
powerpc64             randconfig-003-20250619    gcc-10.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250619    gcc-11.5.0
riscv                 randconfig-002-20250619    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250619    clang-19
s390                  randconfig-002-20250619    gcc-13.2.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250619    gcc-9.3.0
sh                    randconfig-002-20250619    gcc-9.3.0
sh                          rsk7269_defconfig    gcc-15.1.0
sh                          sdk7780_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250619    gcc-14.3.0
sparc                 randconfig-002-20250619    gcc-10.3.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250619    gcc-13.3.0
sparc64               randconfig-002-20250619    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250619    clang-19
um                    randconfig-002-20250619    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250619    clang-20
x86_64      buildonly-randconfig-002-20250619    gcc-12
x86_64      buildonly-randconfig-003-20250619    clang-20
x86_64      buildonly-randconfig-004-20250619    gcc-12
x86_64      buildonly-randconfig-005-20250619    clang-20
x86_64      buildonly-randconfig-006-20250619    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250619    gcc-9.3.0
xtensa                randconfig-002-20250619    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

