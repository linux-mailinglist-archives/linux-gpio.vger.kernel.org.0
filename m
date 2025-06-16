Return-Path: <linux-gpio+bounces-21670-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD83DADBB4A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 22:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E9F0175EE1
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 20:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D9620B7F9;
	Mon, 16 Jun 2025 20:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PRMTNEt+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88735136349
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 20:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750106402; cv=none; b=Py3fS2dt6YJ1PYDAJYDN6nm8gClynCicNotJGu3UfgwfqVQdyEwOwHORhneiYUPT8IyPzlbeWbgPGBh3kjfqDMMiRBI/G1Xp41odiHAU0/BR4Qn4BZ4v/wpd0vm/h9helYMYSpgZRDtB6sedKGqniC+Nbv9txd9yN0SRbmghLcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750106402; c=relaxed/simple;
	bh=e9whwgCRlDrSJDH7euW+iZGCSNtoK/+pQofD5VLTCac=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cSp+gX0xM3V65TIazjQRuYZNtCjzNCVrHoZH2ssOJajaiuEuIsm+e9Agy90ut/wUkI2iNFXBPphlme1vZshMZjeMhisFDTFsdHVJaR3VN4fCIn5fOYS/uzw9w+0bYgen3g8zXmBrB/4XNCYsb+T4A9J6ABAWXprbYXwukjq6/wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PRMTNEt+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750106400; x=1781642400;
  h=date:from:to:cc:subject:message-id;
  bh=e9whwgCRlDrSJDH7euW+iZGCSNtoK/+pQofD5VLTCac=;
  b=PRMTNEt+Y1ZtTtxh4CYw9lllrJ10YZEUuTyf2YIRwk0VjRaIJrY7IlRa
   r8Pko5gIMLR/KVU5cgvgUub/Dty74SKvKQWTc0etYOKL0rXJy9aHr/3cf
   7vjqTDJnhcIUu+XHn35Av+Pii9XJmFZGwvvca4oINmdzEYCIlHPY1bOn7
   chDEZ3fYPhz8PNjONnrOahXNxFhGz6v9PQR2pjUFLZh+WSP+8SamMGi85
   LV3R/mLLXyiJL8TPRtQTMqlsUCF3T0FvzXCBmw49delY1R0reqO81w4vS
   G4LtR2PkZpmmwM5WbN34QB9gDp281gVQVkKtN2moye2TV6INzgvQbgVYc
   g==;
X-CSE-ConnectionGUID: 7OzbT65LTCWZtuzZTYtWCg==
X-CSE-MsgGUID: LEQ0BqhRTXafNR5VTocTPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62535043"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="62535043"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 13:39:58 -0700
X-CSE-ConnectionGUID: LQOmYjPKR9iY2teR46+XoQ==
X-CSE-MsgGUID: anC3SHvqTGi3yNamYOkExw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="179560967"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jun 2025 13:39:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRGcT-000FL6-24;
	Mon, 16 Jun 2025 20:39:53 +0000
Date: Tue, 17 Jun 2025 04:39:02 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 367864935785382bab95f5e5a691535d28f5a21b
Message-ID: <202506170452.lPvdTPYz-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 367864935785382bab95f5e5a691535d28f5a21b  gpio: raspberrypi-exp: use new GPIO line value setter callbacks

elapsed time: 734m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                            hsdk_defconfig    gcc-15.1.0
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20250616    gcc-15.1.0
arc                   randconfig-002-20250616    gcc-15.1.0
arm                              alldefconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                            hisi_defconfig    gcc-15.1.0
arm                   randconfig-001-20250616    gcc-12.4.0
arm                   randconfig-002-20250616    gcc-15.1.0
arm                   randconfig-003-20250616    clang-21
arm                   randconfig-004-20250616    clang-21
arm                           sunxi_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250616    gcc-8.5.0
arm64                 randconfig-002-20250616    gcc-15.1.0
arm64                 randconfig-003-20250616    clang-19
arm64                 randconfig-004-20250616    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250616    gcc-13.3.0
csky                  randconfig-002-20250616    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250616    clang-21
hexagon               randconfig-002-20250616    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250616    gcc-12
i386        buildonly-randconfig-002-20250616    gcc-11
i386        buildonly-randconfig-003-20250616    clang-20
i386        buildonly-randconfig-004-20250616    gcc-12
i386        buildonly-randconfig-005-20250616    gcc-12
i386        buildonly-randconfig-006-20250616    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250616    gcc-15.1.0
loongarch             randconfig-002-20250616    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       bvme6000_defconfig    gcc-15.1.0
m68k                          sun3x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250616    gcc-8.5.0
nios2                 randconfig-002-20250616    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250616    gcc-8.5.0
parisc                randconfig-002-20250616    gcc-9.3.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                        icon_defconfig    gcc-15.1.0
powerpc                     rainier_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250616    clang-21
powerpc               randconfig-002-20250616    clang-21
powerpc               randconfig-003-20250616    clang-21
powerpc64             randconfig-001-20250616    gcc-8.5.0
powerpc64             randconfig-002-20250616    clang-21
powerpc64             randconfig-003-20250616    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                 randconfig-001-20250616    clang-19
riscv                 randconfig-002-20250616    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250616    gcc-11.5.0
s390                  randconfig-002-20250616    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250616    gcc-12.4.0
sh                    randconfig-002-20250616    gcc-12.4.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250616    gcc-13.3.0
sparc                 randconfig-002-20250616    gcc-8.5.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250616    gcc-13.3.0
sparc64               randconfig-002-20250616    gcc-8.5.0
um                               alldefconfig    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250616    clang-20
um                    randconfig-002-20250616    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250616    clang-20
x86_64      buildonly-randconfig-002-20250616    clang-20
x86_64      buildonly-randconfig-003-20250616    clang-20
x86_64      buildonly-randconfig-004-20250616    clang-20
x86_64      buildonly-randconfig-005-20250616    gcc-12
x86_64      buildonly-randconfig-006-20250616    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  cadence_csp_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250616    gcc-13.3.0
xtensa                randconfig-002-20250616    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

