Return-Path: <linux-gpio+bounces-30381-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A468D0CAB1
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 01:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C13EF301D650
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 00:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED0D1FF7C7;
	Sat, 10 Jan 2026 00:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHUvxeQl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D78B27472
	for <linux-gpio@vger.kernel.org>; Sat, 10 Jan 2026 00:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768006444; cv=none; b=Lije++4rz5J3jDYGjg70O7/yNPy5aCb3oUw/2GUXKSmp1vdOm6YUpv+UREasR2xgESQoSgxSuzHUrJ35oiTeBKVjl9M1dET13tAiZJKDykX5yDailNG9smSlvH57Ic3PMZV9vGI7QCu/bPdLtiVvLkvhoeEDEEG2zKSqWUyZr6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768006444; c=relaxed/simple;
	bh=1TYTWwLU1QGun0hppTV4SCTq8u5983ZRbF/OBr+AbIg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gtTQv6AfTy+TxQpMQFyxs5nAWnwy84mFkmSEpL07pA6MuSImDtwVbKtsoXlfqiSGe9BWbSwxHBGde8r2eWwsywrL3V/8dAYDvpPAxLsb8suXeobqXSXTeA2kx+cAz3tEjI8LutAlSUhkGqQ7n1ilHBrjSrAaJgdJVsdMH70yoXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHUvxeQl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768006442; x=1799542442;
  h=date:from:to:cc:subject:message-id;
  bh=1TYTWwLU1QGun0hppTV4SCTq8u5983ZRbF/OBr+AbIg=;
  b=lHUvxeQlG4dB588sKzqmHX5OEAPldh0SS2R4n3pA9Vvqk8Qg+jHWaRAW
   9Nr4Uyn9QMj3EsqHUer57kMkTyGBMjdHVYFrJJappvOv9PMmPAbj78BXA
   iEs1NKfcKChIPemi6azSBylGivsV5RXJusxKTS1CwkW7WsLQ6bHWHehbI
   vPP9V3ao6pmC6K/UsEPzZimg1uC9o4OvsJqOik5TODSnTvLrFdgTHOJAX
   7f409egI3i6pq1UUFVi+g2obsfuxnP/62GIBG4JPDm1NsMNi77SsSU/0C
   6wDFqJC1BMUcqNCbyjw0evZpMgopM8bo3eeWRzm9gonufLz+Dhktn2lma
   A==;
X-CSE-ConnectionGUID: Tsw9yySlQtiVOiVjRfhQqA==
X-CSE-MsgGUID: 485Nc+2LT+2Pp53e9N1l9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69434834"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69434834"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 16:54:02 -0800
X-CSE-ConnectionGUID: cr5VoIClQ22ht/jZtQ8Qbg==
X-CSE-MsgGUID: 54TOO8htRqiWy/mtLCYIBQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jan 2026 16:54:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veNEs-000000007tc-1p6I;
	Sat, 10 Jan 2026 00:53:58 +0000
Date: Sat, 10 Jan 2026 08:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 4400dfd2acee4a492a29b33292d9f8c9c311cc6a
Message-ID: <202601100849.U2MmOAkh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 4400dfd2acee4a492a29b33292d9f8c9c311cc6a  Merge branch 'devel' into for-next

elapsed time: 1590m

configs tested: 139
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260109    gcc-13.4.0
arc                   randconfig-002-20260109    gcc-13.4.0
arm                               allnoconfig    gcc-15.2.0
arm                       aspeed_g4_defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260109    gcc-13.4.0
arm                   randconfig-002-20260109    gcc-13.4.0
arm                   randconfig-003-20260109    gcc-13.4.0
arm                   randconfig-004-20260109    gcc-13.4.0
arm                           spitz_defconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260109    gcc-8.5.0
arm64                 randconfig-002-20260109    gcc-8.5.0
arm64                 randconfig-003-20260109    gcc-8.5.0
arm64                 randconfig-004-20260109    gcc-8.5.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260109    gcc-8.5.0
csky                  randconfig-002-20260109    gcc-8.5.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260109    gcc-8.5.0
hexagon               randconfig-002-20260109    gcc-8.5.0
i386                              allnoconfig    gcc-15.2.0
i386        buildonly-randconfig-001-20260109    clang-20
i386        buildonly-randconfig-002-20260109    clang-20
i386        buildonly-randconfig-003-20260109    clang-20
i386        buildonly-randconfig-004-20260109    clang-20
i386        buildonly-randconfig-005-20260109    clang-20
i386        buildonly-randconfig-006-20260109    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260109    gcc-14
i386                  randconfig-002-20260109    gcc-14
i386                  randconfig-003-20260109    gcc-14
i386                  randconfig-004-20260109    gcc-14
i386                  randconfig-005-20260109    gcc-14
i386                  randconfig-006-20260109    gcc-14
i386                  randconfig-007-20260109    gcc-14
i386                  randconfig-011-20260109    clang-20
i386                  randconfig-012-20260109    clang-20
i386                  randconfig-013-20260109    clang-20
i386                  randconfig-014-20260109    clang-20
i386                  randconfig-015-20260109    clang-20
i386                  randconfig-016-20260109    clang-20
i386                  randconfig-017-20260109    clang-20
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260109    gcc-8.5.0
loongarch             randconfig-002-20260109    gcc-8.5.0
m68k                              allnoconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                           sun3_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                              allnoconfig    gcc-15.2.0
mips                     decstation_defconfig    clang-22
mips                        vocore2_defconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260109    gcc-8.5.0
nios2                 randconfig-002-20260109    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260109    gcc-8.5.0
parisc                randconfig-002-20260109    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                           allnoconfig    clang-22
powerpc               randconfig-001-20260109    gcc-8.5.0
powerpc               randconfig-002-20260109    gcc-8.5.0
powerpc                      tqm8xx_defconfig    clang-22
powerpc64             randconfig-001-20260109    gcc-8.5.0
powerpc64             randconfig-002-20260109    gcc-8.5.0
riscv                             allnoconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260109    clang-22
riscv                 randconfig-002-20260109    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260109    clang-22
s390                  randconfig-002-20260109    clang-22
s390                       zfcpdump_defconfig    clang-22
sh                                allnoconfig    clang-22
sh                                  defconfig    gcc-14
sh                        dreamcast_defconfig    clang-22
sh                    randconfig-001-20260109    clang-22
sh                    randconfig-002-20260109    clang-22
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260109    gcc-14.3.0
sparc                 randconfig-002-20260109    gcc-14.3.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260109    gcc-14.3.0
sparc64               randconfig-002-20260109    gcc-14.3.0
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260109    gcc-14.3.0
um                    randconfig-002-20260109    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20260109    gcc-14
x86_64      buildonly-randconfig-002-20260109    gcc-14
x86_64      buildonly-randconfig-003-20260109    gcc-14
x86_64      buildonly-randconfig-004-20260109    gcc-14
x86_64      buildonly-randconfig-005-20260109    gcc-14
x86_64      buildonly-randconfig-006-20260109    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260109    gcc-14
x86_64                randconfig-002-20260109    gcc-14
x86_64                randconfig-003-20260109    gcc-14
x86_64                randconfig-004-20260109    gcc-14
x86_64                randconfig-005-20260109    gcc-14
x86_64                randconfig-006-20260109    gcc-14
x86_64                randconfig-011-20260109    gcc-14
x86_64                randconfig-012-20260109    gcc-14
x86_64                randconfig-013-20260109    gcc-14
x86_64                randconfig-014-20260109    gcc-14
x86_64                randconfig-015-20260109    gcc-14
x86_64                randconfig-016-20260109    gcc-14
x86_64                randconfig-071-20260109    clang-20
x86_64                randconfig-072-20260109    clang-20
x86_64                randconfig-073-20260109    clang-20
x86_64                randconfig-074-20260109    clang-20
x86_64                randconfig-075-20260109    clang-20
x86_64                randconfig-076-20260109    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
xtensa                            allnoconfig    clang-22
xtensa                randconfig-001-20260109    gcc-14.3.0
xtensa                randconfig-002-20260109    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

