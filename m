Return-Path: <linux-gpio+bounces-26093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD95B55F8C
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Sep 2025 10:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E28E37B5720
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Sep 2025 08:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD03F2C08CB;
	Sat, 13 Sep 2025 08:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBBkpbOB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3D428FD
	for <linux-gpio@vger.kernel.org>; Sat, 13 Sep 2025 08:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757753174; cv=none; b=fKNKUryJXJ+AYkQlZNG87yafQJ3C2BygAtBwctm1QZy4OR/dw8tYPY/U3EeUTLIjKanLr8lElyAonVBHas3D9iR/Yx03m2aKxqKQR1zY5HYqh92WWZccbQ34/rHvEDeBqf8/Mx4R3hrIWTfUHFKEuxykIVtKW/dGT6qbyG2KgFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757753174; c=relaxed/simple;
	bh=U5zXcsA3IJUItJRNKsQ3MuBRV7XFjMv6lTNi6AQsboM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mya7XXwy0X1iMPUQ6eJZhcYyBb1wduccR7VIB+XxUtkM5c35BkwZW1PasTmHgNlT18cLUyENF7SfHEDwl7AY8EJVeKcglNTtxwHnwKY0wVNbInfaDQ3JwF0erg8U62fad5UX8WlJsAWUJA4VUxyDUAYTJjEffPLvSjPgNDA7GR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBBkpbOB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757753172; x=1789289172;
  h=date:from:to:cc:subject:message-id;
  bh=U5zXcsA3IJUItJRNKsQ3MuBRV7XFjMv6lTNi6AQsboM=;
  b=aBBkpbOB3+992oq57BgwN4Vtgb0ok+VX+85d00HWzVRz/mudRsguzS3S
   CebJL9AH/oUEiDEtj/p/6oWMKuUAQd9RUWDlPz10rFrLv8XTzWd7jEmrv
   NemHtcr0V/jbbiP1KHpjI1006wE9g30P6QlKePIn1wLlYsUb8J180izSI
   OrvnwmfbDdhtwKmWn2JLb9NYbsmiTOvjQtcEotCb8oE87RcBji+OK0iS8
   AGp7sIihbhHGSwR0cwdaoNJk8AEXcaXe3Dr9KenA0UUsGHZxDWkw7T8WY
   ae00f7praDxSD27TH70/U9O/2rfonf+R1Z17P6W2hdqAIOH02KYt4saJ1
   Q==;
X-CSE-ConnectionGUID: rD/1d4l0Q6a55AD1VRkFeA==
X-CSE-MsgGUID: 4Y5mhFJWR+O5UU5PfOq1lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="60156530"
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="60156530"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 01:46:12 -0700
X-CSE-ConnectionGUID: Lax8bcOvQ1+a8ZFLJjph/Q==
X-CSE-MsgGUID: YrukRga+S86rKKTJL6Tbbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="173772443"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 13 Sep 2025 01:46:11 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxLtZ-0001QS-0a;
	Sat, 13 Sep 2025 08:46:09 +0000
Date: Sat, 13 Sep 2025 16:45:17 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 9b90afa6d613b66ec4e74ae75f9bfa5baf386ecd
Message-ID: <202509131607.Gutfim5w-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 9b90afa6d613b66ec4e74ae75f9bfa5baf386ecd  gpio: move gpio-mmio-specific fields out of struct gpio_chip

elapsed time: 1446m

configs tested: 124
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250912    gcc-10.5.0
arc                   randconfig-002-20250912    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   milbeaut_m10v_defconfig    clang-19
arm                   randconfig-001-20250912    clang-22
arm                   randconfig-002-20250912    gcc-14.3.0
arm                   randconfig-003-20250912    clang-22
arm                   randconfig-004-20250912    gcc-10.5.0
arm                           sama5_defconfig    gcc-15.1.0
arm                        spear6xx_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250912    clang-20
arm64                 randconfig-002-20250912    clang-16
arm64                 randconfig-003-20250912    clang-22
arm64                 randconfig-004-20250912    clang-19
csky                             alldefconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250912    gcc-15.1.0
csky                  randconfig-002-20250912    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250912    clang-22
hexagon               randconfig-002-20250912    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20250912    gcc-14
i386        buildonly-randconfig-002-20250912    clang-20
i386        buildonly-randconfig-003-20250912    gcc-13
i386        buildonly-randconfig-004-20250912    clang-20
i386        buildonly-randconfig-005-20250912    gcc-14
i386        buildonly-randconfig-006-20250912    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250912    gcc-15.1.0
loongarch             randconfig-002-20250912    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          atari_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250912    gcc-11.5.0
nios2                 randconfig-002-20250912    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250912    gcc-14.3.0
parisc                randconfig-002-20250912    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250912    gcc-8.5.0
powerpc               randconfig-002-20250912    clang-22
powerpc               randconfig-003-20250912    clang-17
powerpc64             randconfig-001-20250912    gcc-12.5.0
powerpc64             randconfig-002-20250912    clang-22
powerpc64             randconfig-003-20250912    clang-19
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250912    clang-16
riscv                 randconfig-002-20250912    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250912    gcc-10.5.0
s390                  randconfig-002-20250912    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                        edosk7705_defconfig    gcc-15.1.0
sh                    randconfig-001-20250912    gcc-15.1.0
sh                    randconfig-002-20250912    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250912    gcc-8.5.0
sparc                 randconfig-002-20250912    gcc-13.4.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250912    gcc-8.5.0
sparc64               randconfig-002-20250912    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250912    clang-22
um                    randconfig-002-20250912    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20250912    gcc-14
x86_64      buildonly-randconfig-002-20250912    gcc-14
x86_64      buildonly-randconfig-003-20250912    clang-20
x86_64      buildonly-randconfig-004-20250912    clang-20
x86_64      buildonly-randconfig-005-20250912    clang-20
x86_64      buildonly-randconfig-006-20250912    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250912    gcc-9.5.0
xtensa                randconfig-002-20250912    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

