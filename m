Return-Path: <linux-gpio+bounces-23969-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09616B18A9F
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Aug 2025 06:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 878E8627B8C
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Aug 2025 04:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924EF130E58;
	Sat,  2 Aug 2025 04:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ErfIuqCE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5037F2628D
	for <linux-gpio@vger.kernel.org>; Sat,  2 Aug 2025 04:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754107528; cv=none; b=aH5DIlsN2SV9VvZOm8wEykU5OD4+gCMI335fl+4YXriErZ4fXDGCR5pO+hhWuhcMx7c898YZNVeuewsU2B8Qs5/EXrdnqEuXPLiH5vUs9Bom/uhYsmqRIHWJCEgryTk+XSZKfuom+UdNFdDh/PT4wWM6UBbpvpRuxTZaGexO4zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754107528; c=relaxed/simple;
	bh=aF1d+YwGtAqQcSRdmZf1kNKTJ7rwR7v7A+tJnFBc62E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ixtlp/tma4cB+I69+p2/qAdV87Gbgbja8zwESPtVaDDXBetRP+jBf/a8OIhPvPWs505XAI5Jbm1xOeyC2k2w4iiXZg0rEFyPaKqK2wAqEWVPg/iAXbgerRfXCdXQerQ0+gowUTlSJcPk9gu+qQE/0dX+7lp6WdE64Mzyy++tZaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ErfIuqCE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754107526; x=1785643526;
  h=date:from:to:cc:subject:message-id;
  bh=aF1d+YwGtAqQcSRdmZf1kNKTJ7rwR7v7A+tJnFBc62E=;
  b=ErfIuqCEwp5Pd9/ZcHN0iBk8sI2uhCZxswE0PsvR3ESVWzxH26m/lVmN
   i9oAkZkGvrCTfF/BBdt2liTCNXsR88UemHDSJN+NQWGHRFGSe1OFlgK8q
   VMbDxeSwhyOH6bcGbwYcAmGzypg2x5B2xvnUKrbNwhgA3cQg9qQDIsBPe
   PIQerjz+qAujm7cG76Bs0CV0r9mAYbtZt93aZCQPgBJgM+1MxpnLqyAQE
   ErGnhVecyZsZ0zJklvdlDC4CkRZ1tKjcpfhS5Ro6nqwFZiw4mhkuHzUlG
   ORHRc4kEGp9+idy4dWme/5tEgYmtv31+O7o2XihpskpCifwdeRBLhdm4/
   Q==;
X-CSE-ConnectionGUID: X7rUxYK2TZ6BJrMBUJn+PA==
X-CSE-MsgGUID: 4V+s2UxsRSeWXepjs/SJzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="73911759"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="73911759"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 21:05:25 -0700
X-CSE-ConnectionGUID: YqV4HzG9TMyty+efBlUR5A==
X-CSE-MsgGUID: SHFITpDBS5ySBTVlgpHrRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="200877687"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Aug 2025 21:05:25 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui3Uo-00059M-0v;
	Sat, 02 Aug 2025 04:05:22 +0000
Date: Sat, 02 Aug 2025 12:04:48 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/devel] BUILD SUCCESS
 13dd340b0bd90aa198954f87c9d7463302d7b8fd
Message-ID: <202508021238.o1J8zPJF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
branch HEAD: 13dd340b0bd90aa198954f87c9d7463302d7b8fd  treewide: rename GPIO set callbacks back to their original names

elapsed time: 989m

configs tested: 135
configs skipped: 4

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
arc                   randconfig-001-20250801    gcc-15.1.0
arc                   randconfig-002-20250801    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                         lpc32xx_defconfig    clang-17
arm                   randconfig-001-20250801    clang-22
arm                   randconfig-002-20250801    gcc-8.5.0
arm                   randconfig-003-20250801    gcc-10.5.0
arm                   randconfig-004-20250801    gcc-14.3.0
arm                          sp7021_defconfig    gcc-15.1.0
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250801    clang-22
arm64                 randconfig-002-20250801    clang-22
arm64                 randconfig-003-20250801    gcc-11.5.0
arm64                 randconfig-004-20250801    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250801    gcc-13.4.0
csky                  randconfig-002-20250801    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250801    clang-22
hexagon               randconfig-002-20250801    clang-22
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250801    clang-20
i386        buildonly-randconfig-002-20250801    gcc-12
i386        buildonly-randconfig-003-20250801    gcc-12
i386        buildonly-randconfig-004-20250801    gcc-12
i386        buildonly-randconfig-005-20250801    gcc-12
i386        buildonly-randconfig-006-20250801    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250801    gcc-15.1.0
loongarch             randconfig-002-20250801    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                           virt_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
nios2                         3c120_defconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250801    gcc-11.5.0
nios2                 randconfig-002-20250801    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250801    gcc-13.4.0
parisc                randconfig-002-20250801    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250801    gcc-13.4.0
powerpc               randconfig-002-20250801    clang-22
powerpc               randconfig-003-20250801    clang-22
powerpc                         wii_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250801    gcc-8.5.0
powerpc64             randconfig-002-20250801    clang-22
powerpc64             randconfig-003-20250801    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250801    clang-22
riscv                 randconfig-002-20250801    clang-17
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250801    clang-22
s390                  randconfig-002-20250801    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                            hp6xx_defconfig    gcc-15.1.0
sh                    randconfig-001-20250801    gcc-14.3.0
sh                    randconfig-002-20250801    gcc-11.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250801    gcc-15.1.0
sparc                 randconfig-002-20250801    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250801    gcc-9.5.0
sparc64               randconfig-002-20250801    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250801    gcc-12
um                    randconfig-002-20250801    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250801    gcc-12
x86_64      buildonly-randconfig-002-20250801    clang-20
x86_64      buildonly-randconfig-003-20250801    clang-20
x86_64      buildonly-randconfig-004-20250801    clang-20
x86_64      buildonly-randconfig-005-20250801    gcc-12
x86_64      buildonly-randconfig-006-20250801    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250801    gcc-8.5.0
xtensa                randconfig-002-20250801    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

