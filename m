Return-Path: <linux-gpio+bounces-11139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4419981CC
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 11:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADF302833E9
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 09:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68EE1BA272;
	Thu, 10 Oct 2024 09:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X40xZqBb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019BC1B86CF
	for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728551585; cv=none; b=R97eO2XsOD1kdi/mGfEioGPj3g2SUxgNdEnLEf12Led+YjTjzTJofIbXNMWxhacYLGPqRGdbMTVWA538R8b+OE3tXLP1rOwmndrvl9b9+sFO18iNvcOZEvgOmuvRjOu6nYV7f5d17BL6juJOwsXBoju7kHQToEjPetVIYc9OkaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728551585; c=relaxed/simple;
	bh=NClmhjmpH6xYBHomqLQW4g6bmVV37O/WwKvSABcitlo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BAHufSbfZwDaNuV5GRoNojdr3BAF3CUVWpLBg0gHz7qKJae8zIdas1uIw4vy/Dc/tDAu/YlQH+m8R+0h0QC7YUq6+xQzDFTUerndM7Qg+3fJ1r9S95W56zUE5/7VTwVzhzzTb4PcOSx9ztTsbfWCc0+CxalIq1sxKZYFLijc/kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X40xZqBb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728551584; x=1760087584;
  h=date:from:to:cc:subject:message-id;
  bh=NClmhjmpH6xYBHomqLQW4g6bmVV37O/WwKvSABcitlo=;
  b=X40xZqBbfwDQX81RYlFf2qsTykXhuzsDEDlkMmnecZlNcnXKuPfDd0fZ
   JMvB7XWDyJBJzd6MtekDHY9mhtxGr79LNTXq3anvGQYxBuy5dzB0mjoxz
   V1Mwo91+4996BTBOJiMzDo1Pi0xuoe3aNB+vNT7LF0SetVtB1ZX5XXxhm
   uwdAmRHwgLwaPQ4Uk5vkMpEjf429bkdD0HVe3wgoXd9HJVuQq5H7w186P
   hzIpqaJAvrCu/PJvXFisum4maOeOCCQZaNFmMiu75UYwXTiblx0/HN/oF
   jaP2QTNw5CMhMQqcYdkMicoSDvExKnoVINWLQM6shYE2wzs9QmZBI6yl9
   Q==;
X-CSE-ConnectionGUID: vnjTc4t2TtWsnXXhTdHD+w==
X-CSE-MsgGUID: AzC2eoX1TOudE0GtZsqXBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27981321"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="27981321"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 02:13:03 -0700
X-CSE-ConnectionGUID: P+F+V1a2Qvqbu7trs2nPwQ==
X-CSE-MsgGUID: b73OTQCQRUKlICAxWzarLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="80541387"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Oct 2024 02:13:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sypEC-000AY1-0s;
	Thu, 10 Oct 2024 09:13:00 +0000
Date: Thu, 10 Oct 2024 17:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 573cba282788c90b4ed01e21b9d3ba522fdcda17
Message-ID: <202410101735.5maDgP1t-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 573cba282788c90b4ed01e21b9d3ba522fdcda17  pinctrl: th1520: Convert dt child node loop to scoped iterator

elapsed time: 983m

configs tested: 173
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                          axs101_defconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241010    clang-20
arc                   randconfig-002-20241010    clang-20
arc                           tb10x_defconfig    gcc-14.1.0
arc                        vdk_hs38_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                   randconfig-001-20241010    clang-20
arm                   randconfig-002-20241010    clang-20
arm                   randconfig-003-20241010    clang-20
arm                   randconfig-004-20241010    clang-20
arm                         wpcm450_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241010    clang-20
arm64                 randconfig-002-20241010    clang-20
arm64                 randconfig-003-20241010    clang-20
arm64                 randconfig-004-20241010    clang-20
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241010    clang-20
csky                  randconfig-002-20241010    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241010    clang-20
hexagon               randconfig-002-20241010    clang-20
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241010    clang-18
i386        buildonly-randconfig-002-20241010    clang-18
i386        buildonly-randconfig-003-20241010    clang-18
i386        buildonly-randconfig-004-20241010    clang-18
i386        buildonly-randconfig-005-20241010    clang-18
i386        buildonly-randconfig-006-20241010    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241010    clang-18
i386                  randconfig-002-20241010    clang-18
i386                  randconfig-003-20241010    clang-18
i386                  randconfig-004-20241010    clang-18
i386                  randconfig-005-20241010    clang-18
i386                  randconfig-006-20241010    clang-18
i386                  randconfig-011-20241010    clang-18
i386                  randconfig-012-20241010    clang-18
i386                  randconfig-013-20241010    clang-18
i386                  randconfig-014-20241010    clang-18
i386                  randconfig-015-20241010    clang-18
i386                  randconfig-016-20241010    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241010    clang-20
loongarch             randconfig-002-20241010    clang-20
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ci20_defconfig    gcc-14.1.0
mips                     cu1830-neo_defconfig    gcc-14.1.0
mips                          malta_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241010    clang-20
nios2                 randconfig-002-20241010    clang-20
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241010    clang-20
parisc                randconfig-002-20241010    clang-20
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    gcc-14.1.0
powerpc                     mpc83xx_defconfig    gcc-14.1.0
powerpc                      ppc6xx_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241010    clang-20
powerpc               randconfig-002-20241010    clang-20
powerpc               randconfig-003-20241010    clang-20
powerpc                     tqm8541_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241010    clang-20
powerpc64             randconfig-002-20241010    clang-20
powerpc64             randconfig-003-20241010    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.1.0
riscv                 randconfig-001-20241010    clang-20
riscv                 randconfig-002-20241010    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241010    clang-20
s390                  randconfig-002-20241010    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    gcc-14.1.0
sh                            hp6xx_defconfig    gcc-14.1.0
sh                    randconfig-001-20241010    clang-20
sh                    randconfig-002-20241010    clang-20
sh                   sh7770_generic_defconfig    gcc-14.1.0
sh                        sh7785lcr_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241010    clang-20
sparc64               randconfig-002-20241010    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241010    clang-20
um                    randconfig-002-20241010    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    gcc-14.1.0
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241010    gcc-12
x86_64      buildonly-randconfig-002-20241010    gcc-12
x86_64      buildonly-randconfig-003-20241010    gcc-12
x86_64      buildonly-randconfig-004-20241010    gcc-12
x86_64      buildonly-randconfig-005-20241010    gcc-12
x86_64      buildonly-randconfig-006-20241010    gcc-12
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241010    gcc-12
x86_64                randconfig-002-20241010    gcc-12
x86_64                randconfig-003-20241010    gcc-12
x86_64                randconfig-004-20241010    gcc-12
x86_64                randconfig-005-20241010    gcc-12
x86_64                randconfig-006-20241010    gcc-12
x86_64                randconfig-011-20241010    gcc-12
x86_64                randconfig-012-20241010    gcc-12
x86_64                randconfig-013-20241010    gcc-12
x86_64                randconfig-014-20241010    gcc-12
x86_64                randconfig-015-20241010    gcc-12
x86_64                randconfig-016-20241010    gcc-12
x86_64                randconfig-071-20241010    gcc-12
x86_64                randconfig-072-20241010    gcc-12
x86_64                randconfig-073-20241010    gcc-12
x86_64                randconfig-074-20241010    gcc-12
x86_64                randconfig-075-20241010    gcc-12
x86_64                randconfig-076-20241010    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241010    clang-20
xtensa                randconfig-002-20241010    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

