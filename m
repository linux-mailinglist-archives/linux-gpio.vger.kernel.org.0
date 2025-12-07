Return-Path: <linux-gpio+bounces-29348-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C43CAB3F9
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Dec 2025 12:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6035B305B90E
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Dec 2025 11:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8770A2C1594;
	Sun,  7 Dec 2025 11:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hAkkg25r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9537153598
	for <linux-gpio@vger.kernel.org>; Sun,  7 Dec 2025 11:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765108422; cv=none; b=ldHmzZ4yXJecjHTSA4kmb0UA4GEeMuZiTlD4iwVY/dzsq7w4REZnYoOTFgAuRC0U6ScqGftDNF5uzaAN8HHNinOZSnkgvdA5L7PTWXON3yiNkWQ/+pT1WaKPDDaKoMbZNAEYf86gZkW8fE05lPtIVCNDJ43LTFRsjAsa453NlrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765108422; c=relaxed/simple;
	bh=1PaDuj0NDGd13BD0c1a6OPvlDS53OI0DVZ4df8o4zPU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YwdpHQ59hHZDvB/1tJX/c8C0pXNyW8BHVmbHH9TdXj937MKARqxI/BiwvEWMkvvh0EOKK17iTek4qL8E5Hjbz0vIV4ytR0EVi4eki3B5dcpzbQZ/c9Ta/6YnJAtXkAT4qsEdwMpbvyIGZ2CdAlPgcbvsqh5jZc4lcAXp/Um/sk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hAkkg25r; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765108420; x=1796644420;
  h=date:from:to:cc:subject:message-id;
  bh=1PaDuj0NDGd13BD0c1a6OPvlDS53OI0DVZ4df8o4zPU=;
  b=hAkkg25rr86X9GiqkLifc6gVJwdCcDEQz+mIw0xZQnhsEwlF7LIXzjWK
   UYmDW/t6ua89Ip6yqjh1qqJkA0BrubteV/9iMJxRIuUR4ujv5fPTnIfch
   o4BvVbFtuR4IPwm/EhFXVTgwbNQBJwwto6WBQxWNp2bZBywxxeUIYhBf4
   VAbdCeJsdNx4LOuCdwTUg755dfW6pj2xM7quJJcUKyDQ8EmyuNrtPfT7S
   fRZ5hJZ0AwARn0cZP54z29YFuPaLbOH4XG4Knj9a0FsD7rPzeVai/RvPF
   dJKNQrUwpunnlX77TKpQ/xPtGAWIpXEyGQN+salNjBxSIHx1ZT8vVdNcm
   Q==;
X-CSE-ConnectionGUID: YoOk3GmdTLysmP8x6pnYgw==
X-CSE-MsgGUID: DXSh2TV8TBWUUsIutgKsTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="67238261"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67238261"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 03:53:40 -0800
X-CSE-ConnectionGUID: I+rVFV9cS4qLzS70eie16g==
X-CSE-MsgGUID: uAnknCjZR1Cf68B+1DUrWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="194745062"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Dec 2025 03:53:40 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSDKb-00000000JD3-0iaI;
	Sun, 07 Dec 2025 11:53:37 +0000
Date: Sun, 07 Dec 2025 19:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 dd44d4d0c55a4ecf5eabf7856f96ed47e0684780
Message-ID: <202512071944.N91zcBeM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: dd44d4d0c55a4ecf5eabf7856f96ed47e0684780  gpio: tb10x: fix OF_GPIO dependency

elapsed time: 1453m

configs tested: 130
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251207    gcc-13.4.0
arc                   randconfig-002-20251207    gcc-8.5.0
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20251207    gcc-15.1.0
arm                   randconfig-002-20251207    clang-22
arm                   randconfig-003-20251207    gcc-8.5.0
arm                   randconfig-004-20251207    gcc-12.5.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251207    clang-22
arm64                 randconfig-002-20251207    gcc-10.5.0
arm64                 randconfig-003-20251207    clang-18
arm64                 randconfig-004-20251207    gcc-13.4.0
csky                             allmodconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251207    gcc-15.1.0
csky                  randconfig-002-20251207    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251207    clang-22
hexagon               randconfig-002-20251207    clang-22
i386                             allmodconfig    gcc-14
i386                             allyesconfig    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251207    clang-20
i386                  randconfig-002-20251207    gcc-14
i386                  randconfig-003-20251207    clang-20
i386                  randconfig-004-20251207    gcc-14
i386                  randconfig-005-20251207    clang-20
i386                  randconfig-011-20251207    gcc-13
i386                  randconfig-012-20251207    clang-20
i386                  randconfig-013-20251207    clang-20
i386                  randconfig-014-20251207    gcc-14
i386                  randconfig-015-20251207    clang-20
i386                  randconfig-016-20251207    clang-20
i386                  randconfig-017-20251207    gcc-14
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251207    gcc-14.3.0
loongarch             randconfig-002-20251207    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251207    gcc-11.5.0
nios2                 randconfig-002-20251207    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251207    gcc-8.5.0
parisc                randconfig-002-20251207    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                        cell_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251207    gcc-13.4.0
powerpc               randconfig-002-20251207    gcc-10.5.0
powerpc                     skiroot_defconfig    clang-22
powerpc                        warp_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251207    clang-19
powerpc64             randconfig-002-20251207    gcc-10.5.0
riscv                            alldefconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251207    gcc-13.4.0
riscv                 randconfig-002-20251207    gcc-12.5.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251207    clang-22
s390                  randconfig-002-20251207    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251207    gcc-14.3.0
sh                    randconfig-002-20251207    gcc-14.3.0
sh                   rts7751r2dplus_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251207    gcc-13.4.0
sparc                 randconfig-002-20251207    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251207    gcc-10.5.0
sparc64               randconfig-002-20251207    clang-22
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251207    clang-22
um                    randconfig-002-20251207    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251207    gcc-14
x86_64      buildonly-randconfig-002-20251207    gcc-14
x86_64      buildonly-randconfig-003-20251207    gcc-14
x86_64      buildonly-randconfig-004-20251207    clang-20
x86_64      buildonly-randconfig-005-20251207    clang-20
x86_64      buildonly-randconfig-006-20251207    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251207    clang-20
x86_64                randconfig-002-20251207    gcc-14
x86_64                randconfig-003-20251207    gcc-14
x86_64                randconfig-071-20251207    clang-20
x86_64                randconfig-072-20251207    gcc-14
x86_64                randconfig-073-20251207    clang-20
x86_64                randconfig-074-20251207    gcc-14
x86_64                randconfig-075-20251207    gcc-14
x86_64                randconfig-076-20251207    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251207    gcc-8.5.0
xtensa                randconfig-002-20251207    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

