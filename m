Return-Path: <linux-gpio+bounces-10083-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 086BF978CF3
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 05:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C04E2286CE7
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 03:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E64D268;
	Sat, 14 Sep 2024 03:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ng+u0oid"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A465E3D62
	for <linux-gpio@vger.kernel.org>; Sat, 14 Sep 2024 03:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726282960; cv=none; b=c43gI5fYLpXdrdJ/sp5lI64O6Bk1hL1Z9TTK31R8wPLR93qzcJbjNeZgWBQfkSSB44uTWGCp9E4IzvfRug0FRAAz1Z691GVUPr3l/mu1lDKH5BUksoBFNksB69mIvP6h3PYPz8KOOb5Q6jF5eseZ710TPq1Amy1P19gduptV6J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726282960; c=relaxed/simple;
	bh=u9pQKKcAn3Nnm+NmUEE5Jzr0nMfMXvhtzWy145eavIY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ChmJDE3t9s66bGanRZJR0atrgoBdyUaucavDKk5BhF+6PXDZrtuYXZOgNVyAlbxa0cF/oipY9/b2zgUTW4HJVbwMCMJ7KO5Wah60IOubeKGKHpaJIUhG4B3MWRMcHlVYdKSnlyoO8XOHVZ5Z6Mt2bxq/4rSi9iiN0RGIPT4cNNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ng+u0oid; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726282959; x=1757818959;
  h=date:from:to:cc:subject:message-id;
  bh=u9pQKKcAn3Nnm+NmUEE5Jzr0nMfMXvhtzWy145eavIY=;
  b=Ng+u0oid1EV4sePeDx3I3mMnpteBLMqmE5bUW5w3Vg8m52Nq0GN6wJM7
   gAMdYBXEen2cx3eb874bZZZmWFiFuQ2Y2ZD86j8EJDu/JB4K59Srhd2k4
   9Pzg2DSuXA9ACyEx45ulyyUWr2KwfvVCp//XylUZckkhGbc96Ms/0hAFm
   A5J01WILEdaCtlKhdRAp8EOXVRK7zu/7Mbes/5e3GcK1w/2pylJD7H5tN
   1ikYzaEUrwYQWsFTitkJEFueUPvlHDnTlKIJRcYsAvuuySO9Z3EWT4YMJ
   mkFGBhThH2MR/m4Rr57NXoYMvv/IFiWaaI3dfRdcmIi+VptjOk5MMrmVL
   Q==;
X-CSE-ConnectionGUID: FYmaPe1gRfKCYOJJVxGb4A==
X-CSE-MsgGUID: XvJHehJGQgu7GK4fiGLE/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35770944"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="35770944"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 20:02:38 -0700
X-CSE-ConnectionGUID: FJFEik1rRnCEGVSUW662ng==
X-CSE-MsgGUID: kSZhw2ZoTvWYsekydE86Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="67981394"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Sep 2024 20:02:36 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spJ3S-0007IM-1s;
	Sat, 14 Sep 2024 03:02:34 +0000
Date: Sat, 14 Sep 2024 11:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 b8b23101552df8bab3756a2ff9169d8b9619ce02
Message-ID: <202409141147.VSLWvsRM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: b8b23101552df8bab3756a2ff9169d8b9619ce02  Merge branch 'devel' into for-next

elapsed time: 891m

configs tested: 106
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                      jornada720_defconfig    clang-20
arm                            mmp2_defconfig    clang-20
arm                        multi_v5_defconfig    clang-20
arm                         wpcm450_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240914    clang-18
i386        buildonly-randconfig-002-20240914    clang-18
i386        buildonly-randconfig-003-20240914    clang-18
i386        buildonly-randconfig-004-20240914    clang-18
i386        buildonly-randconfig-005-20240914    clang-18
i386        buildonly-randconfig-006-20240914    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240914    clang-18
i386                  randconfig-002-20240914    clang-18
i386                  randconfig-003-20240914    clang-18
i386                  randconfig-004-20240914    clang-18
i386                  randconfig-005-20240914    clang-18
i386                  randconfig-006-20240914    clang-18
i386                  randconfig-011-20240914    clang-18
i386                  randconfig-012-20240914    clang-18
i386                  randconfig-013-20240914    clang-18
i386                  randconfig-014-20240914    clang-18
i386                  randconfig-015-20240914    clang-18
i386                  randconfig-016-20240914    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5249evb_defconfig    clang-20
m68k                        m5307c3_defconfig    clang-20
m68k                          multi_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        omega2p_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                 simple_smp_defconfig    clang-20
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                    adder875_defconfig    clang-20
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                   bluestone_defconfig    clang-20
riscv                            alldefconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                           se7705_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

