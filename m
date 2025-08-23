Return-Path: <linux-gpio+bounces-24844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8D3B32878
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Aug 2025 14:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 920A05E2600
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Aug 2025 12:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E72A248F7D;
	Sat, 23 Aug 2025 12:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGGJF3OX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FB2214A78
	for <linux-gpio@vger.kernel.org>; Sat, 23 Aug 2025 12:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755950700; cv=none; b=P6G48ZK135GwjrODCVyWLty4TAIWStWUhjX5a2u+NYz2sB0/jvdNccnI/enHai58um5e5vz9+3DNztnKTE8R5qoQWQCqv8lU3zx5HjlfDUKqo9TfQDGl8Y6yt+S94WKZJboaAIoXi7LVQyVkgAbCVh6GsVeOGJF23/F60dKBpbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755950700; c=relaxed/simple;
	bh=7HokT7XPIecvv3KQ2lViymdZZm3t4AfqDLsPYbuKD90=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KUtqGL3WAOhQDO/qJznIlEMqa5TqCV1t/FksrLLhrTydkJVJzSlRZeQBIUPZlVjlVMIFLn/RHMqpfna3Lbj7+VCUifE3EGRYJ08xy78wIECMlotxuGsf7G61C5+aztcxwExd0G9QdQ+avV3mZ9zqxQIwG2ip0sdiYE0fTGA2qCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGGJF3OX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755950699; x=1787486699;
  h=date:from:to:cc:subject:message-id;
  bh=7HokT7XPIecvv3KQ2lViymdZZm3t4AfqDLsPYbuKD90=;
  b=dGGJF3OXUVQfr5QAeeyDndJp8Ihzk2udm8Cp6m5B/8XFRq6KtHsmrMvl
   obgbBgcGqOtVWQ+NCCNTVeM/bATttcZMQGMoR+sFO7KdE5t+Irn4zJf48
   f3bfgaV2vj3zVWY5wiTccGtWzYZTC01JU8wmZ6avJD9ANnjIQe4Hz2nFh
   2DcEE6Er7j+2Y3WBRdewJ+M9Gt0XqAnHjCcruvSXTOLdiPwo6iLrvQ1QW
   bvZOY4pRtahLDwKTQ5b+75yv9xs3VY0u1+wvvAfeAuX9qftvcz2k/JFIC
   2V8nUR651GLwWUjYdG4bYdhT3hzg3e+S4mWgFySRwYbbAKWQLANS69Kme
   Q==;
X-CSE-ConnectionGUID: IDs0NH2yQdSxlo2OF+pqsg==
X-CSE-MsgGUID: JhEfc2iqRpyAbCYG+66WSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58384012"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58384012"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 05:04:58 -0700
X-CSE-ConnectionGUID: Wg8gf9UlQZOLGZBZ3iD3vg==
X-CSE-MsgGUID: 4xUN28z4QD+ZvFia5/TMYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173314450"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Aug 2025 05:04:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upmzN-000MI3-1M;
	Sat, 23 Aug 2025 12:04:54 +0000
Date: Sat, 23 Aug 2025 20:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 6b1569f931674171f0d3dae050ef848a142bd34e
Message-ID: <202508232041.B2rVPNVY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 6b1569f931674171f0d3dae050ef848a142bd34e  Merge branch 'devel' into for-next

elapsed time: 1303m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250822    gcc-8.5.0
arc                   randconfig-002-20250822    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                      footbridge_defconfig    clang-17
arm                             pxa_defconfig    gcc-15.1.0
arm                   randconfig-001-20250822    clang-22
arm                   randconfig-002-20250822    gcc-8.5.0
arm                   randconfig-003-20250822    clang-22
arm                   randconfig-004-20250822    gcc-8.5.0
arm                    vt8500_v6_v7_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250822    clang-22
arm64                 randconfig-002-20250822    clang-22
arm64                 randconfig-003-20250822    clang-17
arm64                 randconfig-004-20250822    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250822    gcc-9.5.0
csky                  randconfig-002-20250822    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250822    clang-22
hexagon               randconfig-002-20250822    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250822    gcc-12
i386        buildonly-randconfig-002-20250822    clang-20
i386        buildonly-randconfig-003-20250822    gcc-12
i386        buildonly-randconfig-004-20250822    gcc-12
i386        buildonly-randconfig-005-20250822    gcc-12
i386        buildonly-randconfig-006-20250822    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250822    clang-22
loongarch             randconfig-002-20250822    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
microblaze                      mmu_defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250822    gcc-11.5.0
nios2                 randconfig-002-20250822    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                       virt_defconfig    gcc-15.1.0
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250822    gcc-9.5.0
parisc                randconfig-002-20250822    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                  mpc885_ads_defconfig    clang-22
powerpc               randconfig-001-20250822    clang-22
powerpc               randconfig-002-20250822    gcc-11.5.0
powerpc               randconfig-003-20250822    clang-18
powerpc64             randconfig-001-20250822    gcc-13.4.0
powerpc64             randconfig-002-20250822    clang-22
powerpc64             randconfig-003-20250822    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250823    clang-22
riscv                 randconfig-002-20250823    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250823    gcc-9.5.0
s390                  randconfig-002-20250823    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250823    gcc-15.1.0
sh                    randconfig-002-20250823    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250823    gcc-8.5.0
sparc                 randconfig-002-20250823    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250823    gcc-8.5.0
sparc64               randconfig-002-20250823    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250823    clang-22
um                    randconfig-002-20250823    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250822    clang-20
x86_64      buildonly-randconfig-002-20250822    gcc-12
x86_64      buildonly-randconfig-003-20250822    clang-20
x86_64      buildonly-randconfig-004-20250822    clang-20
x86_64      buildonly-randconfig-005-20250822    clang-20
x86_64      buildonly-randconfig-006-20250822    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250823    gcc-15.1.0
xtensa                randconfig-002-20250823    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

