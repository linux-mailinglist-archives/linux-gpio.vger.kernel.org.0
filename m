Return-Path: <linux-gpio+bounces-29330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEDACAA8FD
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Dec 2025 16:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E571C3009F66
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Dec 2025 15:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E3E286D63;
	Sat,  6 Dec 2025 15:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFbLGahe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A66226CE1A
	for <linux-gpio@vger.kernel.org>; Sat,  6 Dec 2025 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765034104; cv=none; b=p00f31qDiBl/q9FlmYKhypTrs3I3anKcNs0fRj4a92vbkj918LwjZ7iRcKIGhqvvjpZw3AVscC8A8PLiN4Ulhxs5QvnKe2J532RtzlhpuK5JeebRL7P8ebBOTixNAQsOB+K8vkDfeDiuKLfMgb6Dq4MjpXTmaDQjqDCLT19y0Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765034104; c=relaxed/simple;
	bh=IIddJGqr+AjCeVhR3sr0/qkDR4x7MK+0LoccPGrHYmU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gG395eyYs4H301jKO9trTGxxE2ashggvN5UTjusz4USyDodx/OmxUSHB2TzgcST7c8z+458xu2X8jRYr0+8SxEB5J+ZieA5LBRQeiJEHT3vvC2Oku0cBstvBoVhDQYnIfAmrvfz32RNPXzDX6b8VDYJbLpIxjusT+nakq7SH+ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFbLGahe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765034103; x=1796570103;
  h=date:from:to:cc:subject:message-id;
  bh=IIddJGqr+AjCeVhR3sr0/qkDR4x7MK+0LoccPGrHYmU=;
  b=BFbLGaheuMLs+3E/Vql8afiEc8ZV/NrSMP8p4BFzwQHajW1R73s8XOX6
   9OR7Q3K6y510UsL7GbNiDveKr1o3oDrND6UWWA5qILCs1kVB8jcdXtHux
   u+AjnhWeuBJ8iUgfD8tOvgxRrrn//U3/FGud43jlz1eNcf6uqWtL16gSq
   qLpXAwm+T21+Ax0Dailcapsiwh7P7t7m95tflEoz2B+veROVQHvUjzyit
   TUZX1UDzB4CYNH6laX+qHB7Xv0MiLGRJ7rRLQj0/6U+a6gXkkpZhipm8/
   Gay2dmcN+/WiWKcKhxTBSheITO15tEfIBxshVDFnaYtf3YBaK+oFiJOvk
   w==;
X-CSE-ConnectionGUID: P3bhb+DBRmqHJPYmnYhsUA==
X-CSE-MsgGUID: fdWJ4WJhR4WytXlKilm0eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="67124416"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="67124416"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 07:15:03 -0800
X-CSE-ConnectionGUID: SI4F7XrjSvmFXNltnvLQsw==
X-CSE-MsgGUID: JB5CXp4TTryneVUBnDmLpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="199989914"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Dec 2025 07:15:01 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRtzv-00000000IHR-1I1K;
	Sat, 06 Dec 2025 15:14:59 +0000
Date: Sat, 06 Dec 2025 23:14:10 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 666065caa31aeb812978740bae21871067bb14b6
Message-ID: <202512062300.VVZ3UimR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 666065caa31aeb812978740bae21871067bb14b6  pinctrl: add CONFIG_OF dependencies for microchip drivers

elapsed time: 1462m

configs tested: 221
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
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251206    gcc-8.5.0
arc                   randconfig-002-20251206    gcc-14.3.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                         at91_dt_defconfig    gcc-15.1.0
arm                            hisi_defconfig    gcc-15.1.0
arm                   randconfig-001-20251206    clang-22
arm                   randconfig-002-20251206    clang-22
arm                   randconfig-003-20251206    clang-16
arm                   randconfig-004-20251206    clang-20
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251206    gcc-8.5.0
arm64                 randconfig-002-20251206    clang-22
arm64                 randconfig-003-20251206    clang-22
arm64                 randconfig-004-20251206    gcc-8.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251206    gcc-15.1.0
csky                  randconfig-002-20251206    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251206    clang-16
hexagon               randconfig-002-20251206    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251206    gcc-14
i386        buildonly-randconfig-002-20251206    gcc-14
i386        buildonly-randconfig-003-20251206    clang-20
i386        buildonly-randconfig-004-20251206    clang-20
i386        buildonly-randconfig-005-20251206    clang-20
i386        buildonly-randconfig-006-20251206    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251206    clang-20
i386                  randconfig-002-20251206    clang-20
i386                  randconfig-003-20251206    gcc-14
i386                  randconfig-004-20251206    gcc-14
i386                  randconfig-005-20251206    clang-20
i386                  randconfig-006-20251206    clang-20
i386                  randconfig-007-20251206    gcc-14
i386                  randconfig-011-20251206    clang-20
i386                  randconfig-011-20251206    gcc-14
i386                  randconfig-012-20251206    gcc-14
i386                  randconfig-013-20251206    gcc-14
i386                  randconfig-014-20251206    clang-20
i386                  randconfig-014-20251206    gcc-14
i386                  randconfig-015-20251206    clang-20
i386                  randconfig-015-20251206    gcc-14
i386                  randconfig-016-20251206    gcc-14
i386                  randconfig-017-20251206    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251206    gcc-15.1.0
loongarch             randconfig-002-20251206    gcc-12.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                          eyeq5_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251206    gcc-8.5.0
nios2                 randconfig-002-20251206    gcc-8.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251206    clang-22
parisc                randconfig-001-20251206    gcc-11.5.0
parisc                randconfig-002-20251206    clang-22
parisc                randconfig-002-20251206    gcc-15.1.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                       eiger_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251206    clang-22
powerpc               randconfig-001-20251206    gcc-11.5.0
powerpc               randconfig-002-20251206    clang-22
powerpc                     tqm5200_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251206    clang-22
powerpc64             randconfig-001-20251206    gcc-15.1.0
powerpc64             randconfig-002-20251206    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251206    clang-22
riscv                 randconfig-002-20251206    clang-19
riscv                 randconfig-002-20251206    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251206    clang-22
s390                  randconfig-002-20251206    clang-22
s390                  randconfig-002-20251206    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                        edosk7705_defconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                    randconfig-001-20251206    clang-22
sh                    randconfig-001-20251206    gcc-15.1.0
sh                    randconfig-002-20251206    clang-22
sh                    randconfig-002-20251206    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251206    gcc-12.5.0
sparc                 randconfig-001-20251206    gcc-14
sparc                 randconfig-002-20251206    gcc-14
sparc                 randconfig-002-20251206    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251206    clang-22
sparc64               randconfig-001-20251206    gcc-14
sparc64               randconfig-002-20251206    gcc-14
sparc64               randconfig-002-20251206    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251206    gcc-14
um                    randconfig-002-20251206    gcc-14
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251206    clang-20
x86_64      buildonly-randconfig-002-20251206    gcc-14
x86_64      buildonly-randconfig-003-20251206    clang-20
x86_64      buildonly-randconfig-004-20251206    clang-20
x86_64      buildonly-randconfig-005-20251206    gcc-13
x86_64      buildonly-randconfig-006-20251206    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251206    clang-20
x86_64                randconfig-001-20251206    gcc-14
x86_64                randconfig-002-20251206    gcc-14
x86_64                randconfig-003-20251206    gcc-14
x86_64                randconfig-004-20251206    gcc-14
x86_64                randconfig-005-20251206    gcc-14
x86_64                randconfig-006-20251206    gcc-14
x86_64                randconfig-011-20251206    clang-20
x86_64                randconfig-011-20251206    gcc-14
x86_64                randconfig-012-20251206    clang-20
x86_64                randconfig-013-20251206    clang-20
x86_64                randconfig-013-20251206    gcc-14
x86_64                randconfig-014-20251206    clang-20
x86_64                randconfig-015-20251206    clang-20
x86_64                randconfig-016-20251206    clang-20
x86_64                randconfig-071-20251206    clang-20
x86_64                randconfig-071-20251206    gcc-14
x86_64                randconfig-072-20251206    clang-20
x86_64                randconfig-072-20251206    gcc-14
x86_64                randconfig-073-20251206    gcc-14
x86_64                randconfig-074-20251206    gcc-14
x86_64                randconfig-075-20251206    gcc-14
x86_64                randconfig-076-20251206    gcc-14
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
xtensa                randconfig-001-20251206    gcc-14
xtensa                randconfig-001-20251206    gcc-8.5.0
xtensa                randconfig-002-20251206    gcc-14
xtensa                randconfig-002-20251206    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

