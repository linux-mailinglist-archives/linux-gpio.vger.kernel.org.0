Return-Path: <linux-gpio+bounces-10855-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF43990662
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 16:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AF4C1F21B30
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 14:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899C72178E6;
	Fri,  4 Oct 2024 14:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlDAyMtw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E937215F6C
	for <linux-gpio@vger.kernel.org>; Fri,  4 Oct 2024 14:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728052826; cv=none; b=iITCxVrHlb8CSOx7ATS7i5VX0UAE0xpyQrjxt5qjACexXYzGGxxkC3L5bjSpj0uPNuJPdSbZDdGvbZppngPNsbyqsaItVAMD0V0jVeP5E27xOHSem/9q7RMEN99Q2G9G/mqbF7zkfzzp9ZKuYcpOVH8w0AVQXQl+xWRmKRiQZGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728052826; c=relaxed/simple;
	bh=qW1M2p1AVJlF2aTAFOm9Ocxftu50QFpQdN9dFBRDl64=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gG8pnFeWBNDdyrWiOb73w3G+ofysEwTaSwBDYmZS4HPOptWXGfqzE7TBa/modZNilnBiTPXzkRzhRJsFIpNYo3P+z2lNCkwzksyCUsWc0XBpZIvibuG0JDkXdGg8x+daZIuVdb4lrRtPmDMCXIXXzf7FeM0rs1QUN7xfz7ZjFhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WlDAyMtw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728052824; x=1759588824;
  h=date:from:to:cc:subject:message-id;
  bh=qW1M2p1AVJlF2aTAFOm9Ocxftu50QFpQdN9dFBRDl64=;
  b=WlDAyMtwtNEni26QJ1tCd237nKn5tJVbiJwRW6SatIjce/oRiKmU3b02
   dqsz4rBo0BluMxDjnWOwcxd1wTBBetMzsc/hAsHpCH3Ff4ERHK/R4/EIp
   2kpWhegztwFic++dtW1fn3lTCZnY/cnIUc9TqDBkl/j5V62TiGqIy2squ
   oPav7PhiHlFM0xSmkHLtPxDD5cHXpaluv0gxCbpYzK6t4MXqayCJmHBzi
   eehjfD2YhqCS/IKkJdFOp6H3Z40cXNEQZwR1QTEiTa7ymxUj6VU6Fh4So
   8tLZd7rNfPJREASW6gnhdluzgpyDS+VH4DzVnH1aT0XJ0HXPjvJnhsPbT
   g==;
X-CSE-ConnectionGUID: nKMOXCC7RMWQ1US79yyL8Q==
X-CSE-MsgGUID: AxABtS0KRRSh4ObVZ+TCJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27161529"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27161529"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 07:40:23 -0700
X-CSE-ConnectionGUID: 535idK51T62qLiDWJIG08Q==
X-CSE-MsgGUID: IWULYTq6QeCJ+32jG3HK+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="112203660"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Oct 2024 07:40:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swjTg-0001lc-11;
	Fri, 04 Oct 2024 14:40:20 +0000
Date: Fri, 04 Oct 2024 22:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/fix-imx27-pc] BUILD SUCCESS
 2cedd2976b8b700278e37f3e51d094496701851a
Message-ID: <202410042234.PD46neoL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/fix-imx27-pc
branch HEAD: 2cedd2976b8b700278e37f3e51d094496701851a  pinctrl: imx27: Fix too generic defines

elapsed time: 1358m

configs tested: 199
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241004    gcc-14.1.0
arc                   randconfig-002-20241004    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                         bcm2835_defconfig    gcc-14.1.0
arm                          collie_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                            dove_defconfig    clang-14
arm                        keystone_defconfig    gcc-14.1.0
arm                       multi_v4t_defconfig    clang-14
arm                        neponset_defconfig    clang-14
arm                   randconfig-001-20241004    gcc-14.1.0
arm                   randconfig-002-20241004    gcc-14.1.0
arm                   randconfig-003-20241004    gcc-14.1.0
arm                   randconfig-004-20241004    gcc-14.1.0
arm                           spitz_defconfig    clang-14
arm                         vf610m4_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241004    gcc-14.1.0
arm64                 randconfig-002-20241004    gcc-14.1.0
arm64                 randconfig-003-20241004    gcc-14.1.0
arm64                 randconfig-004-20241004    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241004    gcc-14.1.0
csky                  randconfig-002-20241004    gcc-14.1.0
hexagon                          alldefconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241004    gcc-14.1.0
hexagon               randconfig-002-20241004    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241004    clang-18
i386        buildonly-randconfig-002-20241004    clang-18
i386        buildonly-randconfig-003-20241004    clang-18
i386        buildonly-randconfig-004-20241004    clang-18
i386        buildonly-randconfig-005-20241004    clang-18
i386        buildonly-randconfig-006-20241004    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241004    clang-18
i386                  randconfig-002-20241004    clang-18
i386                  randconfig-003-20241004    clang-18
i386                  randconfig-004-20241004    clang-18
i386                  randconfig-005-20241004    clang-18
i386                  randconfig-006-20241004    clang-18
i386                  randconfig-011-20241004    clang-18
i386                  randconfig-012-20241004    clang-18
i386                  randconfig-013-20241004    clang-18
i386                  randconfig-014-20241004    clang-18
i386                  randconfig-015-20241004    clang-18
i386                  randconfig-016-20241004    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241004    gcc-14.1.0
loongarch             randconfig-002-20241004    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5208evb_defconfig    clang-14
m68k                          multi_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                            gpr_defconfig    clang-14
mips                malta_qemu_32r6_defconfig    clang-14
mips                      maltaaprp_defconfig    clang-14
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241004    gcc-14.1.0
nios2                 randconfig-002-20241004    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241004    gcc-14.1.0
parisc                randconfig-002-20241004    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      arches_defconfig    gcc-14.1.0
powerpc                   bluestone_defconfig    clang-14
powerpc                      chrp32_defconfig    gcc-14.1.0
powerpc                      cm5200_defconfig    gcc-14.1.0
powerpc                     ep8248e_defconfig    clang-14
powerpc                      ep88xc_defconfig    clang-14
powerpc                  iss476-smp_defconfig    clang-14
powerpc                   microwatt_defconfig    clang-14
powerpc                   motionpro_defconfig    clang-14
powerpc               randconfig-001-20241004    gcc-14.1.0
powerpc               randconfig-002-20241004    gcc-14.1.0
powerpc               randconfig-003-20241004    gcc-14.1.0
powerpc                    sam440ep_defconfig    gcc-14.1.0
powerpc                     sequoia_defconfig    clang-14
powerpc                    socrates_defconfig    gcc-14.1.0
powerpc                     stx_gp3_defconfig    gcc-14.1.0
powerpc                     taishan_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241004    gcc-14.1.0
powerpc64             randconfig-002-20241004    gcc-14.1.0
powerpc64             randconfig-003-20241004    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241004    gcc-14.1.0
riscv                 randconfig-002-20241004    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241004    gcc-14.1.0
s390                  randconfig-002-20241004    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20241004    gcc-14.1.0
sh                    randconfig-002-20241004    gcc-14.1.0
sh                           se7619_defconfig    gcc-14.1.0
sh                           se7751_defconfig    clang-14
sh                  sh7785lcr_32bit_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241004    gcc-14.1.0
sparc64               randconfig-002-20241004    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241004    gcc-14.1.0
um                    randconfig-002-20241004    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
um                           x86_64_defconfig    gcc-14.1.0
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241004    clang-18
x86_64      buildonly-randconfig-002-20241004    clang-18
x86_64      buildonly-randconfig-003-20241004    clang-18
x86_64      buildonly-randconfig-004-20241004    clang-18
x86_64      buildonly-randconfig-005-20241004    clang-18
x86_64      buildonly-randconfig-006-20241004    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241004    clang-18
x86_64                randconfig-002-20241004    clang-18
x86_64                randconfig-003-20241004    clang-18
x86_64                randconfig-004-20241004    clang-18
x86_64                randconfig-005-20241004    clang-18
x86_64                randconfig-006-20241004    clang-18
x86_64                randconfig-011-20241004    clang-18
x86_64                randconfig-012-20241004    clang-18
x86_64                randconfig-013-20241004    clang-18
x86_64                randconfig-014-20241004    clang-18
x86_64                randconfig-015-20241004    clang-18
x86_64                randconfig-016-20241004    clang-18
x86_64                randconfig-071-20241004    clang-18
x86_64                randconfig-072-20241004    clang-18
x86_64                randconfig-073-20241004    clang-18
x86_64                randconfig-074-20241004    clang-18
x86_64                randconfig-075-20241004    clang-18
x86_64                randconfig-076-20241004    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241004    gcc-14.1.0
xtensa                randconfig-002-20241004    gcc-14.1.0
xtensa                         virt_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

