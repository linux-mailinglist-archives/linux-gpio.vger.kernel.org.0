Return-Path: <linux-gpio+bounces-3235-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A67852E99
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 12:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 089C1B26726
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 10:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208552C870;
	Tue, 13 Feb 2024 10:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjpUVxyU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D1F2BB16
	for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 10:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707821990; cv=none; b=FIKOyubncW5kkvoS5DoLMrwLQX3C1yo86TtkPiSkxpJdfz45yrlME/E/hfZide3Xh36xqkgBMYGl1x+uqGuE+McVbjuGCMuAe7sC9eSlTBRFH+1DooGSuGGl4L8jD1u6agHdlXUsBCqWvc3iedsYDh2C2FN2PDkvkNh37LjDO0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707821990; c=relaxed/simple;
	bh=a1KkG3Isll81PTdEGgeeH/m4y0kemsv60S82a51DISo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nhX63RCcx4E6tjE7nM4N3LdJ8f9oVOVO7uYZryk0aY+JzPePpDtPvcJcivVDMlCgoPQG0NcEe5+blke8pWLeKfmObH+kDxl0OqMru1TGXE6kUMAftOd+vB0UMm+ZAhj6zRgEGwxvFbTcAjn5clJwLOOT+HOQN+ccXWVGE0HFbtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjpUVxyU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707821989; x=1739357989;
  h=date:from:to:cc:subject:message-id;
  bh=a1KkG3Isll81PTdEGgeeH/m4y0kemsv60S82a51DISo=;
  b=jjpUVxyU2AlZaIBoi9qwey8XLHLBH2V1mf4Cr2a5jRYPYxzYJDxE170O
   23Kz98Iaw5p+Ca33Gz6A7gYYTuLks742ecHv8kVDUFI92U9T29SEwW+G8
   5nufr34dWr044Ik72a3RVFCCrzvWH86ffWD8rE9V86HwtCi24C/4aL9dF
   929A/DUtAxekiwGSRs0Q0TkSyUMiclP5BTwXVigiY/mjexAcd5NHdO+GQ
   +vat2pJG7NquSMqkphHfA3KNisMUOVQ0HaDoPx+fcP8OpJtYWxLFh8wPa
   z9I5oCi/FiBLj4Cl7WcBf3QV7scd1s5ZZHdxDU+uv+8m+vBCthqV6leRh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12546936"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="12546936"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:59:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="3167881"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Feb 2024 02:59:47 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZqVs-0007gG-01;
	Tue, 13 Feb 2024 10:59:44 +0000
Date: Tue, 13 Feb 2024 18:59:02 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 5e6284444024cf7e7d0ae538df8037a3a5efbec8
Message-ID: <202402131800.kQp1KYPf-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 5e6284444024cf7e7d0ae538df8037a3a5efbec8  gpio: mark unsafe gpio_chip manipulators as deprecated

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
arc                   randconfig-001-20240213   gcc  
arc                   randconfig-002-20240213   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                       netwinder_defconfig   gcc  
arm                            qcom_defconfig   clang
arm                   randconfig-001-20240213   gcc  
arm                   randconfig-002-20240213   gcc  
arm                   randconfig-003-20240213   gcc  
arm                   randconfig-004-20240213   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240213   gcc  
arm64                 randconfig-002-20240213   gcc  
arm64                 randconfig-003-20240213   gcc  
arm64                 randconfig-004-20240213   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240213   gcc  
csky                  randconfig-002-20240213   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240213   clang
hexagon               randconfig-002-20240213   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240212   clang
i386         buildonly-randconfig-002-20240212   gcc  
i386         buildonly-randconfig-003-20240212   gcc  
i386         buildonly-randconfig-004-20240212   clang
i386         buildonly-randconfig-005-20240212   gcc  
i386         buildonly-randconfig-006-20240212   clang
i386                                defconfig   clang
i386                  randconfig-001-20240212   gcc  
i386                  randconfig-002-20240212   clang
i386                  randconfig-003-20240212   clang
i386                  randconfig-004-20240212   gcc  
i386                  randconfig-005-20240212   clang
i386                  randconfig-006-20240212   gcc  
i386                  randconfig-011-20240212   gcc  
i386                  randconfig-012-20240212   gcc  
i386                  randconfig-013-20240212   gcc  
i386                  randconfig-014-20240212   gcc  
i386                  randconfig-015-20240212   gcc  
i386                  randconfig-016-20240212   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240213   gcc  
loongarch             randconfig-002-20240213   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          multi_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                           gcw0_defconfig   clang
mips                     loongson1b_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240213   gcc  
nios2                 randconfig-002-20240213   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240213   gcc  
parisc                randconfig-002-20240213   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    gamecube_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc               randconfig-001-20240213   clang
powerpc               randconfig-002-20240213   gcc  
powerpc               randconfig-003-20240213   gcc  
powerpc64             randconfig-001-20240213   gcc  
powerpc64             randconfig-002-20240213   gcc  
powerpc64             randconfig-003-20240213   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20240213   gcc  
riscv                 randconfig-002-20240213   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240213   gcc  
s390                  randconfig-002-20240213   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                    randconfig-001-20240213   gcc  
sh                    randconfig-002-20240213   gcc  
sh                           se7724_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240213   gcc  
sparc64               randconfig-002-20240213   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240213   clang
um                    randconfig-002-20240213   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240212   clang
x86_64       buildonly-randconfig-002-20240212   clang
x86_64       buildonly-randconfig-003-20240212   clang
x86_64       buildonly-randconfig-004-20240212   clang
x86_64       buildonly-randconfig-005-20240212   clang
x86_64       buildonly-randconfig-006-20240212   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240212   gcc  
x86_64                randconfig-002-20240212   gcc  
x86_64                randconfig-003-20240212   gcc  
x86_64                randconfig-004-20240212   gcc  
x86_64                randconfig-005-20240212   gcc  
x86_64                randconfig-006-20240212   gcc  
x86_64                randconfig-011-20240212   gcc  
x86_64                randconfig-012-20240212   gcc  
x86_64                randconfig-013-20240212   clang
x86_64                randconfig-014-20240212   gcc  
x86_64                randconfig-015-20240212   gcc  
x86_64                randconfig-016-20240212   clang
x86_64                randconfig-071-20240212   gcc  
x86_64                randconfig-072-20240212   gcc  
x86_64                randconfig-073-20240212   clang
x86_64                randconfig-074-20240212   gcc  
x86_64                randconfig-075-20240212   gcc  
x86_64                randconfig-076-20240212   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20240213   gcc  
xtensa                randconfig-002-20240213   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

