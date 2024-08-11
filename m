Return-Path: <linux-gpio+bounces-8705-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E82C494E281
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2024 20:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97C5E28156C
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2024 18:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7D414B96A;
	Sun, 11 Aug 2024 18:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEvrS0MZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223D0BE71
	for <linux-gpio@vger.kernel.org>; Sun, 11 Aug 2024 18:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723400177; cv=none; b=YYPk650O4zei7FgSx9KV5uXPtedim9d0MzE3luOE8hgliHU+oxhehv6cNjOvrxgyBv/KSfs4LM0v9aXUsIb26Yze4yCiv0Agkv17RoevGWCtdq5WSOAuRyFDIUn6Nj+K5IGf+kf0GrvezisBT65bOso+eDoZ1NIISBNeIVLyFhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723400177; c=relaxed/simple;
	bh=i14HXv9b3PrQJIkMzLMTVH4iIs4BYbudrW1T3e/Lt84=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uy7VTQLwv7YmzJPQo/q8guCxDckzMW0o6OZKU3Zg89U/vkPELZLrXUpLEdKWMsj2GEj6FBvHcoMeuY8TQJBBtQi6bFPiAIi845xdEAl1mZFb1noOugRCrqWan4+L+2bSv8nMFdoXksNrNwcnJvEKYATIsynDXr9PQ74TNoL5h7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEvrS0MZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723400175; x=1754936175;
  h=date:from:to:cc:subject:message-id;
  bh=i14HXv9b3PrQJIkMzLMTVH4iIs4BYbudrW1T3e/Lt84=;
  b=UEvrS0MZlIXrsaT2A0jtJi8w/KdjCMbc2BundZPjk2xfpx6F7tqEKjhm
   wL4y8KVNUDGUpmyxQOsEhGHAFtMVP61fTuPloNEEnHpLjyylrCNGmq6X/
   FSevRTaUcVN/7ik0YY9wbXU0sg0585XI+f0Yd7fARnPhHck2tnpKhztnV
   EX3axFJtjfLiWW5TzHfrcXL4IdHnRdV/6YLX0X+Uj8KnOveRkf+P4EJax
   2Fz6s2EW4+j/GfEcYZT9+G46vqKSxi2hzhx3FHBrTR0K6PyBi2bpOZa3u
   agJBeVSdvIWMiym5nAts4KbH1HMIAiiY3u+Nur5vlthsg8ksOsWZxaXR/
   A==;
X-CSE-ConnectionGUID: geKOFnmgTGSmHp489pAy9w==
X-CSE-MsgGUID: eIlIdwu4TzOfhDOfQnQugw==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21676262"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="21676262"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 11:16:14 -0700
X-CSE-ConnectionGUID: N4xXnmM1Q0icvcFXTARs6Q==
X-CSE-MsgGUID: YwEFxzZBSrSGbFlloPnulw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="95563489"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 11 Aug 2024 11:16:13 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdD6w-000B2d-2c;
	Sun, 11 Aug 2024 18:16:10 +0000
Date: Mon, 12 Aug 2024 02:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 789ce0f6028f9e68fc27f6748acefbd2e23f4716
Message-ID: <202408120218.OUT7qLUI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 789ce0f6028f9e68fc27f6748acefbd2e23f4716  dt-bindings: gpio: gpio-davinci: Add the gpio-reserved-ranges property

elapsed time: 1352m

configs tested: 295
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                         haps_hs_defconfig   gcc-13.2.0
arc                     nsimosci_hs_defconfig   gcc-13.2.0
arc                   randconfig-001-20240811   gcc-13.2.0
arc                   randconfig-002-20240811   gcc-13.2.0
arc                           tb10x_defconfig   gcc-13.2.0
arc                    vdk_hs38_smp_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                         at91_dt_defconfig   gcc-13.2.0
arm                         axm55xx_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                            hisi_defconfig   gcc-13.2.0
arm                       imx_v4_v5_defconfig   gcc-13.2.0
arm                      integrator_defconfig   gcc-13.2.0
arm                        mvebu_v7_defconfig   gcc-13.2.0
arm                             mxs_defconfig   gcc-13.2.0
arm                       omap2plus_defconfig   gcc-13.2.0
arm                   randconfig-001-20240811   clang-14
arm                   randconfig-001-20240811   gcc-13.2.0
arm                   randconfig-002-20240811   clang-20
arm                   randconfig-002-20240811   gcc-13.2.0
arm                   randconfig-003-20240811   gcc-13.2.0
arm                   randconfig-003-20240811   gcc-14.1.0
arm                   randconfig-004-20240811   gcc-13.2.0
arm                   randconfig-004-20240811   gcc-14.1.0
arm                             rpc_defconfig   gcc-13.2.0
arm                        shmobile_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240811   clang-20
arm64                 randconfig-001-20240811   gcc-13.2.0
arm64                 randconfig-002-20240811   gcc-13.2.0
arm64                 randconfig-002-20240811   gcc-14.1.0
arm64                 randconfig-003-20240811   gcc-13.2.0
arm64                 randconfig-003-20240811   gcc-14.1.0
arm64                 randconfig-004-20240811   gcc-13.2.0
arm64                 randconfig-004-20240811   gcc-14.1.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240811   gcc-13.2.0
csky                  randconfig-001-20240811   gcc-14.1.0
csky                  randconfig-002-20240811   gcc-13.2.0
csky                  randconfig-002-20240811   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240811   clang-20
hexagon               randconfig-002-20240811   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240811   gcc-12
i386         buildonly-randconfig-002-20240811   gcc-12
i386         buildonly-randconfig-003-20240811   gcc-12
i386         buildonly-randconfig-004-20240811   clang-18
i386         buildonly-randconfig-004-20240811   gcc-12
i386         buildonly-randconfig-005-20240811   gcc-12
i386         buildonly-randconfig-006-20240811   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240811   clang-18
i386                  randconfig-001-20240811   gcc-12
i386                  randconfig-002-20240811   clang-18
i386                  randconfig-002-20240811   gcc-12
i386                  randconfig-003-20240811   clang-18
i386                  randconfig-003-20240811   gcc-12
i386                  randconfig-004-20240811   clang-18
i386                  randconfig-004-20240811   gcc-12
i386                  randconfig-005-20240811   gcc-12
i386                  randconfig-006-20240811   gcc-12
i386                  randconfig-011-20240811   gcc-11
i386                  randconfig-011-20240811   gcc-12
i386                  randconfig-012-20240811   gcc-12
i386                  randconfig-013-20240811   clang-18
i386                  randconfig-013-20240811   gcc-12
i386                  randconfig-014-20240811   gcc-12
i386                  randconfig-015-20240811   clang-18
i386                  randconfig-015-20240811   gcc-12
i386                  randconfig-016-20240811   clang-18
i386                  randconfig-016-20240811   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240811   gcc-13.2.0
loongarch             randconfig-001-20240811   gcc-14.1.0
loongarch             randconfig-002-20240811   gcc-13.2.0
loongarch             randconfig-002-20240811   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         apollo_defconfig   gcc-13.2.0
m68k                          atari_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5407c3_defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.2.0
m68k                           sun3_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                          ath79_defconfig   gcc-13.2.0
mips                         bigsur_defconfig   gcc-13.2.0
mips                      bmips_stb_defconfig   gcc-13.2.0
mips                         db1xxx_defconfig   gcc-13.2.0
mips                 decstation_r4k_defconfig   gcc-13.2.0
mips                          eyeq6_defconfig   gcc-13.2.0
mips                           ip28_defconfig   gcc-13.2.0
mips                      malta_kvm_defconfig   gcc-13.2.0
mips                        maltaup_defconfig   gcc-13.2.0
mips                      pic32mzda_defconfig   gcc-13.2.0
mips                        vocore2_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240811   gcc-13.2.0
nios2                 randconfig-001-20240811   gcc-14.1.0
nios2                 randconfig-002-20240811   gcc-13.2.0
nios2                 randconfig-002-20240811   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240811   gcc-13.2.0
parisc                randconfig-001-20240811   gcc-14.1.0
parisc                randconfig-002-20240811   gcc-13.2.0
parisc                randconfig-002-20240811   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                     akebono_defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                    amigaone_defconfig   gcc-13.2.0
powerpc                   bluestone_defconfig   gcc-13.2.0
powerpc                       eiger_defconfig   gcc-13.2.0
powerpc                     ep8248e_defconfig   gcc-13.2.0
powerpc                      ep88xc_defconfig   gcc-13.2.0
powerpc                 linkstation_defconfig   gcc-13.2.0
powerpc                       maple_defconfig   gcc-13.2.0
powerpc                     mpc5200_defconfig   gcc-13.2.0
powerpc                 mpc834x_itx_defconfig   gcc-13.2.0
powerpc                      pmac32_defconfig   gcc-13.2.0
powerpc                     powernv_defconfig   gcc-13.2.0
powerpc                     rainier_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240811   clang-20
powerpc               randconfig-001-20240811   gcc-13.2.0
powerpc               randconfig-003-20240811   clang-20
powerpc               randconfig-003-20240811   gcc-13.2.0
powerpc                     redwood_defconfig   gcc-13.2.0
powerpc                  storcenter_defconfig   gcc-13.2.0
powerpc                     tqm8541_defconfig   gcc-13.2.0
powerpc64                        alldefconfig   gcc-13.2.0
powerpc64             randconfig-001-20240811   clang-14
powerpc64             randconfig-001-20240811   gcc-13.2.0
powerpc64             randconfig-002-20240811   gcc-13.2.0
powerpc64             randconfig-002-20240811   gcc-14.1.0
powerpc64             randconfig-003-20240811   clang-20
powerpc64             randconfig-003-20240811   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240811   gcc-13.2.0
riscv                 randconfig-001-20240811   gcc-14.1.0
riscv                 randconfig-002-20240811   clang-20
riscv                 randconfig-002-20240811   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240811   clang-20
s390                  randconfig-001-20240811   gcc-13.2.0
s390                  randconfig-002-20240811   clang-20
s390                  randconfig-002-20240811   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                          kfr2r09_defconfig   gcc-13.2.0
sh                          landisk_defconfig   gcc-13.2.0
sh                          polaris_defconfig   gcc-13.2.0
sh                    randconfig-001-20240811   gcc-13.2.0
sh                    randconfig-001-20240811   gcc-14.1.0
sh                    randconfig-002-20240811   gcc-13.2.0
sh                    randconfig-002-20240811   gcc-14.1.0
sh                          rsk7269_defconfig   gcc-13.2.0
sh                           se7206_defconfig   gcc-13.2.0
sh                           se7705_defconfig   gcc-13.2.0
sh                  sh7785lcr_32bit_defconfig   gcc-13.2.0
sh                             shx3_defconfig   gcc-13.2.0
sh                            titan_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc32_defconfig   gcc-13.2.0
sparc64                          alldefconfig   gcc-13.2.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240811   gcc-13.2.0
sparc64               randconfig-001-20240811   gcc-14.1.0
sparc64               randconfig-002-20240811   gcc-13.2.0
sparc64               randconfig-002-20240811   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   clang-20
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-12
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240811   gcc-12
um                    randconfig-001-20240811   gcc-13.2.0
um                    randconfig-002-20240811   clang-20
um                    randconfig-002-20240811   gcc-13.2.0
um                           x86_64_defconfig   clang-15
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240811   gcc-12
x86_64       buildonly-randconfig-002-20240811   clang-18
x86_64       buildonly-randconfig-002-20240811   gcc-12
x86_64       buildonly-randconfig-003-20240811   gcc-12
x86_64       buildonly-randconfig-004-20240811   gcc-12
x86_64       buildonly-randconfig-005-20240811   gcc-12
x86_64       buildonly-randconfig-006-20240811   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                                  kexec   clang-18
x86_64                randconfig-001-20240811   clang-18
x86_64                randconfig-001-20240811   gcc-12
x86_64                randconfig-002-20240811   clang-18
x86_64                randconfig-002-20240811   gcc-12
x86_64                randconfig-003-20240811   clang-18
x86_64                randconfig-003-20240811   gcc-12
x86_64                randconfig-004-20240811   clang-18
x86_64                randconfig-004-20240811   gcc-12
x86_64                randconfig-005-20240811   gcc-12
x86_64                randconfig-006-20240811   clang-18
x86_64                randconfig-006-20240811   gcc-12
x86_64                randconfig-011-20240811   gcc-12
x86_64                randconfig-012-20240811   clang-18
x86_64                randconfig-012-20240811   gcc-12
x86_64                randconfig-013-20240811   gcc-12
x86_64                randconfig-014-20240811   gcc-12
x86_64                randconfig-015-20240811   clang-18
x86_64                randconfig-015-20240811   gcc-12
x86_64                randconfig-016-20240811   clang-18
x86_64                randconfig-016-20240811   gcc-12
x86_64                randconfig-071-20240811   clang-18
x86_64                randconfig-071-20240811   gcc-12
x86_64                randconfig-072-20240811   clang-18
x86_64                randconfig-072-20240811   gcc-12
x86_64                randconfig-073-20240811   clang-18
x86_64                randconfig-073-20240811   gcc-12
x86_64                randconfig-074-20240811   gcc-12
x86_64                randconfig-075-20240811   clang-18
x86_64                randconfig-075-20240811   gcc-12
x86_64                randconfig-076-20240811   gcc-12
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                          iss_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240811   gcc-13.2.0
xtensa                randconfig-001-20240811   gcc-14.1.0
xtensa                randconfig-002-20240811   gcc-13.2.0
xtensa                randconfig-002-20240811   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

