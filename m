Return-Path: <linux-gpio+bounces-29272-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AD8CA5C90
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 02:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C199D30F69C3
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 01:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD031F03D9;
	Fri,  5 Dec 2025 01:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="if5Z2HaJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0602629D
	for <linux-gpio@vger.kernel.org>; Fri,  5 Dec 2025 01:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764896810; cv=none; b=u7EpB4pwERaauzuKxxatcVp73fNY+YaLBPVyn29CZnMnGP2IB/cEyaoiIQEx3Hap0IzxnIIw2b337o6yVHNC44sPRl+clxzlJSTuB/ZbYMrXTSPpJtSZIzqheeaD2dbiijxETpfjITfgJhNHj56cOwujiUFZ76uTNKEoyp9CVRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764896810; c=relaxed/simple;
	bh=Ef0wz7fiJduxXDFK5UsXbV8/X5dq8z3p+V/1nUMsBcQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LDA/Lu579B/5yIpECqHmLYE1+sdJDgKtpAyYdwzninx6cb6ofAItSeUjZjbfBaJhlHbIAoNcIzzsRqBv9aF2oweip6wcwuD3dZ2EUo93k+2x2U6NVNsrEfqD2sJp47AFj9V0HVnjz85l6OG0S9zTTEnYypfBHopnWwaz4WwMRy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=if5Z2HaJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764896808; x=1796432808;
  h=date:from:to:cc:subject:message-id;
  bh=Ef0wz7fiJduxXDFK5UsXbV8/X5dq8z3p+V/1nUMsBcQ=;
  b=if5Z2HaJE1fWHI7yInCiu7yVNHHXIkHok5Jadj8MS1fxBnqd5oGWkRsT
   AQ53qy5jculohWDq5KX/Opch2CvOT9EZM1AXsyP7qnuZzDcuQLcIWqZDE
   4qQnF1VSZorzXkN0YMDUQsUDCDVHU1SYud0W8mZi9Go7xlAGacOM4xiA5
   0jqEGsta5DcitilsUtKQBszGITRdIBfi6W+VJ2sErRLGsno4pRRhXzcNq
   b2FEQYPfdpGoxgvgYtCgX8A+o7WUU5QeLFdCmDOvp7nbanW10Ie0l/esB
   OoflCRMq4WCdniaxOrym6VH292iLFVzCuqxY6iGLPthIxKma8OrlB+zXX
   g==;
X-CSE-ConnectionGUID: 9VpUF8MQSSO4PsxUsOsE3Q==
X-CSE-MsgGUID: cCewFPioTCWDTOxZraxNCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78395316"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="78395316"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 17:06:48 -0800
X-CSE-ConnectionGUID: hPG/zW+lSXeETWS6De3SsA==
X-CSE-MsgGUID: 4tAb79vER4emU2zA3OZiWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="194950599"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Dec 2025 17:06:47 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRKHU-00000000EQV-0jEe;
	Fri, 05 Dec 2025 01:06:44 +0000
Date: Fri, 05 Dec 2025 09:05:48 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD REGRESSION
 9dc966799ac9a2573d970080334a801fcc283a1b
Message-ID: <202512050940.2y4QsBv5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 9dc966799ac9a2573d970080334a801fcc283a1b  pinctrl: starfive: use dynamic GPIO base allocation

Error/Warning (recently discovered and may have been fixed):

    include/linux/pinctrl/pinconf-generic.h:250:(.text+0x8bdd90): undefined reference to `pinconf_generic_dt_node_to_map'
    ld.lld: error: undefined symbol: pinconf_generic_dt_node_to_map
    pinctrl-pic64gx-gpio2.c:(.rodata.cst4+0x4): undefined reference to `pinconf_generic_dt_node_to_map'
    pinctrl-pic64gx-gpio2.c:(.text+0x1b2): undefined reference to `pinconf_generic_dt_node_to_map'
    pinctrl-pic64gx-gpio2.c:(.text+0x1d8): undefined reference to `pinconf_generic_dt_node_to_map'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- i386-buildonly-randconfig-006-20251204
|   `-- ld.lld:error:undefined-symbol:pinconf_generic_dt_node_to_map
|-- parisc-randconfig-002-20251204
|   `-- pinctrl-pic64gx-gpio2.c:(.rodata.cst4):undefined-reference-to-pinconf_generic_dt_node_to_map
|-- s390-randconfig-002-20251205
|   `-- ld.lld:error:undefined-symbol:pinconf_generic_dt_node_to_map
|-- um-randconfig-002-20251205
|   `-- pinctrl-pic64gx-gpio2.c:(.text):undefined-reference-to-pinconf_generic_dt_node_to_map
|-- x86_64-buildonly-randconfig-003-20251205
|   `-- pinctrl-pic64gx-gpio2.c:(.text):undefined-reference-to-pinconf_generic_dt_node_to_map
`-- x86_64-buildonly-randconfig-006-20251205
    `-- include-linux-pinctrl-pinconf-generic.h:(.text):undefined-reference-to-pinconf_generic_dt_node_to_map

elapsed time: 1465m

configs tested: 89
configs skipped: 3

tested configs:
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251205    gcc-8.5.0
arc                   randconfig-002-20251205    gcc-9.5.0
arm                   randconfig-001-20251205    gcc-8.5.0
arm                   randconfig-002-20251205    gcc-8.5.0
arm                   randconfig-003-20251205    gcc-13.4.0
arm                   randconfig-004-20251205    gcc-8.5.0
arm                       versatile_defconfig    gcc-15.1.0
arm64                 randconfig-001-20251205    clang-22
arm64                 randconfig-002-20251205    clang-22
arm64                 randconfig-003-20251205    gcc-8.5.0
arm64                 randconfig-004-20251205    clang-22
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251205    gcc-15.1.0
csky                  randconfig-002-20251205    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251205    clang-22
hexagon               randconfig-002-20251205    clang-22
i386                             allmodconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251204    gcc-14
i386        buildonly-randconfig-002-20251204    clang-20
i386        buildonly-randconfig-003-20251204    clang-20
i386        buildonly-randconfig-004-20251204    gcc-14
i386        buildonly-randconfig-005-20251204    clang-20
i386        buildonly-randconfig-006-20251204    clang-20
i386                                defconfig    clang-20
i386                  randconfig-002-20251205    gcc-14
i386                  randconfig-003-20251205    clang-20
loongarch             randconfig-001-20251205    clang-22
loongarch             randconfig-002-20251205    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251205    gcc-10.5.0
nios2                 randconfig-002-20251205    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251205    gcc-8.5.0
parisc                randconfig-002-20251205    gcc-14.3.0
parisc64                         alldefconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251205    clang-18
powerpc               randconfig-002-20251205    clang-18
powerpc64             randconfig-001-20251205    gcc-15.1.0
powerpc64             randconfig-002-20251205    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251205    gcc-13.4.0
riscv                 randconfig-002-20251205    gcc-8.5.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251205    gcc-11.5.0
s390                  randconfig-002-20251205    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                    randconfig-001-20251205    gcc-13.4.0
sh                    randconfig-002-20251205    gcc-12.5.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251205    gcc-14.3.0
sparc                 randconfig-002-20251205    gcc-8.5.0
sparc64               randconfig-001-20251205    gcc-8.5.0
sparc64               randconfig-002-20251205    gcc-10.5.0
um                                allnoconfig    clang-22
um                    randconfig-001-20251205    gcc-14
um                    randconfig-002-20251205    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251205    clang-20
x86_64      buildonly-randconfig-002-20251205    gcc-14
x86_64      buildonly-randconfig-003-20251205    gcc-12
x86_64      buildonly-randconfig-004-20251205    clang-20
x86_64      buildonly-randconfig-005-20251205    clang-20
x86_64      buildonly-randconfig-006-20251205    gcc-14
x86_64                randconfig-001-20251205    clang-20
x86_64                randconfig-002-20251205    gcc-14
x86_64                randconfig-003-20251205    gcc-14
x86_64                randconfig-004-20251205    clang-20
x86_64                randconfig-005-20251205    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251205    gcc-10.5.0
xtensa                randconfig-002-20251205    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

