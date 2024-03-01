Return-Path: <linux-gpio+bounces-4010-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9CC86DB35
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 06:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DB071F22A25
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 05:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D037951037;
	Fri,  1 Mar 2024 05:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjEfae0R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A375027F
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 05:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709271542; cv=none; b=oLzEaPhf2r9GCt7TBoHi+dr5Cde5RCcPu3Jdf1Bcvn/D5tn9XA+oSzars0C5EaPhBlhamru1uV9cLqawk2O+DPxUpOISuhTI5jJY1TYHaxksQZU+BNxnsRa6R+5UKMLibzWFW6scqLcDxuU+id7H7TMHshwuXPe+YIFjRDKq8qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709271542; c=relaxed/simple;
	bh=Inh0EbnmXIOawCu6GnHEp4HjhslAbEiRgi5t8XwInN4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dioeeexaSiXDFDde0lxwnRqvcNBBuiKCn6opQKUQzhTt3Bwz+4Tx6o8Mp1l13MvYi2CiDR6IP/sw5JaA8ERmNHTW5Z0Ia2ZIz3Mr57l5BTlOqv33XtHruSCt4+7xPAwCfjg37Ga0ABGa1SqpRV9MmnfP9DPpub85OJNy+SRsjA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjEfae0R; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709271541; x=1740807541;
  h=date:from:to:cc:subject:message-id;
  bh=Inh0EbnmXIOawCu6GnHEp4HjhslAbEiRgi5t8XwInN4=;
  b=EjEfae0RnmIqznuNmNSMGwFzaenGFGbX74NIJPNx61ryo+YoNxOng6a+
   ZCmf/7vMYFvSG/+E0unq+gWXMt0mQwa4cgkSgzhIfMHE18F4cIjXETjPl
   14U5xPzdeqwVNHTz2NEIp1Qut7PR434Ay9GyPaH3126zkixM85Xs85cY1
   17TUow90d5vgbeuHQiFSa9aDMpfGoP9YAVkT/ccDLHT/P/7zY0+W7SwWb
   CaCJiC0yU9J1lH/XFVgG7ylSo4JQ4309eqqxZ57uSwaWrhHG98PtCm+ZA
   wAihr5+uR4rmL+2sAKkdER/0glk3f2jhe3uCLAfKXfUl3my+LlvmLR5o0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="7565829"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="7565829"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 21:39:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8029330"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Feb 2024 21:38:59 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfvbk-000DZU-2y;
	Fri, 01 Mar 2024 05:38:56 +0000
Date: Fri, 01 Mar 2024 13:38:18 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 90680213a662349fb364510bd11ba3bdb96ae067
Message-ID: <202403011315.cRHiKS0Z-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 90680213a662349fb364510bd11ba3bdb96ae067  gpiolib: Fix the error path order in gpiochip_add_data_with_key()

elapsed time: 741m

configs tested: 168
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
arm                              alldefconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        multi_v5_defconfig   gcc  
arm                       netwinder_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                   randconfig-001-20240301   gcc  
arm                   randconfig-003-20240301   gcc  
arm                   randconfig-004-20240301   gcc  
arm                          sp7021_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240301   gcc  
arm64                 randconfig-003-20240301   gcc  
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
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-003-20240301   gcc  
i386                                defconfig   clang
i386                  randconfig-005-20240301   gcc  
i386                  randconfig-006-20240301   gcc  
i386                  randconfig-011-20240301   gcc  
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
m68k                        m5307c3_defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240301   gcc  
nios2                 randconfig-002-20240301   gcc  
openrisc                         alldefconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
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
powerpc                      arches_defconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                          g5_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                     powernv_defconfig   gcc  
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-001-20240301   gcc  
powerpc               randconfig-002-20240301   gcc  
powerpc64             randconfig-002-20240301   gcc  
powerpc64             randconfig-003-20240301   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240301   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240301   gcc  
sh                    randconfig-002-20240301   gcc  
sh                          rsk7201_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc64_defconfig   gcc  
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
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-002-20240301   gcc  
x86_64       buildonly-randconfig-004-20240301   gcc  
x86_64       buildonly-randconfig-006-20240301   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240301   gcc  
x86_64                randconfig-005-20240301   gcc  
x86_64                randconfig-006-20240301   gcc  
x86_64                randconfig-014-20240301   gcc  
x86_64                randconfig-016-20240301   gcc  
x86_64                randconfig-071-20240301   gcc  
x86_64                randconfig-073-20240301   gcc  
x86_64                randconfig-074-20240301   gcc  
x86_64                randconfig-075-20240301   gcc  
x86_64                randconfig-076-20240301   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                randconfig-001-20240301   gcc  
xtensa                randconfig-002-20240301   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

