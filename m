Return-Path: <linux-gpio+bounces-8898-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2E3959333
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 05:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8076D284B14
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 03:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870D214C585;
	Wed, 21 Aug 2024 03:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0k55+ZU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B4D22619
	for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 03:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724210056; cv=none; b=tHcUocqBYQdj2nnIP66fTq58R53q/jkQtNsd7uEH9ZhOWzIBYwNjmvxk+4NaIjPSXGElBHOMVDC3125lnwLRMIjSt187NrpCB4jCLrbLfOOpKM77gMSEgmIsl4UBi25ehJKFOCtHYgtD9mP2ybHusyGOppW2Q5IuCRVPEMJmxuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724210056; c=relaxed/simple;
	bh=vO/oVJSdbyfwfRaPvxtOc1//uAa/szCZYfSWw4+l/GE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PkTNzHS0AoeMvmHx+QVBQ7jsUG4u3QD00BsMXH0ug79K8Nf/ZaTZROzfwA1t8o0ujPkZJBbMl1yoa0Hi/ORSBLGCoMGifaYGaloT9z925QU1Z2OV7OTV8NKZcBOO+0XY8DsqP9qmbL2lBSTSJAeQstCjRhb+wuSELnpHDkvbS3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0k55+ZU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724210054; x=1755746054;
  h=date:from:to:cc:subject:message-id;
  bh=vO/oVJSdbyfwfRaPvxtOc1//uAa/szCZYfSWw4+l/GE=;
  b=e0k55+ZULeXl67LgtiBntEbf0A7xkPmBdffTEThTYvF4vTQkj3xn9tTl
   NDmTLsxOXbFA+/qk1JKTF4Lcr+2oPOs29+nNVHnaxaayqxAwh848PgDnb
   xjiX4orv8AVBUl4wUDB+Qmu8FcEEw84jZpTlqqKgxcNJmnlqOYq6V6xyq
   nGynF9ZuPm1YyNyUreSbq04c0zcQKFjYjsPbLdcFDFVvcgBbARxf8WO6+
   dJJkF5MyawA17uHFW1/f35QUl5R91wLzUo8fymCtulAJ44yJgbwV8v7mx
   n5JAwAJUgyCCGcVsw9cw0v0XqYtYEOptbaoHwUZggdRuRxhWWfdor906D
   A==;
X-CSE-ConnectionGUID: oBGGIscHTryhnOY4i0mSEA==
X-CSE-MsgGUID: LgQW6ujQTaqGQ88olkR9dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22162233"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="22162233"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 20:14:04 -0700
X-CSE-ConnectionGUID: n3pvwCOHQ5697J19a3YqCg==
X-CSE-MsgGUID: 1e1nlVWRTXi2HzyVwySR/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="60655182"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Aug 2024 20:14:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgbnN-000Apm-1m;
	Wed, 21 Aug 2024 03:14:01 +0000
Date: Wed, 21 Aug 2024 11:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 4b91188dced811e2d867574b672888406cb7114c
Message-ID: <202408211154.AC4MGadU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 4b91188dced811e2d867574b672888406cb7114c  gpiolib: Replace gpio_suffix_count with NULL-terminated array

elapsed time: 1090m

configs tested: 287
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                            hsdk_defconfig   gcc-13.2.0
arc                   randconfig-001-20240820   gcc-13.2.0
arc                   randconfig-002-20240820   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                         assabet_defconfig   gcc-13.2.0
arm                     davinci_all_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                          ep93xx_defconfig   clang-20
arm                      jornada720_defconfig   clang-20
arm                             mxs_defconfig   clang-20
arm                       netwinder_defconfig   clang-20
arm                   randconfig-001-20240820   clang-20
arm                   randconfig-001-20240820   gcc-13.2.0
arm                   randconfig-002-20240820   clang-20
arm                   randconfig-002-20240820   gcc-13.2.0
arm                   randconfig-003-20240820   clang-20
arm                   randconfig-003-20240820   gcc-13.2.0
arm                   randconfig-004-20240820   clang-20
arm                   randconfig-004-20240820   gcc-13.2.0
arm                           sama5_defconfig   gcc-13.2.0
arm                          sp7021_defconfig   clang-20
arm                           stm32_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240820   clang-20
arm64                 randconfig-001-20240820   gcc-13.2.0
arm64                 randconfig-002-20240820   clang-20
arm64                 randconfig-002-20240820   gcc-13.2.0
arm64                 randconfig-003-20240820   gcc-13.2.0
arm64                 randconfig-003-20240820   gcc-14.1.0
arm64                 randconfig-004-20240820   clang-20
arm64                 randconfig-004-20240820   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240820   gcc-13.2.0
csky                  randconfig-001-20240820   gcc-14.1.0
csky                  randconfig-002-20240820   gcc-13.2.0
csky                  randconfig-002-20240820   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240820   clang-20
hexagon               randconfig-002-20240820   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240820   clang-18
i386         buildonly-randconfig-001-20240821   gcc-12
i386         buildonly-randconfig-002-20240820   clang-18
i386         buildonly-randconfig-002-20240821   gcc-12
i386         buildonly-randconfig-003-20240820   clang-18
i386         buildonly-randconfig-003-20240821   gcc-12
i386         buildonly-randconfig-004-20240820   clang-18
i386         buildonly-randconfig-004-20240820   gcc-12
i386         buildonly-randconfig-004-20240821   gcc-12
i386         buildonly-randconfig-005-20240820   clang-18
i386         buildonly-randconfig-005-20240821   gcc-12
i386         buildonly-randconfig-006-20240820   clang-18
i386         buildonly-randconfig-006-20240821   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240820   clang-18
i386                  randconfig-001-20240821   gcc-12
i386                  randconfig-002-20240820   clang-18
i386                  randconfig-002-20240821   gcc-12
i386                  randconfig-003-20240820   clang-18
i386                  randconfig-003-20240821   gcc-12
i386                  randconfig-004-20240820   clang-18
i386                  randconfig-004-20240821   gcc-12
i386                  randconfig-005-20240820   clang-18
i386                  randconfig-005-20240821   gcc-12
i386                  randconfig-006-20240820   clang-18
i386                  randconfig-006-20240821   gcc-12
i386                  randconfig-011-20240820   clang-18
i386                  randconfig-011-20240820   gcc-11
i386                  randconfig-011-20240821   gcc-12
i386                  randconfig-012-20240820   clang-18
i386                  randconfig-012-20240820   gcc-12
i386                  randconfig-012-20240821   gcc-12
i386                  randconfig-013-20240820   clang-18
i386                  randconfig-013-20240820   gcc-12
i386                  randconfig-013-20240821   gcc-12
i386                  randconfig-014-20240820   clang-18
i386                  randconfig-014-20240820   gcc-12
i386                  randconfig-014-20240821   gcc-12
i386                  randconfig-015-20240820   clang-18
i386                  randconfig-015-20240820   gcc-12
i386                  randconfig-015-20240821   gcc-12
i386                  randconfig-016-20240820   clang-18
i386                  randconfig-016-20240821   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240820   gcc-13.2.0
loongarch             randconfig-001-20240820   gcc-14.1.0
loongarch             randconfig-002-20240820   gcc-13.2.0
loongarch             randconfig-002-20240820   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5208evb_defconfig   gcc-13.2.0
m68k                        m5272c3_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                       bmips_be_defconfig   clang-20
mips                      bmips_stb_defconfig   gcc-13.2.0
mips                          eyeq6_defconfig   clang-20
mips                      malta_kvm_defconfig   clang-20
mips                      maltaaprp_defconfig   clang-20
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240820   gcc-13.2.0
nios2                 randconfig-001-20240820   gcc-14.1.0
nios2                 randconfig-002-20240820   gcc-13.2.0
nios2                 randconfig-002-20240820   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240820   gcc-13.2.0
parisc                randconfig-001-20240820   gcc-14.1.0
parisc                randconfig-002-20240820   gcc-13.2.0
parisc                randconfig-002-20240820   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                 canyonlands_defconfig   gcc-13.2.0
powerpc                       eiger_defconfig   clang-20
powerpc                     ep8248e_defconfig   gcc-13.2.0
powerpc                       maple_defconfig   gcc-13.2.0
powerpc                     mpc5200_defconfig   gcc-13.2.0
powerpc                 mpc832x_rdb_defconfig   gcc-13.2.0
powerpc                      pcm030_defconfig   clang-20
powerpc                      ppc64e_defconfig   gcc-13.2.0
powerpc                      ppc6xx_defconfig   gcc-13.2.0
powerpc                     rainier_defconfig   clang-20
powerpc               randconfig-003-20240820   clang-20
powerpc               randconfig-003-20240820   gcc-13.2.0
powerpc64             randconfig-001-20240820   gcc-13.2.0
powerpc64             randconfig-001-20240820   gcc-14.1.0
powerpc64             randconfig-002-20240820   clang-20
powerpc64             randconfig-002-20240820   gcc-13.2.0
powerpc64             randconfig-003-20240820   gcc-13.2.0
powerpc64             randconfig-003-20240820   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240820   clang-20
riscv                 randconfig-001-20240820   gcc-13.2.0
riscv                 randconfig-002-20240820   gcc-13.2.0
riscv                 randconfig-002-20240820   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240820   gcc-13.2.0
s390                  randconfig-001-20240820   gcc-14.1.0
s390                  randconfig-002-20240820   gcc-13.2.0
s390                  randconfig-002-20240820   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                 kfr2r09-romimage_defconfig   gcc-13.2.0
sh                    randconfig-001-20240820   gcc-13.2.0
sh                    randconfig-001-20240820   gcc-14.1.0
sh                    randconfig-002-20240820   gcc-13.2.0
sh                    randconfig-002-20240820   gcc-14.1.0
sh                           se7619_defconfig   gcc-13.2.0
sh                           se7705_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240820   gcc-13.2.0
sparc64               randconfig-001-20240820   gcc-14.1.0
sparc64               randconfig-002-20240820   gcc-13.2.0
sparc64               randconfig-002-20240820   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240820   gcc-12
um                    randconfig-001-20240820   gcc-13.2.0
um                    randconfig-002-20240820   clang-20
um                    randconfig-002-20240820   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240820   clang-18
x86_64       buildonly-randconfig-001-20240821   gcc-12
x86_64       buildonly-randconfig-002-20240820   clang-18
x86_64       buildonly-randconfig-002-20240821   gcc-12
x86_64       buildonly-randconfig-003-20240820   clang-18
x86_64       buildonly-randconfig-003-20240821   gcc-12
x86_64       buildonly-randconfig-004-20240820   clang-18
x86_64       buildonly-randconfig-004-20240821   gcc-12
x86_64       buildonly-randconfig-005-20240820   clang-18
x86_64       buildonly-randconfig-005-20240821   gcc-12
x86_64       buildonly-randconfig-006-20240820   clang-18
x86_64       buildonly-randconfig-006-20240821   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240820   clang-18
x86_64                randconfig-001-20240821   gcc-12
x86_64                randconfig-002-20240820   clang-18
x86_64                randconfig-002-20240821   gcc-12
x86_64                randconfig-003-20240820   clang-18
x86_64                randconfig-003-20240821   gcc-12
x86_64                randconfig-004-20240820   clang-18
x86_64                randconfig-004-20240821   gcc-12
x86_64                randconfig-005-20240820   clang-18
x86_64                randconfig-005-20240821   gcc-12
x86_64                randconfig-006-20240820   clang-18
x86_64                randconfig-006-20240821   gcc-12
x86_64                randconfig-011-20240820   clang-18
x86_64                randconfig-011-20240821   gcc-12
x86_64                randconfig-012-20240820   clang-18
x86_64                randconfig-012-20240821   gcc-12
x86_64                randconfig-013-20240820   clang-18
x86_64                randconfig-013-20240821   gcc-12
x86_64                randconfig-014-20240820   clang-18
x86_64                randconfig-014-20240821   gcc-12
x86_64                randconfig-015-20240820   clang-18
x86_64                randconfig-015-20240821   gcc-12
x86_64                randconfig-016-20240820   clang-18
x86_64                randconfig-016-20240821   gcc-12
x86_64                randconfig-071-20240820   clang-18
x86_64                randconfig-071-20240821   gcc-12
x86_64                randconfig-072-20240820   clang-18
x86_64                randconfig-072-20240821   gcc-12
x86_64                randconfig-073-20240820   clang-18
x86_64                randconfig-073-20240821   gcc-12
x86_64                randconfig-074-20240820   clang-18
x86_64                randconfig-074-20240821   gcc-12
x86_64                randconfig-075-20240820   clang-18
x86_64                randconfig-075-20240821   gcc-12
x86_64                randconfig-076-20240820   clang-18
x86_64                randconfig-076-20240821   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240820   gcc-13.2.0
xtensa                randconfig-001-20240820   gcc-14.1.0
xtensa                randconfig-002-20240820   gcc-13.2.0
xtensa                randconfig-002-20240820   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

