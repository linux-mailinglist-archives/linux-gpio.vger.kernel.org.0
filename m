Return-Path: <linux-gpio+bounces-8712-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C53294E840
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 10:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1D401F248F4
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 08:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11943165EFF;
	Mon, 12 Aug 2024 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aPO2FcOU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ED74D8D1
	for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2024 08:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723450077; cv=none; b=rsVdg+negW/0GQzwaQafcv0u4hg1VcXVsTuiG0bXkZzlhFU1e/3xVUk1LVsMGLkSvGTwamLicNeJNK8gIrQJShB0rLyycwIPworI1tmmTuRwmR/BK7yYjJAnW/RFseqYHs9+A45HzFQfUJVl3L7sSMDS3v6SP4Z2p4pRZ3o5Ebw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723450077; c=relaxed/simple;
	bh=4eJ4p2FzMvDXGxt8fXu/sTQ1XH/edjLeV96KaunxMFY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fe0fqH8sGwpLtRo9EaMO9hAC4PtJxWeXqBWvQTbWCRCW0TGZU0EdUiKEan8X/FXxkGuYgYWauVqYj5HOAxAdfVNqqwLXgbeSfKBRY1g00SC1A2DJzHcSIXRGwZ/Khtu05KO+vxzjxc281mN13uiq+akZobBnaPM+/LDPXtBQT5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aPO2FcOU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723450075; x=1754986075;
  h=date:from:to:cc:subject:message-id;
  bh=4eJ4p2FzMvDXGxt8fXu/sTQ1XH/edjLeV96KaunxMFY=;
  b=aPO2FcOUd0TCsDiZWlJLaAMkHmDnjzTX6BD/Ky4iHPj5fpD0XzCubexs
   Ad2j5BJ+PjhDWMxioAKmID56yGYPnvTBHo/yN5nUwJ/r7wpPxsOifekqo
   y8lJva2NhffBvh6z/AaLzRKHyUU2wGY8Juc81xf5tQnw7bBG9/3n/FR1G
   Xl4ZIYzl9RAA1+qOD290qBsm+g3xV8RvvIEoQZNK1IXBUpr07owZfdQPf
   luVJkUV2UONPxw/xsyAocBBgYIcAXYbFroYmPGHK7TkoyNPIxcsE29zPt
   Tnk7sJ0MUlEhwN6c+CVRFQWkfbUufM4vWJnwKwX5PmsXS+PLctcArU2x2
   g==;
X-CSE-ConnectionGUID: 6Qv7+25RSPKRfJUcS7vh6A==
X-CSE-MsgGUID: woPaIm+vQ1CN/gqOPBYuGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="24450209"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="24450209"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 01:07:54 -0700
X-CSE-ConnectionGUID: ODNXJiinRW69co4S10a3lg==
X-CSE-MsgGUID: zO4LC0ZhSqqC9sChbRfBKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58257979"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 12 Aug 2024 01:07:53 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdQ5n-000BWR-1X;
	Mon, 12 Aug 2024 08:07:51 +0000
Date: Mon, 12 Aug 2024 16:07:41 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:at24/for-next] BUILD SUCCESS
 36e071d2a1522eeb3d38fb9c257cac8e5907979f
Message-ID: <202408121637.KVghc6Re-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git at24/for-next
branch HEAD: 36e071d2a1522eeb3d38fb9c257cac8e5907979f  dt-bindings: eeprom: at24: Add compatible for Giantec GT24C04A

elapsed time: 721m

configs tested: 249
configs skipped: 5

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
arc                   randconfig-001-20240812   gcc-13.2.0
arc                   randconfig-002-20240812   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                     am200epdkit_defconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                        keystone_defconfig   gcc-14.1.0
arm                        multi_v5_defconfig   gcc-14.1.0
arm                   randconfig-001-20240812   clang-15
arm                   randconfig-001-20240812   gcc-13.2.0
arm                   randconfig-002-20240812   clang-20
arm                   randconfig-002-20240812   gcc-13.2.0
arm                   randconfig-003-20240812   clang-20
arm                   randconfig-003-20240812   gcc-13.2.0
arm                   randconfig-004-20240812   clang-20
arm                   randconfig-004-20240812   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240812   gcc-13.2.0
arm64                 randconfig-001-20240812   gcc-14.1.0
arm64                 randconfig-002-20240812   clang-20
arm64                 randconfig-002-20240812   gcc-13.2.0
arm64                 randconfig-003-20240812   gcc-13.2.0
arm64                 randconfig-003-20240812   gcc-14.1.0
arm64                 randconfig-004-20240812   clang-20
arm64                 randconfig-004-20240812   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240812   gcc-13.2.0
csky                  randconfig-001-20240812   gcc-14.1.0
csky                  randconfig-002-20240812   gcc-13.2.0
csky                  randconfig-002-20240812   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240812   clang-20
hexagon               randconfig-002-20240812   clang-20
i386                             alldefconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240812   clang-18
i386         buildonly-randconfig-002-20240812   clang-18
i386         buildonly-randconfig-003-20240812   clang-18
i386         buildonly-randconfig-004-20240812   clang-18
i386         buildonly-randconfig-005-20240812   clang-18
i386         buildonly-randconfig-005-20240812   gcc-12
i386         buildonly-randconfig-006-20240812   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240812   clang-18
i386                  randconfig-001-20240812   gcc-12
i386                  randconfig-002-20240812   clang-18
i386                  randconfig-002-20240812   gcc-12
i386                  randconfig-003-20240812   clang-18
i386                  randconfig-003-20240812   gcc-12
i386                  randconfig-004-20240812   clang-18
i386                  randconfig-005-20240812   clang-18
i386                  randconfig-006-20240812   clang-18
i386                  randconfig-006-20240812   gcc-12
i386                  randconfig-011-20240812   clang-18
i386                  randconfig-011-20240812   gcc-12
i386                  randconfig-012-20240812   clang-18
i386                  randconfig-013-20240812   clang-18
i386                  randconfig-014-20240812   clang-18
i386                  randconfig-015-20240812   clang-18
i386                  randconfig-016-20240812   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240812   gcc-13.2.0
loongarch             randconfig-001-20240812   gcc-14.1.0
loongarch             randconfig-002-20240812   gcc-13.2.0
loongarch             randconfig-002-20240812   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5208evb_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                         cobalt_defconfig   gcc-14.1.0
mips                           jazz_defconfig   gcc-14.1.0
mips                        omega2p_defconfig   gcc-14.1.0
mips                        vocore2_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240812   gcc-13.2.0
nios2                 randconfig-001-20240812   gcc-14.1.0
nios2                 randconfig-002-20240812   gcc-13.2.0
nios2                 randconfig-002-20240812   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240812   gcc-13.2.0
parisc                randconfig-001-20240812   gcc-14.1.0
parisc                randconfig-002-20240812   gcc-13.2.0
parisc                randconfig-002-20240812   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                    mvme5100_defconfig   gcc-14.1.0
powerpc                      pcm030_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240812   gcc-13.2.0
powerpc               randconfig-001-20240812   gcc-14.1.0
powerpc               randconfig-002-20240812   gcc-13.2.0
powerpc               randconfig-002-20240812   gcc-14.1.0
powerpc               randconfig-003-20240812   gcc-13.2.0
powerpc               randconfig-003-20240812   gcc-14.1.0
powerpc                  storcenter_defconfig   gcc-14.1.0
powerpc                         wii_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240812   clang-20
powerpc64             randconfig-001-20240812   gcc-13.2.0
powerpc64             randconfig-002-20240812   clang-15
powerpc64             randconfig-002-20240812   gcc-13.2.0
powerpc64             randconfig-003-20240812   clang-20
powerpc64             randconfig-003-20240812   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240812   gcc-13.2.0
riscv                 randconfig-001-20240812   gcc-14.1.0
riscv                 randconfig-002-20240812   clang-20
riscv                 randconfig-002-20240812   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240812   gcc-13.2.0
s390                  randconfig-001-20240812   gcc-14.1.0
s390                  randconfig-002-20240812   gcc-13.2.0
s390                  randconfig-002-20240812   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        edosk7705_defconfig   gcc-14.1.0
sh                    randconfig-001-20240812   gcc-13.2.0
sh                    randconfig-001-20240812   gcc-14.1.0
sh                    randconfig-002-20240812   gcc-13.2.0
sh                    randconfig-002-20240812   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240812   gcc-13.2.0
sparc64               randconfig-001-20240812   gcc-14.1.0
sparc64               randconfig-002-20240812   gcc-13.2.0
sparc64               randconfig-002-20240812   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   clang-20
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-12
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240812   clang-20
um                    randconfig-001-20240812   gcc-13.2.0
um                    randconfig-002-20240812   gcc-12
um                    randconfig-002-20240812   gcc-13.2.0
um                           x86_64_defconfig   clang-15
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240812   clang-18
x86_64       buildonly-randconfig-002-20240812   clang-18
x86_64       buildonly-randconfig-003-20240812   clang-18
x86_64       buildonly-randconfig-003-20240812   gcc-12
x86_64       buildonly-randconfig-004-20240812   clang-18
x86_64       buildonly-randconfig-005-20240812   clang-18
x86_64       buildonly-randconfig-006-20240812   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240812   clang-18
x86_64                randconfig-002-20240812   clang-18
x86_64                randconfig-003-20240812   clang-18
x86_64                randconfig-003-20240812   gcc-12
x86_64                randconfig-004-20240812   clang-18
x86_64                randconfig-004-20240812   gcc-12
x86_64                randconfig-005-20240812   clang-18
x86_64                randconfig-005-20240812   gcc-11
x86_64                randconfig-006-20240812   clang-18
x86_64                randconfig-011-20240812   clang-18
x86_64                randconfig-012-20240812   clang-18
x86_64                randconfig-012-20240812   gcc-12
x86_64                randconfig-013-20240812   clang-18
x86_64                randconfig-014-20240812   clang-18
x86_64                randconfig-015-20240812   clang-18
x86_64                randconfig-015-20240812   gcc-12
x86_64                randconfig-016-20240812   clang-18
x86_64                randconfig-016-20240812   gcc-12
x86_64                randconfig-071-20240812   clang-18
x86_64                randconfig-071-20240812   gcc-12
x86_64                randconfig-072-20240812   clang-18
x86_64                randconfig-072-20240812   gcc-12
x86_64                randconfig-073-20240812   clang-18
x86_64                randconfig-073-20240812   gcc-12
x86_64                randconfig-074-20240812   clang-18
x86_64                randconfig-075-20240812   clang-18
x86_64                randconfig-075-20240812   gcc-12
x86_64                randconfig-076-20240812   clang-18
x86_64                randconfig-076-20240812   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                generic_kc705_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240812   gcc-13.2.0
xtensa                randconfig-001-20240812   gcc-14.1.0
xtensa                randconfig-002-20240812   gcc-13.2.0
xtensa                randconfig-002-20240812   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

