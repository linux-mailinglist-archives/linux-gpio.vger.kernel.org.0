Return-Path: <linux-gpio+bounces-20424-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36371ABF474
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 14:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 349873B4787
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 12:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3D9262FE5;
	Wed, 21 May 2025 12:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBDO1vUX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1219239585
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 12:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831141; cv=none; b=NAmU0F7QeRY+gw1X1Yc4HjP7H+3Nc0sRtUX6V0O/xQoEGPjnefuiRwMrWZbdqsZ4E4cSh8HRPhyOVBOW19kZbdhB/rmIBm8Qn0u/pJMpoXXZemXY19Ot2nCNfX68HJCT7NlkltGTcI3+/aRz+fC3x+TVrGA448y3u/SvkBDBgmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831141; c=relaxed/simple;
	bh=HDjHma8lmy0UD7p1pV9TNEneinicXpo0byMZJeOZ2AI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ltEO69ukdXCt23GaMZjG3M5493lnKWvcX21QWrbJfSi4B+kezZgJhIo133Tz1LWTKWkIkkHbKAZKbq6d18SUluFQFBCcDupDcpq+HKEVE63ro8Q+7nZtJGleckPuRn9Ck/RzOxb4+OHKT7S11q2Jz2X1ghykvXYCGEePvrEGIRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBDO1vUX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747831140; x=1779367140;
  h=date:from:to:cc:subject:message-id;
  bh=HDjHma8lmy0UD7p1pV9TNEneinicXpo0byMZJeOZ2AI=;
  b=lBDO1vUXkDJfUy3bjwZwin1JrYNlDXrojRPv8cOZacl8L7H4ugLoV093
   vo4G+1LQYNh6aGSI+Sturn2K3/WRyi3Jr0rqLrHRz3tnSZ7NjdeM9SIl+
   b/QqEngeavqo8ztTz3Dhao1Xf4zX36MnwlbQ5S26sy3oenVcL38w/7bQw
   tdKqPSgRHaWQNCSunM5YeFnGVrEM4oTyv0CXbA/yF09uodRk4NKatXqba
   dCK/yxo2Q6JxQGmZQwI3j0/HypXmdXGva/0Cf+oPL2ERLinx7Sm9KxniY
   LWJJTkfchjZJDWeD+AnCfjMs6B4ohwfUDVLqxbabmtzoWRaviUMMu5l7+
   w==;
X-CSE-ConnectionGUID: UfZUexviRVifeeQWDu3ajQ==
X-CSE-MsgGUID: brDTsAJyR2yNQJCk4OCVyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49730484"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49730484"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 05:38:59 -0700
X-CSE-ConnectionGUID: 4EYwUT5OTe+xiTj6NFrptw==
X-CSE-MsgGUID: cGQFKIYCSBeSaNlHQWOlzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="140988981"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 May 2025 05:38:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHiil-000OFM-1O;
	Wed, 21 May 2025 12:38:55 +0000
Date: Wed, 21 May 2025 20:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 6a423361b0c6cb8bc618b4b3e62b7f002baffc5b
Message-ID: <202505212003.QVTCjTPr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 6a423361b0c6cb8bc618b4b3e62b7f002baffc5b  pinctrl: qcom: switch to devm_gpiochip_add_data()

elapsed time: 793m

configs tested: 212
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250521    clang-21
arc                   randconfig-001-20250521    gcc-10.5.0
arc                   randconfig-002-20250521    clang-21
arc                   randconfig-002-20250521    gcc-12.4.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                        keystone_defconfig    gcc-14.2.0
arm                   randconfig-001-20250521    clang-21
arm                   randconfig-002-20250521    clang-21
arm                   randconfig-003-20250521    clang-16
arm                   randconfig-003-20250521    clang-21
arm                   randconfig-004-20250521    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250521    clang-21
arm64                 randconfig-001-20250521    gcc-6.5.0
arm64                 randconfig-002-20250521    clang-21
arm64                 randconfig-002-20250521    gcc-6.5.0
arm64                 randconfig-003-20250521    clang-21
arm64                 randconfig-003-20250521    gcc-8.5.0
arm64                 randconfig-004-20250521    clang-21
arm64                 randconfig-004-20250521    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250521    gcc-10.5.0
csky                  randconfig-001-20250521    gcc-14.2.0
csky                  randconfig-002-20250521    gcc-12.4.0
csky                  randconfig-002-20250521    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250521    clang-20
hexagon               randconfig-001-20250521    gcc-14.2.0
hexagon               randconfig-002-20250521    clang-21
hexagon               randconfig-002-20250521    gcc-14.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250521    clang-20
i386        buildonly-randconfig-002-20250521    clang-20
i386        buildonly-randconfig-003-20250521    clang-20
i386        buildonly-randconfig-003-20250521    gcc-12
i386        buildonly-randconfig-004-20250521    clang-20
i386        buildonly-randconfig-005-20250521    clang-20
i386        buildonly-randconfig-005-20250521    gcc-12
i386        buildonly-randconfig-006-20250521    clang-20
i386        buildonly-randconfig-006-20250521    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250521    clang-20
i386                  randconfig-002-20250521    clang-20
i386                  randconfig-003-20250521    clang-20
i386                  randconfig-004-20250521    clang-20
i386                  randconfig-005-20250521    clang-20
i386                  randconfig-006-20250521    clang-20
i386                  randconfig-007-20250521    clang-20
i386                  randconfig-011-20250521    gcc-12
i386                  randconfig-012-20250521    gcc-12
i386                  randconfig-013-20250521    gcc-12
i386                  randconfig-014-20250521    gcc-12
i386                  randconfig-015-20250521    gcc-12
i386                  randconfig-016-20250521    gcc-12
i386                  randconfig-017-20250521    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250521    gcc-14.2.0
loongarch             randconfig-001-20250521    gcc-15.1.0
loongarch             randconfig-002-20250521    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250521    gcc-14.2.0
nios2                 randconfig-002-20250521    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250521    gcc-13.3.0
parisc                randconfig-001-20250521    gcc-14.2.0
parisc                randconfig-002-20250521    gcc-11.5.0
parisc                randconfig-002-20250521    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                       ebony_defconfig    gcc-14.2.0
powerpc                       holly_defconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                  mpc885_ads_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250521    clang-21
powerpc               randconfig-001-20250521    gcc-14.2.0
powerpc               randconfig-002-20250521    gcc-14.2.0
powerpc               randconfig-002-20250521    gcc-8.5.0
powerpc               randconfig-003-20250521    gcc-14.2.0
powerpc               randconfig-003-20250521    gcc-6.5.0
powerpc                     tqm8541_defconfig    gcc-14.2.0
powerpc                     tqm8560_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250521    gcc-14.2.0
powerpc64             randconfig-001-20250521    gcc-8.5.0
powerpc64             randconfig-002-20250521    gcc-14.2.0
powerpc64             randconfig-002-20250521    gcc-6.5.0
powerpc64             randconfig-003-20250521    clang-21
powerpc64             randconfig-003-20250521    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250521    gcc-8.5.0
riscv                 randconfig-002-20250521    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250521    clang-20
s390                  randconfig-001-20250521    gcc-8.5.0
s390                  randconfig-002-20250521    clang-21
s390                  randconfig-002-20250521    gcc-8.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250521    gcc-12.4.0
sh                    randconfig-001-20250521    gcc-8.5.0
sh                    randconfig-002-20250521    gcc-15.1.0
sh                    randconfig-002-20250521    gcc-8.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250521    gcc-13.3.0
sparc                 randconfig-001-20250521    gcc-8.5.0
sparc                 randconfig-002-20250521    gcc-13.3.0
sparc                 randconfig-002-20250521    gcc-8.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250521    gcc-13.3.0
sparc64               randconfig-001-20250521    gcc-8.5.0
sparc64               randconfig-002-20250521    gcc-13.3.0
sparc64               randconfig-002-20250521    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250521    clang-21
um                    randconfig-001-20250521    gcc-8.5.0
um                    randconfig-002-20250521    clang-21
um                    randconfig-002-20250521    gcc-8.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250521    clang-20
x86_64      buildonly-randconfig-002-20250521    clang-20
x86_64      buildonly-randconfig-003-20250521    clang-20
x86_64      buildonly-randconfig-003-20250521    gcc-12
x86_64      buildonly-randconfig-004-20250521    clang-20
x86_64      buildonly-randconfig-004-20250521    gcc-12
x86_64      buildonly-randconfig-005-20250521    clang-20
x86_64      buildonly-randconfig-006-20250521    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250521    gcc-12
x86_64                randconfig-002-20250521    gcc-12
x86_64                randconfig-003-20250521    gcc-12
x86_64                randconfig-004-20250521    gcc-12
x86_64                randconfig-005-20250521    gcc-12
x86_64                randconfig-006-20250521    gcc-12
x86_64                randconfig-007-20250521    gcc-12
x86_64                randconfig-008-20250521    gcc-12
x86_64                randconfig-071-20250521    clang-20
x86_64                randconfig-072-20250521    clang-20
x86_64                randconfig-073-20250521    clang-20
x86_64                randconfig-074-20250521    clang-20
x86_64                randconfig-075-20250521    clang-20
x86_64                randconfig-076-20250521    clang-20
x86_64                randconfig-077-20250521    clang-20
x86_64                randconfig-078-20250521    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250521    gcc-15.1.0
xtensa                randconfig-001-20250521    gcc-8.5.0
xtensa                randconfig-002-20250521    gcc-15.1.0
xtensa                randconfig-002-20250521    gcc-8.5.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

