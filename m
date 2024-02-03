Return-Path: <linux-gpio+bounces-2907-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B58368486CB
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Feb 2024 15:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EAA2282C68
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Feb 2024 14:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2792EB0E;
	Sat,  3 Feb 2024 14:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTukQJ02"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F565C8EF
	for <linux-gpio@vger.kernel.org>; Sat,  3 Feb 2024 14:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706971416; cv=none; b=DzNhB1qlW8XfFWm0jXKxUPbWcVnXhc6MY8BdfnQz4G7QY6Lv6tnHj7QTn1pFJ+NdOK/qNX1GtsVjEyLNOlhLipdkE1c/bwBLmygyVYdcjAtf8F40kZB3DFlvlCkib0UumTwVhVIi4rZBUMQrwwnjFKQFFVzSkUYAj9b9vhya4Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706971416; c=relaxed/simple;
	bh=QHSgKNg320jamIjvG6d3hLuf4g3AIZk9QeTMMkJg1BU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hz15MklDaE7wJJ+7U2Jpk4+Pa4eJKdfqsdUvGgiGbbdYLznYAT0DsBGqBP9qN+radf47C0x7kY5liHF+2XgorOg6JbWY21CfDpd3LdL+SxmekPN2NJswBQNE1SMo3KeLTjr6dgZX46ZFNRZkgmut8nExGbK4EXUHvPQuI4y0s9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JTukQJ02; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706971415; x=1738507415;
  h=date:from:to:cc:subject:message-id;
  bh=QHSgKNg320jamIjvG6d3hLuf4g3AIZk9QeTMMkJg1BU=;
  b=JTukQJ02qhsSAjBbnwaFJBeznDQxxmIa23L8p6OP2qaqc22rHGfB06c/
   utcpHyFJh8Ex0aJC0BGIdkjPdwHgeBnxKFWhGwPBKge1cGZAGU4NgkJ6g
   skmnnLgfsL3+AdU9kTEUyf0SsnZQOFlwsBZEgIyXksHzDaje/uTbLPGCs
   n2sJYhCN49eLfKKQjZ5HuComvlS+tpsB1BmXzuInt2BsmpaNopUsdMR8S
   VqJYTEfgfrXxUniHL43VkbAHzC8R3XwKBOAbuENaQ+UStp1kk+nREKVD2
   ZF5NsCFwKdMp9dXmXVK0L9M73MYef/IysJiYCFYqFDfjTvH3ghDRcn/mc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="232829"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="232829"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 06:43:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="4947830"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Feb 2024 06:43:33 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWHEw-0005BT-2E;
	Sat, 03 Feb 2024 14:43:30 +0000
Date: Sat, 03 Feb 2024 22:43:29 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 3eac8bbed22e940ac1645a884f221bef408f675c
Message-ID: <202402032226.bvx8pBMC-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 3eac8bbed22e940ac1645a884f221bef408f675c  gpio: vf610: enable COMPILE_TEST

elapsed time: 1461m

configs tested: 179
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
arc                   randconfig-001-20240203   gcc  
arc                   randconfig-002-20240203   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          exynos_defconfig   clang
arm                           imxrt_defconfig   clang
arm                        mvebu_v7_defconfig   clang
arm                   randconfig-001-20240203   clang
arm                   randconfig-002-20240203   clang
arm                   randconfig-003-20240203   gcc  
arm                   randconfig-004-20240203   clang
arm                        realview_defconfig   clang
arm                         socfpga_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240203   clang
arm64                 randconfig-002-20240203   clang
arm64                 randconfig-003-20240203   gcc  
arm64                 randconfig-004-20240203   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240203   gcc  
csky                  randconfig-002-20240203   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240203   clang
hexagon               randconfig-002-20240203   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240203   clang
i386         buildonly-randconfig-002-20240203   gcc  
i386         buildonly-randconfig-003-20240203   clang
i386         buildonly-randconfig-004-20240203   clang
i386         buildonly-randconfig-005-20240203   clang
i386         buildonly-randconfig-006-20240203   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240203   clang
i386                  randconfig-002-20240203   gcc  
i386                  randconfig-003-20240203   clang
i386                  randconfig-004-20240203   gcc  
i386                  randconfig-005-20240203   clang
i386                  randconfig-006-20240203   gcc  
i386                  randconfig-011-20240203   clang
i386                  randconfig-012-20240203   gcc  
i386                  randconfig-013-20240203   gcc  
i386                  randconfig-014-20240203   gcc  
i386                  randconfig-015-20240203   gcc  
i386                  randconfig-016-20240203   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240203   gcc  
loongarch             randconfig-002-20240203   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips                           ci20_defconfig   clang
mips                           jazz_defconfig   clang
mips                      maltaaprp_defconfig   clang
nios2                            alldefconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240203   gcc  
nios2                 randconfig-002-20240203   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240203   gcc  
parisc                randconfig-002-20240203   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    mvme5100_defconfig   gcc  
powerpc               randconfig-001-20240203   clang
powerpc               randconfig-002-20240203   clang
powerpc               randconfig-003-20240203   clang
powerpc                     skiroot_defconfig   clang
powerpc64             randconfig-001-20240203   clang
powerpc64             randconfig-002-20240203   gcc  
powerpc64             randconfig-003-20240203   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240203   clang
riscv                 randconfig-002-20240203   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240203   gcc  
s390                  randconfig-002-20240203   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                    randconfig-001-20240203   gcc  
sh                    randconfig-002-20240203   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240203   gcc  
sparc64               randconfig-002-20240203   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240203   clang
um                    randconfig-002-20240203   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240203   gcc  
x86_64       buildonly-randconfig-002-20240203   gcc  
x86_64       buildonly-randconfig-003-20240203   gcc  
x86_64       buildonly-randconfig-004-20240203   gcc  
x86_64       buildonly-randconfig-005-20240203   gcc  
x86_64       buildonly-randconfig-006-20240203   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240203   gcc  
x86_64                randconfig-002-20240203   gcc  
x86_64                randconfig-003-20240203   clang
x86_64                randconfig-004-20240203   gcc  
x86_64                randconfig-005-20240203   gcc  
x86_64                randconfig-006-20240203   gcc  
x86_64                randconfig-011-20240203   gcc  
x86_64                randconfig-012-20240203   gcc  
x86_64                randconfig-013-20240203   clang
x86_64                randconfig-014-20240203   clang
x86_64                randconfig-015-20240203   clang
x86_64                randconfig-016-20240203   clang
x86_64                randconfig-071-20240203   clang
x86_64                randconfig-072-20240203   gcc  
x86_64                randconfig-073-20240203   clang
x86_64                randconfig-074-20240203   clang
x86_64                randconfig-075-20240203   clang
x86_64                randconfig-076-20240203   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240203   gcc  
xtensa                randconfig-002-20240203   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

