Return-Path: <linux-gpio+bounces-7143-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D888FBF00
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 00:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EE351F21BBD
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 22:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C568143C61;
	Tue,  4 Jun 2024 22:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApCR5G5O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85E928DC7
	for <linux-gpio@vger.kernel.org>; Tue,  4 Jun 2024 22:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717540464; cv=none; b=I5NsXsQkDvVHDChOBwYB+5bpJxqvESYoyf+pOzKYfAep3yJlRKSq7hqjRSF8V6/YJVtC1w3EgNe1C3pn7tJC29aMwCcHWKKryyFRU45i8p4DHsaZZ3JEtoFGd/UE5/J0ZwqeDjQMCCxbQNa+/AvWtR0HEfDvVF81c2+9a5D3orY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717540464; c=relaxed/simple;
	bh=w92vekf8L6if7oBHgwy+vqkJVoWB8Exf9epxHH0LgnU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bR77dg1jHcJ4dRat21Mu/B1b7EXoA5lTL3peg3La9S4QdBiYqCVyL/aLF19FJcL0CtDqqEvEJABXXXptiKErKIPjn3s2mkjQrswBGO+3cD66A2QiGPwj6zA1V7lsumHNQOj5mBiam47LR1jncn+oO5O4EEtFwB1syAHYZtKfKk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApCR5G5O; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717540463; x=1749076463;
  h=date:from:to:cc:subject:message-id;
  bh=w92vekf8L6if7oBHgwy+vqkJVoWB8Exf9epxHH0LgnU=;
  b=ApCR5G5OyTxeAwVdIMWoLyQD30Q4Y+RVFW1/me+X25BtvORvfHx5VW9f
   NhE3NONy3CSSdeQ0YnZEWYVouAkv8PbYz5GLH/dJgFMf7QULOjsaxZvpR
   ukyXFmUGLPpgURExhHRsnNBDZAB3zYhUlnhnSRF+W77tBh+kvSEc1iq4T
   dVEpZSnlrP+gIWJYi/4EhTnBczlDZ+HRhp73WUj2fkhdJM1y1HZ/GbZu0
   LHI76t6BL9EPBh6kn0JRE4V7TGCCW0jeq+l0yj1ygXwIRRaN5ipJ61c8T
   rUIP1ilwyIfbV0YNFflDZ4N0ka4bYD2xD6lg8HiLiT4qrW8lVjt77zXW0
   w==;
X-CSE-ConnectionGUID: M1P+4hZDSbqXJOBs84meMg==
X-CSE-MsgGUID: bWp3/oiNQD2yRhD0DOxqHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="25524860"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="25524860"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 15:34:23 -0700
X-CSE-ConnectionGUID: k2DZC+O2Q/mYA8HehD31OA==
X-CSE-MsgGUID: 5crnldVNSXSrKDenYYK5IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="74866874"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Jun 2024 15:34:21 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEcjS-0000cb-2r;
	Tue, 04 Jun 2024 22:34:18 +0000
Date: Wed, 05 Jun 2024 06:33:45 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 32335efff386d04961b178d4c6b7d1ccbafb729f
Message-ID: <202406050642.wgUD1LzI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 32335efff386d04961b178d4c6b7d1ccbafb729f  Merge branch 'devel' into for-next

elapsed time: 1449m

configs tested: 172
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240604   gcc  
arc                   randconfig-001-20240605   gcc  
arc                   randconfig-002-20240604   gcc  
arc                   randconfig-002-20240605   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                   randconfig-002-20240604   gcc  
arm                   randconfig-004-20240604   gcc  
arm                   randconfig-004-20240605   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240605   gcc  
arm64                 randconfig-002-20240604   gcc  
arm64                 randconfig-003-20240604   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240604   gcc  
csky                  randconfig-001-20240605   gcc  
csky                  randconfig-002-20240604   gcc  
csky                  randconfig-002-20240605   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240604   gcc  
i386         buildonly-randconfig-002-20240604   clang
i386         buildonly-randconfig-003-20240604   clang
i386         buildonly-randconfig-004-20240604   gcc  
i386         buildonly-randconfig-005-20240604   clang
i386         buildonly-randconfig-006-20240604   clang
i386                                defconfig   clang
i386                  randconfig-001-20240604   clang
i386                  randconfig-002-20240604   clang
i386                  randconfig-003-20240604   clang
i386                  randconfig-004-20240604   clang
i386                  randconfig-005-20240604   gcc  
i386                  randconfig-006-20240604   gcc  
i386                  randconfig-011-20240604   clang
i386                  randconfig-012-20240604   gcc  
i386                  randconfig-013-20240604   gcc  
i386                  randconfig-014-20240604   clang
i386                  randconfig-015-20240604   clang
i386                  randconfig-016-20240604   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240604   gcc  
loongarch             randconfig-001-20240605   gcc  
loongarch             randconfig-002-20240604   gcc  
loongarch             randconfig-002-20240605   gcc  
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
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240604   gcc  
nios2                 randconfig-001-20240605   gcc  
nios2                 randconfig-002-20240604   gcc  
nios2                 randconfig-002-20240605   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240604   gcc  
parisc                randconfig-001-20240605   gcc  
parisc                randconfig-002-20240604   gcc  
parisc                randconfig-002-20240605   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240604   gcc  
powerpc               randconfig-001-20240605   gcc  
powerpc               randconfig-002-20240604   gcc  
powerpc               randconfig-002-20240605   gcc  
powerpc               randconfig-003-20240604   gcc  
powerpc               randconfig-003-20240605   gcc  
powerpc64             randconfig-001-20240604   gcc  
powerpc64             randconfig-001-20240605   gcc  
powerpc64             randconfig-002-20240604   gcc  
powerpc64             randconfig-003-20240605   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240605   gcc  
riscv                 randconfig-002-20240604   gcc  
riscv                 randconfig-002-20240605   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240605   gcc  
s390                  randconfig-002-20240604   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240604   gcc  
sh                    randconfig-001-20240605   gcc  
sh                    randconfig-002-20240604   gcc  
sh                    randconfig-002-20240605   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240604   gcc  
sparc64               randconfig-001-20240605   gcc  
sparc64               randconfig-002-20240604   gcc  
sparc64               randconfig-002-20240605   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240605   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240605   gcc  
x86_64       buildonly-randconfig-002-20240605   gcc  
x86_64       buildonly-randconfig-003-20240605   gcc  
x86_64       buildonly-randconfig-004-20240605   clang
x86_64       buildonly-randconfig-005-20240605   clang
x86_64       buildonly-randconfig-006-20240605   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240605   clang
x86_64                randconfig-002-20240605   clang
x86_64                randconfig-003-20240605   gcc  
x86_64                randconfig-004-20240605   clang
x86_64                randconfig-005-20240605   clang
x86_64                randconfig-006-20240605   gcc  
x86_64                randconfig-011-20240605   clang
x86_64                randconfig-012-20240605   gcc  
x86_64                randconfig-013-20240605   clang
x86_64                randconfig-014-20240605   gcc  
x86_64                randconfig-015-20240605   clang
x86_64                randconfig-016-20240605   gcc  
x86_64                randconfig-071-20240605   gcc  
x86_64                randconfig-072-20240605   clang
x86_64                randconfig-073-20240605   gcc  
x86_64                randconfig-074-20240605   gcc  
x86_64                randconfig-075-20240605   gcc  
x86_64                randconfig-076-20240605   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240604   gcc  
xtensa                randconfig-001-20240605   gcc  
xtensa                randconfig-002-20240604   gcc  
xtensa                randconfig-002-20240605   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

