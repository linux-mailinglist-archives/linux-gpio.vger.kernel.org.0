Return-Path: <linux-gpio+bounces-4025-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2CE86DF2F
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 11:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 926FE1C20F2C
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 10:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811426BB21;
	Fri,  1 Mar 2024 10:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6WrLnce"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5525B1E2
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 10:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709288830; cv=none; b=Puz/NMhtCyZejrEwZZYqynWhAjnqyrYcee+Mu+ShUUUDDUg9z8op88VnzR9dTDaeVmbjonFLp9n4NYqqjdgFQ8+k0L2FtCjGlfBbR0/kR4P4wQIQBIaTIpwKb2ZCxl/sW+8HFhHj1x4H1kIK0qbXU1a8fk9Ro/BGdF5dJXmN1+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709288830; c=relaxed/simple;
	bh=4/l5dpXqhMbHFXDMwCPthnvyjKz2gCn5sfAYZdUgMFM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WB/UHdLf1r+sBQx1dKjspzRfs7QX93yXiIzZDFg54d57f2AHRhPdzAzrUcXDVxvUnhH6+B6HwmbNm6tOeilOtVJkxV1ten/upRfJLxr+ADJQN2Uoo+2H59sJnpLIMV6RSwQrkkhWFblIfD1iuZELxzqLmYJSEUT5Ydm7Bn9sklA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6WrLnce; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709288828; x=1740824828;
  h=date:from:to:cc:subject:message-id;
  bh=4/l5dpXqhMbHFXDMwCPthnvyjKz2gCn5sfAYZdUgMFM=;
  b=M6WrLnceZsYVSDw/nzuruPD4JjmiAe7NHDRi3KF0tzMyoFMcuEXy3iZZ
   xG25yLkWa4Ap1I1G9RIZh71erFxUkcUfbyS79Kdyy9Gou7WHD4/EUi9Hm
   x1KC7k/YnqpKxpcnwfPus/mKjvNw4eXWoRbqwTZK/O6DJD0xvma7+S7+9
   XABeDy6ecM3mq5LuwGjUN9FH1nU9u7Dt/EyPYNsSwZKW47RfnwdVypLNv
   VshindlS8uMyHbbNPnGpb6j5tFroHvpz91S8+QpGae03jtPoGSLF4ilW8
   YrhuJlL5NjXkGeGd5tLjTVi7OfqcFvCMZvmbsJMcbBTkWlFgyrn1Y9qXt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="21359821"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="21359821"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 02:27:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="12742267"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 01 Mar 2024 02:27:06 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rg06M-000DmT-14;
	Fri, 01 Mar 2024 10:26:55 +0000
Date: Fri, 01 Mar 2024 18:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/awinic-aw9523] BUILD SUCCESS
 69ca9eeb0c0b98105dddd91927c31efac34883f6
Message-ID: <202403011845.S6X9qG7n-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/awinic-aw9523
branch HEAD: 69ca9eeb0c0b98105dddd91927c31efac34883f6  dt-bindings: pinctrl: Add bindings for Awinic AW9523/AW9523B

elapsed time: 738m

configs tested: 165
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
arc                   randconfig-001-20240301   gcc  
arc                   randconfig-002-20240301   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240301   gcc  
arm                   randconfig-002-20240301   clang
arm                   randconfig-003-20240301   gcc  
arm                   randconfig-004-20240301   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240301   gcc  
arm64                 randconfig-002-20240301   clang
arm64                 randconfig-003-20240301   gcc  
arm64                 randconfig-004-20240301   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240301   gcc  
csky                  randconfig-002-20240301   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240301   clang
hexagon               randconfig-002-20240301   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240301   clang
i386         buildonly-randconfig-002-20240301   clang
i386         buildonly-randconfig-003-20240301   gcc  
i386         buildonly-randconfig-004-20240301   clang
i386         buildonly-randconfig-005-20240301   clang
i386         buildonly-randconfig-006-20240301   clang
i386                                defconfig   clang
i386                  randconfig-001-20240301   clang
i386                  randconfig-002-20240301   clang
i386                  randconfig-003-20240301   clang
i386                  randconfig-004-20240301   clang
i386                  randconfig-005-20240301   gcc  
i386                  randconfig-006-20240301   gcc  
i386                  randconfig-011-20240301   gcc  
i386                  randconfig-012-20240301   clang
i386                  randconfig-013-20240301   clang
i386                  randconfig-014-20240301   gcc  
i386                  randconfig-015-20240301   gcc  
i386                  randconfig-016-20240301   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240301   gcc  
loongarch             randconfig-002-20240301   gcc  
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
nios2                 randconfig-001-20240301   gcc  
nios2                 randconfig-002-20240301   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240301   gcc  
parisc                randconfig-002-20240301   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240301   gcc  
powerpc               randconfig-002-20240301   gcc  
powerpc               randconfig-003-20240301   clang
powerpc64             randconfig-001-20240301   clang
powerpc64             randconfig-002-20240301   gcc  
powerpc64             randconfig-003-20240301   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240301   gcc  
riscv                 randconfig-002-20240301   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240301   clang
s390                  randconfig-002-20240301   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240301   gcc  
sh                    randconfig-002-20240301   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240301   gcc  
sparc64               randconfig-002-20240301   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240301   gcc  
um                    randconfig-002-20240301   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240301   clang
x86_64       buildonly-randconfig-002-20240301   gcc  
x86_64       buildonly-randconfig-003-20240301   clang
x86_64       buildonly-randconfig-004-20240301   gcc  
x86_64       buildonly-randconfig-005-20240301   clang
x86_64       buildonly-randconfig-006-20240301   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240301   gcc  
x86_64                randconfig-002-20240301   clang
x86_64                randconfig-003-20240301   clang
x86_64                randconfig-004-20240301   clang
x86_64                randconfig-005-20240301   gcc  
x86_64                randconfig-006-20240301   gcc  
x86_64                randconfig-011-20240301   clang
x86_64                randconfig-012-20240301   clang
x86_64                randconfig-013-20240301   clang
x86_64                randconfig-014-20240301   gcc  
x86_64                randconfig-015-20240301   clang
x86_64                randconfig-016-20240301   gcc  
x86_64                randconfig-071-20240301   gcc  
x86_64                randconfig-072-20240301   clang
x86_64                randconfig-073-20240301   gcc  
x86_64                randconfig-074-20240301   gcc  
x86_64                randconfig-075-20240301   gcc  
x86_64                randconfig-076-20240301   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240301   gcc  
xtensa                randconfig-002-20240301   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

