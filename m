Return-Path: <linux-gpio+bounces-29734-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2FCCCB497
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 11:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B0BD3003F99
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 10:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E199B2749CB;
	Thu, 18 Dec 2025 10:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q312zxK8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B36D1A5BB4
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 10:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766052057; cv=none; b=msIEkNEyCK11kzk5k0FtgYB18+WhJ5NkLb+jNxAN0+5VQoLOwKCQmbZUW1UBvm/21n0vGPTtFNGFPIAKM/P1ogo3PfVzcO0iY0+0LqPBv/TlQiPrDElLCYos84MgPEmG+XBP/MlqvJXIo6IpYwd/E2TrQBcB+lBdXspoZQG47XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766052057; c=relaxed/simple;
	bh=lB9GwEzSMXGghb+NcdQECpHsst6SycrdotjLjzSCwNg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lpGEcihyMrnqlM21iUfLFF0fbEaZ8gMl+AtcndM8PJpdaaokdIZ7OM7RCjYWk//y2Og3jwD8sbeN6NACJ2/aXqqVJCxJPLS+PZAUWBCPjHk0slv8RmmKpLcI02ORRJBmSWnpnv7CKmp7nqfiMLrUEG2cgQTYKyUm3U6TFwY4nU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q312zxK8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766052056; x=1797588056;
  h=date:from:to:cc:subject:message-id;
  bh=lB9GwEzSMXGghb+NcdQECpHsst6SycrdotjLjzSCwNg=;
  b=Q312zxK8sBYmB60X5ZZd7ypJjgHzKxUk3OdFBhkhx49IJl5ln3GuN67E
   Cha2GVry6v9187ZQcfZah+SCsDqY81Rr6xWPOYz0lrZ3mlriPfmC65EQl
   d2kgKtmTgJedhFysy6DyJ97OufyddgAdcLA6tn2CFqBIO37CW0u++r766
   43MfvOAFKmge2/l8vJDX0C3IMSHr/ulPkBbZhx2HoZJZjyJeJis9OaLqe
   blNAlT17UvOwZMsafN+avaQb7CxaUNXjMMIyJApChImF34afPxF6idFtS
   x7LDdHjd5aUi1dLwC2lcpa1UHM6ikVry0qetfB7qel1FigEYV0/i7DyyZ
   g==;
X-CSE-ConnectionGUID: qFkXHSitSeK6YjVhGyP6pA==
X-CSE-MsgGUID: l6G0EJz9Q+GLJ5QqAP+4oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="93476456"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="93476456"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 02:00:55 -0800
X-CSE-ConnectionGUID: twNL7EboQKanCrRmcUhqvw==
X-CSE-MsgGUID: KO2CxxumSgifNoUkWjShYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="235971964"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Dec 2025 02:00:54 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWAoV-000000001v7-26iO;
	Thu, 18 Dec 2025 10:00:51 +0000
Date: Thu, 18 Dec 2025 18:00:16 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:at24/for-next] BUILD SUCCESS
 7a29af24b288eace769ccd9eb8044742dfbd5944
Message-ID: <202512181803.aMftMjHb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git at24/for-next
branch HEAD: 7a29af24b288eace769ccd9eb8044742dfbd5944  eeprom: at24: use dev_err_probe() consistently

elapsed time: 1457m

configs tested: 175
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251218    clang-22
arc                   randconfig-002-20251218    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.1.0
arm                         lpc32xx_defconfig    clang-22
arm                         orion5x_defconfig    clang-22
arm                   randconfig-001-20251218    clang-22
arm                   randconfig-002-20251218    clang-22
arm                   randconfig-003-20251218    clang-22
arm                   randconfig-004-20251218    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251218    gcc-14
i386        buildonly-randconfig-002-20251218    gcc-14
i386        buildonly-randconfig-003-20251218    gcc-14
i386        buildonly-randconfig-004-20251218    gcc-14
i386        buildonly-randconfig-005-20251218    gcc-14
i386        buildonly-randconfig-006-20251218    gcc-14
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251218    gcc-12
i386                  randconfig-002-20251218    gcc-12
i386                  randconfig-003-20251218    gcc-12
i386                  randconfig-004-20251218    gcc-12
i386                  randconfig-005-20251218    gcc-12
i386                  randconfig-006-20251218    gcc-12
i386                  randconfig-007-20251218    gcc-12
i386                  randconfig-011-20251218    clang-20
i386                  randconfig-012-20251218    clang-20
i386                  randconfig-013-20251218    clang-20
i386                  randconfig-014-20251218    clang-20
i386                  randconfig-015-20251218    clang-20
i386                  randconfig-016-20251218    clang-20
i386                  randconfig-017-20251218    clang-20
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
m68k                           sun3_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251218    gcc-8.5.0
parisc                randconfig-002-20251218    gcc-8.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     ppa8548_defconfig    clang-22
powerpc               randconfig-001-20251218    gcc-8.5.0
powerpc               randconfig-002-20251218    gcc-8.5.0
powerpc64             randconfig-001-20251218    gcc-8.5.0
powerpc64             randconfig-002-20251218    gcc-8.5.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251218    gcc-8.5.0
riscv                 randconfig-002-20251218    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251218    gcc-8.5.0
s390                  randconfig-002-20251218    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                          r7780mp_defconfig    clang-22
sh                    randconfig-001-20251218    gcc-8.5.0
sh                    randconfig-002-20251218    gcc-8.5.0
sh                           se7750_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                       sparc32_defconfig    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251218    gcc-14
x86_64      buildonly-randconfig-002-20251218    gcc-14
x86_64      buildonly-randconfig-003-20251218    gcc-14
x86_64      buildonly-randconfig-004-20251218    gcc-14
x86_64      buildonly-randconfig-005-20251218    gcc-14
x86_64      buildonly-randconfig-006-20251218    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251218    clang-20
x86_64                randconfig-002-20251218    clang-20
x86_64                randconfig-003-20251218    clang-20
x86_64                randconfig-004-20251218    clang-20
x86_64                randconfig-005-20251218    clang-20
x86_64                randconfig-006-20251218    clang-20
x86_64                randconfig-011-20251218    gcc-14
x86_64                randconfig-012-20251218    gcc-14
x86_64                randconfig-013-20251218    gcc-14
x86_64                randconfig-014-20251218    gcc-14
x86_64                randconfig-015-20251218    gcc-14
x86_64                randconfig-016-20251218    gcc-14
x86_64                randconfig-071-20251218    gcc-12
x86_64                randconfig-072-20251218    gcc-12
x86_64                randconfig-073-20251218    gcc-12
x86_64                randconfig-074-20251218    gcc-12
x86_64                randconfig-075-20251218    gcc-12
x86_64                randconfig-076-20251218    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

