Return-Path: <linux-gpio+bounces-12114-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A95549B09D3
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 18:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B26BF1C2129D
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 16:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B56189F3F;
	Fri, 25 Oct 2024 16:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbKX3yfV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABCF186298
	for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 16:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729873457; cv=none; b=oAoeJeEPFnKA4jbU2qOJ5PGNEbVSkVyz/D/Wrrs05Unmktp2ZJlwzE+Zwci1Cve/l1LL9+OFTFQbOa/77trmr5HvXzsyIs6StGb2tdTmRai2FdK2r0gPUOcsAF8XKa1M3YceXRW0I0Blf77ubHrN6G+l6jbYIVH/UsgWV1ANmOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729873457; c=relaxed/simple;
	bh=aA2Dzftnajcuqab3Gp5CZtdjK+MfCFH/tH0ZF4GuqIQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TdCrjPVV94xgB9tmYAEzXWBQnwM/afyMl4xdn7yacU99LvMC1kEhwfJzMkkrZ1pUu5+S946Szh6gZ6jTTVUDKHB+sU/7H3d8DRDH9Q7crEEbixh4vK4C82B1OvsQjDqsvD5EgvEuJuJyFvcePk55bL1Cu38dspMLS2O5lKpM8Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bbKX3yfV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729873455; x=1761409455;
  h=date:from:to:cc:subject:message-id;
  bh=aA2Dzftnajcuqab3Gp5CZtdjK+MfCFH/tH0ZF4GuqIQ=;
  b=bbKX3yfVk2RKBTxL1jNvCde/jOGJqoYI8dDCw21wWJwkYbQXrT0BuL2A
   BxZqVCOVrWsoKLnlo7HutsZ5FPFERmO++CfLu/cr7c80nwKnJLgcKP/9i
   XsH1CcQEg7AJGhaxYTcaao2aGCCyuJUFbWg8gnoVAPq21lj+CXWdpxakd
   szlKpvKi+LVjpPdqbgb0WnIkz1qzhYaQ91UgoJ2H2k8bYTy4BlXOC++EM
   lqKPrlr8qDgR+CqWTVg7K6pE+zk/EDF8QioL5bRHakGQ44uldDbqGCFhm
   a+HhFtYlOHgxgxx6VVUfMIP9ordr3x6x92AANHO9lZHKab8olYqxIDRGx
   Q==;
X-CSE-ConnectionGUID: +PmM3miAS9mc/W37hN8L2w==
X-CSE-MsgGUID: j+C/DfqoQB6rkP8h2jvPqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29493204"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29493204"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 09:24:14 -0700
X-CSE-ConnectionGUID: 5+RQOjskRNishugfYDPpbQ==
X-CSE-MsgGUID: XIa2bnMCQcCJ2cKj5Q5F5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="80871821"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Oct 2024 09:24:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4N6h-000YTo-0r;
	Fri, 25 Oct 2024 16:24:11 +0000
Date: Sat, 26 Oct 2024 00:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 1f4a640e9ac7f450752365541ad9c064b13ef8bf
Message-ID: <202410260012.zASLRPNi-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 1f4a640e9ac7f450752365541ad9c064b13ef8bf  gpiolib: fix a NULL-pointer dereference when setting direction

elapsed time: 1230m

configs tested: 193
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              alldefconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241025    gcc-14.1.0
arc                   randconfig-002-20241025    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                       aspeed_g5_defconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                         lpc18xx_defconfig    gcc-14.1.0
arm                           omap1_defconfig    gcc-14.1.0
arm                   randconfig-001-20241025    gcc-14.1.0
arm                   randconfig-002-20241025    gcc-14.1.0
arm                   randconfig-003-20241025    gcc-14.1.0
arm                   randconfig-004-20241025    gcc-14.1.0
arm                           sama5_defconfig    clang-20
arm                        shmobile_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241025    gcc-14.1.0
arm64                 randconfig-002-20241025    gcc-14.1.0
arm64                 randconfig-003-20241025    gcc-14.1.0
arm64                 randconfig-004-20241025    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241025    gcc-14.1.0
csky                  randconfig-002-20241025    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241025    gcc-14.1.0
hexagon               randconfig-002-20241025    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241025    gcc-12
i386        buildonly-randconfig-002-20241025    gcc-12
i386        buildonly-randconfig-003-20241025    gcc-12
i386        buildonly-randconfig-004-20241025    gcc-12
i386        buildonly-randconfig-005-20241025    gcc-12
i386        buildonly-randconfig-006-20241025    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241025    gcc-12
i386                  randconfig-002-20241025    gcc-12
i386                  randconfig-003-20241025    gcc-12
i386                  randconfig-004-20241025    gcc-12
i386                  randconfig-005-20241025    gcc-12
i386                  randconfig-006-20241025    gcc-12
i386                  randconfig-011-20241025    gcc-12
i386                  randconfig-012-20241025    gcc-12
i386                  randconfig-013-20241025    gcc-12
i386                  randconfig-014-20241025    gcc-12
i386                  randconfig-015-20241025    gcc-12
i386                  randconfig-016-20241025    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241025    gcc-14.1.0
loongarch             randconfig-002-20241025    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                          amiga_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5249evb_defconfig    gcc-14.1.0
m68k                            q40_defconfig    gcc-14.1.0
m68k                           sun3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm63xx_defconfig    clang-20
mips                         bigsur_defconfig    clang-20
mips                          eyeq6_defconfig    gcc-14.1.0
mips                            gpr_defconfig    clang-20
mips                        omega2p_defconfig    clang-20
nios2                         10m50_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241025    gcc-14.1.0
nios2                 randconfig-002-20241025    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241025    gcc-14.1.0
parisc                randconfig-002-20241025    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                    adder875_defconfig    clang-20
powerpc                     akebono_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                    amigaone_defconfig    gcc-14.1.0
powerpc                    ge_imp3a_defconfig    clang-20
powerpc                 mpc832x_rdb_defconfig    clang-20
powerpc               randconfig-001-20241025    gcc-14.1.0
powerpc               randconfig-002-20241025    gcc-14.1.0
powerpc               randconfig-003-20241025    gcc-14.1.0
powerpc                     tqm8560_defconfig    clang-20
powerpc64             randconfig-001-20241025    gcc-14.1.0
powerpc64             randconfig-002-20241025    gcc-14.1.0
powerpc64             randconfig-003-20241025    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    gcc-14.1.0
riscv                 randconfig-001-20241025    gcc-14.1.0
riscv                 randconfig-002-20241025    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241025    gcc-14.1.0
s390                  randconfig-002-20241025    gcc-14.1.0
s390                       zfcpdump_defconfig    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                        apsh4ad0a_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    gcc-14.1.0
sh                    randconfig-001-20241025    gcc-14.1.0
sh                    randconfig-002-20241025    gcc-14.1.0
sh                      rts7751r2d1_defconfig    clang-20
sh                           se7343_defconfig    gcc-14.1.0
sh                           se7705_defconfig    clang-20
sh                   secureedge5410_defconfig    gcc-14.1.0
sh                  sh7785lcr_32bit_defconfig    clang-20
sh                             shx3_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241025    gcc-14.1.0
sparc64               randconfig-002-20241025    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241025    gcc-14.1.0
um                    randconfig-002-20241025    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241025    gcc-12
x86_64      buildonly-randconfig-002-20241025    gcc-12
x86_64      buildonly-randconfig-003-20241025    gcc-12
x86_64      buildonly-randconfig-004-20241025    gcc-12
x86_64      buildonly-randconfig-005-20241025    gcc-12
x86_64      buildonly-randconfig-006-20241025    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241025    gcc-12
x86_64                randconfig-002-20241025    gcc-12
x86_64                randconfig-003-20241025    gcc-12
x86_64                randconfig-004-20241025    gcc-12
x86_64                randconfig-005-20241025    gcc-12
x86_64                randconfig-006-20241025    gcc-12
x86_64                randconfig-011-20241025    gcc-12
x86_64                randconfig-012-20241025    gcc-12
x86_64                randconfig-013-20241025    gcc-12
x86_64                randconfig-014-20241025    gcc-12
x86_64                randconfig-015-20241025    gcc-12
x86_64                randconfig-016-20241025    gcc-12
x86_64                randconfig-071-20241025    gcc-12
x86_64                randconfig-072-20241025    gcc-12
x86_64                randconfig-073-20241025    gcc-12
x86_64                randconfig-074-20241025    gcc-12
x86_64                randconfig-075-20241025    gcc-12
x86_64                randconfig-076-20241025    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  cadence_csp_defconfig    clang-20
xtensa                randconfig-001-20241025    gcc-14.1.0
xtensa                randconfig-002-20241025    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

