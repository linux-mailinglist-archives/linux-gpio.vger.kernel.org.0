Return-Path: <linux-gpio+bounces-1774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6545181B8B0
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 14:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E60A71F26A15
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 13:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6BD7A20F;
	Thu, 21 Dec 2023 13:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CfKO/3yz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A2F7996F
	for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 13:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703165742; x=1734701742;
  h=date:from:to:cc:subject:message-id;
  bh=rRWImRtBG5AEIc7gMhQsehNWwJHKDs6zBy025BvZWg4=;
  b=CfKO/3yzYjCAVuG3AWbs3uloJckaexENGrcc+Gqd6cG5GVwmmrt/uOk0
   +vEUhHVGHP9vSCB9FJRRsgJ5ybj56PpyOQ4okd+sAq42EhTz/WvKh9a4E
   CYY+pDpyCk+1SX7uv/Sfjo2MIOCnK2AfNbeKVProNRfntaICuT2wigB8E
   /H5wGGlY/UVW3gi7kR5B8/f6UHgW88VmkBy28gO2GcHqqrpgb64z+RW4D
   xBSv3I8ciLg0Qpeo4OnlfN4SujxWO6UI+wI8oFsmv98YIFPughcRUDBt8
   8Lxsm2Hmx+9LJLp8/IzrmE3v3s0n7y8Ge3gYzJHHpSad4Equf4vnboeQP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="9355821"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="9355821"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 05:35:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="895101881"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="895101881"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Dec 2023 05:35:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGJCp-0008Mu-0A;
	Thu, 21 Dec 2023 13:35:21 +0000
Date: Thu, 21 Dec 2023 21:32:27 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 7d7cd22dc497dc79c2b1ae0e26cada1c5207d5dd
Message-ID: <202312212124.va7kAmTp-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 7d7cd22dc497dc79c2b1ae0e26cada1c5207d5dd  pinctrl: cy8c95x0: Cache muxed registers

elapsed time: 1465m

configs tested: 178
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20231221   gcc  
arc                   randconfig-002-20231221   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                       imx_v6_v7_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                            mmp2_defconfig   clang
arm                   randconfig-001-20231221   clang
arm                   randconfig-002-20231221   clang
arm                   randconfig-003-20231221   clang
arm                   randconfig-004-20231221   clang
arm                       spear13xx_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231221   clang
arm64                 randconfig-002-20231221   clang
arm64                 randconfig-003-20231221   clang
arm64                 randconfig-004-20231221   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231221   gcc  
csky                  randconfig-002-20231221   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231221   clang
hexagon               randconfig-002-20231221   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231221   clang
i386         buildonly-randconfig-002-20231221   clang
i386         buildonly-randconfig-003-20231221   clang
i386         buildonly-randconfig-004-20231221   clang
i386         buildonly-randconfig-005-20231221   clang
i386         buildonly-randconfig-006-20231221   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231221   clang
i386                  randconfig-002-20231221   clang
i386                  randconfig-003-20231221   clang
i386                  randconfig-004-20231221   clang
i386                  randconfig-005-20231221   clang
i386                  randconfig-006-20231221   clang
i386                  randconfig-011-20231221   gcc  
i386                  randconfig-012-20231221   gcc  
i386                  randconfig-013-20231221   gcc  
i386                  randconfig-014-20231221   gcc  
i386                  randconfig-015-20231221   gcc  
i386                  randconfig-016-20231221   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231221   gcc  
loongarch             randconfig-002-20231221   gcc  
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
mips                       bmips_be_defconfig   gcc  
mips                        maltaup_defconfig   clang
mips                      pic32mzda_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231221   gcc  
nios2                 randconfig-002-20231221   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231221   gcc  
parisc                randconfig-002-20231221   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     mpc512x_defconfig   clang
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc               randconfig-001-20231221   clang
powerpc               randconfig-002-20231221   clang
powerpc               randconfig-003-20231221   clang
powerpc                     taishan_defconfig   gcc  
powerpc                      walnut_defconfig   clang
powerpc64             randconfig-001-20231221   clang
powerpc64             randconfig-002-20231221   clang
powerpc64             randconfig-003-20231221   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231221   clang
riscv                 randconfig-002-20231221   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231221   gcc  
s390                  randconfig-002-20231221   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231221   gcc  
sh                    randconfig-002-20231221   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231221   gcc  
sparc64               randconfig-002-20231221   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231221   clang
um                    randconfig-002-20231221   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231221   clang
x86_64       buildonly-randconfig-002-20231221   clang
x86_64       buildonly-randconfig-003-20231221   clang
x86_64       buildonly-randconfig-004-20231221   clang
x86_64       buildonly-randconfig-005-20231221   clang
x86_64       buildonly-randconfig-006-20231221   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231221   gcc  
x86_64                randconfig-002-20231221   gcc  
x86_64                randconfig-003-20231221   gcc  
x86_64                randconfig-004-20231221   gcc  
x86_64                randconfig-005-20231221   gcc  
x86_64                randconfig-006-20231221   gcc  
x86_64                randconfig-011-20231221   clang
x86_64                randconfig-012-20231221   clang
x86_64                randconfig-013-20231221   clang
x86_64                randconfig-014-20231221   clang
x86_64                randconfig-015-20231221   clang
x86_64                randconfig-016-20231221   clang
x86_64                randconfig-071-20231221   clang
x86_64                randconfig-072-20231221   clang
x86_64                randconfig-073-20231221   clang
x86_64                randconfig-074-20231221   clang
x86_64                randconfig-075-20231221   clang
x86_64                randconfig-076-20231221   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231221   gcc  
xtensa                randconfig-002-20231221   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

