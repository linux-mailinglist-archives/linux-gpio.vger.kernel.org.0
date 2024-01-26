Return-Path: <linux-gpio+bounces-2634-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B24A583E091
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 18:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C8861F25379
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 17:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5BC1E49F;
	Fri, 26 Jan 2024 17:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IcJNPb/3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0751EB49
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 17:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706290808; cv=none; b=txAG1Jyjy4RP57JlgNNjf3/koQK2ElNfH0zxWoUVivhYpD70DPnGnI8Uv14S87Z5onqqE8cPIg4Vfa5Uvo0AU1Ha0qa0DiR/pvejRwa2QlasWZCP/dxY1/gQW/jYSM27L/dtCTVpF3FqPMs0X59BOBKxONI5aTXPN5+rORji9NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706290808; c=relaxed/simple;
	bh=etkUkQID+RoEF8SVcQ9cI9acfrhrNZve9VwZxkRC9sk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TTQfW4SO9RD9bQsjqz1Zw6z7k6hVCpV1Q46zRXq0lN0hr8PDv17o81d70Galf/QveOjpT1uar8uQrfWiO39imbwl63iyEctN7aM74jdII5py2Mrb0zlremlnYC6CJTKaho7ZIOe+FcTbnDYROCW+xhB5d29omqry0QHkraUXI4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IcJNPb/3; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706290806; x=1737826806;
  h=date:from:to:cc:subject:message-id;
  bh=etkUkQID+RoEF8SVcQ9cI9acfrhrNZve9VwZxkRC9sk=;
  b=IcJNPb/3JXsD5FSoG+LKJfm3FLdf5/sB5YP1/xzgbDmnad5oN3Nn7AiL
   Nvt00Q27cIBiVLD5GMIfRDfsQlF+RecDiGqNt9Jx/z6WLOyHqa87LPAx3
   oP45vkUq6x69+BjwiE+My4ehzNJqTOPaAxAXdRag3OsYoXvQ5oSBDD6Gq
   Vjr5YYV1HuRU2FZEf96iOE10QGFyG3IK5Qi+K1WMoZMBE36lE5THWJu8E
   FY4G61ahCcxGBKKVntNykYt4LTswNGcN2S1KaNhEctjRnqv9X7PAF2p5A
   cBRoC65BQBcxxqYccu44m/LeqP+siUmgrm6YdDVYxGY06g720kfnZVQog
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="406260275"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="406260275"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 09:40:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2723928"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jan 2024 09:40:05 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTQBO-0001FS-27;
	Fri, 26 Jan 2024 17:40:02 +0000
Date: Sat, 27 Jan 2024 01:39:16 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 42969726a19f796f0e731ec74347fd8a0e4e91a2
Message-ID: <202401270114.01JekAMk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 42969726a19f796f0e731ec74347fd8a0e4e91a2  Documentation: gpio: describe uAPI behaviour for unsupported config

elapsed time: 1891m

configs tested: 107
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
arc                   randconfig-001-20240127   gcc  
arc                   randconfig-002-20240127   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240127   gcc  
arm                   randconfig-002-20240127   gcc  
arm                   randconfig-003-20240127   gcc  
arm                   randconfig-004-20240127   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240125   gcc  
i386         buildonly-randconfig-002-20240125   gcc  
i386         buildonly-randconfig-003-20240125   gcc  
i386         buildonly-randconfig-004-20240125   gcc  
i386         buildonly-randconfig-005-20240125   gcc  
i386         buildonly-randconfig-006-20240125   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240125   gcc  
i386                  randconfig-002-20240125   gcc  
i386                  randconfig-003-20240125   gcc  
i386                  randconfig-004-20240125   gcc  
i386                  randconfig-005-20240125   gcc  
i386                  randconfig-006-20240125   gcc  
i386                  randconfig-011-20240125   clang
i386                  randconfig-012-20240125   clang
i386                  randconfig-013-20240125   clang
i386                  randconfig-014-20240125   clang
i386                  randconfig-015-20240125   clang
i386                  randconfig-016-20240125   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
s390                              allnoconfig   gcc  
s390                                defconfig   gcc  
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240127   gcc  
x86_64       buildonly-randconfig-002-20240127   gcc  
x86_64       buildonly-randconfig-003-20240127   gcc  
x86_64       buildonly-randconfig-004-20240127   gcc  
x86_64       buildonly-randconfig-005-20240127   gcc  
x86_64       buildonly-randconfig-006-20240127   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240127   clang
x86_64                randconfig-002-20240127   clang
x86_64                randconfig-003-20240127   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

