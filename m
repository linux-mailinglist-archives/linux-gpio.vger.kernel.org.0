Return-Path: <linux-gpio+bounces-4808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 904CB890DD8
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 23:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2AAE1C225A2
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 22:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8264085B;
	Thu, 28 Mar 2024 22:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZDXK0W0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8636A225A8
	for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 22:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711666347; cv=none; b=ka59DFuGXmSihF5tp9JCIo+4lLyS4bRqK59ca7iZeyIi9Nmr9UWmJaNnI1OC9ieOR0ikKGkP7qOV1f1XndR6tY6doOX9zVlxydJ+/UyaEGoWkJmjRSM67vSDqo+m+owRuR17/m9LNIoKGa3amXTUXOPXEZ9VEJ1SFbqB2klpTKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711666347; c=relaxed/simple;
	bh=OjQekYp4KU/MdcZDKTOSKrgPoaNAM6BA/NibtNKEIOI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fZUVo8kB1Mr3Q1DmVGxgU2bPz7Hwl+cKi2FoL8DnePfMlt7/dvMnOjaVhGh3Ocb+uZj/rr7BOeoXTPTC8VPW/xykx33wA6qDNaWh3uu6NzmANgeM7IHgjg+pd3FM7fHVSuo9ynxZxPoo+AgFPux85Dnua781KZoBosFMvcIjfrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZDXK0W0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711666346; x=1743202346;
  h=date:from:to:cc:subject:message-id;
  bh=OjQekYp4KU/MdcZDKTOSKrgPoaNAM6BA/NibtNKEIOI=;
  b=HZDXK0W0cMrhG63Lv2AXtRvfGaxUDdyDqkFkMcB063WTGH9Bvfa/GjhT
   3xuO02vK/gE18j+CtkpaSKbwnsp+Yy/FCDGYMNZ3PsElrqtCrJeitolDj
   mI8HHStFcqNi36Ucmg2Mbbc4SMsIfYUzFmTDras947q8wMTblCGjl+Alh
   0lwD1eoZxFN7XFhFfFhKzhe5Wj+9MYdFn6INAO4UcPWYk+KLsC7Sv7p6n
   LwtzY440pX4qQsEvr1Nz9iPgFSLAtLQuGFm038EdxzzIS2DXuPD+Mnat4
   9qJn+L0N9xdPybsI9GXZbAWlNwlRV7MhnZERBSBEAiZyj+wmW8k0zoA1t
   w==;
X-CSE-ConnectionGUID: pitQLx1wSZ6zAoeZdkl33Q==
X-CSE-MsgGUID: DNM+KhPbR0mEjMGrcbhalg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="7069142"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="7069142"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 15:52:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="47996282"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Mar 2024 15:52:24 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpybd-0002aJ-2r;
	Thu, 28 Mar 2024 22:52:21 +0000
Date: Fri, 29 Mar 2024 06:52:17 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 d741723c0ad3500bfeaaa87be00089736a10fd26
Message-ID: <202403290616.iffwWLRC-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: d741723c0ad3500bfeaaa87be00089736a10fd26  Merge branch 'devel' into for-next

elapsed time: 723m

configs tested: 150
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
arc                   randconfig-001-20240329   gcc  
arc                   randconfig-002-20240329   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240329   gcc  
arm                   randconfig-002-20240329   clang
arm                   randconfig-003-20240329   clang
arm                   randconfig-004-20240329   gcc  
arm                       spear13xx_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240329   gcc  
arm64                 randconfig-002-20240329   clang
arm64                 randconfig-003-20240329   clang
arm64                 randconfig-004-20240329   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240329   gcc  
csky                  randconfig-002-20240329   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240329   clang
hexagon               randconfig-002-20240329   clang
i386                             alldefconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240329   gcc  
i386         buildonly-randconfig-002-20240329   clang
i386         buildonly-randconfig-003-20240329   clang
i386         buildonly-randconfig-004-20240329   clang
i386         buildonly-randconfig-005-20240329   clang
i386         buildonly-randconfig-006-20240329   clang
i386                                defconfig   clang
i386                  randconfig-001-20240329   clang
i386                  randconfig-002-20240329   clang
i386                  randconfig-003-20240329   clang
i386                  randconfig-004-20240329   clang
i386                  randconfig-005-20240329   clang
i386                  randconfig-006-20240329   clang
i386                  randconfig-011-20240329   clang
i386                  randconfig-012-20240329   clang
i386                  randconfig-013-20240329   gcc  
i386                  randconfig-014-20240329   gcc  
i386                  randconfig-015-20240329   gcc  
i386                  randconfig-016-20240329   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240329   gcc  
loongarch             randconfig-002-20240329   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                       lemote2f_defconfig   gcc  
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240329   gcc  
nios2                 randconfig-002-20240329   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240329   gcc  
parisc                randconfig-002-20240329   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        fsp2_defconfig   gcc  
powerpc               randconfig-001-20240329   clang
powerpc               randconfig-002-20240329   gcc  
powerpc               randconfig-003-20240329   clang
powerpc                    socrates_defconfig   gcc  
powerpc64             randconfig-001-20240329   gcc  
powerpc64             randconfig-002-20240329   clang
powerpc64             randconfig-003-20240329   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240329   gcc  
riscv                 randconfig-002-20240329   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240329   clang
s390                  randconfig-002-20240329   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240329   gcc  
sh                    randconfig-002-20240329   gcc  
sh                           sh2007_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240329   gcc  
sparc64               randconfig-002-20240329   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240329   clang
um                    randconfig-002-20240329   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240329   gcc  
xtensa                randconfig-002-20240329   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

