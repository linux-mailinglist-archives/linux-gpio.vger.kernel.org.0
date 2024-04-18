Return-Path: <linux-gpio+bounces-5647-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9408A9243
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Apr 2024 07:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8548DB225BD
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Apr 2024 05:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAE854902;
	Thu, 18 Apr 2024 05:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NoNk7t37"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E07282F4
	for <linux-gpio@vger.kernel.org>; Thu, 18 Apr 2024 05:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713416893; cv=none; b=mkAmaymFslrVsU2jpznUH+fvxzrWIA2nTaGVzwGHw9Ds9ET+AzvPbWnPc6n6ue1lg2wn90UsFLP8AeKZsQq+L74zpmdwj/BGV1+c2+bcz3zBleLophS3Kk5Ico64oJDkrbOvihfcSfffBkSqMCTZC3FucAaQFyl7pUhbgn35Pzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713416893; c=relaxed/simple;
	bh=oIevqEZ7Dru6aCWszhs2+Hxxp4z0pCpcrsYXTSareXE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FlFZUdfOKr1npOeOvSYqN5iUOECBvd5GSll0SP2d7LtNpMXsr6W6eZ0kUHBKiRyevsL7RjlPiBQf+JENJArj1ibJQx/V00kZ78HV9EMoO+mLbjbgBX4j2A31eihaMOcQfuuE5xGk1GHbygfpzSIWjVHZLhDPt8YNGH4QnLyvgww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NoNk7t37; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713416891; x=1744952891;
  h=date:from:to:cc:subject:message-id;
  bh=oIevqEZ7Dru6aCWszhs2+Hxxp4z0pCpcrsYXTSareXE=;
  b=NoNk7t37ufBOiBhXidJIwMxPianDItA0jMvxur6ODkDjQdiJNfNGS6Va
   R5vC4ZONWmhOfgM7ZKqtcYiWkIspjabN5lhYbiwOzMwsFsjLJ3aHgDM13
   55ydPmf4+x3+aZsVO5qGXwlI1rlr+6WShvRvGtwFV2G2txq7MGOvUWgL6
   xEL4h2f54dU4haL46efY86u4sS8XjDRsZvgdh4Sabj5N7pCiHDhqn7bRR
   YsAGEQ0n/bCFqPUlfT4KeOyUrJygEgkgdnq5b2Xb9ibt1hppz/wa69hD4
   hZIsKm8nyhiae62Xg1LhS7yxuo5eQrINaxCze92ssGoASBNZtmemVZwOp
   w==;
X-CSE-ConnectionGUID: 7AIfkPFiToumX9PhMlADBA==
X-CSE-MsgGUID: yO0LDf/4RTuRRlReIWswxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8865579"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="8865579"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 22:08:11 -0700
X-CSE-ConnectionGUID: fA1am2LdTdSHV8F/kvfaAg==
X-CSE-MsgGUID: bvnjQgWoTwWaunGCG/AXMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="22916057"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2024 22:08:09 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxK0E-0007Ju-29;
	Thu, 18 Apr 2024 05:08:06 +0000
Date: Thu, 18 Apr 2024 13:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 85fb4a0fad953343291bb61e85a27464aa235e6c
Message-ID: <202404181353.E0geZFe6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 85fb4a0fad953343291bb61e85a27464aa235e6c  Merge branch 'devel' into for-next

elapsed time: 978m

configs tested: 124
configs skipped: 4

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
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240418   gcc  
i386         buildonly-randconfig-002-20240418   gcc  
i386         buildonly-randconfig-003-20240418   clang
i386         buildonly-randconfig-004-20240418   gcc  
i386         buildonly-randconfig-005-20240418   clang
i386         buildonly-randconfig-006-20240418   clang
i386                                defconfig   clang
i386                  randconfig-001-20240418   gcc  
i386                  randconfig-002-20240418   gcc  
i386                  randconfig-003-20240418   clang
i386                  randconfig-004-20240418   gcc  
i386                  randconfig-005-20240418   gcc  
i386                  randconfig-006-20240418   gcc  
i386                  randconfig-011-20240418   clang
i386                  randconfig-012-20240418   clang
i386                  randconfig-013-20240418   gcc  
i386                  randconfig-014-20240418   gcc  
i386                  randconfig-015-20240418   gcc  
i386                  randconfig-016-20240418   clang
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
mips                              allnoconfig   gcc  
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
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240418   clang
x86_64       buildonly-randconfig-002-20240418   clang
x86_64       buildonly-randconfig-003-20240418   clang
x86_64       buildonly-randconfig-004-20240418   clang
x86_64       buildonly-randconfig-005-20240418   gcc  
x86_64       buildonly-randconfig-006-20240418   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240418   gcc  
x86_64                randconfig-002-20240418   clang
x86_64                randconfig-003-20240418   gcc  
x86_64                randconfig-004-20240418   clang
x86_64                randconfig-005-20240418   gcc  
x86_64                randconfig-006-20240418   gcc  
x86_64                randconfig-011-20240418   clang
x86_64                randconfig-012-20240418   gcc  
x86_64                randconfig-013-20240418   clang
x86_64                randconfig-014-20240418   gcc  
x86_64                randconfig-015-20240418   gcc  
x86_64                randconfig-016-20240418   gcc  
x86_64                randconfig-071-20240418   gcc  
x86_64                randconfig-072-20240418   clang
x86_64                randconfig-073-20240418   clang
x86_64                randconfig-074-20240418   gcc  
x86_64                randconfig-075-20240418   gcc  
x86_64                randconfig-076-20240418   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

