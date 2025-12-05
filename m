Return-Path: <linux-gpio+bounces-29271-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 386B6CA5C8A
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 02:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1FC530D8D7F
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 01:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E15B1E376C;
	Fri,  5 Dec 2025 01:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPGJ1J1T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A39F1C84A0
	for <linux-gpio@vger.kernel.org>; Fri,  5 Dec 2025 01:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764896749; cv=none; b=COfakDD2YyuE9kbNZQmc95GDN8uSkz+iLb8UC0S1YmnZWJzwoB92+3EUteTMSuLzJeECo1bHs6u+3eCSE1pVMkQf6uGCauPbVpyGZcqhPI/vpsmceDnbLbmTAO8TnRYtdv68F7qjUuCCf8xDGRMa4mAL8rwV8IzjzzAGHJ2EFDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764896749; c=relaxed/simple;
	bh=YlNKgyc0D2qbf+O4ZP9WI3Xz+yOKTEVU0oLUySejBk4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WEnWFYLFFQZUnuwnj91OYhMi9EhyMSj7QW+Bx2rKxDqGP20u2vIeJoBL2NJxOdoEIuKbs7P/yTa3qioTK0uD/NvkLBVBDtdloWlYx4Qc9rf9d5SmsVvnaTqIjMroUM7Sq6gin64CiNFdzCvMrRuB3ggXVPo7eNn9GgPDa3erwNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPGJ1J1T; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764896747; x=1796432747;
  h=date:from:to:cc:subject:message-id;
  bh=YlNKgyc0D2qbf+O4ZP9WI3Xz+yOKTEVU0oLUySejBk4=;
  b=MPGJ1J1TY9hD426bOBEmscs8KcJXua5ZNcTSAaw+c/0MH0LVqrxcgyts
   8YyLCbfLrZvETx6s+VBV5nsFBCVnL9IU/KJQaIkbd2VI5aUUiozFZOX/T
   x5n5GhxLWH5ESOFDcDFkKSJm0W63Y/LCCAO0qw+DtwDd9NV9UAOxmUKxN
   lHqnONLQxiwpS42ovsrSkofOEcmMoHlHDPi2kNBMulbsbYXxg2yAPshNI
   ZOPHugLsyoHYtFZcHbsuwbhN7BYB8xxJlAMPrRQGeEqmeZPWfizpD6rYk
   IsLyZFX/DMT/JDvUJajebk9QY31YMhi97vmk+gz1+RV/ypiYlqZnX8U7O
   Q==;
X-CSE-ConnectionGUID: eRJs166mQh+j+8Gw6U1PgQ==
X-CSE-MsgGUID: Wb0KAIlqQhG8F7nwzwCmDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77253200"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="77253200"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 17:05:47 -0800
X-CSE-ConnectionGUID: F/FMPtWbQDW1mIAccF898Q==
X-CSE-MsgGUID: aZnpjuGhSlunyEzx6ytPJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="199317105"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Dec 2025 17:05:46 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRKGV-00000000EQL-3owe;
	Fri, 05 Dec 2025 01:05:43 +0000
Date: Fri, 05 Dec 2025 09:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 5b3a403eb57617e090f6232a355f10f32c14022a
Message-ID: <202512050950.dwrwKz1J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 5b3a403eb57617e090f6232a355f10f32c14022a  Merge branch 'devel' into for-next

elapsed time: 1464m

configs tested: 176
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251204    gcc-10.5.0
arc                   randconfig-002-20251204    gcc-10.5.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.1.0
arm                         orion5x_defconfig    gcc-15.1.0
arm                   randconfig-001-20251204    gcc-10.5.0
arm                   randconfig-002-20251204    gcc-10.5.0
arm                   randconfig-003-20251204    gcc-10.5.0
arm                   randconfig-004-20251204    gcc-10.5.0
arm                           stm32_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251204    gcc-14.3.0
arm64                 randconfig-002-20251204    gcc-14.3.0
arm64                 randconfig-003-20251204    gcc-14.3.0
arm64                 randconfig-004-20251204    gcc-14.3.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251204    gcc-14.3.0
csky                  randconfig-002-20251204    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251204    gcc-15.1.0
hexagon               randconfig-002-20251204    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251204    clang-20
i386        buildonly-randconfig-002-20251204    clang-20
i386        buildonly-randconfig-003-20251204    clang-20
i386        buildonly-randconfig-004-20251204    clang-20
i386        buildonly-randconfig-005-20251204    clang-20
i386        buildonly-randconfig-006-20251204    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251204    clang-20
i386                  randconfig-002-20251204    clang-20
i386                  randconfig-003-20251204    clang-20
i386                  randconfig-004-20251204    clang-20
i386                  randconfig-005-20251204    clang-20
i386                  randconfig-006-20251204    clang-20
i386                  randconfig-007-20251204    clang-20
i386                  randconfig-011-20251204    gcc-14
i386                  randconfig-012-20251204    gcc-14
i386                  randconfig-013-20251204    gcc-14
i386                  randconfig-014-20251204    gcc-14
i386                  randconfig-015-20251204    gcc-14
i386                  randconfig-016-20251204    gcc-14
i386                  randconfig-017-20251204    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251204    gcc-15.1.0
loongarch             randconfig-002-20251204    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251204    gcc-15.1.0
nios2                 randconfig-002-20251204    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251204    clang-22
parisc                randconfig-002-20251204    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc               randconfig-001-20251204    clang-22
powerpc               randconfig-002-20251204    clang-22
powerpc                     tqm8548_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251204    clang-22
powerpc64             randconfig-002-20251204    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251204    clang-22
riscv                 randconfig-002-20251204    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251204    clang-22
s390                  randconfig-002-20251204    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251204    clang-22
sh                    randconfig-002-20251204    clang-22
sh                          rsk7201_defconfig    gcc-15.1.0
sh                   rts7751r2dplus_defconfig    gcc-15.1.0
sh                           se7712_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251204    clang-22
sparc                 randconfig-002-20251204    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251204    clang-22
sparc64               randconfig-002-20251204    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251204    clang-22
um                    randconfig-002-20251204    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251204    clang-20
x86_64      buildonly-randconfig-002-20251204    clang-20
x86_64      buildonly-randconfig-003-20251204    clang-20
x86_64      buildonly-randconfig-004-20251204    clang-20
x86_64      buildonly-randconfig-005-20251204    clang-20
x86_64      buildonly-randconfig-006-20251204    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251204    clang-20
x86_64                randconfig-002-20251204    clang-20
x86_64                randconfig-003-20251204    clang-20
x86_64                randconfig-004-20251204    clang-20
x86_64                randconfig-005-20251204    clang-20
x86_64                randconfig-006-20251204    clang-20
x86_64                randconfig-011-20251204    clang-20
x86_64                randconfig-012-20251204    clang-20
x86_64                randconfig-013-20251204    clang-20
x86_64                randconfig-014-20251204    clang-20
x86_64                randconfig-015-20251204    clang-20
x86_64                randconfig-016-20251204    clang-20
x86_64                randconfig-071-20251204    clang-20
x86_64                randconfig-072-20251204    clang-20
x86_64                randconfig-073-20251204    clang-20
x86_64                randconfig-074-20251204    clang-20
x86_64                randconfig-075-20251204    clang-20
x86_64                randconfig-076-20251204    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                randconfig-001-20251204    clang-22
xtensa                randconfig-002-20251204    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

