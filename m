Return-Path: <linux-gpio+bounces-8833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C149577DF
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 00:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B985A1C20F33
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 22:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84BB205E20;
	Mon, 19 Aug 2024 22:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+SbNsDO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EE21DF695
	for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2024 22:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724107149; cv=none; b=KoCm72x9CQas+ORIiySwHn+z2olZf0jS4oKrA8/4AP3e9gKVtGBYM3Z/SlRxR8cxMmLM6dujCp3+n3m9T1uwAjolOMNr/Jt8cRScGe/26DSfdQ863KvvGeDEd9vgu2UaoXAK9U8QB6DCZzBvRJPDZnUDmm78vHX7TNg2s0C+vsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724107149; c=relaxed/simple;
	bh=1LM+EqjWo5P4Cc+2x2FfoNJ6z1+VfbbhbE0KQb3eVhI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ltoZg76APwaYtA6BgGBG12wbtDtabw+kaMp4NR9ONJEZo0MtgYptlzF76cLaiplk3cimPlsSINVUz0Wa0Dd2pnipKgLYUuGQeZoe3TReVbTEj5nQOVrkpDSsIovUDpeFM5Vov9kWcGAHfiG0HUxj7NDxEj4DgeJNYY4w1NNnXhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+SbNsDO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724107148; x=1755643148;
  h=date:from:to:cc:subject:message-id;
  bh=1LM+EqjWo5P4Cc+2x2FfoNJ6z1+VfbbhbE0KQb3eVhI=;
  b=Q+SbNsDOFnP5+7tmK6fCURLMWdHF4/+GY0B1dXNr5rR+MjkL0XbjSDga
   HD8KhfX+VUY5PBHeeu6Q6rwN/1kHJV+Kk36lo6GyD8oziTtJ5AkkWgZsy
   1oOS48hfwKo6CvRYUNqJCmXU2o1pT60Lfjm30aGnX4YSGpuoE5sEghefq
   F5nyFXnBetN2NBJcCuBskcvMhueT6l22ZcOOdVH+1yuI0WIVmEjNX1lkO
   ZucQleHDBc2yUF8cxupFdtfYNqIWbwcN3x/P1YAlR3BadrnGHr/znDoBw
   bUnukMzbPBk8QBd7xcofdX7fyYQyb4uQIQ4u1fKnxxpm4AfPVywo/zSeW
   A==;
X-CSE-ConnectionGUID: H/ZdjMxkTDO7iQCIoTI8lg==
X-CSE-MsgGUID: nb4agn8uQgGr+JVZNzdmQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33535410"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; 
   d="scan'208";a="33535410"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 15:39:07 -0700
X-CSE-ConnectionGUID: /9NDg4mFQemdhEq4K8Mklw==
X-CSE-MsgGUID: 9sZXGE17RgSNWsV0heoLWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; 
   d="scan'208";a="64701639"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Aug 2024 15:39:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgB1j-0009V8-1z;
	Mon, 19 Aug 2024 22:39:03 +0000
Date: Tue, 20 Aug 2024 06:38:11 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 88d8a3082a949f09809352c334caff80c3ad234f
Message-ID: <202408200609.OfRQR4ca-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 88d8a3082a949f09809352c334caff80c3ad234f  Merge tag 'ib-mfd-gpio-pwm-v6.12' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd into gpio/for-next

elapsed time: 809m

configs tested: 220
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              alldefconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsim_700_defconfig   gcc-13.2.0
arc                   randconfig-001-20240819   gcc-13.2.0
arc                   randconfig-002-20240819   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         assabet_defconfig   gcc-12.4.0
arm                                 defconfig   gcc-13.2.0
arm                      footbridge_defconfig   gcc-13.2.0
arm                          pxa3xx_defconfig   gcc-12.4.0
arm                            qcom_defconfig   gcc-12.4.0
arm                   randconfig-001-20240819   gcc-13.2.0
arm                   randconfig-002-20240819   gcc-13.2.0
arm                   randconfig-003-20240819   gcc-13.2.0
arm                   randconfig-004-20240819   gcc-13.2.0
arm                             rpc_defconfig   gcc-13.2.0
arm                         s3c6400_defconfig   gcc-12.4.0
arm                         s3c6400_defconfig   gcc-13.2.0
arm                        spear6xx_defconfig   gcc-12.4.0
arm                           u8500_defconfig   gcc-12.4.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240819   gcc-13.2.0
arm64                 randconfig-002-20240819   gcc-13.2.0
arm64                 randconfig-003-20240819   gcc-13.2.0
arm64                 randconfig-004-20240819   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240819   gcc-13.2.0
csky                  randconfig-002-20240819   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240819   clang-18
i386         buildonly-randconfig-001-20240820   clang-18
i386         buildonly-randconfig-002-20240819   clang-18
i386         buildonly-randconfig-002-20240820   clang-18
i386         buildonly-randconfig-003-20240819   clang-18
i386         buildonly-randconfig-003-20240820   clang-18
i386         buildonly-randconfig-004-20240819   clang-18
i386         buildonly-randconfig-004-20240820   clang-18
i386         buildonly-randconfig-005-20240819   clang-18
i386         buildonly-randconfig-005-20240820   clang-18
i386         buildonly-randconfig-006-20240819   clang-18
i386         buildonly-randconfig-006-20240820   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240819   clang-18
i386                  randconfig-001-20240820   clang-18
i386                  randconfig-002-20240819   clang-18
i386                  randconfig-002-20240820   clang-18
i386                  randconfig-003-20240819   clang-18
i386                  randconfig-003-20240820   clang-18
i386                  randconfig-004-20240819   clang-18
i386                  randconfig-004-20240820   clang-18
i386                  randconfig-005-20240819   clang-18
i386                  randconfig-005-20240820   clang-18
i386                  randconfig-006-20240819   clang-18
i386                  randconfig-006-20240820   clang-18
i386                  randconfig-011-20240819   clang-18
i386                  randconfig-011-20240820   clang-18
i386                  randconfig-012-20240819   clang-18
i386                  randconfig-012-20240820   clang-18
i386                  randconfig-013-20240819   clang-18
i386                  randconfig-013-20240820   clang-18
i386                  randconfig-014-20240819   clang-18
i386                  randconfig-014-20240820   clang-18
i386                  randconfig-015-20240819   clang-18
i386                  randconfig-015-20240820   clang-18
i386                  randconfig-016-20240819   clang-18
i386                  randconfig-016-20240820   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240819   gcc-13.2.0
loongarch             randconfig-002-20240819   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                            mac_defconfig   gcc-12.4.0
m68k                        stmark2_defconfig   gcc-12.4.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                           ip22_defconfig   gcc-13.2.0
mips                      malta_kvm_defconfig   gcc-13.2.0
mips                      maltaaprp_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240819   gcc-13.2.0
nios2                 randconfig-002-20240819   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240819   gcc-13.2.0
parisc                randconfig-002-20240819   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                     kmeter1_defconfig   gcc-12.4.0
powerpc                 mpc8315_rdb_defconfig   gcc-13.2.0
powerpc                 mpc836x_rdk_defconfig   gcc-12.4.0
powerpc                 mpc837x_rdb_defconfig   gcc-13.2.0
powerpc                  mpc885_ads_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240819   gcc-13.2.0
powerpc               randconfig-002-20240819   gcc-13.2.0
powerpc64             randconfig-001-20240819   gcc-13.2.0
powerpc64             randconfig-002-20240819   gcc-13.2.0
powerpc64             randconfig-003-20240819   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_virt_defconfig   gcc-12.4.0
riscv                 randconfig-001-20240819   gcc-13.2.0
riscv                 randconfig-002-20240819   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240819   gcc-13.2.0
s390                  randconfig-002-20240819   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                        apsh4ad0a_defconfig   gcc-12.4.0
sh                                  defconfig   gcc-14.1.0
sh                             espt_defconfig   gcc-13.2.0
sh                          lboxre2_defconfig   gcc-12.4.0
sh                          lboxre2_defconfig   gcc-13.2.0
sh                     magicpanelr2_defconfig   gcc-13.2.0
sh                          r7785rp_defconfig   gcc-12.4.0
sh                    randconfig-001-20240819   gcc-13.2.0
sh                    randconfig-002-20240819   gcc-13.2.0
sh                           se7206_defconfig   gcc-12.4.0
sh                           se7724_defconfig   gcc-13.2.0
sh                            titan_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240819   gcc-13.2.0
sparc64               randconfig-002-20240819   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240819   gcc-13.2.0
um                    randconfig-002-20240819   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                           alldefconfig   gcc-12.4.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240819   gcc-12
x86_64       buildonly-randconfig-002-20240819   gcc-12
x86_64       buildonly-randconfig-003-20240819   gcc-12
x86_64       buildonly-randconfig-004-20240819   gcc-12
x86_64       buildonly-randconfig-005-20240819   gcc-12
x86_64       buildonly-randconfig-006-20240819   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240819   gcc-12
x86_64                randconfig-002-20240819   gcc-12
x86_64                randconfig-003-20240819   gcc-12
x86_64                randconfig-004-20240819   gcc-12
x86_64                randconfig-005-20240819   gcc-12
x86_64                randconfig-006-20240819   gcc-12
x86_64                randconfig-011-20240819   gcc-12
x86_64                randconfig-012-20240819   gcc-12
x86_64                randconfig-013-20240819   gcc-12
x86_64                randconfig-014-20240819   gcc-12
x86_64                randconfig-015-20240819   gcc-12
x86_64                randconfig-016-20240819   gcc-12
x86_64                randconfig-071-20240819   gcc-12
x86_64                randconfig-072-20240819   gcc-12
x86_64                randconfig-073-20240819   gcc-12
x86_64                randconfig-074-20240819   gcc-12
x86_64                randconfig-075-20240819   gcc-12
x86_64                randconfig-076-20240819   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240819   gcc-13.2.0
xtensa                randconfig-002-20240819   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

