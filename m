Return-Path: <linux-gpio+bounces-5064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F708981F2
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 09:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C74F1F230C4
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 07:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117D555787;
	Thu,  4 Apr 2024 07:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jPVQj6Zw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F065A548F1
	for <linux-gpio@vger.kernel.org>; Thu,  4 Apr 2024 07:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712214876; cv=none; b=L8x+2hNq95BPC9JTr0Adfxh3wR/VTgbJhyK5nIosztstAiFpDkKrHmXueQCBo/bqL27S1vkls1M3H/arcYGOu+Yj60deEpWHIhfLsES6iJL07N9wuCVXupzdADIsFATm3qrt8s9MHfyY/dzfDRtK86rqLlIkQxWh2Ju8Zebhw8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712214876; c=relaxed/simple;
	bh=72SouMm/4Xwzo6MnqyhKGWZoXEcOm28BXSPUuNQZzDw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nkG+77tNQi5ldMf4476uBATB1DJs1f1QZaFqY8Uo9i9Z6dYVJaK0beQL2oVpCelFDNCMCqEYwx55RfyhBELYXBENU3vG/FNQtQtonq2kXAjBQEW/0selm8oTB9ejDNhdsiayx56dU/JfWN9E/43HEqAk75reSroFWqdEM0IGf7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jPVQj6Zw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712214875; x=1743750875;
  h=date:from:to:cc:subject:message-id;
  bh=72SouMm/4Xwzo6MnqyhKGWZoXEcOm28BXSPUuNQZzDw=;
  b=jPVQj6ZwobZgFGh8eW5fU/I5ZEZpaojBYVlS/fxV276XEu7PO3KXls5s
   kognyFfRLy2yGW6q5BNFBx9TDStqL26vk63ToYpRwkY9HWZ1xnX/GICIu
   2GawLILzMmLT/TNH4L6PhVY7/3WC04XSJTFFM4QrG5T6ue9Ngl6zTvstk
   tzmfybS4/VO5FDVD8qST/JHlephy7qDmo6r1bjnBMJ2SvKCQjZJnneC6O
   D9r+pD9uMqgbcGzb5bqHSRbPqmemJ4eP9OuHjg7MSLAychXUaypWd65oq
   e1v2LfVkefKuXFA5SpT7dUuww5G9Ra8KO3uDSQX6lAu4jvCn4IXivYCLs
   w==;
X-CSE-ConnectionGUID: 0v3DtPw/SNinYkajdQ4KeA==
X-CSE-MsgGUID: jT9N3dmLQw6dNQI0JfCMdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7321488"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7321488"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 00:14:34 -0700
X-CSE-ConnectionGUID: fcqBdpILSBuKAwX99toOCQ==
X-CSE-MsgGUID: COcoyW6zQSu3jzWhDCPJdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="49918187"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2024 00:14:33 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsHIs-0000jJ-2s;
	Thu, 04 Apr 2024 07:14:30 +0000
Date: Thu, 04 Apr 2024 15:13:45 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 e8acd2d209a387f2358c2c83fe894b444db9ea46
Message-ID: <202404041543.MPveqhm1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: e8acd2d209a387f2358c2c83fe894b444db9ea46  gpiolib: Fix triggering "kobject: 'gpiochipX' is not initialized, yet" kobject_get() errors

elapsed time: 1145m

configs tested: 167
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240404   gcc  
arc                   randconfig-002-20240404   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        neponset_defconfig   gcc  
arm                   randconfig-001-20240404   gcc  
arm                   randconfig-002-20240404   gcc  
arm                   randconfig-003-20240404   clang
arm                   randconfig-004-20240404   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240404   gcc  
arm64                 randconfig-002-20240404   gcc  
arm64                 randconfig-003-20240404   clang
arm64                 randconfig-004-20240404   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240404   gcc  
csky                  randconfig-002-20240404   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240404   clang
hexagon               randconfig-002-20240404   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240404   gcc  
i386         buildonly-randconfig-004-20240404   gcc  
i386         buildonly-randconfig-006-20240404   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240404   gcc  
i386                  randconfig-004-20240404   gcc  
i386                  randconfig-011-20240404   gcc  
i386                  randconfig-013-20240404   gcc  
i386                  randconfig-015-20240404   gcc  
i386                  randconfig-016-20240404   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240404   gcc  
loongarch             randconfig-002-20240404   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1830-neo_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240404   gcc  
nios2                 randconfig-002-20240404   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240404   gcc  
parisc                randconfig-002-20240404   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      arches_defconfig   gcc  
powerpc                        icon_defconfig   gcc  
powerpc               randconfig-001-20240404   gcc  
powerpc               randconfig-002-20240404   gcc  
powerpc               randconfig-003-20240404   clang
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20240404   gcc  
powerpc64             randconfig-002-20240404   clang
powerpc64             randconfig-003-20240404   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240404   clang
riscv                 randconfig-002-20240404   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240404   gcc  
s390                  randconfig-002-20240404   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240404   gcc  
sh                    randconfig-002-20240404   gcc  
sh                           se7722_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240404   gcc  
sparc64               randconfig-002-20240404   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240404   clang
um                    randconfig-002-20240404   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240404   gcc  
x86_64       buildonly-randconfig-002-20240404   gcc  
x86_64       buildonly-randconfig-003-20240404   gcc  
x86_64       buildonly-randconfig-004-20240404   clang
x86_64       buildonly-randconfig-005-20240404   clang
x86_64       buildonly-randconfig-006-20240404   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240404   clang
x86_64                randconfig-002-20240404   gcc  
x86_64                randconfig-003-20240404   clang
x86_64                randconfig-004-20240404   gcc  
x86_64                randconfig-005-20240404   gcc  
x86_64                randconfig-006-20240404   gcc  
x86_64                randconfig-011-20240404   clang
x86_64                randconfig-012-20240404   clang
x86_64                randconfig-013-20240404   clang
x86_64                randconfig-014-20240404   clang
x86_64                randconfig-015-20240404   gcc  
x86_64                randconfig-016-20240404   gcc  
x86_64                randconfig-071-20240404   gcc  
x86_64                randconfig-072-20240404   clang
x86_64                randconfig-073-20240404   clang
x86_64                randconfig-074-20240404   gcc  
x86_64                randconfig-075-20240404   clang
x86_64                randconfig-076-20240404   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240404   gcc  
xtensa                randconfig-002-20240404   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

