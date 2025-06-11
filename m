Return-Path: <linux-gpio+bounces-21392-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DCAAD56DB
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 15:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB2C5173632
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 13:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B6E2777F2;
	Wed, 11 Jun 2025 13:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hepssJQW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF718288509
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 13:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648173; cv=none; b=XOuweUI61WRrLFulJkvJKzp7Mp5Gt+vV3fpMYKcdtXMAZbzVqb/ozxvyNSx7alQrUR0JYFXqonjrXS1Hr/+PH8xZsKiXG/Kam6/e7u7CIDFKMjJRf6Os7DOts0FwXayxEQSwX4b1usZPiFZZ+rqfS4mCzfqpsV4Ox5eH5huA1HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648173; c=relaxed/simple;
	bh=l1aPgFuwT8XUVleJ3gkxcqRUen/bNp2kpw+eA5pEOY4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=flts1Ij7AVmO3H8EXaOpZrRhlWLy8ESVcWpSCi/BUT8gSRnJBsjb0X98rayzSbGdEpnyqXt0g/aW7zJbYK+BRAgsIcA8+S+rV6er0Bd7gZfOdGC+A6ycd5O6kegPGE67u8a8Ablf1QBM9V7SEhW0+quscY1kboqXUscplMf8TbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hepssJQW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749648172; x=1781184172;
  h=date:from:to:cc:subject:message-id;
  bh=l1aPgFuwT8XUVleJ3gkxcqRUen/bNp2kpw+eA5pEOY4=;
  b=hepssJQWoBxHe7g1GAZsT9D7MYK5xN/cdh4GAJ6aawcS7uoul041RXgH
   HIQ+6LgY2B/VDDr1iXm09zcyY604kJwLKmXCB+yesOAiv/TlrL4GdTcEL
   TzW5CbnV64tzoJUF2sZzGhX+tyzM4GrTubdhm9/RmKok2lercTAt+23ol
   OutNMVLnyNH3hdD+pqwI4Y8uv4qO024gXatpXugLLUZ5LLB/VAaV5w6aB
   fEiBrpJisCGQw6VRsZLKFLrQKAFcJ2zQ1ID53+QQrDZn53+ioeR21uKAI
   aBa2PGMmOJW6w6gF+5RwxRyZBuygP8opb2XNY2/g9xWUdq/CIy8YrukfS
   Q==;
X-CSE-ConnectionGUID: VggNWMhHQJ2jKcvApemLgA==
X-CSE-MsgGUID: C7fakRn0S62m+LhKRSnEVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51928209"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="51928209"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 06:22:50 -0700
X-CSE-ConnectionGUID: NgQnDk6ZRXGgECLJIDSLUA==
X-CSE-MsgGUID: 46OBK5BOSeS+98URF1ym5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="152474258"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jun 2025 06:22:48 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPLPh-000AUu-1n;
	Wed, 11 Jun 2025 13:22:45 +0000
Date: Wed, 11 Jun 2025 21:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 90256033c11028a57437b145449c0dab196183b9
Message-ID: <202506112157.akIoL92w-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 90256033c11028a57437b145449c0dab196183b9  pinctrl: cirrus: madera-core: Use devm_pinctrl_register_mappings()

elapsed time: 1455m

configs tested: 244
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    clang-21
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                            hsdk_defconfig    clang-21
arc                        nsim_700_defconfig    clang-21
arc                   randconfig-001-20250611    gcc-12.4.0
arc                   randconfig-002-20250611    gcc-12.4.0
arc                   randconfig-002-20250611    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                      footbridge_defconfig    gcc-12
arm                       multi_v4t_defconfig    gcc-12
arm                          pxa3xx_defconfig    clang-21
arm                             pxa_defconfig    gcc-12
arm                   randconfig-001-20250611    gcc-11.5.0
arm                   randconfig-001-20250611    gcc-12.4.0
arm                   randconfig-002-20250611    clang-21
arm                   randconfig-002-20250611    gcc-12.4.0
arm                   randconfig-003-20250611    gcc-12.4.0
arm                   randconfig-003-20250611    gcc-13.3.0
arm                   randconfig-004-20250611    gcc-12.4.0
arm                   randconfig-004-20250611    gcc-13.3.0
arm                         socfpga_defconfig    clang-21
arm                        spear3xx_defconfig    gcc-12
arm                         wpcm450_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250611    gcc-12.4.0
arm64                 randconfig-001-20250611    gcc-8.5.0
arm64                 randconfig-002-20250611    gcc-12.4.0
arm64                 randconfig-002-20250611    gcc-9.5.0
arm64                 randconfig-003-20250611    gcc-12.4.0
arm64                 randconfig-003-20250611    gcc-13.3.0
arm64                 randconfig-004-20250611    gcc-12.4.0
arm64                 randconfig-004-20250611    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250611    gcc-15.1.0
csky                  randconfig-001-20250611    gcc-8.5.0
csky                  randconfig-002-20250611    gcc-15.1.0
csky                  randconfig-002-20250611    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250611    clang-21
hexagon               randconfig-001-20250611    gcc-8.5.0
hexagon               randconfig-002-20250611    clang-21
hexagon               randconfig-002-20250611    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250610    clang-20
i386        buildonly-randconfig-001-20250611    clang-20
i386        buildonly-randconfig-002-20250610    clang-20
i386        buildonly-randconfig-002-20250611    clang-20
i386        buildonly-randconfig-003-20250610    clang-20
i386        buildonly-randconfig-003-20250611    clang-20
i386        buildonly-randconfig-004-20250610    gcc-12
i386        buildonly-randconfig-004-20250611    clang-20
i386        buildonly-randconfig-005-20250610    clang-20
i386        buildonly-randconfig-005-20250611    clang-20
i386        buildonly-randconfig-006-20250610    clang-20
i386        buildonly-randconfig-006-20250611    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250611    clang-20
i386                  randconfig-002-20250611    clang-20
i386                  randconfig-003-20250611    clang-20
i386                  randconfig-004-20250611    clang-20
i386                  randconfig-005-20250611    clang-20
i386                  randconfig-006-20250611    clang-20
i386                  randconfig-007-20250611    clang-20
i386                  randconfig-011-20250611    gcc-12
i386                  randconfig-012-20250611    gcc-12
i386                  randconfig-013-20250611    gcc-12
i386                  randconfig-014-20250611    gcc-12
i386                  randconfig-015-20250611    gcc-12
i386                  randconfig-016-20250611    gcc-12
i386                  randconfig-017-20250611    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250611    gcc-15.1.0
loongarch             randconfig-001-20250611    gcc-8.5.0
loongarch             randconfig-002-20250611    gcc-15.1.0
loongarch             randconfig-002-20250611    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        mvme147_defconfig    gcc-12
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    clang-21
mips                           mtx1_defconfig    clang-21
mips                         rt305x_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250611    gcc-8.5.0
nios2                 randconfig-002-20250611    gcc-8.5.0
nios2                 randconfig-002-20250611    gcc-9.3.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           alldefconfig    clang-21
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250611    gcc-11.5.0
parisc                randconfig-001-20250611    gcc-8.5.0
parisc                randconfig-002-20250611    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                       ebony_defconfig    clang-21
powerpc                      katmai_defconfig    clang-21
powerpc                  mpc866_ads_defconfig    clang-21
powerpc               randconfig-001-20250611    gcc-8.5.0
powerpc               randconfig-002-20250611    gcc-13.3.0
powerpc               randconfig-002-20250611    gcc-8.5.0
powerpc               randconfig-003-20250611    clang-21
powerpc               randconfig-003-20250611    gcc-8.5.0
powerpc64             randconfig-001-20250611    clang-21
powerpc64             randconfig-001-20250611    gcc-8.5.0
powerpc64             randconfig-002-20250611    clang-21
powerpc64             randconfig-002-20250611    gcc-8.5.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250611    clang-21
riscv                 randconfig-001-20250611    gcc-15.1.0
riscv                 randconfig-002-20250611    clang-19
riscv                 randconfig-002-20250611    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250611    gcc-15.1.0
s390                  randconfig-002-20250611    gcc-11.5.0
s390                  randconfig-002-20250611    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                          landisk_defconfig    clang-21
sh                          polaris_defconfig    clang-21
sh                    randconfig-001-20250611    gcc-15.1.0
sh                    randconfig-002-20250611    gcc-15.1.0
sh                           sh2007_defconfig    clang-21
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250611    gcc-11.5.0
sparc                 randconfig-001-20250611    gcc-15.1.0
sparc                 randconfig-002-20250611    gcc-15.1.0
sparc                 randconfig-002-20250611    gcc-8.5.0
sparc                       sparc32_defconfig    clang-21
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250611    gcc-15.1.0
sparc64               randconfig-001-20250611    gcc-8.5.0
sparc64               randconfig-002-20250611    gcc-13.3.0
sparc64               randconfig-002-20250611    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250611    clang-21
um                    randconfig-001-20250611    gcc-15.1.0
um                    randconfig-002-20250611    clang-19
um                    randconfig-002-20250611    gcc-15.1.0
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250611    clang-20
x86_64      buildonly-randconfig-001-20250611    gcc-12
x86_64      buildonly-randconfig-002-20250611    clang-20
x86_64      buildonly-randconfig-003-20250611    clang-20
x86_64      buildonly-randconfig-004-20250611    clang-20
x86_64      buildonly-randconfig-004-20250611    gcc-12
x86_64      buildonly-randconfig-005-20250611    clang-20
x86_64      buildonly-randconfig-005-20250611    gcc-12
x86_64      buildonly-randconfig-006-20250611    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250611    clang-20
x86_64                randconfig-002-20250611    clang-20
x86_64                randconfig-003-20250611    clang-20
x86_64                randconfig-004-20250611    clang-20
x86_64                randconfig-005-20250611    clang-20
x86_64                randconfig-006-20250611    clang-20
x86_64                randconfig-007-20250611    clang-20
x86_64                randconfig-008-20250611    clang-20
x86_64                randconfig-071-20250611    gcc-12
x86_64                randconfig-072-20250611    gcc-12
x86_64                randconfig-073-20250611    gcc-12
x86_64                randconfig-074-20250611    gcc-12
x86_64                randconfig-075-20250611    gcc-12
x86_64                randconfig-076-20250611    gcc-12
x86_64                randconfig-077-20250611    gcc-12
x86_64                randconfig-078-20250611    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  nommu_kc705_defconfig    clang-21
xtensa                randconfig-001-20250611    gcc-13.3.0
xtensa                randconfig-001-20250611    gcc-15.1.0
xtensa                randconfig-002-20250611    gcc-10.5.0
xtensa                randconfig-002-20250611    gcc-15.1.0
xtensa                    smp_lx200_defconfig    gcc-12
xtensa                         virt_defconfig    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

