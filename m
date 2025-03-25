Return-Path: <linux-gpio+bounces-17951-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A56A6EB8D
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 09:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEBBF188CDCE
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 08:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B61F1A01BE;
	Tue, 25 Mar 2025 08:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSTR1019"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB1615FA7B
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 08:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742891378; cv=none; b=s/qHKHQp8j6KCXepgHb7amf/Kxr9WMK6YMqIvvZEQ+GWnZI6XZ8SM9Y5d8ng82qfX3CuuTL2ByYl0Th7GoiGmi7dBmaorFvxldSr8GMl/AlSmJOOoms/e+aecnAOPeo1ZAIDmPwUsqtFVV1dpKH04BI8zQ2Q7K1z52WIXFnQaug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742891378; c=relaxed/simple;
	bh=UmW4Fi1lAMXez1yPy4YaX5VH3f45C4xq9TafH8FmImA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h0O7iZOZwpKCJoHKv7G3nIJj6l2FDtvkOcsyrlIGQBepWxyGp5PRyZUXRfy9en6HnLATE534sa8Ypl0tceUTX6VTOeRuyeKYuQ8bq5L419L5AOZZdPOHOGyev9W1XjHTYaDPkjltd7QovsDFLxoJx0w2JIQsy14diiBHk5OMjL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSTR1019; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742891376; x=1774427376;
  h=date:from:to:cc:subject:message-id;
  bh=UmW4Fi1lAMXez1yPy4YaX5VH3f45C4xq9TafH8FmImA=;
  b=YSTR1019TvEuTRVYugLW0H3atah2lf4V5VUbjeg8Eij15VfyLSK2lBB+
   94oZrKPQGFY92oWQTZK4DQ+3Yen5QlkJweofTxVAGmyyCITVK+1QZ23Dy
   Fn+BbmTHaWFr9duFODxaPxvK+8hmtGQnTsXlcC/pBikqgGnfw3GJ49eec
   l/dXBJisdvUd+Pq9JXB+rTA1mjrdlWkUTLgJlytDu7LJQpzapkOqsqqN0
   y0pNPLTnIQEmW5pX0WA+ZxFLK/0cRyCyrmbmstykHXF7x0CqTjmopl9t1
   SmrdH2TZhZlz79sR8DGZ8LctmCkkcIFtfTKPKs3U4rEhJIkUxmeR1tdOX
   A==;
X-CSE-ConnectionGUID: BkZfAvEZRTqwU/a6isERHg==
X-CSE-MsgGUID: dsv76ySaR/StOBEf0QT/7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="31727910"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="31727910"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 01:29:33 -0700
X-CSE-ConnectionGUID: 2usYGLsvToOPRN+ZGB4wIA==
X-CSE-MsgGUID: ULMaPVakS02lVmeKI1OFUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="155318120"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Mar 2025 01:29:32 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twzf8-0004Ex-1H;
	Tue, 25 Mar 2025 08:29:30 +0000
Date: Tue, 25 Mar 2025 16:29:07 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 3ef9f710efcb5cc1335b5b09c16c757f703d7e5f
Message-ID: <202503251600.xviESQug-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 3ef9f710efcb5cc1335b5b09c16c757f703d7e5f  pinctrl: mediatek: Add EINT support for multiple addresses

elapsed time: 1453m

configs tested: 132
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250324    gcc-12.4.0
arc                   randconfig-002-20250324    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          gemini_defconfig    clang-20
arm                          pxa3xx_defconfig    clang-21
arm                   randconfig-001-20250324    gcc-8.5.0
arm                   randconfig-002-20250324    gcc-7.5.0
arm                   randconfig-003-20250324    clang-21
arm                   randconfig-004-20250324    clang-21
arm                           sama5_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250324    gcc-8.5.0
arm64                 randconfig-002-20250324    clang-14
arm64                 randconfig-003-20250324    clang-21
arm64                 randconfig-004-20250324    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250324    gcc-14.2.0
csky                  randconfig-002-20250324    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250324    clang-21
hexagon               randconfig-002-20250324    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250324    clang-20
i386        buildonly-randconfig-002-20250324    clang-20
i386        buildonly-randconfig-003-20250324    gcc-12
i386        buildonly-randconfig-004-20250324    clang-20
i386        buildonly-randconfig-005-20250324    gcc-12
i386        buildonly-randconfig-006-20250324    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250324    gcc-14.2.0
loongarch             randconfig-002-20250324    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-21
mips                        qi_lb60_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250324    gcc-8.5.0
nios2                 randconfig-002-20250324    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250324    gcc-13.3.0
parisc                randconfig-002-20250324    gcc-5.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                    amigaone_defconfig    gcc-14.2.0
powerpc                      ppc64e_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250324    gcc-6.5.0
powerpc               randconfig-002-20250324    clang-19
powerpc               randconfig-003-20250324    clang-21
powerpc                        warp_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250324    gcc-6.5.0
powerpc64             randconfig-002-20250324    clang-15
powerpc64             randconfig-003-20250324    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250324    clang-21
riscv                 randconfig-002-20250324    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250324    clang-15
s390                  randconfig-002-20250324    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                    randconfig-001-20250324    gcc-12.4.0
sh                    randconfig-002-20250324    gcc-12.4.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250324    gcc-5.5.0
sparc                 randconfig-002-20250324    gcc-11.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250324    gcc-13.3.0
sparc64               randconfig-002-20250324    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250324    clang-21
um                    randconfig-002-20250324    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250324    clang-20
x86_64      buildonly-randconfig-002-20250324    gcc-12
x86_64      buildonly-randconfig-003-20250324    clang-20
x86_64      buildonly-randconfig-004-20250324    clang-20
x86_64      buildonly-randconfig-005-20250324    clang-20
x86_64      buildonly-randconfig-006-20250324    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250324    gcc-13.3.0
xtensa                randconfig-002-20250324    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

