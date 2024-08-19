Return-Path: <linux-gpio+bounces-8831-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8D795753C
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 22:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B070FB241E9
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 20:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414121DD383;
	Mon, 19 Aug 2024 20:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/A230Qp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A5018E0E
	for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2024 20:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724097906; cv=none; b=dOnpIf8jqIMAl3/pGcI4vZn7adVSloDUH5Neei50KML040OsOentUdh1WQbMkHSmiBkdAY17SoiyqK+6NvaRrTlr1JK3CL+gW2eQzDKuyqX3ke0bd9hv5U/hhacCdi10EQwMUr8TdIghyuRi3nSM3ZS8Uk2p6W9Wno2TmXCxPqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724097906; c=relaxed/simple;
	bh=ft3wnhgo3vMbHUGPhsFDK2q0/uHQrblF3/aNfsBJfD0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c/XC9p3GO71lK3+3SLdAJle/cVk9bWqcV19p6wLj3LmMR3hz6ZJz1WBq/Me32UTVmShx0r38/aWJ65dUZlm1R1SjZolNCaG1kYJ3ciGcDKzUe2+FVbeih+6vd3sVQzr6VUCZgtAO7EqyQq86FeTzYZzbT5YwS0LhjfOIi8N5yrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/A230Qp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724097904; x=1755633904;
  h=date:from:to:cc:subject:message-id;
  bh=ft3wnhgo3vMbHUGPhsFDK2q0/uHQrblF3/aNfsBJfD0=;
  b=m/A230QpQqWJgqE4vcwc97+67S7CSofxYHGsiWTx+KQ7MKFuFTXN/NO3
   daaGRNVzWAuS2p03xHwN0R8LHH55+uTM2sV0dZMC4A0Y8Qi6b5U5Pvjrx
   hMrPoKJOK2gBQHdWjD6X4JhgSkrQ8ScMwAJhUA4PEfNpCItq2p0oVQiHw
   TEp5nUghmgn2pevDz6SH0SF6X5Vo8WDPcwiU2BvRoOx3hsGsAbSM4wXfD
   vze9bfgG8ALi0lk/BcksEMp7fRFEwd06JF9kyEzLN9mDQ1e1RqrK/V2ZS
   pcVYUk7Vd8dlHL1XuumtqSj9sD+TFCK2D37REl/Z2OinhOTcyDZzEEbrT
   A==;
X-CSE-ConnectionGUID: 9gu9uWVsTViAtJzYNBYDZg==
X-CSE-MsgGUID: E/kBgL1cTLqYQ+HGBGsw4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="13099186"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; 
   d="scan'208";a="13099186"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 13:05:03 -0700
X-CSE-ConnectionGUID: VSYiJ7v1RW63Fxo8wR8BEQ==
X-CSE-MsgGUID: m8+Krg4CTDSStwXKRlomCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; 
   d="scan'208";a="61257505"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Aug 2024 13:05:02 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg8cd-0009OE-0d;
	Mon, 19 Aug 2024 20:04:59 +0000
Date: Tue, 20 Aug 2024 04:04:15 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:davinci/for-next] BUILD SUCCESS
 973d248c43f237e53116009dec70091c8e836c11
Message-ID: <202408200412.GbeKHufj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git davinci/for-next
branch HEAD: 973d248c43f237e53116009dec70091c8e836c11  ARM: davinci: remove unused cpuidle code

elapsed time: 729m

configs tested: 140
configs skipped: 107

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              alldefconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsim_700_defconfig   gcc-13.2.0
arc                   randconfig-001-20240819   gcc-13.2.0
arc                   randconfig-002-20240819   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                      footbridge_defconfig   gcc-13.2.0
arm                   randconfig-001-20240819   gcc-13.2.0
arm                   randconfig-002-20240819   gcc-13.2.0
arm                   randconfig-003-20240819   gcc-13.2.0
arm                   randconfig-004-20240819   gcc-13.2.0
arm                             rpc_defconfig   gcc-13.2.0
arm                         s3c6400_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240819   gcc-13.2.0
arm64                 randconfig-002-20240819   gcc-13.2.0
arm64                 randconfig-003-20240819   gcc-13.2.0
arm64                 randconfig-004-20240819   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240819   gcc-13.2.0
csky                  randconfig-002-20240819   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240819   clang-18
i386         buildonly-randconfig-002-20240819   clang-18
i386         buildonly-randconfig-003-20240819   clang-18
i386         buildonly-randconfig-004-20240819   clang-18
i386         buildonly-randconfig-005-20240819   clang-18
i386         buildonly-randconfig-006-20240819   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240819   clang-18
i386                  randconfig-002-20240819   clang-18
i386                  randconfig-003-20240819   clang-18
i386                  randconfig-004-20240819   clang-18
i386                  randconfig-005-20240819   clang-18
i386                  randconfig-006-20240819   clang-18
i386                  randconfig-011-20240819   clang-18
i386                  randconfig-012-20240819   clang-18
i386                  randconfig-013-20240819   clang-18
i386                  randconfig-014-20240819   clang-18
i386                  randconfig-015-20240819   clang-18
i386                  randconfig-016-20240819   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240819   gcc-13.2.0
loongarch             randconfig-002-20240819   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           ip22_defconfig   gcc-13.2.0
mips                      malta_kvm_defconfig   gcc-13.2.0
mips                      maltaaprp_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240819   gcc-13.2.0
nios2                 randconfig-002-20240819   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240819   gcc-13.2.0
parisc                randconfig-002-20240819   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                 mpc8315_rdb_defconfig   gcc-13.2.0
powerpc                 mpc837x_rdb_defconfig   gcc-13.2.0
powerpc                  mpc885_ads_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240819   gcc-13.2.0
powerpc               randconfig-002-20240819   gcc-13.2.0
powerpc64             randconfig-001-20240819   gcc-13.2.0
powerpc64             randconfig-002-20240819   gcc-13.2.0
powerpc64             randconfig-003-20240819   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240819   gcc-13.2.0
riscv                 randconfig-002-20240819   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240819   gcc-13.2.0
s390                  randconfig-002-20240819   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sh                             espt_defconfig   gcc-13.2.0
sh                          lboxre2_defconfig   gcc-13.2.0
sh                     magicpanelr2_defconfig   gcc-13.2.0
sh                    randconfig-001-20240819   gcc-13.2.0
sh                    randconfig-002-20240819   gcc-13.2.0
sh                           se7724_defconfig   gcc-13.2.0
sh                            titan_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240819   gcc-13.2.0
sparc64               randconfig-002-20240819   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240819   gcc-13.2.0
um                    randconfig-002-20240819   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240819   gcc-13.2.0
xtensa                randconfig-002-20240819   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

