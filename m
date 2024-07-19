Return-Path: <linux-gpio+bounces-8293-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1F293733B
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 07:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF655281AC7
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 05:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB83376E6;
	Fri, 19 Jul 2024 05:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JwrkDb3/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EA029CE6
	for <linux-gpio@vger.kernel.org>; Fri, 19 Jul 2024 05:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721366651; cv=none; b=VIIslZCLk1lFjqZrJTIZgAWh9L22Q1B7EVwRBlDT1siiLZbJRkrSVHdSBp0ZfBfVPW9AoXW/6hhQT+TjVAV71ClsHFtMP1ilM3U0xUnW8xKwSPxUI1pzXVRhZOTzJBxUaCZJ0JdZCWiffKA9xR7sgwZk5zkAEP4buqQQxpxmwa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721366651; c=relaxed/simple;
	bh=JpNF79n8nzUQ9De0KllGLcoXvEtqHmSQog9ed8XOsKs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F57tusYRen7ZFSIkVv1Sk1TMTnoMM7qUzZCoV+X4EqgqwZ0VM7ZKkssQ+sIF8RGyOv60LXQMkmUYBpbzCM/UpLCecOvj88BqsRkAXGyEYW1hXr6UF4ciKn3MFOtIYBFVaRNBYBOyXECMBW6nmrIOoa18QAguxoEc3hq6ZUae4k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JwrkDb3/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721366649; x=1752902649;
  h=date:from:to:cc:subject:message-id;
  bh=JpNF79n8nzUQ9De0KllGLcoXvEtqHmSQog9ed8XOsKs=;
  b=JwrkDb3/Vdo5iUOy0j7YxS/2Z6jjV1nU7VIJ1yM76pdmvbLEsvACdTEx
   q00tHvr6emxcqrrP6jWhs0lwjCYd3Eji9Bqdb4ZNWNMpHHaP4Q5iI14bi
   YLhs/neeX53dDZucTYZKueNVeQ+ykgBIMos+9wAv6/OEKSwGuUJ+8X4tD
   iX7srbBFjaV/wI+N2fR8sc+uRbhtlqq7foq/ImuoX+1AenMKsSEKGFcOM
   lp7b9Rkr3o5bAsZ6Ew9HnoswsotZ+CVlzKqNP9JSI7U9qumk3OME16vVl
   mlY+uaAqwmU+AXINxyApJr31wgTYwK/VbUNA/j9lulRxCZl3+f1ZvO5T+
   Q==;
X-CSE-ConnectionGUID: k9vi1J7VRhi8/w2aUNmI7w==
X-CSE-MsgGUID: +7cERTp6TKKUu3BOftos1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="36400488"
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="36400488"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 22:24:08 -0700
X-CSE-ConnectionGUID: tagpd4RhSyCpG03HLqkccA==
X-CSE-MsgGUID: KqzOewfuT3qSaJ5SYUsCgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="55853261"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Jul 2024 22:24:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUg68-000hsk-0c;
	Fri, 19 Jul 2024 05:24:04 +0000
Date: Fri, 19 Jul 2024 13:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq/for-current] BUILD SUCCESS
 ed70aaac7c359540d3d8332827fa60b6a45e15f2
Message-ID: <202407191303.gd4K8f12-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-current
branch HEAD: ed70aaac7c359540d3d8332827fa60b6a45e15f2  Kconfig: reduce the amount of power sequencing noise

elapsed time: 974m

configs tested: 285
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
arc                                 defconfig   gcc-13.2.0
arc                         haps_hs_defconfig   gcc-13.2.0
arc                            hsdk_defconfig   gcc-13.2.0
arc                   randconfig-001-20240719   gcc-13.2.0
arc                   randconfig-002-20240719   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                           h3600_defconfig   gcc-13.2.0
arm                            mmp2_defconfig   gcc-13.2.0
arm                          moxart_defconfig   gcc-13.2.0
arm                   randconfig-001-20240719   clang-19
arm                   randconfig-001-20240719   gcc-13.2.0
arm                   randconfig-002-20240719   gcc-13.2.0
arm                   randconfig-002-20240719   gcc-14.1.0
arm                   randconfig-003-20240719   gcc-13.2.0
arm                   randconfig-003-20240719   gcc-14.1.0
arm                   randconfig-004-20240719   clang-19
arm                   randconfig-004-20240719   gcc-13.2.0
arm                         s3c6400_defconfig   gcc-13.2.0
arm                           sama5_defconfig   gcc-13.2.0
arm                         socfpga_defconfig   gcc-13.2.0
arm                         wpcm450_defconfig   gcc-13.2.0
arm64                            alldefconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240719   gcc-13.2.0
arm64                 randconfig-001-20240719   gcc-14.1.0
arm64                 randconfig-002-20240719   gcc-13.2.0
arm64                 randconfig-002-20240719   gcc-14.1.0
arm64                 randconfig-003-20240719   gcc-13.2.0
arm64                 randconfig-003-20240719   gcc-14.1.0
arm64                 randconfig-004-20240719   gcc-13.2.0
arm64                 randconfig-004-20240719   gcc-14.1.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240719   gcc-13.2.0
csky                  randconfig-001-20240719   gcc-14.1.0
csky                  randconfig-002-20240719   gcc-13.2.0
csky                  randconfig-002-20240719   gcc-14.1.0
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
i386         buildonly-randconfig-001-20240718   gcc-11
i386         buildonly-randconfig-001-20240719   clang-18
i386         buildonly-randconfig-002-20240718   gcc-7
i386         buildonly-randconfig-002-20240719   clang-18
i386         buildonly-randconfig-003-20240718   gcc-13
i386         buildonly-randconfig-003-20240719   clang-18
i386         buildonly-randconfig-004-20240718   clang-18
i386         buildonly-randconfig-004-20240719   clang-18
i386         buildonly-randconfig-005-20240718   gcc-9
i386         buildonly-randconfig-005-20240719   clang-18
i386         buildonly-randconfig-006-20240718   gcc-13
i386         buildonly-randconfig-006-20240719   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240718   gcc-13
i386                  randconfig-001-20240719   clang-18
i386                  randconfig-002-20240718   gcc-13
i386                  randconfig-002-20240719   clang-18
i386                  randconfig-003-20240718   clang-18
i386                  randconfig-003-20240719   clang-18
i386                  randconfig-004-20240718   clang-18
i386                  randconfig-004-20240719   clang-18
i386                  randconfig-005-20240718   clang-18
i386                  randconfig-005-20240719   clang-18
i386                  randconfig-006-20240718   clang-18
i386                  randconfig-006-20240719   clang-18
i386                  randconfig-011-20240718   gcc-13
i386                  randconfig-011-20240719   clang-18
i386                  randconfig-012-20240718   gcc-13
i386                  randconfig-012-20240719   clang-18
i386                  randconfig-013-20240718   gcc-10
i386                  randconfig-013-20240719   clang-18
i386                  randconfig-014-20240718   clang-18
i386                  randconfig-014-20240719   clang-18
i386                  randconfig-015-20240718   clang-18
i386                  randconfig-015-20240719   clang-18
i386                  randconfig-016-20240718   gcc-13
i386                  randconfig-016-20240719   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240719   gcc-13.2.0
loongarch             randconfig-001-20240719   gcc-14.1.0
loongarch             randconfig-002-20240719   gcc-13.2.0
loongarch             randconfig-002-20240719   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          amiga_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5272c3_defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                       bmips_be_defconfig   gcc-13.2.0
mips                         cobalt_defconfig   gcc-13.2.0
mips                          eyeq5_defconfig   gcc-13.2.0
mips                        maltaup_defconfig   gcc-13.2.0
mips                   sb1250_swarm_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240719   gcc-13.2.0
nios2                 randconfig-001-20240719   gcc-14.1.0
nios2                 randconfig-002-20240719   gcc-13.2.0
nios2                 randconfig-002-20240719   gcc-14.1.0
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
parisc                randconfig-002-20240719   gcc-13.2.0
parisc                randconfig-002-20240719   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-14.1.0
powerpc                    amigaone_defconfig   gcc-13.2.0
powerpc                      ep88xc_defconfig   gcc-13.2.0
powerpc                    gamecube_defconfig   gcc-13.2.0
powerpc                  iss476-smp_defconfig   gcc-13.2.0
powerpc                      katmai_defconfig   gcc-13.2.0
powerpc                       maple_defconfig   gcc-13.2.0
powerpc                 mpc837x_rdb_defconfig   gcc-13.2.0
powerpc                    mvme5100_defconfig   gcc-13.2.0
powerpc                      ppc64e_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240719   gcc-13.2.0
powerpc               randconfig-001-20240719   gcc-14.1.0
powerpc               randconfig-002-20240719   gcc-13.2.0
powerpc               randconfig-002-20240719   gcc-14.1.0
powerpc               randconfig-003-20240719   gcc-13.2.0
powerpc               randconfig-003-20240719   gcc-14.1.0
powerpc                     tqm8555_defconfig   gcc-13.2.0
powerpc64             randconfig-002-20240719   gcc-13.2.0
powerpc64             randconfig-002-20240719   gcc-14.1.0
powerpc64             randconfig-003-20240719   gcc-13.2.0
powerpc64             randconfig-003-20240719   gcc-14.1.0
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240719   clang-19
riscv                 randconfig-001-20240719   gcc-13.2.0
riscv                 randconfig-002-20240719   clang-19
riscv                 randconfig-002-20240719   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240719   clang-19
s390                  randconfig-001-20240719   gcc-13.2.0
s390                  randconfig-002-20240719   clang-19
s390                  randconfig-002-20240719   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                            hp6xx_defconfig   gcc-13.2.0
sh                          landisk_defconfig   gcc-13.2.0
sh                          r7785rp_defconfig   gcc-13.2.0
sh                    randconfig-001-20240719   gcc-13.2.0
sh                    randconfig-001-20240719   gcc-14.1.0
sh                    randconfig-002-20240719   gcc-13.2.0
sh                    randconfig-002-20240719   gcc-14.1.0
sh                           se7206_defconfig   gcc-13.2.0
sh                           se7722_defconfig   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sh                   sh7724_generic_defconfig   gcc-13.2.0
sh                        sh7757lcr_defconfig   gcc-13.2.0
sh                        sh7763rdp_defconfig   gcc-13.2.0
sh                   sh7770_generic_defconfig   gcc-13.2.0
sh                             shx3_defconfig   gcc-13.2.0
sh                              ul2_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240719   gcc-13.2.0
sparc64               randconfig-001-20240719   gcc-14.1.0
sparc64               randconfig-002-20240719   gcc-13.2.0
sparc64               randconfig-002-20240719   gcc-14.1.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240719   clang-19
um                    randconfig-001-20240719   gcc-13.2.0
um                    randconfig-002-20240719   gcc-13
um                    randconfig-002-20240719   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                           alldefconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240719   gcc-13
x86_64       buildonly-randconfig-002-20240719   clang-18
x86_64       buildonly-randconfig-002-20240719   gcc-13
x86_64       buildonly-randconfig-003-20240719   gcc-10
x86_64       buildonly-randconfig-003-20240719   gcc-13
x86_64       buildonly-randconfig-004-20240719   gcc-13
x86_64       buildonly-randconfig-005-20240719   gcc-12
x86_64       buildonly-randconfig-005-20240719   gcc-13
x86_64       buildonly-randconfig-006-20240719   gcc-13
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240719   gcc-13
x86_64                randconfig-002-20240719   clang-18
x86_64                randconfig-002-20240719   gcc-13
x86_64                randconfig-003-20240719   gcc-13
x86_64                randconfig-004-20240719   gcc-13
x86_64                randconfig-004-20240719   gcc-7
x86_64                randconfig-005-20240719   gcc-13
x86_64                randconfig-005-20240719   gcc-7
x86_64                randconfig-006-20240719   clang-18
x86_64                randconfig-006-20240719   gcc-13
x86_64                randconfig-011-20240719   gcc-13
x86_64                randconfig-012-20240719   gcc-13
x86_64                randconfig-013-20240719   gcc-13
x86_64                randconfig-013-20240719   gcc-8
x86_64                randconfig-014-20240719   gcc-13
x86_64                randconfig-015-20240719   clang-18
x86_64                randconfig-015-20240719   gcc-13
x86_64                randconfig-016-20240719   gcc-13
x86_64                randconfig-071-20240719   clang-18
x86_64                randconfig-071-20240719   gcc-13
x86_64                randconfig-072-20240719   gcc-13
x86_64                randconfig-072-20240719   gcc-8
x86_64                randconfig-073-20240719   clang-18
x86_64                randconfig-073-20240719   gcc-13
x86_64                randconfig-074-20240719   gcc-10
x86_64                randconfig-074-20240719   gcc-13
x86_64                randconfig-075-20240719   gcc-10
x86_64                randconfig-075-20240719   gcc-13
x86_64                randconfig-076-20240719   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240719   gcc-13.2.0
xtensa                randconfig-001-20240719   gcc-14.1.0
xtensa                randconfig-002-20240719   gcc-13.2.0
xtensa                randconfig-002-20240719   gcc-14.1.0
xtensa                    xip_kc705_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

