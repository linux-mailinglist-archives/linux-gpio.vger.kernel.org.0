Return-Path: <linux-gpio+bounces-3435-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C781859911
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Feb 2024 20:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02F1328157A
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Feb 2024 19:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D806F50D;
	Sun, 18 Feb 2024 19:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4csgGiu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2A81E86E
	for <linux-gpio@vger.kernel.org>; Sun, 18 Feb 2024 19:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708284456; cv=none; b=rdApzKZOie0/nRNwrwRFZrL0iCh8a3dB5RK8aAX7hu+QcAS/sLp7TlNsPeMKFYT98mrYH5T7WLPjGV9bGJYzKe3a4h9SM+ztEnDwo0rOzrlPI5/3l+SnguFJzQRn4ZfE0ucg+BnhY18zjJtU9X0WrCXWNzfOAouGIVCtKiQ+C+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708284456; c=relaxed/simple;
	bh=CzbktdVkyBCNkdbOQULQcD0bsN3EWu7CaUdTTy4ixzw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sgMeHLduu5Vb5Bi1fqvjG8e7ITCE2r8OS2rYcw/ewzrlFMrPdci6F0p0eT6Rw36COZZdH1ZN8O7kzVSW1S7s433B2tiladiGZJpNm7fyXsnkT15BbXfYUlyS9lEYSwub8S5HqtJ+IajcwnGtADCx4jL23Q7q9ylV5eKbQjvKABU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4csgGiu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708284454; x=1739820454;
  h=date:from:to:cc:subject:message-id;
  bh=CzbktdVkyBCNkdbOQULQcD0bsN3EWu7CaUdTTy4ixzw=;
  b=c4csgGiuY0owb1pGymfX8e9cpYb2Zp9Sfn7mLkpEwINmQUk37oHPjGga
   rbcH1+hZ16GRqbdL1RNuCGP3QwraC8ZYeXK3QX/edAqGPFGOcGqe/kaum
   +S4KAtXFhEMaoXBlhdxwO4mWO9MG2UZuQ1V37DF4w0SqmCAf2Cr8gzh67
   SsMJy+OseLG6jEYBSxFW4KFSe+rFoqs/tEIfW2+ZjU5C3tYkpNzCf8v0f
   z+ociA75PAuIxhrMpSmhb69yszzCEtwUW1Q6sZso2YH1YU6WBFvIuYyEr
   P5+loShSutdWw5salMTdyp94VR64MR9Z4aF7tYILgmOiwkZUWpF+LVeOc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="19884600"
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="19884600"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 11:27:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="35094228"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 18 Feb 2024 11:27:32 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbmoz-0003GS-2g;
	Sun, 18 Feb 2024 19:27:29 +0000
Date: Mon, 19 Feb 2024 03:27:18 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 4a92857d6e8383eca6d661538bb25dc7004fd391
Message-ID: <202402190316.6DqaJl8g-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 4a92857d6e8383eca6d661538bb25dc7004fd391  gpio: constify opaque pointer "data" in gpio_device_find()

elapsed time: 1443m

configs tested: 178
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
arc                   randconfig-001-20240218   gcc  
arc                   randconfig-002-20240218   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          exynos_defconfig   clang
arm                      jornada720_defconfig   clang
arm                        mvebu_v7_defconfig   clang
arm                   randconfig-001-20240218   clang
arm                   randconfig-002-20240218   clang
arm                   randconfig-003-20240218   gcc  
arm                   randconfig-004-20240218   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240218   clang
arm64                 randconfig-002-20240218   clang
arm64                 randconfig-003-20240218   clang
arm64                 randconfig-004-20240218   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240218   gcc  
csky                  randconfig-002-20240218   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240218   clang
hexagon               randconfig-002-20240218   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240218   clang
i386         buildonly-randconfig-002-20240218   clang
i386         buildonly-randconfig-003-20240218   clang
i386         buildonly-randconfig-004-20240218   clang
i386         buildonly-randconfig-005-20240218   clang
i386         buildonly-randconfig-006-20240218   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240218   clang
i386                  randconfig-002-20240218   gcc  
i386                  randconfig-003-20240218   clang
i386                  randconfig-004-20240218   clang
i386                  randconfig-005-20240218   clang
i386                  randconfig-006-20240218   gcc  
i386                  randconfig-011-20240218   gcc  
i386                  randconfig-012-20240218   gcc  
i386                  randconfig-013-20240218   clang
i386                  randconfig-014-20240218   gcc  
i386                  randconfig-015-20240218   gcc  
i386                  randconfig-016-20240218   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240218   gcc  
loongarch             randconfig-002-20240218   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   gcc  
mips                           mtx1_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240218   gcc  
nios2                 randconfig-002-20240218   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240218   gcc  
parisc                randconfig-002-20240218   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      katmai_defconfig   clang
powerpc                      mgcoge_defconfig   clang
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20240218   gcc  
powerpc               randconfig-002-20240218   gcc  
powerpc               randconfig-003-20240218   clang
powerpc                     stx_gp3_defconfig   clang
powerpc64             randconfig-001-20240218   clang
powerpc64             randconfig-002-20240218   gcc  
powerpc64             randconfig-003-20240218   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240218   gcc  
riscv                 randconfig-002-20240218   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240218   gcc  
s390                  randconfig-002-20240218   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240218   gcc  
sh                    randconfig-002-20240218   gcc  
sh                           se7619_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240218   gcc  
sparc64               randconfig-002-20240218   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240218   gcc  
um                    randconfig-002-20240218   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240218   clang
x86_64       buildonly-randconfig-002-20240218   gcc  
x86_64       buildonly-randconfig-003-20240218   gcc  
x86_64       buildonly-randconfig-004-20240218   clang
x86_64       buildonly-randconfig-005-20240218   gcc  
x86_64       buildonly-randconfig-006-20240218   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240218   clang
x86_64                randconfig-002-20240218   clang
x86_64                randconfig-003-20240218   gcc  
x86_64                randconfig-004-20240218   gcc  
x86_64                randconfig-005-20240218   gcc  
x86_64                randconfig-006-20240218   clang
x86_64                randconfig-011-20240218   clang
x86_64                randconfig-012-20240218   gcc  
x86_64                randconfig-013-20240218   clang
x86_64                randconfig-014-20240218   clang
x86_64                randconfig-015-20240218   gcc  
x86_64                randconfig-016-20240218   clang
x86_64                randconfig-071-20240218   gcc  
x86_64                randconfig-072-20240218   clang
x86_64                randconfig-073-20240218   gcc  
x86_64                randconfig-074-20240218   gcc  
x86_64                randconfig-075-20240218   clang
x86_64                randconfig-076-20240218   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240218   gcc  
xtensa                randconfig-002-20240218   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

