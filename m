Return-Path: <linux-gpio+bounces-29125-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F349FC8D831
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 10:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7737A341D71
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 09:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9FD328B69;
	Thu, 27 Nov 2025 09:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XbQLWJSD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8D83242C8
	for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764235456; cv=none; b=jVEPOEbU6lvBe8HfUvkTDBAgVoHSbDH3UQI+JiAjGcfkISEJtjNlk02/7oRLtMMtC9f9B48X8FzJQDNho7n/8mWzn8bqAG/lEUY8xHqMVsb3cyYgqRAFPDfEnl+ddsdgr20MeAf2orqHJd8tf1qpmFb9ci+YA9OPLtaFQPaOOiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764235456; c=relaxed/simple;
	bh=lU3YEX2lIZKGvb2rNBXNOBXFeXck+N7MfFe0xJ6y2/E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KA7ojPDtmbvHcID5bVPgyQTc/VO0K4Cr/2sXxKOgkK6xGD81Y1/YG3agB32XwIbcb0RGr0cqhQkCXN3kcoxjlt8ajG+SqiaPqcWqKJ8mRnDmESpqWGwTpAKIdI1dV7NF9Qmj8tV7UjA5Ps+Ro3cFhDm4S9RO4XsmYFESO5oQKvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XbQLWJSD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764235454; x=1795771454;
  h=date:from:to:cc:subject:message-id;
  bh=lU3YEX2lIZKGvb2rNBXNOBXFeXck+N7MfFe0xJ6y2/E=;
  b=XbQLWJSDTtWA+Hp3W+DhfYc5JaTs3g59Kyf3BwPhSbH2r+faWcmxLRI8
   vlvM7E+zebTygCVyTGl14U278SKpHqwfBPXYMc3CUinvEV/7fw1uV2Jd1
   uNAko/ir3oxTyZ19Bzy/H/LiA5yOvL3iWxcndUIf+nqcUM7mqAS89ogvI
   kuKgl0FISx45ortcxb7dJA3PJu6soQ41b1N4fwidSnpLZG8/Fvt07oefv
   vknI+XTS9C0Sa6X7hcpTJadDTJ9+9nFDXYZTMk4gwMDS5cmqehS50Bodp
   +Hbo4CvD0fAeaAc/oFXhdPRPHzEwL7FQppGQy6FmJwhMaKJQ+U5T78STf
   g==;
X-CSE-ConnectionGUID: C5iWJjs7R/KPQ5EFu54ktA==
X-CSE-MsgGUID: yS1Pln9kRKCR2Xk5xr5JDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77642864"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="77642864"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 01:24:11 -0800
X-CSE-ConnectionGUID: mMyrtVB7TF6K/LcMXe/KvQ==
X-CSE-MsgGUID: 3pgscleVRoGS1/ebdB/dFw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Nov 2025 01:24:10 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOYER-000000004C9-2Ynn;
	Thu, 27 Nov 2025 09:24:07 +0000
Date: Thu, 27 Nov 2025 17:23:52 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/cix-deps] BUILD SUCCESS
 91f9345d6ba65a926bf0df0e76d6f4bb2619eabc
Message-ID: <202511271747.jbeHVWw0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/cix-deps
branch HEAD: 91f9345d6ba65a926bf0df0e76d6f4bb2619eabc  pinctrl: cix: Fix obscure dependency

elapsed time: 2178m

configs tested: 180
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                              alldefconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20251126    gcc-13.4.0
arc                   randconfig-001-20251127    clang-22
arc                   randconfig-002-20251126    gcc-11.5.0
arc                   randconfig-002-20251127    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                      integrator_defconfig    clang-22
arm                   randconfig-001-20251126    clang-22
arm                   randconfig-001-20251127    clang-22
arm                   randconfig-002-20251126    clang-22
arm                   randconfig-002-20251127    clang-22
arm                   randconfig-003-20251126    clang-19
arm                   randconfig-003-20251127    clang-22
arm                   randconfig-004-20251126    clang-22
arm                   randconfig-004-20251127    clang-22
arm                         s3c6400_defconfig    clang-22
arm                         s3c6400_defconfig    gcc-15.1.0
arm                         socfpga_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-16
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251127    gcc-15.1.0
arm64                 randconfig-002-20251127    gcc-15.1.0
arm64                 randconfig-003-20251127    gcc-15.1.0
arm64                 randconfig-004-20251127    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251127    gcc-15.1.0
csky                  randconfig-002-20251127    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon               randconfig-001-20251127    gcc-15.1.0
hexagon               randconfig-002-20251127    gcc-15.1.0
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386        buildonly-randconfig-001-20251127    clang-20
i386        buildonly-randconfig-002-20251127    clang-20
i386        buildonly-randconfig-003-20251127    clang-20
i386        buildonly-randconfig-004-20251127    clang-20
i386        buildonly-randconfig-005-20251127    clang-20
i386        buildonly-randconfig-006-20251127    clang-20
i386                  randconfig-011-20251127    clang-20
i386                  randconfig-012-20251127    clang-20
i386                  randconfig-013-20251127    clang-20
i386                  randconfig-014-20251127    clang-20
i386                  randconfig-015-20251127    clang-20
i386                  randconfig-016-20251127    clang-20
i386                  randconfig-017-20251127    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251127    gcc-15.1.0
loongarch             randconfig-002-20251127    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
mips                         rt305x_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251127    gcc-15.1.0
nios2                 randconfig-002-20251127    gcc-15.1.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                       virt_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251126    gcc-8.5.0
parisc                randconfig-001-20251127    gcc-13.4.0
parisc                randconfig-002-20251126    gcc-15.1.0
parisc                randconfig-002-20251127    gcc-13.4.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    clang-22
powerpc                   bluestone_defconfig    clang-22
powerpc                 linkstation_defconfig    clang-22
powerpc                 mpc836x_rdk_defconfig    clang-22
powerpc               randconfig-001-20251126    gcc-10.5.0
powerpc               randconfig-001-20251127    gcc-13.4.0
powerpc               randconfig-002-20251126    gcc-8.5.0
powerpc               randconfig-002-20251127    gcc-13.4.0
powerpc                     skiroot_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251126    clang-19
powerpc64             randconfig-001-20251127    gcc-13.4.0
powerpc64             randconfig-002-20251126    clang-22
powerpc64             randconfig-002-20251127    gcc-13.4.0
riscv                            allmodconfig    clang-16
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251127    gcc-12.5.0
riscv                 randconfig-002-20251127    gcc-12.5.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251127    gcc-12.5.0
s390                  randconfig-002-20251127    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                          kfr2r09_defconfig    clang-22
sh                          r7780mp_defconfig    gcc-15.1.0
sh                    randconfig-001-20251127    gcc-12.5.0
sh                    randconfig-002-20251127    gcc-12.5.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251126    gcc-8.5.0
sparc                 randconfig-001-20251127    clang-22
sparc                 randconfig-002-20251126    gcc-14.3.0
sparc                 randconfig-002-20251127    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251126    gcc-8.5.0
sparc64               randconfig-001-20251127    clang-22
sparc64               randconfig-002-20251126    clang-22
sparc64               randconfig-002-20251127    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251126    clang-19
um                    randconfig-001-20251127    clang-22
um                    randconfig-002-20251126    clang-22
um                    randconfig-002-20251127    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20251127    clang-20
x86_64      buildonly-randconfig-002-20251127    clang-20
x86_64      buildonly-randconfig-003-20251127    clang-20
x86_64      buildonly-randconfig-004-20251127    clang-20
x86_64      buildonly-randconfig-005-20251127    clang-20
x86_64      buildonly-randconfig-006-20251127    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251127    gcc-14
x86_64                randconfig-002-20251127    gcc-14
x86_64                randconfig-003-20251127    gcc-14
x86_64                randconfig-004-20251127    gcc-14
x86_64                randconfig-005-20251127    gcc-14
x86_64                randconfig-006-20251127    gcc-14
x86_64                randconfig-071-20251127    gcc-14
x86_64                randconfig-072-20251127    gcc-14
x86_64                randconfig-073-20251127    gcc-14
x86_64                randconfig-074-20251127    gcc-14
x86_64                randconfig-075-20251127    gcc-14
x86_64                randconfig-076-20251127    gcc-14
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251126    gcc-14.3.0
xtensa                randconfig-001-20251127    clang-22
xtensa                randconfig-002-20251126    gcc-10.5.0
xtensa                randconfig-002-20251127    clang-22
xtensa                    xip_kc705_defconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

