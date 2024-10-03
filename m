Return-Path: <linux-gpio+bounces-10770-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF4298E89D
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 05:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D7FE1C225CE
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 03:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6D418054;
	Thu,  3 Oct 2024 03:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZVDOs3H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C930D1C32
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 03:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727924635; cv=none; b=pUH6YT98Hpg0kGujopY+4dRAVYdRBZW8vJ4S5Cw72tyLk+qqT8mYVFLSHHowYcIrT80QAhulDk7B6gQ0VqfPR9Gg/N4Az8q7iY2MJRIKzB/nT/+5J9caJ+SkISQjsHnEyfFlORMV7oVzjBRiNNM9RzwQZ1Dkx0hHpYeRYN0bQSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727924635; c=relaxed/simple;
	bh=UXACKs/+whQu7gaf7z6ul4FiBZdQU7+/KskES2U+Do8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PaA1LRHlji3Sp/ApNh6ei0AsFwqJka2UWLjxv5+im0vAIsQzFfHevpfxo48HplXGZRPJGL5TYqYxJi9L2U11SMkBDn2c0yobiDpOJc5t81FOIYhknYFRq1ZVppgx9C/TrFZqWnM0KZzVZI+nVTCctK86X5WxKEyDoEI4YxZsq+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZVDOs3H; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727924634; x=1759460634;
  h=date:from:to:cc:subject:message-id;
  bh=UXACKs/+whQu7gaf7z6ul4FiBZdQU7+/KskES2U+Do8=;
  b=cZVDOs3HXQ0YvbLyClp4TkPFt9mjv1tQgT5ielx1BlGg1PimHsHGx/ro
   9HifUDcZc0nV6XkTfehXLHWOfaFmV8MyzJTQNBUgQ1N/knHnXP4saDceq
   qbDFCCrSfUWd7VEQkXl6RfsivQnvXpKkZbe/WrxazOqCPU1P41CnbOoOx
   SHdZKdBQBasTMrOcvyNYxRlrp3CmAtaDObu7fKWuCtCpbYAqaMFHFAD/p
   x9hU1SIlwcal0BpY5pOcX7PqBCBbZhafQSPHC8V3OhZEsoTS+jjRfkdDk
   85wzJYJO3dmFtqcsONSTkdPJfxZYbn02LwTqp/Ka/nrGj0bZHLCFniqMr
   Q==;
X-CSE-ConnectionGUID: e7Bz1d3TTKKNhlw8sTQUag==
X-CSE-MsgGUID: 4ir22iA+S/mj6tHzuRWjug==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27261342"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="27261342"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 20:03:53 -0700
X-CSE-ConnectionGUID: LiLZTwD2TH+702uVS6OwAA==
X-CSE-MsgGUID: t8+VEhjIR5ux2A7CC498LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="74236012"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Oct 2024 20:03:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swC85-000Usf-2R;
	Thu, 03 Oct 2024 03:03:49 +0000
Date: Thu, 03 Oct 2024 11:02:51 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 5a431e50e9d4189800be1607eef9deaf95959fc3
Message-ID: <202410031138.12lGbZWg-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 5a431e50e9d4189800be1607eef9deaf95959fc3  gpio: davinci: Fix condition for irqchip registration

elapsed time: 964m

configs tested: 123
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241003    gcc-12
i386        buildonly-randconfig-002-20241003    gcc-12
i386        buildonly-randconfig-003-20241003    gcc-12
i386        buildonly-randconfig-004-20241003    gcc-12
i386        buildonly-randconfig-005-20241003    gcc-12
i386        buildonly-randconfig-006-20241003    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241003    gcc-12
i386                  randconfig-002-20241003    gcc-12
i386                  randconfig-003-20241003    gcc-12
i386                  randconfig-004-20241003    gcc-12
i386                  randconfig-005-20241003    gcc-12
i386                  randconfig-006-20241003    gcc-12
i386                  randconfig-011-20241003    gcc-12
i386                  randconfig-012-20241003    gcc-12
i386                  randconfig-013-20241003    gcc-12
i386                  randconfig-014-20241003    gcc-12
i386                  randconfig-015-20241003    gcc-12
i386                  randconfig-016-20241003    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241003    clang-18
x86_64      buildonly-randconfig-002-20241003    clang-18
x86_64      buildonly-randconfig-003-20241003    clang-18
x86_64      buildonly-randconfig-004-20241003    clang-18
x86_64      buildonly-randconfig-005-20241003    clang-18
x86_64      buildonly-randconfig-006-20241003    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241003    clang-18
x86_64                randconfig-002-20241003    clang-18
x86_64                randconfig-003-20241003    clang-18
x86_64                randconfig-004-20241003    clang-18
x86_64                randconfig-005-20241003    clang-18
x86_64                randconfig-006-20241003    clang-18
x86_64                randconfig-011-20241003    clang-18
x86_64                randconfig-012-20241003    clang-18
x86_64                randconfig-013-20241003    clang-18
x86_64                randconfig-014-20241003    clang-18
x86_64                randconfig-015-20241003    clang-18
x86_64                randconfig-016-20241003    clang-18
x86_64                randconfig-071-20241003    clang-18
x86_64                randconfig-072-20241003    clang-18
x86_64                randconfig-073-20241003    clang-18
x86_64                randconfig-074-20241003    clang-18
x86_64                randconfig-075-20241003    clang-18
x86_64                randconfig-076-20241003    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

