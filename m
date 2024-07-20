Return-Path: <linux-gpio+bounces-8314-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC62937EE9
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jul 2024 06:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60B8D1F217E8
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jul 2024 04:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A01BB661;
	Sat, 20 Jul 2024 04:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UESevuMp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC531C3D
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jul 2024 04:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721449501; cv=none; b=RNrBYEjhhaaDizKohzn1zEBY51SUSYizIvChSiEnM/4XZFikGdvv2o/zA0TEgs50HpiEhRBGDQkuU/GZOGaGIQV7N+wNXrJ0eMBv1sM81+Vx1uBRHsKfc6ogYM0jjefZ5i8EfCAwTUJnkrVH/TdTfEFOsTLCqv8LCmeypuRRhYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721449501; c=relaxed/simple;
	bh=UpVTmk0Tet/Iyk9xEl855Ndn2VoR5rLl/DHRYt4eoog=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l2d4guC4OI+tGudzgeFB50x4L4gOjNk0djncg+6nncJ8/RJxS1b2L3gCswhURM35a6LoGXWy7uK1kmJa5WEx2Imy18qnzKUtBZh9SG+iTkuCc6Un5vWr3jB+ZIUQeXXjl+YVkwxUv5bnaMdrh3q1hA4+d0dzAnPm4Yfl6vjRrNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UESevuMp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721449499; x=1752985499;
  h=date:from:to:cc:subject:message-id;
  bh=UpVTmk0Tet/Iyk9xEl855Ndn2VoR5rLl/DHRYt4eoog=;
  b=UESevuMpXvRB0Ye92rtJjWSBpR4hNKwUmFzxmF2792w0ZDrI0GB8Pyqj
   VGOdXGE+2hnv6LzA5GBVBVekiyifnXzd31087VzXWybOEHbfZtUbTLr45
   qVtivZ1GLtiJ7QAJ+yu8NZBiam2zprRE7nIDwd+MBLZsdoIpxPdVvX6Os
   pKF3M/bf1cUs05PsVlXTyVz48NoD8AdV6FRgkjGM4DHPxiY+H+W2axwY3
   vCB7mxQPsO38yW/cIackkL61XYCg8BWqrfbM2GyKBO9gWRdLxqNknH6JJ
   WyFrh/frrSSNQZBVYz4D1w2pUqmSrBjRTI5Qpgqm6DL6aYfCCGsjV5aBH
   A==;
X-CSE-ConnectionGUID: T+W7JrV6S46jxJ1azV/ZJw==
X-CSE-MsgGUID: xa++XrOjROmCltmx09bIqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18787819"
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="18787819"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 21:24:58 -0700
X-CSE-ConnectionGUID: HHgsIn5XQQ+DEVPhRKXAWA==
X-CSE-MsgGUID: nIV1R9l9SFWKRDtIvjId8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="88779390"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jul 2024 21:24:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sV1eQ-000iqA-2A;
	Sat, 20 Jul 2024 04:24:54 +0000
Date: Sat, 20 Jul 2024 12:24:42 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq/for-current] BUILD SUCCESS
 1a8c67a8b21e26843d5641c55f48130b3e323ce8
Message-ID: <202407201239.0CHMn5Oz-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-current
branch HEAD: 1a8c67a8b21e26843d5641c55f48130b3e323ce8  arm64: qcom: don't select HAVE_PWRCTL when PCI=n

elapsed time: 1230m

configs tested: 355
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc-13.3.0
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              alldefconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                      axs103_smp_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240719   gcc-13.2.0
arc                   randconfig-001-20240720   gcc-13.2.0
arc                   randconfig-002-20240719   gcc-13.2.0
arc                   randconfig-002-20240720   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                       multi_v4t_defconfig   gcc-13.3.0
arm                   randconfig-001-20240719   clang-19
arm                   randconfig-001-20240719   gcc-13.2.0
arm                   randconfig-001-20240720   gcc-13.2.0
arm                   randconfig-002-20240719   gcc-13.2.0
arm                   randconfig-002-20240719   gcc-14.1.0
arm                   randconfig-002-20240720   gcc-13.2.0
arm                   randconfig-003-20240719   gcc-13.2.0
arm                   randconfig-003-20240719   gcc-14.1.0
arm                   randconfig-003-20240720   gcc-13.2.0
arm                   randconfig-004-20240719   clang-19
arm                   randconfig-004-20240719   gcc-13.2.0
arm                   randconfig-004-20240720   gcc-13.2.0
arm                         s3c6400_defconfig   gcc-13.2.0
arm                         s5pv210_defconfig   gcc-13.3.0
arm                           stm32_defconfig   gcc-13.2.0
arm                           u8500_defconfig   gcc-13.3.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240719   gcc-13.2.0
arm64                 randconfig-001-20240719   gcc-14.1.0
arm64                 randconfig-001-20240720   gcc-13.2.0
arm64                 randconfig-002-20240719   gcc-13.2.0
arm64                 randconfig-002-20240719   gcc-14.1.0
arm64                 randconfig-002-20240720   gcc-13.2.0
arm64                 randconfig-003-20240719   gcc-13.2.0
arm64                 randconfig-003-20240719   gcc-14.1.0
arm64                 randconfig-003-20240720   gcc-13.2.0
arm64                 randconfig-004-20240719   gcc-13.2.0
arm64                 randconfig-004-20240719   gcc-14.1.0
arm64                 randconfig-004-20240720   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240719   gcc-13.2.0
csky                  randconfig-001-20240719   gcc-14.1.0
csky                  randconfig-001-20240720   gcc-13.2.0
csky                  randconfig-002-20240719   gcc-13.2.0
csky                  randconfig-002-20240719   gcc-14.1.0
csky                  randconfig-002-20240720   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240719   clang-19
hexagon               randconfig-002-20240719   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240719   clang-18
i386         buildonly-randconfig-001-20240720   clang-18
i386         buildonly-randconfig-002-20240719   clang-18
i386         buildonly-randconfig-002-20240720   clang-18
i386         buildonly-randconfig-003-20240719   clang-18
i386         buildonly-randconfig-003-20240719   gcc-10
i386         buildonly-randconfig-003-20240720   clang-18
i386         buildonly-randconfig-004-20240719   clang-18
i386         buildonly-randconfig-004-20240720   clang-18
i386         buildonly-randconfig-005-20240719   clang-18
i386         buildonly-randconfig-005-20240719   gcc-10
i386         buildonly-randconfig-005-20240720   clang-18
i386         buildonly-randconfig-006-20240719   clang-18
i386         buildonly-randconfig-006-20240720   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240719   clang-18
i386                  randconfig-001-20240720   clang-18
i386                  randconfig-002-20240719   clang-18
i386                  randconfig-002-20240720   clang-18
i386                  randconfig-003-20240719   clang-18
i386                  randconfig-003-20240720   clang-18
i386                  randconfig-004-20240719   clang-18
i386                  randconfig-004-20240719   gcc-13
i386                  randconfig-004-20240720   clang-18
i386                  randconfig-005-20240719   clang-18
i386                  randconfig-005-20240720   clang-18
i386                  randconfig-006-20240719   clang-18
i386                  randconfig-006-20240720   clang-18
i386                  randconfig-011-20240719   clang-18
i386                  randconfig-011-20240720   clang-18
i386                  randconfig-012-20240719   clang-18
i386                  randconfig-012-20240720   clang-18
i386                  randconfig-013-20240719   clang-18
i386                  randconfig-013-20240720   clang-18
i386                  randconfig-014-20240719   clang-18
i386                  randconfig-014-20240720   clang-18
i386                  randconfig-015-20240719   clang-18
i386                  randconfig-015-20240719   gcc-13
i386                  randconfig-015-20240720   clang-18
i386                  randconfig-016-20240719   clang-18
i386                  randconfig-016-20240719   gcc-13
i386                  randconfig-016-20240720   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240719   gcc-13.2.0
loongarch             randconfig-001-20240719   gcc-14.1.0
loongarch             randconfig-001-20240720   gcc-13.2.0
loongarch             randconfig-002-20240719   gcc-13.2.0
loongarch             randconfig-002-20240719   gcc-14.1.0
loongarch             randconfig-002-20240720   gcc-13.2.0
m68k                             alldefconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5208evb_defconfig   gcc-13.3.0
m68k                       m5249evb_defconfig   gcc-13.2.0
m68k                       m5275evb_defconfig   gcc-13.3.0
m68k                        m5407c3_defconfig   gcc-13.2.0
m68k                        m5407c3_defconfig   gcc-13.3.0
m68k                        mvme147_defconfig   gcc-13.2.0
m68k                           sun3_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                       bmips_be_defconfig   gcc-13.2.0
mips                           ci20_defconfig   gcc-13.3.0
mips                     decstation_defconfig   gcc-13.2.0
mips                       lemote2f_defconfig   gcc-13.2.0
mips                        maltaup_defconfig   gcc-13.2.0
mips                        omega2p_defconfig   gcc-13.3.0
mips                          rb532_defconfig   gcc-13.2.0
mips                   sb1250_swarm_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240719   gcc-13.2.0
nios2                 randconfig-001-20240719   gcc-14.1.0
nios2                 randconfig-001-20240720   gcc-13.2.0
nios2                 randconfig-002-20240719   gcc-13.2.0
nios2                 randconfig-002-20240719   gcc-14.1.0
nios2                 randconfig-002-20240720   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-32bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240719   gcc-13.2.0
parisc                randconfig-001-20240719   gcc-14.1.0
parisc                randconfig-001-20240720   gcc-13.2.0
parisc                randconfig-002-20240719   gcc-13.2.0
parisc                randconfig-002-20240719   gcc-14.1.0
parisc                randconfig-002-20240720   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                    adder875_defconfig   gcc-13.3.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-14.1.0
powerpc                    amigaone_defconfig   gcc-13.2.0
powerpc                    gamecube_defconfig   gcc-13.2.0
powerpc                 mpc837x_rdb_defconfig   gcc-13.2.0
powerpc                 mpc837x_rdb_defconfig   gcc-13.3.0
powerpc                      pmac32_defconfig   gcc-13.2.0
powerpc                      ppc64e_defconfig   gcc-13.2.0
powerpc                         ps3_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240719   gcc-13.2.0
powerpc               randconfig-001-20240719   gcc-14.1.0
powerpc               randconfig-001-20240720   gcc-13.2.0
powerpc               randconfig-002-20240719   gcc-13.2.0
powerpc               randconfig-002-20240719   gcc-14.1.0
powerpc               randconfig-002-20240720   gcc-13.2.0
powerpc               randconfig-003-20240719   gcc-13.2.0
powerpc               randconfig-003-20240719   gcc-14.1.0
powerpc               randconfig-003-20240720   gcc-13.2.0
powerpc                     redwood_defconfig   gcc-13.2.0
powerpc                     stx_gp3_defconfig   gcc-13.3.0
powerpc                     tqm8540_defconfig   gcc-13.3.0
powerpc                      tqm8xx_defconfig   gcc-13.3.0
powerpc64             randconfig-001-20240719   gcc-13.2.0
powerpc64             randconfig-001-20240720   gcc-13.2.0
powerpc64             randconfig-002-20240719   gcc-13.2.0
powerpc64             randconfig-002-20240719   gcc-14.1.0
powerpc64             randconfig-002-20240720   gcc-13.2.0
powerpc64             randconfig-003-20240719   gcc-13.2.0
powerpc64             randconfig-003-20240719   gcc-14.1.0
powerpc64             randconfig-003-20240720   gcc-13.2.0
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-13.3.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240719   clang-19
riscv                 randconfig-001-20240719   gcc-13.2.0
riscv                 randconfig-001-20240720   gcc-13.2.0
riscv                 randconfig-002-20240719   clang-19
riscv                 randconfig-002-20240719   gcc-13.2.0
riscv                 randconfig-002-20240720   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240719   clang-19
s390                  randconfig-001-20240719   gcc-13.2.0
s390                  randconfig-001-20240720   gcc-13.2.0
s390                  randconfig-002-20240719   clang-19
s390                  randconfig-002-20240719   gcc-13.2.0
s390                  randconfig-002-20240720   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                        apsh4ad0a_defconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sh                ecovec24-romimage_defconfig   gcc-13.3.0
sh                          r7785rp_defconfig   gcc-13.2.0
sh                    randconfig-001-20240719   gcc-13.2.0
sh                    randconfig-001-20240719   gcc-14.1.0
sh                    randconfig-001-20240720   gcc-13.2.0
sh                    randconfig-002-20240719   gcc-13.2.0
sh                    randconfig-002-20240719   gcc-14.1.0
sh                    randconfig-002-20240720   gcc-13.2.0
sh                   sh7770_generic_defconfig   gcc-13.2.0
sh                             shx3_defconfig   gcc-13.2.0
sh                              ul2_defconfig   gcc-13.2.0
sh                          urquell_defconfig   gcc-13.3.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240719   gcc-13.2.0
sparc64               randconfig-001-20240719   gcc-14.1.0
sparc64               randconfig-001-20240720   gcc-13.2.0
sparc64               randconfig-002-20240719   gcc-13.2.0
sparc64               randconfig-002-20240719   gcc-14.1.0
sparc64               randconfig-002-20240720   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240719   clang-19
um                    randconfig-001-20240719   gcc-13.2.0
um                    randconfig-001-20240720   gcc-13.2.0
um                    randconfig-002-20240719   gcc-13
um                    randconfig-002-20240719   gcc-13.2.0
um                    randconfig-002-20240720   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240719   gcc-13
x86_64       buildonly-randconfig-001-20240720   clang-18
x86_64       buildonly-randconfig-002-20240719   clang-18
x86_64       buildonly-randconfig-002-20240719   gcc-13
x86_64       buildonly-randconfig-002-20240720   clang-18
x86_64       buildonly-randconfig-003-20240719   gcc-10
x86_64       buildonly-randconfig-003-20240719   gcc-13
x86_64       buildonly-randconfig-003-20240720   clang-18
x86_64       buildonly-randconfig-004-20240719   gcc-13
x86_64       buildonly-randconfig-004-20240720   clang-18
x86_64       buildonly-randconfig-005-20240719   gcc-12
x86_64       buildonly-randconfig-005-20240719   gcc-13
x86_64       buildonly-randconfig-005-20240720   clang-18
x86_64       buildonly-randconfig-006-20240719   gcc-13
x86_64       buildonly-randconfig-006-20240720   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240719   gcc-13
x86_64                randconfig-001-20240720   clang-18
x86_64                randconfig-002-20240719   clang-18
x86_64                randconfig-002-20240719   gcc-13
x86_64                randconfig-002-20240720   clang-18
x86_64                randconfig-003-20240719   gcc-13
x86_64                randconfig-003-20240720   clang-18
x86_64                randconfig-004-20240719   gcc-13
x86_64                randconfig-004-20240719   gcc-7
x86_64                randconfig-004-20240720   clang-18
x86_64                randconfig-005-20240719   gcc-13
x86_64                randconfig-005-20240719   gcc-7
x86_64                randconfig-005-20240720   clang-18
x86_64                randconfig-006-20240719   clang-18
x86_64                randconfig-006-20240719   gcc-13
x86_64                randconfig-006-20240720   clang-18
x86_64                randconfig-011-20240719   gcc-13
x86_64                randconfig-011-20240720   clang-18
x86_64                randconfig-012-20240719   gcc-13
x86_64                randconfig-012-20240720   clang-18
x86_64                randconfig-013-20240719   gcc-13
x86_64                randconfig-013-20240719   gcc-8
x86_64                randconfig-013-20240720   clang-18
x86_64                randconfig-014-20240719   gcc-13
x86_64                randconfig-014-20240720   clang-18
x86_64                randconfig-015-20240719   clang-18
x86_64                randconfig-015-20240719   gcc-13
x86_64                randconfig-015-20240720   clang-18
x86_64                randconfig-016-20240719   gcc-13
x86_64                randconfig-016-20240720   clang-18
x86_64                randconfig-071-20240719   clang-18
x86_64                randconfig-071-20240719   gcc-13
x86_64                randconfig-071-20240720   clang-18
x86_64                randconfig-072-20240719   gcc-13
x86_64                randconfig-072-20240719   gcc-8
x86_64                randconfig-072-20240720   clang-18
x86_64                randconfig-073-20240719   clang-18
x86_64                randconfig-073-20240719   gcc-13
x86_64                randconfig-073-20240720   clang-18
x86_64                randconfig-074-20240719   gcc-10
x86_64                randconfig-074-20240719   gcc-13
x86_64                randconfig-074-20240720   clang-18
x86_64                randconfig-075-20240719   gcc-10
x86_64                randconfig-075-20240719   gcc-13
x86_64                randconfig-075-20240720   clang-18
x86_64                randconfig-076-20240719   gcc-13
x86_64                randconfig-076-20240720   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240719   gcc-13.2.0
xtensa                randconfig-001-20240719   gcc-14.1.0
xtensa                randconfig-001-20240720   gcc-13.2.0
xtensa                randconfig-002-20240719   gcc-13.2.0
xtensa                randconfig-002-20240719   gcc-14.1.0
xtensa                randconfig-002-20240720   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

