Return-Path: <linux-gpio+bounces-26301-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F46B7D4A5
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61699165C66
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 11:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C802429B8C2;
	Wed, 17 Sep 2025 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5+FKwJG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDB82248B0
	for <linux-gpio@vger.kernel.org>; Wed, 17 Sep 2025 11:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758107074; cv=none; b=cFYURLocytl3sXosN3d+6g5IHtNkFARuVZcDQ2pPQS4D367kTWiqb0PDw3KO9vIecp/d51KEO9+sqyAP6FLx2DsUkSMc/1AFAQDcx8aDlsiJn2JK03ONCtegHkOovqTa1ccrC3C8v+eMKceTWYNLYn+zTMdAQWKfEJJ9n8KUJ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758107074; c=relaxed/simple;
	bh=HxJxpcmgqTCwrU0AwKhEMZ8AJOLSkwJRaNnqcfB9vWs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o7VpK3JybrThuSIHXlxvVL+mOGmkwhDBoEYrHvqtvaKInM0vOsaRBJE8654xMaH/a+JGyJcd1qsgtq3BK/EC1nU2zW/toyN4QT0FS/HZhVbTSEi2qldE8t6c7iL/cT3R0xJ7KoCB9kqR13hS+atfgajoZSWc0yjoxbuDA91cqdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J5+FKwJG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758107073; x=1789643073;
  h=date:from:to:cc:subject:message-id;
  bh=HxJxpcmgqTCwrU0AwKhEMZ8AJOLSkwJRaNnqcfB9vWs=;
  b=J5+FKwJGmPeo2TpDGsnwSeVWRlaauoql+ImPMRXnXxIP6usZ7I7fNTI4
   21rGU6UbtG+VD21mU/Y7G4jiUWI8L7+0LFgrMtfXXO7cePa+HtDG2UtGJ
   1yhZ0B+4GQxgPsgu+fniOrtu8lplBgKHvVsx8ymktac9FYOH273LXqG91
   52qF7yaDZSp4QJfvW24Q4d6Q13bnVjqqehDz9iT3BCtCupSihkg1Id+AC
   DVwgselLDn+nBXytRZDQlYdrID3TXfwXRkRh7yU9KtaFvAqAIYh7rA7I9
   AL79OAr20DGaNY6UpUBDGP2sucHoZMXVjLG0YNbIog5VUsELVeeKg9GzG
   Q==;
X-CSE-ConnectionGUID: c/Y1gfIhRYCyO6zQ9dhTaA==
X-CSE-MsgGUID: RBWlF6EKQuqPz24oXfxhBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71772255"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="71772255"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 04:04:32 -0700
X-CSE-ConnectionGUID: GLl9UsoRRziAYwfgTxQwpA==
X-CSE-MsgGUID: VdK4wJn3RkCuFsS8lfY7zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="179618525"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Sep 2025 04:04:31 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uypxb-0001PX-1t;
	Wed, 17 Sep 2025 11:04:27 +0000
Date: Wed, 17 Sep 2025 19:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 2b464fd599c583e53fb35dbdc3b4851e30895ff2
Message-ID: <202509171939.hnol2b9o-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 2b464fd599c583e53fb35dbdc3b4851e30895ff2  Merge tag 'intel-gpio-v6.17-1' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-current

elapsed time: 1453m

configs tested: 240
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                 nsimosci_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250916    gcc-8.5.0
arc                   randconfig-001-20250917    clang-22
arc                   randconfig-002-20250916    gcc-8.5.0
arc                   randconfig-002-20250917    clang-22
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20250916    gcc-11.5.0
arm                   randconfig-001-20250917    clang-22
arm                   randconfig-002-20250916    clang-22
arm                   randconfig-002-20250917    clang-22
arm                   randconfig-003-20250916    gcc-12.5.0
arm                   randconfig-003-20250917    clang-22
arm                   randconfig-004-20250916    clang-22
arm                   randconfig-004-20250917    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250916    clang-18
arm64                 randconfig-001-20250917    clang-22
arm64                 randconfig-002-20250916    clang-22
arm64                 randconfig-002-20250917    clang-22
arm64                 randconfig-003-20250916    clang-22
arm64                 randconfig-003-20250917    clang-22
arm64                 randconfig-004-20250916    clang-22
arm64                 randconfig-004-20250917    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250916    gcc-14.3.0
csky                  randconfig-001-20250917    clang-22
csky                  randconfig-002-20250916    gcc-11.5.0
csky                  randconfig-002-20250917    clang-22
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250916    clang-22
hexagon               randconfig-001-20250917    clang-22
hexagon               randconfig-002-20250916    clang-22
hexagon               randconfig-002-20250917    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250916    gcc-14
i386        buildonly-randconfig-001-20250917    gcc-14
i386        buildonly-randconfig-002-20250916    gcc-14
i386        buildonly-randconfig-002-20250917    gcc-14
i386        buildonly-randconfig-003-20250916    clang-20
i386        buildonly-randconfig-003-20250917    gcc-14
i386        buildonly-randconfig-004-20250916    gcc-14
i386        buildonly-randconfig-004-20250917    gcc-14
i386        buildonly-randconfig-005-20250916    gcc-14
i386        buildonly-randconfig-005-20250917    gcc-14
i386        buildonly-randconfig-006-20250916    clang-20
i386        buildonly-randconfig-006-20250917    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20250917    gcc-14
i386                  randconfig-002-20250917    gcc-14
i386                  randconfig-003-20250917    gcc-14
i386                  randconfig-004-20250917    gcc-14
i386                  randconfig-005-20250917    gcc-14
i386                  randconfig-006-20250917    gcc-14
i386                  randconfig-007-20250917    gcc-14
i386                  randconfig-011-20250917    gcc-14
i386                  randconfig-012-20250917    gcc-14
i386                  randconfig-013-20250917    gcc-14
i386                  randconfig-014-20250917    gcc-14
i386                  randconfig-015-20250917    gcc-14
i386                  randconfig-016-20250917    gcc-14
i386                  randconfig-017-20250917    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250916    clang-18
loongarch             randconfig-001-20250917    clang-22
loongarch             randconfig-002-20250916    clang-22
loongarch             randconfig-002-20250917    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250916    gcc-11.5.0
nios2                 randconfig-001-20250917    clang-22
nios2                 randconfig-002-20250916    gcc-8.5.0
nios2                 randconfig-002-20250917    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250916    gcc-9.5.0
parisc                randconfig-001-20250917    clang-22
parisc                randconfig-002-20250916    gcc-13.4.0
parisc                randconfig-002-20250917    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc                      pasemi_defconfig    gcc-15.1.0
powerpc                      ppc6xx_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250916    clang-16
powerpc               randconfig-001-20250917    clang-22
powerpc               randconfig-002-20250916    clang-22
powerpc               randconfig-002-20250917    clang-22
powerpc               randconfig-003-20250916    clang-22
powerpc               randconfig-003-20250917    clang-22
powerpc64             randconfig-001-20250916    clang-22
powerpc64             randconfig-001-20250917    clang-22
powerpc64             randconfig-002-20250916    gcc-8.5.0
powerpc64             randconfig-002-20250917    clang-22
powerpc64             randconfig-003-20250916    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250916    clang-22
riscv                 randconfig-001-20250917    gcc-15.1.0
riscv                 randconfig-002-20250916    gcc-10.5.0
riscv                 randconfig-002-20250917    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250916    gcc-13.4.0
s390                  randconfig-001-20250917    gcc-15.1.0
s390                  randconfig-002-20250916    gcc-8.5.0
s390                  randconfig-002-20250917    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                        edosk7760_defconfig    gcc-15.1.0
sh                    randconfig-001-20250916    gcc-15.1.0
sh                    randconfig-001-20250917    gcc-15.1.0
sh                    randconfig-002-20250916    gcc-15.1.0
sh                    randconfig-002-20250917    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250916    gcc-8.5.0
sparc                 randconfig-001-20250917    gcc-15.1.0
sparc                 randconfig-002-20250916    gcc-8.5.0
sparc                 randconfig-002-20250917    gcc-15.1.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250916    gcc-11.5.0
sparc64               randconfig-001-20250917    gcc-15.1.0
sparc64               randconfig-002-20250916    clang-22
sparc64               randconfig-002-20250917    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250916    gcc-14
um                    randconfig-001-20250917    gcc-15.1.0
um                    randconfig-002-20250916    clang-19
um                    randconfig-002-20250917    gcc-15.1.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250916    gcc-14
x86_64      buildonly-randconfig-001-20250917    clang-20
x86_64      buildonly-randconfig-002-20250916    clang-20
x86_64      buildonly-randconfig-002-20250917    clang-20
x86_64      buildonly-randconfig-003-20250916    clang-20
x86_64      buildonly-randconfig-003-20250917    clang-20
x86_64      buildonly-randconfig-004-20250916    clang-20
x86_64      buildonly-randconfig-004-20250917    clang-20
x86_64      buildonly-randconfig-005-20250916    clang-20
x86_64      buildonly-randconfig-005-20250917    clang-20
x86_64      buildonly-randconfig-006-20250916    clang-20
x86_64      buildonly-randconfig-006-20250917    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250917    clang-20
x86_64                randconfig-002-20250917    clang-20
x86_64                randconfig-003-20250917    clang-20
x86_64                randconfig-004-20250917    clang-20
x86_64                randconfig-005-20250917    clang-20
x86_64                randconfig-006-20250917    clang-20
x86_64                randconfig-007-20250917    clang-20
x86_64                randconfig-008-20250917    clang-20
x86_64                randconfig-071-20250917    clang-20
x86_64                randconfig-072-20250917    clang-20
x86_64                randconfig-073-20250917    clang-20
x86_64                randconfig-074-20250917    clang-20
x86_64                randconfig-075-20250917    clang-20
x86_64                randconfig-076-20250917    clang-20
x86_64                randconfig-077-20250917    clang-20
x86_64                randconfig-078-20250917    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250916    gcc-8.5.0
xtensa                randconfig-001-20250917    gcc-15.1.0
xtensa                randconfig-002-20250916    gcc-8.5.0
xtensa                randconfig-002-20250917    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

