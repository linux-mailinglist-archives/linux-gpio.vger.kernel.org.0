Return-Path: <linux-gpio+bounces-29758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C957CCF87A
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 12:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 632BA301411F
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 11:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F104306B08;
	Fri, 19 Dec 2025 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bnfmagJI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D0F306490
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 11:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766142494; cv=none; b=VdPhWskCVgN6ZY0dFKIQu46NRTM4Mx/ABU/2t1DFpAUtx6hqpGM9S2q44yWBCeVZIlRu9Vvzl9Yitn271Ck7/hh12EyJJWHi/iDyZDmSGadSK7o111X2gdu460bRJfI+2sF2T6IpNR4v8gGjql/UEEdtrYHDkN/tD+IqLEyhL8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766142494; c=relaxed/simple;
	bh=MRHh9AzoUQrM9lDMgse/IPF0i42vRccG6vRvkBaUuqs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ciUPvkMzvb3iaK+S8DLhvlFXhBDSQCxJBZpWM3VO3lYzYDlLSXNGXNTTUSwEEvnjDkANqSkx1cSkt+zxhLP016Vyil4Z1uIhyMUDnhbNMHJd5Z7PTUB5AWxrUigpb+Y6ouYDk1ODFzEtFOYScR+UEE0/PtWu5NR0lq+6gJ6fpBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bnfmagJI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766142492; x=1797678492;
  h=date:from:to:cc:subject:message-id;
  bh=MRHh9AzoUQrM9lDMgse/IPF0i42vRccG6vRvkBaUuqs=;
  b=bnfmagJIsbdsZZcw6XDUA2nQBEiFd8ns/Z7bTRdRc4+Oim4NwvEJ3XBi
   is2kM7kWQ1RpQ9Zaz9KTrcoK81v8dfBL3GzdiP0xDBJAt4q+r3sMpqzdK
   yi/ZBGI1nbEelBWRC4ebmbmF+aQR2NB8ZSIi/1yypx2UnuVRzzDz93K1S
   XX3wSi3ZfmxdsyBGFA25ggYat2aeMwQ+7PNznCC8tNJlY7jZumOSZUFl/
   8t6V/wJgchkzr3mNDKxwdI7H6tOruGvld/VKJlvJ0S2ulYDmzKET8VUFh
   UrJjobHQL29SS45cYUmw672PgOEUs8ARNpEYYmy6dUbylDGtGMfFEDmgJ
   w==;
X-CSE-ConnectionGUID: EDN0SyJSSsWPFLNfrT50WA==
X-CSE-MsgGUID: VubXtdz6TLqI0lkx+eEdEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71963596"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="71963596"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 03:08:11 -0800
X-CSE-ConnectionGUID: VAd1INQWQPqp78MhvPzyCQ==
X-CSE-MsgGUID: rRLK1UU1TGmRWlszFzWb1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="199314693"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Dec 2025 03:08:10 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWYLA-000000003OF-1oYV;
	Fri, 19 Dec 2025 11:08:08 +0000
Date: Fri, 19 Dec 2025 19:07:31 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 a05543d6b05ba998fdbb4b383319ae5121bb7407
Message-ID: <202512191918.dY7IpLzP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: a05543d6b05ba998fdbb4b383319ae5121bb7407  gpio: it87: balance superio enter/exit calls in error path

elapsed time: 1455m

configs tested: 159
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251219    gcc-9.5.0
arm64                 randconfig-002-20251219    gcc-9.5.0
arm64                 randconfig-003-20251219    gcc-9.5.0
arm64                 randconfig-004-20251219    gcc-9.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251219    gcc-9.5.0
csky                  randconfig-002-20251219    gcc-9.5.0
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251219    gcc-11.5.0
hexagon               randconfig-002-20251219    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251219    clang-20
i386        buildonly-randconfig-002-20251219    clang-20
i386        buildonly-randconfig-003-20251219    clang-20
i386        buildonly-randconfig-004-20251219    clang-20
i386        buildonly-randconfig-005-20251219    clang-20
i386        buildonly-randconfig-006-20251219    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251219    clang-20
i386                  randconfig-002-20251219    clang-20
i386                  randconfig-003-20251219    clang-20
i386                  randconfig-004-20251219    clang-20
i386                  randconfig-005-20251219    clang-20
i386                  randconfig-006-20251219    clang-20
i386                  randconfig-007-20251219    clang-20
i386                  randconfig-011-20251219    gcc-14
i386                  randconfig-012-20251219    gcc-14
i386                  randconfig-013-20251219    gcc-14
i386                  randconfig-014-20251219    gcc-14
i386                  randconfig-015-20251219    gcc-14
i386                  randconfig-016-20251219    gcc-14
i386                  randconfig-017-20251219    gcc-14
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251219    gcc-11.5.0
loongarch             randconfig-002-20251219    gcc-11.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                          multi_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251219    gcc-11.5.0
nios2                 randconfig-002-20251219    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251219    clang-22
parisc                randconfig-002-20251219    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                   bluestone_defconfig    gcc-15.1.0
powerpc                     mpc5200_defconfig    gcc-15.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251219    clang-22
powerpc               randconfig-002-20251219    clang-22
powerpc                     tqm8541_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251219    clang-22
powerpc64             randconfig-002-20251219    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251219    gcc-8.5.0
sparc                 randconfig-002-20251219    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251219    gcc-8.5.0
sparc64               randconfig-002-20251219    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251219    gcc-8.5.0
um                    randconfig-002-20251219    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251219    clang-20
x86_64      buildonly-randconfig-002-20251219    clang-20
x86_64      buildonly-randconfig-003-20251219    clang-20
x86_64      buildonly-randconfig-004-20251219    clang-20
x86_64      buildonly-randconfig-005-20251219    clang-20
x86_64      buildonly-randconfig-006-20251219    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251219    gcc-14
x86_64                randconfig-002-20251219    gcc-14
x86_64                randconfig-003-20251219    gcc-14
x86_64                randconfig-004-20251219    gcc-14
x86_64                randconfig-005-20251219    gcc-14
x86_64                randconfig-006-20251219    gcc-14
x86_64                randconfig-011-20251219    clang-20
x86_64                randconfig-012-20251219    clang-20
x86_64                randconfig-013-20251219    clang-20
x86_64                randconfig-014-20251219    clang-20
x86_64                randconfig-015-20251219    clang-20
x86_64                randconfig-016-20251219    clang-20
x86_64                randconfig-071-20251219    gcc-14
x86_64                randconfig-072-20251219    gcc-14
x86_64                randconfig-073-20251219    gcc-14
x86_64                randconfig-074-20251219    gcc-14
x86_64                randconfig-075-20251219    gcc-14
x86_64                randconfig-076-20251219    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251219    gcc-8.5.0
xtensa                randconfig-002-20251219    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

