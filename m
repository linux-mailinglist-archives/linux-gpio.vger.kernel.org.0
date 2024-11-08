Return-Path: <linux-gpio+bounces-12752-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BEF9C2743
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 22:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 091BE284F0E
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 21:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87CE1E47CB;
	Fri,  8 Nov 2024 21:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QO8JerUu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E542233D92
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 21:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731103164; cv=none; b=ios3PKGA4xGT/tVWC1TN7cdEKJP9aN+bh27Nf4OkJCRxSubRQAkHPbh2w9w4BIzybe6UEtbGhJeqimmWyB8IOJvmEqj2BaqfTycAoewhNvxDOrgryZaV9doXpA8z6/NKJkjwuP0BxFrlJQfTbWo1oWgc22z5ZtGZq55QdVqteKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731103164; c=relaxed/simple;
	bh=7LymGg89HW3sZb/WIAbnWNDMzx4e8Qbk1h1c1Tw9AOc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bloSkJVUVe7c9Pdt9UbLuVtGfAiTlyY4Izle/M1UWAFua+nmoiwrd+Hx8l4Lh1mONNFGJFT72EDuVKuJQeTetEhCNMSKZOceeyE0SCwzOQXwiVfcuRRmW2vlm7rKGa3DtcgoUNI3CAAuMQCxMFoEwidpZpMu+1sbXdis46um0ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QO8JerUu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731103162; x=1762639162;
  h=date:from:to:cc:subject:message-id;
  bh=7LymGg89HW3sZb/WIAbnWNDMzx4e8Qbk1h1c1Tw9AOc=;
  b=QO8JerUuhKeKXhmBDhSpM7WpMfhM5cgeAUr9+69lgY3tIzlhc2hl9EBo
   EPAfYD6+eQsrNffnBoXEEEdBW25Tv/Zzii8ycvP/AIO5oKETTsHDv+uYH
   vwHIa51lSo3hRx/t9P2fcKQhki+ZuegizjDgIMgARJ4whWvUDJdPBiOep
   QiBT3GKQ1Kh2s4N4oSrI70DaYRCFvoQWSLNqI177v52jfri0/rbXumSAq
   +NoelmpBYLUTgWGwXq6x3f9YWGncwD+A4cdjpS7UQNWe+6GRMpa4+k7wt
   s2KpWhgnQto4fXkvo12/2qrDPB+jMpvgzOr8tRVq+V4824j/v4fnHMfyo
   A==;
X-CSE-ConnectionGUID: q1o+AD9PTUKD3eF7ryvQKQ==
X-CSE-MsgGUID: UPf86CMdQJ6qUcRmmWgGIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="48516872"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="48516872"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 13:59:22 -0800
X-CSE-ConnectionGUID: XRKYKlwDTqqheQqxVu1SPQ==
X-CSE-MsgGUID: +Y60p3riRHWZUVGQ3RIbIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="86013900"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Nov 2024 13:59:21 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9X0g-000rpW-1g;
	Fri, 08 Nov 2024 21:59:18 +0000
Date: Sat, 09 Nov 2024 05:59:03 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 8bd815bab7f7643e54db2de01564f11f81b1fefa
Message-ID: <202411090558.lLffKUXW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 8bd815bab7f7643e54db2de01564f11f81b1fefa  Merge fixup

elapsed time: 751m

configs tested: 246
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.2.0
arc                         haps_hs_defconfig    clang-14
arc                   randconfig-001-20241108    gcc-13.2.0
arc                   randconfig-001-20241108    gcc-14.2.0
arc                   randconfig-002-20241108    gcc-13.2.0
arc                   randconfig-002-20241108    gcc-14.2.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                         at91_dt_defconfig    clang-15
arm                                 defconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                        neponset_defconfig    clang-14
arm                           omap1_defconfig    gcc-14.2.0
arm                   randconfig-001-20241108    gcc-14.2.0
arm                   randconfig-002-20241108    gcc-14.2.0
arm                   randconfig-003-20241108    clang-15
arm                   randconfig-003-20241108    gcc-14.2.0
arm                   randconfig-004-20241108    clang-20
arm                   randconfig-004-20241108    gcc-14.2.0
arm                           sama7_defconfig    gcc-14.2.0
arm                           tegra_defconfig    clang-15
arm                           u8500_defconfig    clang-14
arm                         wpcm450_defconfig    clang-15
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241108    clang-20
arm64                 randconfig-001-20241108    gcc-14.2.0
arm64                 randconfig-002-20241108    gcc-14.2.0
arm64                 randconfig-003-20241108    clang-20
arm64                 randconfig-003-20241108    gcc-14.2.0
arm64                 randconfig-004-20241108    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241108    gcc-14.2.0
csky                  randconfig-002-20241108    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241108    clang-16
hexagon               randconfig-001-20241108    gcc-14.2.0
hexagon               randconfig-002-20241108    clang-20
hexagon               randconfig-002-20241108    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241109    clang-19
i386        buildonly-randconfig-002-20241109    clang-19
i386        buildonly-randconfig-003-20241109    clang-19
i386        buildonly-randconfig-004-20241109    clang-19
i386        buildonly-randconfig-005-20241109    clang-19
i386        buildonly-randconfig-006-20241109    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241109    clang-19
i386                  randconfig-002-20241109    clang-19
i386                  randconfig-003-20241109    clang-19
i386                  randconfig-004-20241109    clang-19
i386                  randconfig-005-20241109    clang-19
i386                  randconfig-006-20241109    clang-19
i386                  randconfig-011-20241109    clang-19
i386                  randconfig-012-20241109    clang-19
i386                  randconfig-013-20241109    clang-19
i386                  randconfig-014-20241109    clang-19
i386                  randconfig-015-20241109    clang-19
i386                  randconfig-016-20241109    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20241108    gcc-14.2.0
loongarch             randconfig-002-20241108    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    clang-15
m68k                          atari_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    clang-14
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-15
mips                       bmips_be_defconfig    gcc-14.2.0
mips                            gpr_defconfig    clang-15
mips                           ip30_defconfig    gcc-14.2.0
mips                      maltaaprp_defconfig    clang-14
mips                          rb532_defconfig    clang-14
mips                        vocore2_defconfig    clang-15
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241108    gcc-14.2.0
nios2                 randconfig-002-20241108    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           alldefconfig    clang-14
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241108    gcc-14.2.0
parisc                randconfig-002-20241108    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      arches_defconfig    clang-14
powerpc                       eiger_defconfig    clang-15
powerpc                     ep8248e_defconfig    clang-14
powerpc                        fsp2_defconfig    clang-14
powerpc                  iss476-smp_defconfig    clang-14
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                 mpc8313_rdb_defconfig    clang-14
powerpc                 mpc836x_rdk_defconfig    clang-14
powerpc                  mpc885_ads_defconfig    clang-14
powerpc                      pmac32_defconfig    clang-15
powerpc                      pmac32_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241108    clang-15
powerpc               randconfig-001-20241108    gcc-14.2.0
powerpc               randconfig-002-20241108    clang-15
powerpc               randconfig-002-20241108    gcc-14.2.0
powerpc               randconfig-003-20241108    clang-20
powerpc               randconfig-003-20241108    gcc-14.2.0
powerpc                     redwood_defconfig    clang-14
powerpc                     skiroot_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241108    clang-20
powerpc64             randconfig-001-20241108    gcc-14.2.0
powerpc64             randconfig-002-20241108    gcc-14.2.0
powerpc64             randconfig-003-20241108    clang-20
powerpc64             randconfig-003-20241108    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-15
riscv                 randconfig-001-20241108    clang-20
riscv                 randconfig-001-20241108    gcc-14.2.0
riscv                 randconfig-002-20241108    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241108    gcc-14.2.0
s390                  randconfig-002-20241108    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    clang-15
sh                             espt_defconfig    clang-15
sh                    randconfig-001-20241108    gcc-14.2.0
sh                    randconfig-002-20241108    gcc-14.2.0
sh                   secureedge5410_defconfig    clang-15
sh                        sh7757lcr_defconfig    clang-15
sh                   sh7770_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241108    gcc-14.2.0
sparc64               randconfig-002-20241108    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241108    clang-15
um                    randconfig-001-20241108    gcc-14.2.0
um                    randconfig-002-20241108    gcc-12
um                    randconfig-002-20241108    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241108    clang-19
x86_64      buildonly-randconfig-001-20241108    gcc-12
x86_64      buildonly-randconfig-002-20241108    clang-19
x86_64      buildonly-randconfig-003-20241108    clang-19
x86_64      buildonly-randconfig-004-20241108    clang-19
x86_64      buildonly-randconfig-005-20241108    clang-19
x86_64      buildonly-randconfig-005-20241108    gcc-12
x86_64      buildonly-randconfig-006-20241108    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241108    clang-19
x86_64                randconfig-001-20241108    gcc-12
x86_64                randconfig-002-20241108    clang-19
x86_64                randconfig-003-20241108    clang-19
x86_64                randconfig-003-20241108    gcc-12
x86_64                randconfig-004-20241108    clang-19
x86_64                randconfig-005-20241108    clang-19
x86_64                randconfig-005-20241108    gcc-12
x86_64                randconfig-006-20241108    clang-19
x86_64                randconfig-011-20241108    clang-19
x86_64                randconfig-011-20241108    gcc-12
x86_64                randconfig-012-20241108    clang-19
x86_64                randconfig-012-20241108    gcc-12
x86_64                randconfig-013-20241108    clang-19
x86_64                randconfig-013-20241108    gcc-12
x86_64                randconfig-014-20241108    clang-19
x86_64                randconfig-014-20241108    gcc-12
x86_64                randconfig-015-20241108    clang-19
x86_64                randconfig-016-20241108    clang-19
x86_64                randconfig-016-20241108    gcc-12
x86_64                randconfig-071-20241108    clang-19
x86_64                randconfig-072-20241108    clang-19
x86_64                randconfig-072-20241108    gcc-12
x86_64                randconfig-073-20241108    clang-19
x86_64                randconfig-074-20241108    clang-19
x86_64                randconfig-075-20241108    clang-19
x86_64                randconfig-075-20241108    gcc-12
x86_64                randconfig-076-20241108    clang-19
x86_64                               rhel-8.3    gcc-12
xtensa                           alldefconfig    clang-15
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    clang-15
xtensa                  nommu_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241108    gcc-14.2.0
xtensa                randconfig-002-20241108    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

