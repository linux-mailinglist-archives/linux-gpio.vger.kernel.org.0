Return-Path: <linux-gpio+bounces-26053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BADB55025
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 15:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F879AA28DB
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 13:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2881730E857;
	Fri, 12 Sep 2025 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iX7AXdH3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB14A19D8A3
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 13:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757685585; cv=none; b=CHy3qh5UeBdR1P4hoFuLGe3hPHh7zSwRFlySGN1/T15v6/Moq2f9ABmOB7IOyj/vLRoYoX5HMRPxwIfDrwXcntrFo8KlUobodv5SlTJtb3rlYK7iqpkx+36NP/z6DBMqGH/adGh4WPc0fU6KXBQvObzf/nTAbcYFjweMcsnzYp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757685585; c=relaxed/simple;
	bh=dWBKI1vM+fXkhcUN7lAh6vhIJSmikMGk/qvSCg+xrbY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RwKTo8n9ArDqiTdhQK6PrVvkgtJXVrtnXgLrlsI6UvRAGrUg3hbJCKqkWWKBMd0qz8dXha4Rnrtyc27ms5LtID3mJDqJcUriIGLX7J9OpRHmTDCX93y6LSPUn5T1WMPgDkA3xA2ZXQFXTIl2Jwpg2jlKJhw1ki4sdYg5OPTDClM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iX7AXdH3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757685584; x=1789221584;
  h=date:from:to:cc:subject:message-id;
  bh=dWBKI1vM+fXkhcUN7lAh6vhIJSmikMGk/qvSCg+xrbY=;
  b=iX7AXdH3vaHlNkW08EmenhPoTcrbPd/ZkPtp7gzRwyvvKFh2a/vudSsA
   gajfz2jIRN2yFNppyXRaXkyv8Mpvb3VHJE4HPDSL85fVao6YjnybDexzn
   +rOhhE8GI2NbexqEiZTmAccRaCPMmuLBfPwQhdt3jtwiKtO3B0xmul/GO
   Lb456vpDPV5XfUsIjicgKskhDn5y7EeP3AHueCANHQlQLS4iEG0mZL4iy
   28zsnrBXEyMMKoNCHKAPNCkauvCeEQgWp3k+4+CjDOVmxTW1aZGbetgou
   KetJiWHhoWMgYEnGQXH1kTKPBbkPrqvyUdV7q0XqCqIcTs5X6lugfwAar
   g==;
X-CSE-ConnectionGUID: +2q12SmsT+yzDUM2olToEg==
X-CSE-MsgGUID: BtKH+YGLQiyJ4tNkHo6Dxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="60104843"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="60104843"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 06:59:43 -0700
X-CSE-ConnectionGUID: nEEEu7Q6Sw2XYb9H31B7Dw==
X-CSE-MsgGUID: tLJRKcIFS8OeiowdC1O5hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="178003919"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 12 Sep 2025 06:59:42 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ux4JP-00012S-0k;
	Fri, 12 Sep 2025 13:59:39 +0000
Date: Fri, 12 Sep 2025 21:58:49 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:at24/for-next] BUILD SUCCESS
 c7ec58c39b0252e6635dde55e5c708132ab25cfc
Message-ID: <202509122139.pu6RROsA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git at24/for-next
branch HEAD: c7ec58c39b0252e6635dde55e5c708132ab25cfc  dt-bindings: eeprom: at24: Add compatible for Giantec GT24C256C

elapsed time: 1421m

configs tested: 239
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250911    gcc-8.5.0
arc                   randconfig-001-20250912    clang-19
arc                   randconfig-002-20250911    gcc-12.5.0
arc                   randconfig-002-20250912    clang-19
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          gemini_defconfig    gcc-15.1.0
arm                   randconfig-001-20250911    clang-22
arm                   randconfig-001-20250912    clang-19
arm                   randconfig-002-20250911    gcc-14.3.0
arm                   randconfig-002-20250912    clang-19
arm                   randconfig-003-20250911    clang-22
arm                   randconfig-003-20250912    clang-19
arm                   randconfig-004-20250911    clang-16
arm                   randconfig-004-20250912    clang-19
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250911    gcc-13.4.0
arm64                 randconfig-001-20250912    clang-19
arm64                 randconfig-002-20250911    gcc-8.5.0
arm64                 randconfig-002-20250912    clang-19
arm64                 randconfig-003-20250911    gcc-8.5.0
arm64                 randconfig-003-20250912    clang-19
arm64                 randconfig-004-20250911    clang-22
arm64                 randconfig-004-20250912    clang-19
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20250911    gcc-15.1.0
csky                  randconfig-001-20250912    clang-22
csky                  randconfig-002-20250911    gcc-13.4.0
csky                  randconfig-002-20250912    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250911    clang-20
hexagon               randconfig-001-20250912    clang-22
hexagon               randconfig-002-20250911    clang-22
hexagon               randconfig-002-20250912    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250911    clang-20
i386        buildonly-randconfig-001-20250912    gcc-13
i386        buildonly-randconfig-002-20250911    clang-20
i386        buildonly-randconfig-002-20250912    gcc-13
i386        buildonly-randconfig-003-20250911    clang-20
i386        buildonly-randconfig-003-20250912    gcc-13
i386        buildonly-randconfig-004-20250911    clang-20
i386        buildonly-randconfig-004-20250912    gcc-13
i386        buildonly-randconfig-005-20250911    clang-20
i386        buildonly-randconfig-005-20250912    gcc-13
i386        buildonly-randconfig-006-20250911    clang-20
i386        buildonly-randconfig-006-20250912    gcc-13
i386                                defconfig    clang-20
i386                  randconfig-001-20250912    gcc-14
i386                  randconfig-002-20250912    gcc-14
i386                  randconfig-003-20250912    gcc-14
i386                  randconfig-004-20250912    gcc-14
i386                  randconfig-005-20250912    gcc-14
i386                  randconfig-006-20250912    gcc-14
i386                  randconfig-007-20250912    gcc-14
i386                  randconfig-011-20250912    gcc-14
i386                  randconfig-012-20250912    gcc-14
i386                  randconfig-013-20250912    gcc-14
i386                  randconfig-014-20250912    gcc-14
i386                  randconfig-015-20250912    gcc-14
i386                  randconfig-016-20250912    gcc-14
i386                  randconfig-017-20250912    gcc-14
loongarch                        alldefconfig    gcc-15.1.0
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250911    gcc-15.1.0
loongarch             randconfig-001-20250912    clang-22
loongarch             randconfig-002-20250911    gcc-15.1.0
loongarch             randconfig-002-20250912    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                          amiga_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        mvme16x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
mips                         rt305x_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250911    gcc-11.5.0
nios2                 randconfig-001-20250912    clang-22
nios2                 randconfig-002-20250911    gcc-8.5.0
nios2                 randconfig-002-20250912    clang-22
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250911    gcc-8.5.0
parisc                randconfig-001-20250912    clang-22
parisc                randconfig-002-20250911    gcc-8.5.0
parisc                randconfig-002-20250912    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc                  mpc885_ads_defconfig    gcc-15.1.0
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250911    gcc-8.5.0
powerpc               randconfig-001-20250912    clang-22
powerpc               randconfig-002-20250911    gcc-15.1.0
powerpc               randconfig-002-20250912    clang-22
powerpc               randconfig-003-20250911    gcc-8.5.0
powerpc               randconfig-003-20250912    clang-22
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250911    clang-22
powerpc64             randconfig-001-20250912    clang-22
powerpc64             randconfig-002-20250911    gcc-11.5.0
powerpc64             randconfig-002-20250912    clang-22
powerpc64             randconfig-003-20250911    gcc-8.5.0
powerpc64             randconfig-003-20250912    clang-22
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250911    clang-20
riscv                 randconfig-001-20250912    gcc-15.1.0
riscv                 randconfig-002-20250911    clang-22
riscv                 randconfig-002-20250912    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250911    gcc-11.5.0
s390                  randconfig-001-20250912    gcc-15.1.0
s390                  randconfig-002-20250911    clang-16
s390                  randconfig-002-20250912    gcc-15.1.0
s390                       zfcpdump_defconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                            hp6xx_defconfig    gcc-15.1.0
sh                    randconfig-001-20250911    gcc-9.5.0
sh                    randconfig-001-20250912    gcc-15.1.0
sh                    randconfig-002-20250911    gcc-15.1.0
sh                    randconfig-002-20250912    gcc-15.1.0
sh                           se7619_defconfig    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250911    gcc-15.1.0
sparc                 randconfig-001-20250912    gcc-15.1.0
sparc                 randconfig-002-20250911    gcc-15.1.0
sparc                 randconfig-002-20250912    gcc-15.1.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250911    gcc-8.5.0
sparc64               randconfig-001-20250912    gcc-15.1.0
sparc64               randconfig-002-20250911    clang-20
sparc64               randconfig-002-20250912    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250911    clang-22
um                    randconfig-001-20250912    gcc-15.1.0
um                    randconfig-002-20250911    gcc-14
um                    randconfig-002-20250912    gcc-15.1.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250911    gcc-14
x86_64      buildonly-randconfig-002-20250911    gcc-14
x86_64      buildonly-randconfig-003-20250911    clang-20
x86_64      buildonly-randconfig-004-20250911    clang-20
x86_64      buildonly-randconfig-005-20250911    clang-20
x86_64      buildonly-randconfig-006-20250911    gcc-14
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250912    gcc-14
x86_64                randconfig-002-20250912    gcc-14
x86_64                randconfig-003-20250912    gcc-14
x86_64                randconfig-004-20250912    gcc-14
x86_64                randconfig-005-20250912    gcc-14
x86_64                randconfig-006-20250912    gcc-14
x86_64                randconfig-007-20250912    gcc-14
x86_64                randconfig-008-20250912    gcc-14
x86_64                randconfig-071-20250912    clang-20
x86_64                randconfig-072-20250912    clang-20
x86_64                randconfig-073-20250912    clang-20
x86_64                randconfig-074-20250912    clang-20
x86_64                randconfig-075-20250912    clang-20
x86_64                randconfig-076-20250912    clang-20
x86_64                randconfig-077-20250912    clang-20
x86_64                randconfig-078-20250912    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250911    gcc-12.5.0
xtensa                randconfig-001-20250912    gcc-15.1.0
xtensa                randconfig-002-20250911    gcc-8.5.0
xtensa                randconfig-002-20250912    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

