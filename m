Return-Path: <linux-gpio+bounces-11234-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A498199B363
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 13:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C6C01C2236A
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 11:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C23155325;
	Sat, 12 Oct 2024 11:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/4rqjiB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6ED15099D
	for <linux-gpio@vger.kernel.org>; Sat, 12 Oct 2024 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728732065; cv=none; b=jGDX0X2/O2TEapYTEZrzEstoE2KeHZTZeW85QOcdgjWqrJo3qSNFOI4/TKbntLutIGPE9zWE8f+CX7YXZMaYTmy+rouoQ0a2kRebJoJzBtvu4hb5qgsB9m4xOYk2mRETZ+8l+iDnO3AAN5Iemo9xAxChNqycmGusHEt7M6CDhas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728732065; c=relaxed/simple;
	bh=lXhugFGDLWS1qdDCh7vLF3NlVueMIwLjMkCNKNtROYo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iBCs7yimKYMerOlqSMeZ66M4JmYuYmrknTeurvQORKGCMp2zZVXA94Dn/3Ozu9Jss9iC7WtX3K5+ZQoycVuT+TAT84f+pawqT4dmQUvgrBAAMkTxpMa/u+SvK+S9i2yV19o5Epc8PIswyXQtSTJai4QIevtEL9Y4lOEm2cnw37Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/4rqjiB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728732063; x=1760268063;
  h=date:from:to:cc:subject:message-id;
  bh=lXhugFGDLWS1qdDCh7vLF3NlVueMIwLjMkCNKNtROYo=;
  b=k/4rqjiBcbXPJSy8/xWcBbCPVBO07kuCONkd9ZUCaMqTMAUoPQHr74Xo
   XQRkcO+D8a3Xz6hAuNYhU7dB/SdrPdMV6Xsyg8aV2RRKRYkwD/ewdfQHm
   ob42FoJkHkAi/ZKBlDCAsknV/748wGAgyKhjhEI6ACqXtI4g1l0L3OTGn
   HOBedqGsioVv/HCV/vw5plxoQ4KTP1mLglddLZ1mcqjGlJ7+tCeDXIQ6P
   dKTti5kNSrur47Ep/aQebkwU0/az2jdOMOQpxqx9oOBg9EqBjiZB9XTFS
   XsZcbztita233l0sn9Ge1JpIWUgxd2jZVZMwnVbM57wbb9oqwl2GZf/bD
   w==;
X-CSE-ConnectionGUID: zMDoPySrQsmHt0ZRkYYu2Q==
X-CSE-MsgGUID: U6dJH3FFRpmn6mMdG8sYig==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39514617"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="39514617"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 04:21:03 -0700
X-CSE-ConnectionGUID: aqbinJVKTEefoX27yraUkw==
X-CSE-MsgGUID: zhmv7hIUTUa8iSKsG0R0sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="77144931"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Oct 2024 04:21:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szaB9-000DJP-1U;
	Sat, 12 Oct 2024 11:20:59 +0000
Date: Sat, 12 Oct 2024 19:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 2a85fc7044987d751f27d7f1e4423eebbcecc2c6
Message-ID: <202410121914.TA5uc2np-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 2a85fc7044987d751f27d7f1e4423eebbcecc2c6  pinctrl: zynqmp: drop excess struct member description

elapsed time: 1502m

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
arc                                 defconfig    gcc-14.1.0
arc                         haps_hs_defconfig    gcc-14.1.0
arc                   randconfig-001-20241012    clang-15
arc                   randconfig-002-20241012    clang-15
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                       aspeed_g5_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                       imx_v6_v7_defconfig    gcc-14.1.0
arm                   milbeaut_m10v_defconfig    gcc-14.1.0
arm                       multi_v4t_defconfig    gcc-14.1.0
arm                        mvebu_v5_defconfig    gcc-14.1.0
arm                        mvebu_v7_defconfig    gcc-14.1.0
arm                   randconfig-001-20241012    clang-15
arm                   randconfig-002-20241012    clang-15
arm                   randconfig-003-20241012    clang-15
arm                   randconfig-004-20241012    clang-15
arm                         vf610m4_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241012    clang-15
arm64                 randconfig-002-20241012    clang-15
arm64                 randconfig-003-20241012    clang-15
arm64                 randconfig-004-20241012    clang-15
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241012    clang-15
csky                  randconfig-002-20241012    clang-15
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241012    clang-15
hexagon               randconfig-002-20241012    clang-15
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241012    gcc-12
i386        buildonly-randconfig-002-20241012    gcc-12
i386        buildonly-randconfig-003-20241012    gcc-12
i386        buildonly-randconfig-004-20241012    gcc-12
i386        buildonly-randconfig-005-20241012    gcc-12
i386        buildonly-randconfig-006-20241012    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241012    gcc-12
i386                  randconfig-002-20241012    gcc-12
i386                  randconfig-003-20241012    gcc-12
i386                  randconfig-004-20241012    gcc-12
i386                  randconfig-005-20241012    gcc-12
i386                  randconfig-006-20241012    gcc-12
i386                  randconfig-011-20241012    gcc-12
i386                  randconfig-012-20241012    gcc-12
i386                  randconfig-013-20241012    gcc-12
i386                  randconfig-014-20241012    gcc-12
i386                  randconfig-015-20241012    gcc-12
i386                  randconfig-016-20241012    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241012    clang-15
loongarch             randconfig-002-20241012    clang-15
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        mvme16x_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241012    clang-15
nios2                 randconfig-002-20241012    clang-15
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241012    clang-15
parisc                randconfig-002-20241012    clang-15
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      arches_defconfig    gcc-14.1.0
powerpc                   bluestone_defconfig    gcc-14.1.0
powerpc                 mpc8313_rdb_defconfig    gcc-14.1.0
powerpc               mpc834x_itxgp_defconfig    gcc-14.1.0
powerpc                       ppc64_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241012    clang-15
powerpc               randconfig-002-20241012    clang-15
powerpc               randconfig-003-20241012    clang-15
powerpc                    sam440ep_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241012    clang-15
powerpc64             randconfig-002-20241012    clang-15
powerpc64             randconfig-003-20241012    clang-15
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241012    clang-15
riscv                 randconfig-002-20241012    clang-15
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241012    clang-15
s390                  randconfig-002-20241012    clang-15
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          kfr2r09_defconfig    gcc-14.1.0
sh                    randconfig-001-20241012    clang-15
sh                    randconfig-002-20241012    clang-15
sh                           se7724_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241012    clang-15
sparc64               randconfig-002-20241012    clang-15
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241012    clang-15
um                    randconfig-002-20241012    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241012    clang-18
x86_64      buildonly-randconfig-002-20241012    clang-18
x86_64      buildonly-randconfig-003-20241012    clang-18
x86_64      buildonly-randconfig-004-20241012    clang-18
x86_64      buildonly-randconfig-005-20241012    clang-18
x86_64      buildonly-randconfig-006-20241012    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241012    clang-18
x86_64                randconfig-002-20241012    clang-18
x86_64                randconfig-003-20241012    clang-18
x86_64                randconfig-004-20241012    clang-18
x86_64                randconfig-005-20241012    clang-18
x86_64                randconfig-006-20241012    clang-18
x86_64                randconfig-011-20241012    clang-18
x86_64                randconfig-012-20241012    clang-18
x86_64                randconfig-013-20241012    clang-18
x86_64                randconfig-014-20241012    clang-18
x86_64                randconfig-015-20241012    clang-18
x86_64                randconfig-016-20241012    clang-18
x86_64                randconfig-071-20241012    clang-18
x86_64                randconfig-072-20241012    clang-18
x86_64                randconfig-073-20241012    clang-18
x86_64                randconfig-074-20241012    clang-18
x86_64                randconfig-075-20241012    clang-18
x86_64                randconfig-076-20241012    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241012    clang-15
xtensa                randconfig-002-20241012    clang-15

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

