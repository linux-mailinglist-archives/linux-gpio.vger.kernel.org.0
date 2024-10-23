Return-Path: <linux-gpio+bounces-11796-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B0C9ABC36
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 05:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D41D51F222E5
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 03:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB564B5AE;
	Wed, 23 Oct 2024 03:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLDBfprb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAC4D27E
	for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 03:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729654465; cv=none; b=DuXY39SMqCjiu5PkFFdJjhRl5xfin5CVxvtrYIMPQkRUR2gMdYWuZVg7lusYFjEYeAebYK1lYP/DKSHfyH6usMhe9sMYJe4oFSXdBcy4xxJLak8lgcGwVekRBEmvoP+tCOxtAQTJG04xG8Vu5j9EtkHvLeLW4QnpQzBfdrgbwu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729654465; c=relaxed/simple;
	bh=omqj7NfdumQAGvjLajvx6juiZ3G2s0stugfmn1sQLjw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I+ZYrzSHexQ0YJ8nokk5ou5lUcBKLa4r6znlH10rhPMEYEi3dG/XAZCpdCnEq2tr31XX327oFTkjCL0pGGFhbNRt36ml9aIrJRS8qwkZRbkQt1mkie22sloRzYgL9syYYSbs7QeZwx1UJz/pZkw0AkiNz4gjsZZy35qTECKvd+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLDBfprb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729654463; x=1761190463;
  h=date:from:to:cc:subject:message-id;
  bh=omqj7NfdumQAGvjLajvx6juiZ3G2s0stugfmn1sQLjw=;
  b=RLDBfprb1uXhNhSCWyXJJcO5YEtbbNZ5OU8OPeOUlr6VZ07IDtxrlxsg
   pyICt7o3LDG2B65b68aojU+iLjwuXtZb+Cz6jAXgJgneidh8lUmR+fvoF
   J38ch51ZArRsP3oXKd06xN7kxfr/BUqhTVqf6ir4FwqQ60nvx1WFclqt1
   nXA4Ton+uzX7ZVR5uotLdwS67mq6jzDK6P7i03VuPatu1iCh5fWQK6seZ
   HJSJzGFTMG3Ub/udKS1Tjoxf6Au/yyBwCAP4tmM38ViShRrJD8NOwbLRg
   I+k7aclWmzzGsBtCuJhBq9zWxET+4P9spfy94kkk8AJGrdVbONE28bhNG
   g==;
X-CSE-ConnectionGUID: M8jCzKYHRNSBNZDdX7eQDg==
X-CSE-MsgGUID: KSb1ZTQUSO+82gB0V64lMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="28685961"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="28685961"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 20:34:22 -0700
X-CSE-ConnectionGUID: xM5iYTXvSzO02Za1z40Erg==
X-CSE-MsgGUID: zxDgH8HRRbaFfoJdCt1CLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="103354818"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Oct 2024 20:34:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3S8Z-000UPM-2B;
	Wed, 23 Oct 2024 03:34:19 +0000
Date: Wed, 23 Oct 2024 11:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 7e336a6c15ec7675adc1b376ca176ab013642098
Message-ID: <202410231123.wpXGDcoe-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 7e336a6c15ec7675adc1b376ca176ab013642098  MAINTAINERS: add a keyword entry for the GPIO subsystem

elapsed time: 1157m

configs tested: 193
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              alldefconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                          axs103_defconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241022    gcc-14.1.0
arc                   randconfig-002-20241022    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                      footbridge_defconfig    clang-20
arm                       imx_v4_v5_defconfig    clang-20
arm                      jornada720_defconfig    clang-20
arm                       multi_v4t_defconfig    clang-20
arm                         mv78xx0_defconfig    clang-20
arm                   randconfig-001-20241022    gcc-14.1.0
arm                   randconfig-002-20241022    gcc-14.1.0
arm                   randconfig-003-20241022    gcc-14.1.0
arm                   randconfig-004-20241022    gcc-14.1.0
arm                        shmobile_defconfig    clang-20
arm                           sunxi_defconfig    clang-20
arm                    vt8500_v6_v7_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241022    gcc-14.1.0
arm64                 randconfig-002-20241022    gcc-14.1.0
arm64                 randconfig-003-20241022    gcc-14.1.0
arm64                 randconfig-004-20241022    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241022    gcc-14.1.0
csky                  randconfig-002-20241022    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241022    gcc-14.1.0
hexagon               randconfig-002-20241022    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241022    clang-18
i386        buildonly-randconfig-002-20241022    clang-18
i386        buildonly-randconfig-003-20241022    clang-18
i386        buildonly-randconfig-004-20241022    clang-18
i386        buildonly-randconfig-005-20241022    clang-18
i386        buildonly-randconfig-006-20241022    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241022    clang-18
i386                  randconfig-002-20241022    clang-18
i386                  randconfig-003-20241022    clang-18
i386                  randconfig-004-20241022    clang-18
i386                  randconfig-005-20241022    clang-18
i386                  randconfig-006-20241022    clang-18
i386                  randconfig-011-20241022    clang-18
i386                  randconfig-012-20241022    clang-18
i386                  randconfig-013-20241022    clang-18
i386                  randconfig-014-20241022    clang-18
i386                  randconfig-015-20241022    clang-18
i386                  randconfig-016-20241022    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241022    gcc-14.1.0
loongarch             randconfig-002-20241022    gcc-14.1.0
m68k                             alldefconfig    clang-20
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                         apollo_defconfig    clang-20
m68k                                defconfig    gcc-14.1.0
m68k                           sun3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                  cavium_octeon_defconfig    clang-20
mips                            gpr_defconfig    clang-20
mips                           ip28_defconfig    clang-20
mips                           ip30_defconfig    clang-20
mips                           jazz_defconfig    clang-20
nios2                         3c120_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241022    gcc-14.1.0
nios2                 randconfig-002-20241022    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241022    gcc-14.1.0
parisc                randconfig-002-20241022    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                    adder875_defconfig    clang-20
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                    gamecube_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                      ppc44x_defconfig    clang-20
powerpc               randconfig-001-20241022    gcc-14.1.0
powerpc               randconfig-002-20241022    gcc-14.1.0
powerpc               randconfig-003-20241022    gcc-14.1.0
powerpc                     redwood_defconfig    clang-20
powerpc64             randconfig-001-20241022    gcc-14.1.0
powerpc64             randconfig-002-20241022    gcc-14.1.0
powerpc64             randconfig-003-20241022    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241022    gcc-14.1.0
riscv                 randconfig-002-20241022    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241022    gcc-14.1.0
s390                  randconfig-002-20241022    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    clang-20
sh                          kfr2r09_defconfig    clang-20
sh                    randconfig-001-20241022    gcc-14.1.0
sh                    randconfig-002-20241022    gcc-14.1.0
sh                           se7722_defconfig    clang-20
sh                           se7724_defconfig    clang-20
sh                        sh7785lcr_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241022    gcc-14.1.0
sparc64               randconfig-002-20241022    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241022    gcc-14.1.0
um                    randconfig-002-20241022    gcc-14.1.0
um                           x86_64_defconfig    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241022    clang-18
x86_64      buildonly-randconfig-002-20241022    clang-18
x86_64      buildonly-randconfig-003-20241022    clang-18
x86_64      buildonly-randconfig-004-20241022    clang-18
x86_64      buildonly-randconfig-005-20241022    clang-18
x86_64      buildonly-randconfig-006-20241022    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                randconfig-001-20241022    clang-18
x86_64                randconfig-002-20241022    clang-18
x86_64                randconfig-003-20241022    clang-18
x86_64                randconfig-004-20241022    clang-18
x86_64                randconfig-005-20241022    clang-18
x86_64                randconfig-006-20241022    clang-18
x86_64                randconfig-011-20241022    clang-18
x86_64                randconfig-012-20241022    clang-18
x86_64                randconfig-013-20241022    clang-18
x86_64                randconfig-014-20241022    clang-18
x86_64                randconfig-015-20241022    clang-18
x86_64                randconfig-016-20241022    clang-18
x86_64                randconfig-071-20241022    clang-18
x86_64                randconfig-072-20241022    clang-18
x86_64                randconfig-073-20241022    clang-18
x86_64                randconfig-074-20241022    clang-18
x86_64                randconfig-075-20241022    clang-18
x86_64                randconfig-076-20241022    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241022    gcc-14.1.0
xtensa                randconfig-002-20241022    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

