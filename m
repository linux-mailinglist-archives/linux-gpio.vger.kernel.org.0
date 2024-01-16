Return-Path: <linux-gpio+bounces-2290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6342A82FD9F
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jan 2024 00:01:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEB701F27F89
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jan 2024 23:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEEB767C54;
	Tue, 16 Jan 2024 23:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIAJR0Ax"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950E367C52
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jan 2024 23:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705446097; cv=none; b=JJ8+eB8WOKUqnjxq03WKiyn6Hvuo0pq9hJpeefXFbWhJnG39xLxwERGNO/PzpXOqKuUmqT/0tllAvKymi17a5bgRhyekO9Z4AXb1dWVmR24shcC3J12Kkh7X70ujRVt0fnzWPj2ruCoE6OBBrHFuW+1FOl1NV52qxvjg+DNx8h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705446097; c=relaxed/simple;
	bh=lPC2ywcopMDXynxhXlxvXhnyQcVRaTxR4cLgpLX7R/Y=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:User-Agent; b=jGPF5WidC8kGLIJLA5ewbcAGIAoMjKCitx9zaYML0PRsjJ8UFHjFkGU5fnd1i5S3Vv16htx79xqLwMtKqcSZ/+E7XpYJfoXdmdWesh0Or/H+BsuQ5vEIMKkvGiHGfvoqfAvwIzlq9PBIkzHxthbHIXVLyDmxzBaQinfxD8hyS2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gIAJR0Ax; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705446095; x=1736982095;
  h=date:from:to:cc:subject:message-id;
  bh=lPC2ywcopMDXynxhXlxvXhnyQcVRaTxR4cLgpLX7R/Y=;
  b=gIAJR0AxL+ionM+PAyuabb289AXZzCL8aD7/2q0JR7d+7pKOaWFXTd4n
   PU9X9URwKigYq5UTzHVp3aMEUsU8dx2vDjZeeLjq0kMq/8oXw+Vz2s5Lx
   I+w91FANqXzKNiDhUpS1wIdGZijpdP+/7pO418HyIJt1NpCPsB+dvbdoS
   LVPRJ+dPwemyEJje5cY7+JCFLRAPFfcBG7UG3NJmLUHmBWyhYkIL+Lwl9
   VeWkd0S+TbxK44b+3hyKLo+XWosk+UrXWflA2BTKqLCFW3/SOtzKbOQv8
   crOtAx1qnB9des+TBGEANMCUuPuVP627X5shjXtGQOM95Cc9D6z8UWZVD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="21491885"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="21491885"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 15:01:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="1115486908"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="1115486908"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 16 Jan 2024 15:01:33 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPsR1-0001Kq-1m;
	Tue, 16 Jan 2024 23:01:31 +0000
Date: Wed, 17 Jan 2024 07:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 62b38f30a00ff47142e58d0a6d60dd296e0e8108
Message-ID: <202401170711.wn3DJUFH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 62b38f30a00ff47142e58d0a6d60dd296e0e8108  gpio: EN7523: fix kernel-doc warnings

elapsed time: 1452m

configs tested: 240
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240116   gcc  
arc                   randconfig-001-20240117   gcc  
arc                   randconfig-002-20240116   gcc  
arc                   randconfig-002-20240117   gcc  
arc                           tb10x_defconfig   gcc  
arm                               allnoconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                   randconfig-001-20240116   clang
arm                   randconfig-001-20240117   gcc  
arm                   randconfig-002-20240116   clang
arm                   randconfig-002-20240117   gcc  
arm                   randconfig-003-20240116   clang
arm                   randconfig-003-20240117   gcc  
arm                   randconfig-004-20240116   clang
arm                   randconfig-004-20240117   gcc  
arm                             rpc_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240116   clang
arm64                 randconfig-001-20240117   gcc  
arm64                 randconfig-002-20240116   clang
arm64                 randconfig-002-20240117   gcc  
arm64                 randconfig-003-20240116   clang
arm64                 randconfig-003-20240117   gcc  
arm64                 randconfig-004-20240116   clang
arm64                 randconfig-004-20240117   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240116   gcc  
csky                  randconfig-001-20240117   gcc  
csky                  randconfig-002-20240116   gcc  
csky                  randconfig-002-20240117   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
hexagon               randconfig-001-20240116   clang
hexagon               randconfig-002-20240116   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240116   clang
i386         buildonly-randconfig-002-20240116   clang
i386         buildonly-randconfig-003-20240116   clang
i386         buildonly-randconfig-004-20240116   clang
i386         buildonly-randconfig-005-20240116   clang
i386         buildonly-randconfig-006-20240116   clang
i386                  randconfig-001-20240116   clang
i386                  randconfig-002-20240116   clang
i386                  randconfig-003-20240116   clang
i386                  randconfig-004-20240116   clang
i386                  randconfig-005-20240116   clang
i386                  randconfig-006-20240116   clang
i386                  randconfig-011-20240116   gcc  
i386                  randconfig-011-20240117   clang
i386                  randconfig-012-20240116   gcc  
i386                  randconfig-012-20240117   clang
i386                  randconfig-013-20240116   gcc  
i386                  randconfig-013-20240117   clang
i386                  randconfig-014-20240116   gcc  
i386                  randconfig-014-20240117   clang
i386                  randconfig-015-20240116   gcc  
i386                  randconfig-015-20240117   clang
i386                  randconfig-016-20240116   gcc  
i386                  randconfig-016-20240117   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240116   gcc  
loongarch             randconfig-001-20240117   gcc  
loongarch             randconfig-002-20240116   gcc  
loongarch             randconfig-002-20240117   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                         rt305x_defconfig   gcc  
mips                   sb1250_swarm_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240116   gcc  
nios2                 randconfig-001-20240117   gcc  
nios2                 randconfig-002-20240116   gcc  
nios2                 randconfig-002-20240117   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
parisc                           alldefconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240116   gcc  
parisc                randconfig-001-20240117   gcc  
parisc                randconfig-002-20240116   gcc  
parisc                randconfig-002-20240117   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                    amigaone_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                 linkstation_defconfig   gcc  
powerpc                       maple_defconfig   gcc  
powerpc               randconfig-001-20240116   clang
powerpc               randconfig-001-20240117   gcc  
powerpc               randconfig-002-20240116   clang
powerpc               randconfig-002-20240117   gcc  
powerpc               randconfig-003-20240116   clang
powerpc               randconfig-003-20240117   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc64             randconfig-001-20240116   clang
powerpc64             randconfig-001-20240117   gcc  
powerpc64             randconfig-002-20240116   clang
powerpc64             randconfig-002-20240117   gcc  
powerpc64             randconfig-003-20240116   clang
powerpc64             randconfig-003-20240117   gcc  
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240116   clang
riscv                 randconfig-001-20240117   gcc  
riscv                 randconfig-002-20240116   clang
riscv                 randconfig-002-20240117   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240116   gcc  
s390                  randconfig-002-20240116   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                    randconfig-001-20240116   gcc  
sh                    randconfig-001-20240117   gcc  
sh                    randconfig-002-20240116   gcc  
sh                    randconfig-002-20240117   gcc  
sh                          rsk7264_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          alldefconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240116   gcc  
sparc64               randconfig-001-20240117   gcc  
sparc64               randconfig-002-20240116   gcc  
sparc64               randconfig-002-20240117   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240116   clang
um                    randconfig-001-20240117   gcc  
um                    randconfig-002-20240116   clang
um                    randconfig-002-20240117   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240116   clang
x86_64       buildonly-randconfig-001-20240117   gcc  
x86_64       buildonly-randconfig-002-20240116   clang
x86_64       buildonly-randconfig-002-20240117   gcc  
x86_64       buildonly-randconfig-003-20240116   clang
x86_64       buildonly-randconfig-003-20240117   gcc  
x86_64       buildonly-randconfig-004-20240116   clang
x86_64       buildonly-randconfig-004-20240117   gcc  
x86_64       buildonly-randconfig-005-20240116   clang
x86_64       buildonly-randconfig-005-20240117   gcc  
x86_64       buildonly-randconfig-006-20240116   clang
x86_64       buildonly-randconfig-006-20240117   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20240116   clang
x86_64                randconfig-011-20240117   gcc  
x86_64                randconfig-012-20240116   clang
x86_64                randconfig-012-20240117   gcc  
x86_64                randconfig-013-20240116   clang
x86_64                randconfig-013-20240117   gcc  
x86_64                randconfig-014-20240116   clang
x86_64                randconfig-014-20240117   gcc  
x86_64                randconfig-015-20240116   clang
x86_64                randconfig-015-20240117   gcc  
x86_64                randconfig-016-20240116   clang
x86_64                randconfig-016-20240117   gcc  
x86_64                randconfig-071-20240116   clang
x86_64                randconfig-071-20240117   gcc  
x86_64                randconfig-072-20240116   clang
x86_64                randconfig-072-20240117   gcc  
x86_64                randconfig-073-20240116   clang
x86_64                randconfig-073-20240117   gcc  
x86_64                randconfig-074-20240116   clang
x86_64                randconfig-074-20240117   gcc  
x86_64                randconfig-075-20240116   clang
x86_64                randconfig-075-20240117   gcc  
x86_64                randconfig-076-20240116   clang
x86_64                randconfig-076-20240117   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240116   gcc  
xtensa                randconfig-001-20240117   gcc  
xtensa                randconfig-002-20240116   gcc  
xtensa                randconfig-002-20240117   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

