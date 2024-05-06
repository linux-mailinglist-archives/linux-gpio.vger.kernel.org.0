Return-Path: <linux-gpio+bounces-6168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B678D8BD604
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 22:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B698DB2265A
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 20:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAE915B0E8;
	Mon,  6 May 2024 20:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2jJM2yE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A36745D9
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 20:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715025901; cv=none; b=BK5bC9MATvn+QAS0JY+PwOe7n7Dt2OvU+TvL/dDqqqXxMAQY6pyA4uKZ5BjE1VOL1r2bqM7vWchD5l1cenaISXVC+NLxYsk9v/bTMOsEQqeJzpe50FgA16zI5nOoC7lqnOkK7vFQi4WK7nHgDBwean1NezwCbuMgefKCzbmRSx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715025901; c=relaxed/simple;
	bh=zuL0BA6VWQC7A+ETLc+EbX1q9lDoZDdqsdWqD8ErF8I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rZgu8Wu/9p1Qn1BTkiYChh/xmQFf5qBLs9NPd8wsFHC2S/vSqGumH6EML/sPQM3H/vrI7Zn17XdJlnBm1/FqdKzqNiOKcrxHHb2MPU/l4Nf7mNXGFpPMX5N8Xkh7GgYPDyVyPm51HxdRQ5/QIfspWc06dGw+wz5OPSAXDiA5s9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2jJM2yE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715025899; x=1746561899;
  h=date:from:to:cc:subject:message-id;
  bh=zuL0BA6VWQC7A+ETLc+EbX1q9lDoZDdqsdWqD8ErF8I=;
  b=V2jJM2yEb479bCoZGt7Wl3vVTVqN6sHnx8vqeN/UUN5AeXA7K/6XuAWF
   19WJLarkyC53qKcbixRnm3Yff+0H1i+M604KmYYA9dZLmVT3z8liEnY9F
   5ZWJHJb/SjcIvrAmrvQxh5CVoameRJhvr4oWMWJ4lgvvxmKdKNccAAFOH
   Zyr0b2/WBGkyNlOLRdXEDwNaqT0MVbX5gJYwvZO/u37dQzKB3AulY0k8S
   NaIr2/sxzrMXazM+EnvgM36+RjUwb9+w04fq/sVidtfjXaDXWCtikxE1A
   V3CXyjXWA4LtIXQ7Hw3arUjks+toziKiSnDDfcNkXvfVpmAK8BrMtsPfT
   g==;
X-CSE-ConnectionGUID: B5t3FcjrQtCUmHBQ0vV6Zw==
X-CSE-MsgGUID: 0DF7nI2kT7iUidj9ARqUrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10916705"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="10916705"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 13:04:59 -0700
X-CSE-ConnectionGUID: r+pcoWbKRGGGpjgwSYN56g==
X-CSE-MsgGUID: B4Wt2IXARv6CTd95P70XsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="28803085"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 May 2024 13:04:58 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s44Zy-00010M-3B;
	Mon, 06 May 2024 20:04:54 +0000
Date: Tue, 07 May 2024 04:04:36 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 83906257f2e4441a4610f83ae24a713ba609b64a
Message-ID: <202405070435.yiJDMzFd-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 83906257f2e4441a4610f83ae24a713ba609b64a  Merge tag 'samsung-pinctrl-6.10' of https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into devel

elapsed time: 725m

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
arc                   randconfig-001-20240506   gcc  
arc                   randconfig-002-20240506   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   clang
arm                   randconfig-001-20240506   clang
arm                   randconfig-002-20240506   clang
arm                   randconfig-003-20240506   gcc  
arm                   randconfig-004-20240506   clang
arm                         s5pv210_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240506   gcc  
arm64                 randconfig-002-20240506   gcc  
arm64                 randconfig-003-20240506   clang
arm64                 randconfig-004-20240506   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240506   gcc  
csky                  randconfig-002-20240506   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240506   clang
hexagon               randconfig-002-20240506   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240506   gcc  
i386         buildonly-randconfig-002-20240506   clang
i386         buildonly-randconfig-003-20240506   gcc  
i386         buildonly-randconfig-004-20240506   gcc  
i386         buildonly-randconfig-005-20240506   gcc  
i386         buildonly-randconfig-006-20240506   clang
i386                                defconfig   clang
i386                  randconfig-001-20240506   gcc  
i386                  randconfig-002-20240506   clang
i386                  randconfig-003-20240506   gcc  
i386                  randconfig-004-20240506   clang
i386                  randconfig-005-20240506   clang
i386                  randconfig-006-20240506   gcc  
i386                  randconfig-011-20240506   gcc  
i386                  randconfig-012-20240506   gcc  
i386                  randconfig-013-20240506   gcc  
i386                  randconfig-014-20240506   clang
i386                  randconfig-015-20240506   clang
i386                  randconfig-016-20240506   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240506   gcc  
loongarch             randconfig-002-20240506   gcc  
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
mips                     loongson1b_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240506   gcc  
nios2                 randconfig-002-20240506   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240506   gcc  
parisc                randconfig-002-20240506   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     kilauea_defconfig   clang
powerpc                     mpc5200_defconfig   clang
powerpc                      pmac32_defconfig   clang
powerpc               randconfig-001-20240506   gcc  
powerpc               randconfig-002-20240506   clang
powerpc               randconfig-003-20240506   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc64             randconfig-001-20240506   clang
powerpc64             randconfig-002-20240506   clang
powerpc64             randconfig-003-20240506   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240506   clang
riscv                 randconfig-002-20240506   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240506   gcc  
s390                  randconfig-002-20240506   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                    randconfig-001-20240506   gcc  
sh                    randconfig-002-20240506   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240506   gcc  
sparc64               randconfig-002-20240506   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240506   clang
um                    randconfig-002-20240506   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240506   gcc  
x86_64       buildonly-randconfig-002-20240506   gcc  
x86_64       buildonly-randconfig-003-20240506   gcc  
x86_64       buildonly-randconfig-004-20240506   clang
x86_64       buildonly-randconfig-005-20240506   clang
x86_64       buildonly-randconfig-006-20240506   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240506   clang
x86_64                randconfig-002-20240506   clang
x86_64                randconfig-003-20240506   clang
x86_64                randconfig-004-20240506   clang
x86_64                randconfig-005-20240506   clang
x86_64                randconfig-006-20240506   clang
x86_64                randconfig-011-20240506   gcc  
x86_64                randconfig-012-20240506   gcc  
x86_64                randconfig-013-20240506   gcc  
x86_64                randconfig-014-20240506   gcc  
x86_64                randconfig-015-20240506   gcc  
x86_64                randconfig-016-20240506   gcc  
x86_64                randconfig-071-20240506   gcc  
x86_64                randconfig-072-20240506   clang
x86_64                randconfig-073-20240506   gcc  
x86_64                randconfig-074-20240506   clang
x86_64                randconfig-075-20240506   gcc  
x86_64                randconfig-076-20240506   clang
x86_64                          rhel-8.3-rust   clang
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240506   gcc  
xtensa                randconfig-002-20240506   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

