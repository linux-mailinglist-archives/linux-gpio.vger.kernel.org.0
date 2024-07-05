Return-Path: <linux-gpio+bounces-8062-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 780489283A6
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 10:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D04728257B
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 08:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DFD145A12;
	Fri,  5 Jul 2024 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJaIM0Yf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B0613D276
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jul 2024 08:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720167999; cv=none; b=JIhtC4F7wMBCDB3fEz0o6E//Wmmsu89oFSo046Pv25HUY6vhorpEQTFOVUxio+xaj7ILQPKKZvg1RBriS5/3uhqzrNaxZsZNO/JpcyZdCGVxqSlq6yENPZfrTJwNkgCOkwkl/4luTS01XbGW3u5gB4Updsc3DQI4cmkLwaonAFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720167999; c=relaxed/simple;
	bh=K3p+0mYpFfU5aZr5DmgZpirzCfhiE4HMm2eaafri32g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rF/feY1CyXCvThSQywWvsG9jKcDq49NkZzAWGSc+3oekfkiz87ejtG8oHwZBLMQ4je+8ckEsKuUcaBj2YOTO1MZym8ENXZFZS3YJKDCp5+GvuowjmoWEJq3pSjjW9opS3zKyIB109Mipu8RwkzaPPlHxHbqLXURljscoCSeRYnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJaIM0Yf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720167997; x=1751703997;
  h=date:from:to:cc:subject:message-id;
  bh=K3p+0mYpFfU5aZr5DmgZpirzCfhiE4HMm2eaafri32g=;
  b=cJaIM0YfWXw9QQayywsPKrlty/5DeLtLNm62fsh51tI0INiMm0xFmlYK
   gOe0cu2Fyxwwz5LmXuM08YurVZCjXSJ/VKz7rXD5TZw2JrIUodfuoeMv7
   0PbfuTgke/RlFpKrUA7KpIdaVm7DGESNlZoqNPIgjRq9Dt6RpCd5mfnAe
   de8HdqgvbI09xhm73vfcyBU7Ga/Pgmn+mIdCmpUrFsw8inJbhTGB5nZAK
   QumvzVE5dqH827OX1OD0jZvOghemCFEGjqxkztXWDaJntLHHABhBHbXVN
   1tQT3Luou/jeqi5Xn34Is00nDxokqx3XJKpCWbKKvKs3SBEwTfduixU2M
   w==;
X-CSE-ConnectionGUID: Gd4NCY/GS4yDH40BpU61Ig==
X-CSE-MsgGUID: YRHZ9Hn1RoKcs4NuyGvyTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17287283"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="17287283"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 01:26:37 -0700
X-CSE-ConnectionGUID: qwqCEW2nSpm39UmRL1jIIw==
X-CSE-MsgGUID: u8fzzv/sTYiXXNWiiGZZ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="51144904"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Jul 2024 01:26:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPeH3-000S8x-2a;
	Fri, 05 Jul 2024 08:26:33 +0000
Date: Fri, 05 Jul 2024 16:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 9d9c1796a6ae70290c2e013fe4d79e99039a1015
Message-ID: <202407051620.xXwHNLNw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 9d9c1796a6ae70290c2e013fe4d79e99039a1015  gpio: sim: lock GPIOs as interrupts when they are requested

elapsed time: 1459m

configs tested: 162
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240705   gcc-13.2.0
arc                   randconfig-002-20240705   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-13.2.0
arm                   randconfig-001-20240705   gcc-13.2.0
arm                   randconfig-002-20240705   gcc-13.2.0
arm                   randconfig-003-20240705   gcc-13.2.0
arm                   randconfig-004-20240705   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240705   clang-19
arm64                 randconfig-002-20240705   clang-19
arm64                 randconfig-003-20240705   clang-19
arm64                 randconfig-004-20240705   clang-19
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240705   gcc-13.2.0
csky                  randconfig-002-20240705   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240705   clang-19
hexagon               randconfig-002-20240705   clang-17
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240704   clang-18
i386         buildonly-randconfig-002-20240704   gcc-13
i386         buildonly-randconfig-003-20240704   gcc-13
i386         buildonly-randconfig-004-20240704   gcc-12
i386         buildonly-randconfig-005-20240704   gcc-12
i386         buildonly-randconfig-006-20240704   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240704   clang-18
i386                  randconfig-002-20240704   gcc-13
i386                  randconfig-003-20240704   clang-18
i386                  randconfig-004-20240704   gcc-13
i386                  randconfig-005-20240704   clang-18
i386                  randconfig-006-20240704   gcc-12
i386                  randconfig-011-20240704   gcc-13
i386                  randconfig-012-20240704   clang-18
i386                  randconfig-013-20240704   clang-18
i386                  randconfig-014-20240704   clang-18
i386                  randconfig-015-20240704   clang-18
i386                  randconfig-016-20240704   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240705   gcc-13.2.0
loongarch             randconfig-002-20240705   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                          hp300_defconfig   gcc-13.2.0
m68k                          sun3x_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                     decstation_defconfig   gcc-13.2.0
mips                          rb532_defconfig   clang-19
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240705   gcc-13.2.0
nios2                 randconfig-002-20240705   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                generic-64bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240705   gcc-13.2.0
parisc                randconfig-002-20240705   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
powerpc                    amigaone_defconfig   gcc-13.2.0
powerpc                   bluestone_defconfig   clang-19
powerpc                      cm5200_defconfig   clang-19
powerpc                      pcm030_defconfig   clang-19
powerpc                      pmac32_defconfig   clang-19
powerpc                      ppc64e_defconfig   gcc-13.2.0
powerpc                     rainier_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240705   gcc-13.2.0
powerpc               randconfig-002-20240705   clang-19
powerpc               randconfig-003-20240705   clang-19
powerpc                     tqm8548_defconfig   clang-19
powerpc64             randconfig-001-20240705   gcc-13.2.0
powerpc64             randconfig-002-20240705   clang-19
powerpc64             randconfig-003-20240705   clang-19
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240705   gcc-13.2.0
riscv                 randconfig-002-20240705   clang-19
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   clang-19
s390                  randconfig-001-20240705   gcc-13.2.0
s390                  randconfig-002-20240705   clang-16
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                          lboxre2_defconfig   gcc-13.2.0
sh                    randconfig-001-20240705   gcc-13.2.0
sh                    randconfig-002-20240705   gcc-13.2.0
sh                            shmin_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240705   gcc-13.2.0
sparc64               randconfig-002-20240705   gcc-13.2.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240705   clang-19
um                    randconfig-002-20240705   clang-15
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240705   gcc-7
x86_64       buildonly-randconfig-002-20240705   gcc-13
x86_64       buildonly-randconfig-003-20240705   clang-18
x86_64       buildonly-randconfig-004-20240705   clang-18
x86_64       buildonly-randconfig-005-20240705   clang-18
x86_64       buildonly-randconfig-006-20240705   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240705   clang-18
x86_64                randconfig-002-20240705   gcc-13
x86_64                randconfig-003-20240705   clang-18
x86_64                randconfig-004-20240705   gcc-13
x86_64                randconfig-005-20240705   gcc-13
x86_64                randconfig-006-20240705   gcc-13
x86_64                randconfig-011-20240705   clang-18
x86_64                randconfig-012-20240705   gcc-9
x86_64                randconfig-013-20240705   clang-18
x86_64                randconfig-014-20240705   gcc-13
x86_64                randconfig-015-20240705   clang-18
x86_64                randconfig-016-20240705   gcc-9
x86_64                randconfig-071-20240705   gcc-13
x86_64                randconfig-072-20240705   gcc-13
x86_64                randconfig-073-20240705   clang-18
x86_64                randconfig-074-20240705   gcc-13
x86_64                randconfig-075-20240705   clang-18
x86_64                randconfig-076-20240705   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                  audio_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240705   gcc-13.2.0
xtensa                randconfig-002-20240705   gcc-13.2.0
xtensa                    xip_kc705_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

