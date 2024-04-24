Return-Path: <linux-gpio+bounces-5808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE708B0AC5
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Apr 2024 15:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CF371F21FE5
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Apr 2024 13:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6354B15A4B0;
	Wed, 24 Apr 2024 13:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8Oe7NW0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A64B15B15A
	for <linux-gpio@vger.kernel.org>; Wed, 24 Apr 2024 13:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713964997; cv=none; b=Nh3FCmrZHqKNYBumtZ4kGAmzBNevmtGBAl9xaBSw71jgYA3OR1Sbwc1Tln/HmzwZEPzmEkpAnwzET08e5NXFobiiTicjIrKyaZB9BvKW4j2CoxuxOyyxZkGVuFgWIb3wYRuWLg/2XXrX94NahXNN21r9c67tlaAxOqc0Qv0gxes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713964997; c=relaxed/simple;
	bh=lMstcihVv3QSmwIyl+VoacZwwZUQTp+dEy0qJs+bK6g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vFZfCRUXEJMH+gwKmKuiQOuw0RAdmWdheInq/AGxcKZ6reTDuvgmj6TzjxLsBoGroRAXC/IanWESzzxP0mzfXnRfzyk4g4ZxpakjggvUQsjM1Q9kGPfYyFLGJh2l3/JjQBPv1EzQT6HvctNOpKNqEEBNmJmNUt98nSEyO/Fws70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f8Oe7NW0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713964995; x=1745500995;
  h=date:from:to:cc:subject:message-id;
  bh=lMstcihVv3QSmwIyl+VoacZwwZUQTp+dEy0qJs+bK6g=;
  b=f8Oe7NW0UXxmTP4uKvkKd8WCX0rGGv9elpLhxM9Lja2763wLV0QDLIgP
   pGLKrXMz1f3thZbJV1bL1hMCIh1bxzyAabvVMC3PGkvIKfxQT9Qiyux4J
   a8M1DPVheuO4peDKMT9nuqaGAa7VHfrTQkjvS/XV1PYeZSmBXrrSuImgf
   AXTPRk2+focjaCTUApxGUzj8OU6tM0jZE/RiPS5d3TUih6Kn3ECNai/cd
   M88sjD9QZtaJY0el3vK+HdaWTaQKXz6a0R1wrF8EqAtwGxpH3/8EMekxl
   PQVqjnrfUId5y021k8osys0gF/xsCbpvgbnl0QCEJ5TJuBQ2b6ZPtm3Y0
   g==;
X-CSE-ConnectionGUID: u+Jw318fTuugLzGnw0fy5Q==
X-CSE-MsgGUID: KQOltcFORdaZhktg02BLgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20289350"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="20289350"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 06:23:15 -0700
X-CSE-ConnectionGUID: 4Myau9UySDiSKcRWznlQbw==
X-CSE-MsgGUID: R9M2G5cbQlC3DWP7OhggKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="24749539"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Apr 2024 06:23:13 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzcad-0001GW-0E;
	Wed, 24 Apr 2024 13:23:11 +0000
Date: Wed, 24 Apr 2024 21:22:25 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/descriptors-wireless] BUILD SUCCESS
 585861d9845bd6347c7602e6a23a28d6dbf52731
Message-ID: <202404242122.Ry60OkLA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-wireless
branch HEAD: 585861d9845bd6347c7602e6a23a28d6dbf52731  wifi: ath9k: Obtain system GPIOS from descriptors

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-buildonly-randconfig-004-20240424
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- i386-buildonly-randconfig-005-20240424
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- s390-allyesconfig
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
|-- sh-allmodconfig
|   `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
`-- sh-allyesconfig
    `-- drivers-gpio-gpio-ath79.c:warning:no-return-statement-in-function-returning-non-void
clang_recent_errors
`-- s390-allmodconfig
    `-- drivers-gpio-gpio-ath79.c:warning:non-void-function-does-not-return-a-value

elapsed time: 1469m

configs tested: 185
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240424   gcc  
arc                   randconfig-002-20240424   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          gemini_defconfig   clang
arm                       imx_v6_v7_defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20240424   gcc  
arm                   randconfig-002-20240424   gcc  
arm                   randconfig-003-20240424   gcc  
arm                           tegra_defconfig   gcc  
arm                       versatile_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-002-20240424   gcc  
arm64                 randconfig-003-20240424   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240424   gcc  
csky                  randconfig-002-20240424   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             alldefconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240424   gcc  
i386         buildonly-randconfig-002-20240424   gcc  
i386         buildonly-randconfig-003-20240424   gcc  
i386         buildonly-randconfig-004-20240424   gcc  
i386         buildonly-randconfig-005-20240424   gcc  
i386         buildonly-randconfig-006-20240424   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240424   gcc  
i386                  randconfig-002-20240424   gcc  
i386                  randconfig-003-20240424   gcc  
i386                  randconfig-004-20240424   clang
i386                  randconfig-005-20240424   gcc  
i386                  randconfig-006-20240424   gcc  
i386                  randconfig-011-20240424   clang
i386                  randconfig-012-20240424   gcc  
i386                  randconfig-013-20240424   clang
i386                  randconfig-014-20240424   clang
i386                  randconfig-015-20240424   clang
i386                  randconfig-016-20240424   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240424   gcc  
loongarch             randconfig-002-20240424   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                       lemote2f_defconfig   gcc  
mips                          malta_defconfig   gcc  
mips                      malta_kvm_defconfig   gcc  
mips                           rs90_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240424   gcc  
nios2                 randconfig-002-20240424   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240424   gcc  
parisc                randconfig-002-20240424   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 canyonlands_defconfig   clang
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                       holly_defconfig   clang
powerpc                     kmeter1_defconfig   gcc  
powerpc                     powernv_defconfig   gcc  
powerpc               randconfig-002-20240424   gcc  
powerpc               randconfig-003-20240424   gcc  
powerpc                        warp_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240424   gcc  
powerpc64             randconfig-002-20240424   gcc  
powerpc64             randconfig-003-20240424   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20240424   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240424   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240424   gcc  
sh                    randconfig-002-20240424   gcc  
sh                           se7705_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240424   gcc  
sparc64               randconfig-002-20240424   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240424   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240424   clang
x86_64       buildonly-randconfig-002-20240424   clang
x86_64       buildonly-randconfig-003-20240424   gcc  
x86_64       buildonly-randconfig-004-20240424   gcc  
x86_64       buildonly-randconfig-005-20240424   gcc  
x86_64       buildonly-randconfig-006-20240424   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   clang
x86_64                randconfig-001-20240424   clang
x86_64                randconfig-002-20240424   clang
x86_64                randconfig-003-20240424   gcc  
x86_64                randconfig-004-20240424   gcc  
x86_64                randconfig-005-20240424   clang
x86_64                randconfig-006-20240424   clang
x86_64                randconfig-011-20240424   clang
x86_64                randconfig-012-20240424   gcc  
x86_64                randconfig-013-20240424   gcc  
x86_64                randconfig-014-20240424   gcc  
x86_64                randconfig-015-20240424   clang
x86_64                randconfig-016-20240424   gcc  
x86_64                randconfig-071-20240424   clang
x86_64                randconfig-072-20240424   clang
x86_64                randconfig-073-20240424   gcc  
x86_64                randconfig-074-20240424   clang
x86_64                randconfig-075-20240424   gcc  
x86_64                randconfig-076-20240424   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240424   gcc  
xtensa                randconfig-002-20240424   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

