Return-Path: <linux-gpio+bounces-24615-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FE1B2DCB8
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 14:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84B5918870E7
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 12:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE53D315761;
	Wed, 20 Aug 2025 12:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aj82Apnb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D79F31DDB2
	for <linux-gpio@vger.kernel.org>; Wed, 20 Aug 2025 12:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755693326; cv=none; b=Na+MAiDi5kvo2uKL6btvr+P61h9YsOuu5hwdkOYShpFUuc5C0eUgvJaOWJ2Ht182NKw185LLe8NB9YeMh5fPcNQl6A6u9NjJ8qNw+NFRTBez3AAkwhCiIC70zKGtppGpRpHU92EEPu+pjFu87m7WYk2ACClFu68GJ58HNnOWoGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755693326; c=relaxed/simple;
	bh=zy0E1GYDXhPeJq9urBHK+AbCAIsROev9vXbc45XSddY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N1U2ga+ZiXHG1N/reENXR26praoFfkhAqgrc0NVcXyEkfv9TguorAeDPzzKmrX8NWCfz0iCCkUXyQHesVl6oSecI6gd5cziGsz/6WWQBYgn4d7Ic3T2k2ntDPfHZbO11KZyAm/poh5RSqk+Dp41wARhfEYTDj2OfTRRSktQTk+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aj82Apnb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755693324; x=1787229324;
  h=date:from:to:cc:subject:message-id;
  bh=zy0E1GYDXhPeJq9urBHK+AbCAIsROev9vXbc45XSddY=;
  b=aj82ApnblaAMSgL+a00BTspG/4+epyZQczlc/LWtbywxO9Jt1MDX0nbH
   PPLKae+qcutGUfh8TG7x3jJ9xF7jt2xpfkfRJzMvaft1Bfstoo6a3dfdv
   Aqvm+RkaF3VxXnavN2yDmIkRD8ZuIAqT5wgoDh0NLqqbNiFWlDTCz4Zt+
   WBjMi8SQDltIGDxhTEIEvDPZ+f/tP7GtnaGvvKHPvEe8hYIlv7erSinBZ
   As4rHkaiB0GXR/MVtU3DWTLAI/jqq96Vz93KoA5qFtsyhtRhEPQgeOWQF
   8JME7k/PS+jhpYTQ+l0RErkmjigRTEw419pg9u6yCg5OGgsbldFOkad+D
   A==;
X-CSE-ConnectionGUID: Jqln3IpWQCGbK3joYyD9qg==
X-CSE-MsgGUID: WJnZc54oSCa+CDiGAlHYLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="45531189"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="45531189"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 05:35:24 -0700
X-CSE-ConnectionGUID: Jb2yaAolSTuSLV4GxT7GxA==
X-CSE-MsgGUID: TwGFO05gQn2sOhqGRUJHyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="198980124"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 20 Aug 2025 05:35:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoi1e-000J4l-2w;
	Wed, 20 Aug 2025 12:34:55 +0000
Date: Wed, 20 Aug 2025 20:34:07 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 4aca56dd15d24ea653965fee73dd5c0ed42f622d
Message-ID: <202508202001.TGLRFVX0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 4aca56dd15d24ea653965fee73dd5c0ed42f622d  pinctrl: STMFX: add missing HAS_IOMEM dependency

elapsed time: 1328m

configs tested: 233
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250820    gcc-14.3.0
arc                   randconfig-001-20250820    gcc-8.5.0
arc                   randconfig-002-20250820    gcc-11.5.0
arc                   randconfig-002-20250820    gcc-14.3.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                            mmp2_defconfig    clang-22
arm                   randconfig-001-20250820    gcc-14.3.0
arm                   randconfig-001-20250820    gcc-8.5.0
arm                   randconfig-002-20250820    gcc-14.3.0
arm                   randconfig-002-20250820    gcc-15.1.0
arm                   randconfig-003-20250820    gcc-13.4.0
arm                   randconfig-003-20250820    gcc-14.3.0
arm                   randconfig-004-20250820    clang-22
arm                   randconfig-004-20250820    gcc-14.3.0
arm                        realview_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                            allyesconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250820    gcc-14.3.0
arm64                 randconfig-002-20250820    gcc-14.3.0
arm64                 randconfig-003-20250820    gcc-14.3.0
arm64                 randconfig-003-20250820    gcc-8.5.0
arm64                 randconfig-004-20250820    gcc-14.3.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250820    clang-22
csky                  randconfig-001-20250820    gcc-15.1.0
csky                  randconfig-002-20250820    clang-22
csky                  randconfig-002-20250820    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250820    clang-22
hexagon               randconfig-002-20250820    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250819    gcc-12
i386        buildonly-randconfig-001-20250820    gcc-12
i386        buildonly-randconfig-002-20250819    clang-20
i386        buildonly-randconfig-002-20250820    gcc-12
i386        buildonly-randconfig-003-20250819    clang-20
i386        buildonly-randconfig-003-20250820    gcc-12
i386        buildonly-randconfig-004-20250819    clang-20
i386        buildonly-randconfig-004-20250820    gcc-12
i386        buildonly-randconfig-005-20250819    clang-20
i386        buildonly-randconfig-005-20250820    gcc-12
i386        buildonly-randconfig-006-20250819    clang-20
i386        buildonly-randconfig-006-20250820    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250820    gcc-12
i386                  randconfig-002-20250820    gcc-12
i386                  randconfig-003-20250820    gcc-12
i386                  randconfig-004-20250820    gcc-12
i386                  randconfig-005-20250820    gcc-12
i386                  randconfig-006-20250820    gcc-12
i386                  randconfig-007-20250820    gcc-12
i386                  randconfig-011-20250820    clang-20
i386                  randconfig-012-20250820    clang-20
i386                  randconfig-013-20250820    clang-20
i386                  randconfig-014-20250820    clang-20
i386                  randconfig-015-20250820    clang-20
i386                  randconfig-016-20250820    clang-20
i386                  randconfig-017-20250820    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                        allyesconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250820    clang-18
loongarch             randconfig-001-20250820    clang-22
loongarch             randconfig-002-20250820    clang-22
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
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                           gcw0_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250820    clang-22
nios2                 randconfig-001-20250820    gcc-11.5.0
nios2                 randconfig-002-20250820    clang-22
nios2                 randconfig-002-20250820    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250820    clang-22
parisc                randconfig-001-20250820    gcc-8.5.0
parisc                randconfig-002-20250820    clang-22
parisc                randconfig-002-20250820    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                    adder875_defconfig    clang-22
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                          g5_defconfig    clang-22
powerpc               randconfig-001-20250820    clang-22
powerpc               randconfig-001-20250820    gcc-12.5.0
powerpc               randconfig-002-20250820    clang-22
powerpc               randconfig-002-20250820    gcc-8.5.0
powerpc               randconfig-003-20250820    clang-22
powerpc               randconfig-003-20250820    gcc-13.4.0
powerpc                     tqm8548_defconfig    clang-22
powerpc64                        alldefconfig    clang-22
powerpc64             randconfig-001-20250820    clang-22
powerpc64             randconfig-002-20250820    clang-22
powerpc64             randconfig-003-20250820    clang-22
powerpc64             randconfig-003-20250820    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250820    clang-20
riscv                 randconfig-002-20250820    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250820    clang-18
s390                  randconfig-002-20250820    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250820    gcc-15.1.0
sh                    randconfig-002-20250820    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250820    gcc-8.5.0
sparc                 randconfig-002-20250820    gcc-12.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250820    clang-22
sparc64               randconfig-002-20250820    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250820    gcc-12
um                    randconfig-002-20250820    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250819    clang-20
x86_64      buildonly-randconfig-001-20250820    clang-20
x86_64      buildonly-randconfig-002-20250819    clang-20
x86_64      buildonly-randconfig-002-20250820    clang-20
x86_64      buildonly-randconfig-003-20250819    clang-20
x86_64      buildonly-randconfig-003-20250820    clang-20
x86_64      buildonly-randconfig-004-20250819    clang-20
x86_64      buildonly-randconfig-004-20250820    clang-20
x86_64      buildonly-randconfig-005-20250819    clang-20
x86_64      buildonly-randconfig-005-20250820    clang-20
x86_64      buildonly-randconfig-006-20250819    clang-20
x86_64      buildonly-randconfig-006-20250820    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250820    gcc-12
x86_64                randconfig-002-20250820    gcc-12
x86_64                randconfig-003-20250820    gcc-12
x86_64                randconfig-004-20250820    gcc-12
x86_64                randconfig-005-20250820    gcc-12
x86_64                randconfig-006-20250820    gcc-12
x86_64                randconfig-007-20250820    gcc-12
x86_64                randconfig-008-20250820    gcc-12
x86_64                randconfig-071-20250820    gcc-12
x86_64                randconfig-072-20250820    gcc-12
x86_64                randconfig-073-20250820    gcc-12
x86_64                randconfig-074-20250820    gcc-12
x86_64                randconfig-075-20250820    gcc-12
x86_64                randconfig-076-20250820    gcc-12
x86_64                randconfig-077-20250820    gcc-12
x86_64                randconfig-078-20250820    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250820    gcc-8.5.0
xtensa                randconfig-002-20250820    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

