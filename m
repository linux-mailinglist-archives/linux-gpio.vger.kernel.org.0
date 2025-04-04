Return-Path: <linux-gpio+bounces-18241-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA6EA7C019
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 16:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF95E1883D80
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 14:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3FC1F3BB7;
	Fri,  4 Apr 2025 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCMy1i3D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19428DF49
	for <linux-gpio@vger.kernel.org>; Fri,  4 Apr 2025 14:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743778775; cv=none; b=lJeKbkqYLn7Q0Td7hcfKW04DHcjP7EuvrRdHCi19CXCduenrhPRP80fnY4gXaIJaKeeOpD7eQyemTaa//tWLkk4IfbTRHgbt0/95juLGKgIybeCfmIg+Mkf9tkpQNgA4eglqTpexBt6ZN/hZ/NU1eRZJqcpivDgMMjnDRDbIsNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743778775; c=relaxed/simple;
	bh=ZW0HivEyJs6FEvpv6kFgA4i9Uhfs4eLlUemYx8eXXco=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TxTll3BYfF5/PuPXcWMOkRV2tRle7Ify+6IWmRk0QShTOKCVL3f001hOUQW+ygBcB3OUuZCLM+W2HoiohWYn6kRMGq3600OkfIAiFFQocsi7D1ft7QLS3SsvNgeKNJlPq4GcDg/2HHGHh/RqKLYUQ03MB3ehNRyQl3nh8z08w/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCMy1i3D; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743778775; x=1775314775;
  h=date:from:to:cc:subject:message-id;
  bh=ZW0HivEyJs6FEvpv6kFgA4i9Uhfs4eLlUemYx8eXXco=;
  b=RCMy1i3D9YF02RQlcrMgjkbbqE4uQug7DnNl1Q5SHx37S9ltPzppAxDY
   b92PdXxA9vhHkEg6xeFsPWSCBaGKmH9BIM6N5de7+HrLTMUL2t3nfGxA8
   uKxN5RKLSsd77fXkcJpwhz/XixHu3FPu+vGnp8UPm9QyItUwkJaeMlxve
   +p0BXPIGGarPvY2ccx0rjz8vC2Hekr9nF47PXTypdKgKGmplm0+KOF0iL
   emBdIvPoNUIyH77kfBH+97UM2hvFTECseHva5zSjw9uQGFUYJGsFbk7aK
   38iPuCQd/smSgYuEoE/uYMRSoUMSnw83EiOFs8FRafHu+KljPx3JeeflX
   w==;
X-CSE-ConnectionGUID: ZTs7mcSuSTWDhROzR7oUDA==
X-CSE-MsgGUID: C6SGMfQnQU6+/oVoTcMl4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="67692900"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="67692900"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 07:59:34 -0700
X-CSE-ConnectionGUID: U3dPBzSJQZ6cR3pDfqdfxg==
X-CSE-MsgGUID: X2r15y11QWC+o+ITdaM+/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="127146053"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Apr 2025 07:59:32 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0iW2-0001K7-0a;
	Fri, 04 Apr 2025 14:59:30 +0000
Date: Fri, 04 Apr 2025 22:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 72e7cfcb685affb33459f9e011b726278f868aa8
Message-ID: <202504042220.MzadbWxp-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 72e7cfcb685affb33459f9e011b726278f868aa8  gpio: tegra186: fix resource handling in ACPI probe path

elapsed time: 1450m

configs tested: 114
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250404    gcc-14.2.0
arc                   randconfig-002-20250404    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          pxa168_defconfig    clang-19
arm                   randconfig-001-20250404    clang-21
arm                   randconfig-002-20250404    gcc-7.5.0
arm                   randconfig-003-20250404    clang-21
arm                   randconfig-004-20250404    clang-21
arm                           spitz_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250404    gcc-5.5.0
arm64                 randconfig-002-20250404    gcc-7.5.0
arm64                 randconfig-003-20250404    gcc-9.5.0
arm64                 randconfig-004-20250404    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250404    gcc-13.3.0
csky                  randconfig-002-20250404    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250404    clang-15
hexagon               randconfig-002-20250404    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250403    clang-20
i386        buildonly-randconfig-002-20250403    clang-20
i386        buildonly-randconfig-003-20250403    clang-20
i386        buildonly-randconfig-004-20250403    gcc-12
i386        buildonly-randconfig-005-20250403    gcc-12
i386        buildonly-randconfig-006-20250403    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250404    gcc-14.2.0
loongarch             randconfig-002-20250404    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ci20_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250404    gcc-5.5.0
nios2                 randconfig-002-20250404    gcc-11.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250404    gcc-8.5.0
parisc                randconfig-002-20250404    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250404    gcc-5.5.0
powerpc               randconfig-002-20250404    gcc-9.3.0
powerpc               randconfig-003-20250404    clang-21
powerpc64             randconfig-001-20250404    gcc-10.5.0
powerpc64             randconfig-002-20250404    clang-21
powerpc64             randconfig-003-20250404    gcc-10.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250403    clang-21
riscv                 randconfig-002-20250403    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250403    gcc-9.3.0
s390                  randconfig-002-20250403    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250403    gcc-6.5.0
sh                    randconfig-002-20250403    gcc-14.2.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250403    gcc-11.5.0
sparc                 randconfig-002-20250403    gcc-13.3.0
sparc64               randconfig-001-20250403    gcc-7.5.0
sparc64               randconfig-002-20250403    gcc-13.3.0
um                               alldefconfig    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250403    clang-19
um                    randconfig-002-20250403    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250404    clang-20
x86_64      buildonly-randconfig-002-20250404    clang-20
x86_64      buildonly-randconfig-003-20250404    clang-20
x86_64      buildonly-randconfig-004-20250404    gcc-12
x86_64      buildonly-randconfig-005-20250404    gcc-12
x86_64      buildonly-randconfig-006-20250404    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250403    gcc-11.5.0
xtensa                randconfig-002-20250403    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

