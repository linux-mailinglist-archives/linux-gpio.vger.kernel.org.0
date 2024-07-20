Return-Path: <linux-gpio+bounces-8315-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 185AF9380C1
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jul 2024 12:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 799E51F21DD7
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jul 2024 10:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42444CB23;
	Sat, 20 Jul 2024 10:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZad4Bp8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE942913
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jul 2024 10:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721472013; cv=none; b=dxkOM6Ei34i+nBIqwRUq6PI+mdaihB9oufBGSzy3qt1Yf2w/y0RPCfoup76er1majNe5H8t2bH4s2jdzdJUiJ/29DWUFbcjlDXH8R6UZkVw4OXIx4MRCH6IcVIQ/0MPzjdsHrIyR4N5+bQjJ6qr5Lam2PfLgtA3uzX2rvawFK4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721472013; c=relaxed/simple;
	bh=h14+O5cQNZLwIg12FfFqMtjNJ7eXvST7Fad4f/m8jz0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uMhjTkZJdDAc9sq2N8up/aQqe3Hxm1ELJlMb26JQTE3Uy7V7Lpk9H0K4RpbezpJ4iTzj9rMArdvC671/167F2fcaE3pGgOwElaF4f4JDuGf0guFl1Bw1CxK3yO2FrJRFhiTtLeLk5euV7mekzbA6uhZK31G534Y/5xFR/Orjfeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZad4Bp8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721472011; x=1753008011;
  h=date:from:to:cc:subject:message-id;
  bh=h14+O5cQNZLwIg12FfFqMtjNJ7eXvST7Fad4f/m8jz0=;
  b=MZad4Bp858pYzDPueOdP6ny8gaB5R2Q+TSlIDbc9ETSSTw8HsQ4CzhFy
   tmffYzHpbunntnG6wUaoKafWHEt7dk/CLSppnnQwxAC+If8FppnlAeRl4
   m6/xOhyM6J2YTe2ytDL92pmSJFwMPgoV2SiI5lwNxipIzqd/jlpMbIBE1
   BZ9xuO9KDU0T2g5NzM2omY6D2XH6C2uDcs3K/Sdzh3tjg5Lb/SeIzQ4mo
   Zw6LAikOSoE3zyKBIRRIVzvC7/xEVIVeguWO0yK6FbXAYy0Y1V2p6IcLI
   F4H3wPr/ObEoMSVMzmrfPrPi0E7uh0yVpFJzHgLGTLzZTgBAfjf+DJ4Lq
   g==;
X-CSE-ConnectionGUID: wAS9HWqcQ3qRhQRM0tWcqg==
X-CSE-MsgGUID: xx07wJXKQXyLD5/GV1KpgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="19225771"
X-IronPort-AV: E=Sophos;i="6.09,223,1716274800"; 
   d="scan'208";a="19225771"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 03:40:10 -0700
X-CSE-ConnectionGUID: dsElcC7rRi+j/fSOpoRwVg==
X-CSE-MsgGUID: dt1/zW/MRayUAEExxb4oTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,223,1716274800"; 
   d="scan'208";a="51051685"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jul 2024 03:40:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sV7VW-000j7R-0y;
	Sat, 20 Jul 2024 10:40:06 +0000
Date: Sat, 20 Jul 2024 18:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 3ae08e47742eeebf2190900d31ddac53fdd13a5b
Message-ID: <202407201821.TLgRNkt9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 3ae08e47742eeebf2190900d31ddac53fdd13a5b  gpio: virtuser: avoid non-constant format string

elapsed time: 1173m

configs tested: 166
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                      axs103_smp_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240720   gcc-13.2.0
arc                   randconfig-002-20240720   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                   randconfig-001-20240720   gcc-13.2.0
arm                   randconfig-002-20240720   gcc-13.2.0
arm                   randconfig-003-20240720   gcc-13.2.0
arm                   randconfig-004-20240720   gcc-13.2.0
arm                           stm32_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240720   gcc-13.2.0
arm64                 randconfig-002-20240720   gcc-13.2.0
arm64                 randconfig-003-20240720   gcc-13.2.0
arm64                 randconfig-004-20240720   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240720   gcc-13.2.0
csky                  randconfig-002-20240720   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240720   clang-18
i386         buildonly-randconfig-002-20240720   clang-18
i386         buildonly-randconfig-002-20240720   gcc-13
i386         buildonly-randconfig-003-20240720   clang-18
i386         buildonly-randconfig-003-20240720   gcc-13
i386         buildonly-randconfig-004-20240720   clang-18
i386         buildonly-randconfig-005-20240720   clang-18
i386         buildonly-randconfig-006-20240720   clang-18
i386         buildonly-randconfig-006-20240720   gcc-11
i386                                defconfig   clang-18
i386                  randconfig-001-20240720   clang-18
i386                  randconfig-001-20240720   gcc-7
i386                  randconfig-002-20240720   clang-18
i386                  randconfig-003-20240720   clang-18
i386                  randconfig-004-20240720   clang-18
i386                  randconfig-005-20240720   clang-18
i386                  randconfig-005-20240720   gcc-13
i386                  randconfig-006-20240720   clang-18
i386                  randconfig-006-20240720   gcc-11
i386                  randconfig-011-20240720   clang-18
i386                  randconfig-011-20240720   gcc-13
i386                  randconfig-012-20240720   clang-18
i386                  randconfig-012-20240720   gcc-13
i386                  randconfig-013-20240720   clang-18
i386                  randconfig-013-20240720   gcc-13
i386                  randconfig-014-20240720   clang-18
i386                  randconfig-014-20240720   gcc-13
i386                  randconfig-015-20240720   clang-18
i386                  randconfig-015-20240720   gcc-12
i386                  randconfig-016-20240720   clang-18
i386                  randconfig-016-20240720   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240720   gcc-13.2.0
loongarch             randconfig-002-20240720   gcc-13.2.0
m68k                             alldefconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5249evb_defconfig   gcc-13.2.0
m68k                        m5407c3_defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.2.0
m68k                           sun3_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                     decstation_defconfig   gcc-13.2.0
mips                       lemote2f_defconfig   gcc-13.2.0
mips                          rb532_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240720   gcc-13.2.0
nios2                 randconfig-002-20240720   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240720   gcc-13.2.0
parisc                randconfig-002-20240720   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      pmac32_defconfig   gcc-13.2.0
powerpc                         ps3_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240720   gcc-13.2.0
powerpc               randconfig-002-20240720   gcc-13.2.0
powerpc               randconfig-003-20240720   gcc-13.2.0
powerpc                     redwood_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240720   gcc-13.2.0
powerpc64             randconfig-002-20240720   gcc-13.2.0
powerpc64             randconfig-003-20240720   gcc-13.2.0
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240720   gcc-13.2.0
riscv                 randconfig-002-20240720   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240720   gcc-13.2.0
s390                  randconfig-002-20240720   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                        apsh4ad0a_defconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240720   gcc-13.2.0
sh                    randconfig-002-20240720   gcc-13.2.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240720   gcc-13.2.0
sparc64               randconfig-002-20240720   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240720   gcc-13.2.0
um                    randconfig-002-20240720   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240720   gcc-13.2.0
xtensa                randconfig-002-20240720   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

