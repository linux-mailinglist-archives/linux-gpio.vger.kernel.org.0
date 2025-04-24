Return-Path: <linux-gpio+bounces-19264-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 164ACA9AC2E
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 13:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49A1A4A55BA
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 11:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10082227EA0;
	Thu, 24 Apr 2025 11:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1RvvJ1N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C18223DC6
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 11:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745494565; cv=none; b=rrpZvy/S4BcdHb4pnQtvf2jBlcIn1RyV9MciUbNG66DUBGQL2fH+tZhdlu67F0scKKdfb0QJukPXwQkV6PELVb/ruDe4Mz30ARedW3ftJkaZDnUhiW9/DKpTGFrr5G0XkkgaskxXUrGvf2IgQP4lHkJZUd3+owUgQgQ8zy3QRtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745494565; c=relaxed/simple;
	bh=boCOlxkGWeVcwu2SNQowtxODjwsvjWwlEqVFXN86eeE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FRhulrFd41GWL48JBtNQswzk47huNwFg6s+ShUY2KS+QsZ3PyZ4gTd03PjDdebmUpI+xEogdRR4IEu57iWLBU8xQH+udrJaHfNby2IIFbMtJF0RTXenzLE5/6snNgGaTW5Unkn2Ft/+aElDPNrEEUhFLUVFsJQXclfiAGEpwRLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1RvvJ1N; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745494564; x=1777030564;
  h=date:from:to:cc:subject:message-id;
  bh=boCOlxkGWeVcwu2SNQowtxODjwsvjWwlEqVFXN86eeE=;
  b=O1RvvJ1Nm1+fHRuepUlR6qmWAdVH1CpLSEF83m4BQEK+z7+0p77zsRHS
   hveQDNNo+2LsLAFaZU6tjtr6LIb5Fub/HLgyQZrVoDyy5m9ZH2DAFpNt6
   uYWJthYV0YgjEHGplVsKnzTgjjA9z5S8Z7/P51J70qWYsYVUNBpSiS5B7
   ia8LH1p71jjiNL6Wv+1QXxX83b1cL+ySbmJmbJ2WeUwadbRmy8upJ9LDm
   9vonBLbnjOsHGxFQzPwL6CSQ19oVNGCyetAgWK/huIl0zT7U+M2QXmpHU
   7CvL3/t/vIk0kEy2vElbHYfZ2ndXzSmcq/43Zz5U9j4avu4G8HK9NE3Vl
   w==;
X-CSE-ConnectionGUID: OKRZpB9LSEqp93lxCDoYGg==
X-CSE-MsgGUID: vKcRCsNxRByTzPN15VprVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="58494129"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="58494129"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 04:36:03 -0700
X-CSE-ConnectionGUID: aITJOl7QQke/ETWA38H9CA==
X-CSE-MsgGUID: eJKx865ySHy2aWTsU/rZCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="132329693"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Apr 2025 04:36:01 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7us3-00047N-1u;
	Thu, 24 Apr 2025 11:35:59 +0000
Date: Thu, 24 Apr 2025 19:35:10 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 446d28584723e5d4bcdb18cf6ef87cb2bb597dd8
Message-ID: <202504241900.YpoCcL27-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 446d28584723e5d4bcdb18cf6ef87cb2bb597dd8  pinctrl: mediatek: common-v1: Fix error checking in mtk_eint_init()

elapsed time: 1446m

configs tested: 114
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250423    gcc-14.2.0
arc                   randconfig-002-20250423    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250423    gcc-10.5.0
arm                   randconfig-002-20250423    gcc-10.5.0
arm                   randconfig-003-20250423    gcc-7.5.0
arm                   randconfig-004-20250423    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250423    gcc-5.5.0
arm64                 randconfig-002-20250423    gcc-7.5.0
arm64                 randconfig-003-20250423    clang-17
arm64                 randconfig-004-20250423    gcc-7.5.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250423    gcc-13.3.0
csky                  randconfig-002-20250423    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250423    clang-21
hexagon               randconfig-002-20250423    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250423    gcc-12
i386        buildonly-randconfig-002-20250423    clang-20
i386        buildonly-randconfig-003-20250423    clang-20
i386        buildonly-randconfig-004-20250423    clang-20
i386        buildonly-randconfig-005-20250423    gcc-12
i386        buildonly-randconfig-006-20250423    clang-20
i386                                defconfig    clang-20
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250423    gcc-14.2.0
loongarch             randconfig-002-20250423    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ci20_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250423    gcc-11.5.0
nios2                 randconfig-002-20250423    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250423    gcc-12.4.0
parisc                randconfig-002-20250423    gcc-12.4.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250423    gcc-9.3.0
powerpc               randconfig-002-20250423    clang-21
powerpc               randconfig-003-20250423    gcc-9.3.0
powerpc                     taishan_defconfig    clang-17
powerpc64             randconfig-001-20250423    gcc-5.5.0
powerpc64             randconfig-002-20250423    gcc-7.5.0
powerpc64             randconfig-003-20250423    clang-18
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250423    gcc-9.3.0
riscv                 randconfig-002-20250423    gcc-7.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250423    clang-21
s390                  randconfig-002-20250423    gcc-8.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                    randconfig-001-20250423    gcc-7.5.0
sh                    randconfig-002-20250423    gcc-13.3.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250423    gcc-6.5.0
sparc                 randconfig-002-20250423    gcc-6.5.0
sparc64               randconfig-001-20250423    gcc-12.4.0
sparc64               randconfig-002-20250423    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250423    clang-21
um                    randconfig-002-20250423    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250423    gcc-12
x86_64      buildonly-randconfig-002-20250423    gcc-12
x86_64      buildonly-randconfig-003-20250423    gcc-12
x86_64      buildonly-randconfig-004-20250423    clang-20
x86_64      buildonly-randconfig-005-20250423    gcc-12
x86_64      buildonly-randconfig-006-20250423    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250423    gcc-8.5.0
xtensa                randconfig-002-20250423    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

