Return-Path: <linux-gpio+bounces-17637-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2381A62C0C
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 12:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34792179794
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 11:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0476E1DC9BE;
	Sat, 15 Mar 2025 11:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtSJWOv0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFED2192B65
	for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742039197; cv=none; b=a1Wa2tfbErQd0wiP7brOOtBFCadIdAvvlxoFZQ9/Psy+RKqRCdrWkBq0aC7R74aRd4g/qewrtzhfSCJjZQ/wD8M16EKf0N+s13HfnYqcVjZ9Zq7KzcHBYWXFL+O6yR2JV1QCOumieMigk5sgOfieuZY+u0K5R7FpOk+By0VEcIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742039197; c=relaxed/simple;
	bh=JNShb5z9DeWrMBcnN7Ha5IP4tOP8U7IvJv6cNJN4PK0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=egsrOjjCQX6g7JWaHRngcSB3qKP083OIMyxDkHvcroOKeRebRzJJt+fdI8lU5sZBF309yWwkeEjl1faIdDgYv0zgTixhg+Fn8TUiO+dcTz3yUnCU2IguxUKPy6BWgAFVG1a2QBizbhv3GZLWV4+5YOpd4uXRhIn68wwjIqsthIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtSJWOv0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742039196; x=1773575196;
  h=date:from:to:cc:subject:message-id;
  bh=JNShb5z9DeWrMBcnN7Ha5IP4tOP8U7IvJv6cNJN4PK0=;
  b=PtSJWOv0LJkdj2rb84eEqQFmiKa843AHZMluoYCdfsiEtrmigyGb3BWF
   iVsomQfQ7ryllSAK0DU8m229zjzp1BpI/mObHVHvHQk2usX1Jqltb5dww
   W0KqLgPqif4trGcTUIyXwL3YPeu9soQF6V5cjgioeUUPiA2gUNyFT13Gv
   CZB1se27/iqeS2AWC29tBSKxXMhzK4bNQNKGvS3HC37f0MyQZLXewfZE5
   mmdHWhx6m/szXqX2ItzXXsZSaXmnKzQZHWUZ2HrBwlZ6I1aX2+oXB/rJa
   xhsy40Z2iBOC7lp3O44LjAFPljyadYAHiFTxfDK/hb4NqTIhmPbHDhMST
   Q==;
X-CSE-ConnectionGUID: ONYsqLF7RDOdwrn5VSMqsA==
X-CSE-MsgGUID: QdBaAOOgRWKNTO/bZY8t6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="54559678"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="54559678"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 04:46:35 -0700
X-CSE-ConnectionGUID: 2Hx1TE1nR4qsiDcRmspfzg==
X-CSE-MsgGUID: 3we8FSptSeuY+wyBrT/5ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="126380296"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 Mar 2025 04:46:34 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttPyJ-000BJm-2h;
	Sat, 15 Mar 2025 11:46:31 +0000
Date: Sat, 15 Mar 2025 19:45:42 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 1df5ab0e6d040ab4e3da53a47ee13e5abbd74394
Message-ID: <202503151936.B2GmFQIK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 1df5ab0e6d040ab4e3da53a47ee13e5abbd74394  pinctrl: qcom: sa8775p: Enable egpio function

elapsed time: 1447m

configs tested: 224
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250314    gcc-13.2.0
arc                   randconfig-001-20250315    gcc-14.2.0
arc                   randconfig-002-20250314    gcc-13.2.0
arc                   randconfig-002-20250315    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          exynos_defconfig    clang-21
arm                            hisi_defconfig    gcc-14.2.0
arm                   randconfig-001-20250314    clang-21
arm                   randconfig-001-20250315    gcc-14.2.0
arm                   randconfig-002-20250314    gcc-14.2.0
arm                   randconfig-002-20250315    gcc-14.2.0
arm                   randconfig-003-20250314    gcc-14.2.0
arm                   randconfig-003-20250315    gcc-14.2.0
arm                   randconfig-004-20250314    gcc-14.2.0
arm                   randconfig-004-20250315    gcc-14.2.0
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250314    gcc-14.2.0
arm64                 randconfig-001-20250315    gcc-14.2.0
arm64                 randconfig-002-20250314    clang-21
arm64                 randconfig-002-20250315    gcc-14.2.0
arm64                 randconfig-003-20250314    clang-15
arm64                 randconfig-003-20250315    gcc-14.2.0
arm64                 randconfig-004-20250314    clang-21
arm64                 randconfig-004-20250315    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250314    gcc-14.2.0
csky                  randconfig-001-20250315    gcc-14.2.0
csky                  randconfig-002-20250314    gcc-14.2.0
csky                  randconfig-002-20250315    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250314    clang-21
hexagon               randconfig-001-20250315    gcc-14.2.0
hexagon               randconfig-002-20250314    clang-21
hexagon               randconfig-002-20250315    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250314    clang-19
i386        buildonly-randconfig-001-20250315    clang-19
i386        buildonly-randconfig-002-20250314    clang-19
i386        buildonly-randconfig-002-20250315    clang-19
i386        buildonly-randconfig-003-20250314    gcc-12
i386        buildonly-randconfig-003-20250315    clang-19
i386        buildonly-randconfig-004-20250314    gcc-12
i386        buildonly-randconfig-004-20250315    clang-19
i386        buildonly-randconfig-005-20250314    gcc-12
i386        buildonly-randconfig-005-20250315    clang-19
i386        buildonly-randconfig-006-20250314    gcc-12
i386        buildonly-randconfig-006-20250315    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250315    clang-19
i386                  randconfig-002-20250315    clang-19
i386                  randconfig-003-20250315    clang-19
i386                  randconfig-004-20250315    clang-19
i386                  randconfig-005-20250315    clang-19
i386                  randconfig-006-20250315    clang-19
i386                  randconfig-007-20250315    clang-19
i386                  randconfig-011-20250315    gcc-12
i386                  randconfig-012-20250315    gcc-12
i386                  randconfig-013-20250315    gcc-12
i386                  randconfig-014-20250315    gcc-12
i386                  randconfig-015-20250315    gcc-12
i386                  randconfig-016-20250315    gcc-12
i386                  randconfig-017-20250315    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250314    gcc-14.2.0
loongarch             randconfig-001-20250315    gcc-14.2.0
loongarch             randconfig-002-20250314    gcc-14.2.0
loongarch             randconfig-002-20250315    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
microblaze                      mmu_defconfig    clang-21
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-21
mips                        qi_lb60_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250314    gcc-14.2.0
nios2                 randconfig-001-20250315    gcc-14.2.0
nios2                 randconfig-002-20250314    gcc-14.2.0
nios2                 randconfig-002-20250315    gcc-14.2.0
openrisc                          allnoconfig    clang-15
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-15
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250314    gcc-14.2.0
parisc                randconfig-001-20250315    gcc-14.2.0
parisc                randconfig-002-20250314    gcc-14.2.0
parisc                randconfig-002-20250315    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                       holly_defconfig    clang-21
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250314    clang-21
powerpc               randconfig-001-20250315    gcc-14.2.0
powerpc               randconfig-002-20250314    gcc-14.2.0
powerpc               randconfig-002-20250315    gcc-14.2.0
powerpc               randconfig-003-20250314    gcc-14.2.0
powerpc               randconfig-003-20250315    gcc-14.2.0
powerpc64             randconfig-001-20250314    gcc-14.2.0
powerpc64             randconfig-001-20250315    gcc-14.2.0
powerpc64             randconfig-002-20250314    clang-17
powerpc64             randconfig-002-20250315    gcc-14.2.0
powerpc64             randconfig-003-20250314    clang-21
powerpc64             randconfig-003-20250315    gcc-14.2.0
riscv                             allnoconfig    clang-15
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250314    clang-19
riscv                 randconfig-001-20250315    gcc-14.2.0
riscv                 randconfig-002-20250314    gcc-14.2.0
riscv                 randconfig-002-20250315    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250314    gcc-14.2.0
s390                  randconfig-001-20250315    gcc-14.2.0
s390                  randconfig-002-20250314    gcc-14.2.0
s390                  randconfig-002-20250315    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250314    gcc-14.2.0
sh                    randconfig-001-20250315    gcc-14.2.0
sh                    randconfig-002-20250314    gcc-14.2.0
sh                    randconfig-002-20250315    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7724_defconfig    clang-21
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    clang-21
sh                   sh7770_generic_defconfig    gcc-14.2.0
sh                            shmin_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250314    gcc-14.2.0
sparc                 randconfig-001-20250315    gcc-14.2.0
sparc                 randconfig-002-20250314    gcc-14.2.0
sparc                 randconfig-002-20250315    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250314    gcc-14.2.0
sparc64               randconfig-001-20250315    gcc-14.2.0
sparc64               randconfig-002-20250314    gcc-14.2.0
sparc64               randconfig-002-20250315    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-15
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250314    gcc-12
um                    randconfig-001-20250315    gcc-14.2.0
um                    randconfig-002-20250314    gcc-12
um                    randconfig-002-20250315    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250314    clang-19
x86_64      buildonly-randconfig-001-20250315    clang-19
x86_64      buildonly-randconfig-002-20250314    clang-19
x86_64      buildonly-randconfig-002-20250315    clang-19
x86_64      buildonly-randconfig-003-20250314    gcc-12
x86_64      buildonly-randconfig-003-20250315    clang-19
x86_64      buildonly-randconfig-004-20250314    clang-19
x86_64      buildonly-randconfig-004-20250315    clang-19
x86_64      buildonly-randconfig-005-20250314    gcc-12
x86_64      buildonly-randconfig-005-20250315    clang-19
x86_64      buildonly-randconfig-006-20250314    gcc-12
x86_64      buildonly-randconfig-006-20250315    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250315    clang-19
x86_64                randconfig-002-20250315    clang-19
x86_64                randconfig-003-20250315    clang-19
x86_64                randconfig-004-20250315    clang-19
x86_64                randconfig-005-20250315    clang-19
x86_64                randconfig-006-20250315    clang-19
x86_64                randconfig-007-20250315    clang-19
x86_64                randconfig-008-20250315    clang-19
x86_64                randconfig-071-20250315    clang-19
x86_64                randconfig-072-20250315    clang-19
x86_64                randconfig-073-20250315    clang-19
x86_64                randconfig-074-20250315    clang-19
x86_64                randconfig-075-20250315    clang-19
x86_64                randconfig-076-20250315    clang-19
x86_64                randconfig-077-20250315    clang-19
x86_64                randconfig-078-20250315    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250314    gcc-14.2.0
xtensa                randconfig-001-20250315    gcc-14.2.0
xtensa                randconfig-002-20250314    gcc-14.2.0
xtensa                randconfig-002-20250315    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

