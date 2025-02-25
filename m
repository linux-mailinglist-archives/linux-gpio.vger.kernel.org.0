Return-Path: <linux-gpio+bounces-16591-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A07C9A44E1D
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 21:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BE381896813
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 20:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BDC1A9B58;
	Tue, 25 Feb 2025 20:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HhHiLeQb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A9ADF59
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 20:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740517089; cv=none; b=CMAwwBWBzI2fsE85m+PerkbFVWThA1hK8hOWNevBnTKJIbMTSI4lQelQJnSFoj9wZ2SHOJ5H2F1m2z/yYKRSC/MTvTMiPOASksv0wZcIeiOMgeUxORgvA/AoRuNAONKGRZeIK4Wqi2ILYT5ZEWsNgSaqn6MJrskGLx7vEF0Rk+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740517089; c=relaxed/simple;
	bh=kJboif61TnMGQuN9oL0m+nnYPGVKGJb71dRUpdp28Oc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OaGPqN/fNkpfpH8jhxEXbeSUVZDVqlvs5u0Q7epBCMkKsdGD4XeDUtlPShgDorNsQBuSX32GkUQ8He1z6B9nYXngGDJ/1SsBEl9FPkUdOcYg/43DIrT8836zSgF/vlIglokIxzglvyvAzXDsnRhthvXoeWqq0izHA4aH1WguXn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HhHiLeQb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740517086; x=1772053086;
  h=date:from:to:cc:subject:message-id;
  bh=kJboif61TnMGQuN9oL0m+nnYPGVKGJb71dRUpdp28Oc=;
  b=HhHiLeQb6fmUG99/EIOFPE0YdUJywRl1cfPx5xT1XwXEnQkBIxO8GQJ8
   S0zp+a/9IW3FEko5Gq52ijJ4CSLvdNQJn24zTWOp95+pDICNLDVIIOi3E
   sIFWGroFzzW89OrF0r+1UhUNQMnBXSff69Kdj95faH2JXHX+UWIil7Q3N
   XZ7OKMAXfJESE1Gz2MhCcUBvw7yXQJRStDb1MTESvfuMCnGQZdyeJPSc4
   EIfBttV+T0vt4Y3Ghi4fANcFXhKVKqlxgCHEd+dvh5KNq3IwV2vNNY2Ku
   Qum6kjmTdLzGEO9NOkyJkBQ9NTsAfV+GGydoYm3RFyw6BoWHNkoU6HpRM
   Q==;
X-CSE-ConnectionGUID: 5/YcrD3PTFKePTXXcGG//Q==
X-CSE-MsgGUID: r1M0x7eEQfqHO7yoMDOWTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41548237"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41548237"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 12:58:06 -0800
X-CSE-ConnectionGUID: pqO3XYtJRN2c6TTvIXzW2w==
X-CSE-MsgGUID: xPHiVlHIScGkliR5pY5paA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="116279804"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Feb 2025 12:58:05 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tn205-000Am3-2V;
	Tue, 25 Feb 2025 20:57:59 +0000
Date: Wed, 26 Feb 2025 04:57:17 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 da5dd31efd2465ccc9a70a85bdc325e394256689
Message-ID: <202502260410.LICdog11-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: da5dd31efd2465ccc9a70a85bdc325e394256689  gpio: vf610: Switch to gpio-mmio

Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-051-20250225
|   |-- arch-arm-boot-dts-aspeed-aspeed-bmc-ampere-mtjade.dtb:gpio-1e780000:bmc-ready-does-not-match-any-of-the-regexes:hog(-)-pinctrl
|   |-- arch-arm-boot-dts-aspeed-aspeed-bmc-arm-stardragon4800-rep2.dtb:gpio-1e780000:pin_gpio_c7-pin_gpio_d1-do-not-match-any-of-the-regexes:hog(-)-pinctrl
|   |-- arch-arm-boot-dts-aspeed-aspeed-bmc-asrock-e3c246d4i.dtb:gpio-1e780000:bmc-ready-does-not-match-any-of-the-regexes:hog(-)-pinctrl
|   |-- arch-arm-boot-dts-aspeed-aspeed-bmc-bytedance-g220a.dtb:gpio-1e780000:pin_gpio_b6-pin_gpio_i3-do-not-match-any-of-the-regexes:hog(-)-pinctrl
|   |-- arch-arm-boot-dts-aspeed-aspeed-bmc-delta-ahe50dc.dtb:gpio-1e780000:doom-guardrail-does-not-match-any-of-the-regexes:hog(-)-pinctrl
|   |-- arch-arm-boot-dts-aspeed-aspeed-bmc-ibm-bonnell.dtb:gpio-1e780000:usb_power-does-not-match-any-of-the-regexes:hog(-)-pinctrl
|   |-- arch-arm-boot-dts-aspeed-aspeed-bmc-ibm-everest.dtb:gpio-1e780000:usb_power-does-not-match-any-of-the-regexes:hog(-)-pinctrl
|   |-- arch-arm-boot-dts-aspeed-aspeed-bmc-ibm-rainier-1s4u.dtb:gpio-1e780000:i2c3_mux_oe_n-usb_power-do-not-match-any-of-the-regexes:hog(-)-pinctrl
|   |-- arch-arm-boot-dts-aspeed-aspeed-bmc-ibm-rainier-4u.dtb:gpio-1e780000:i2c3_mux_oe_n-usb_power-do-not-match-any-of-the-regexes:hog(-)-pinctrl
|   |-- arch-arm-boot-dts-aspeed-aspeed-bmc-ibm-rainier.dtb:gpio-1e780000:i2c3_mux_oe_n-usb_power-do-not-match-any-of-the-regexes:hog(-)-pinctrl
|   |-- arch-arm-boot-dts-aspeed-aspeed-bmc-opp-lanyang.dtb:gpio-1e780000:pin_gpio_aa6-pin_gpio_aa7-pin_gpio_ab0-pin_gpio_b0-pin_gpio_b5-pin_gpio_h5-pin_gpio_z2-do-not-match-any-of-the-regexes:hog(-)-pinctrl
|   |-- arch-arm-boot-dts-aspeed-aspeed-bmc-opp-nicole.dtb:gpio-1e780000:func_mode0-func_mode1-func_mode2-ncsi_cfg-seq_cont-do-not-match-any-of-the-regexes:hog(-)-pinctrl
|   |-- arch-arm-boot-dts-aspeed-aspeed-bmc-opp-romulus.dtb:gpio-1e780000:nic_func_mode0-nic_func_mode1-seq_cont-do-not-match-any-of-the-regexes:hog(-)-pinctrl
|   `-- arch-arm-boot-dts-aspeed-aspeed-bmc-opp-zaius.dtb:gpio-1e780000:line_bmc_i2c2_sw_rst_n-line_bmc_i2c5_sw_rst_n-line_iso_u146_en-ncsi_mux_en_n-do-not-match-any-of-the-regexes:hog(-)-pinctrl
`-- arm-randconfig-052-20250225
    |-- arch-arm-boot-dts-aspeed-aspeed-bmc-ampere-mtjade.dtb:gpio-1e780000:bmc-ready-does-not-match-any-of-the-regexes:hog(-)-pinctrl
    |-- arch-arm-boot-dts-aspeed-aspeed-bmc-arm-stardragon4800-rep2.dtb:gpio-1e780000:pin_gpio_c7-pin_gpio_d1-do-not-match-any-of-the-regexes:hog(-)-pinctrl
    |-- arch-arm-boot-dts-aspeed-aspeed-bmc-asrock-e3c246d4i.dtb:gpio-1e780000:bmc-ready-does-not-match-any-of-the-regexes:hog(-)-pinctrl
    |-- arch-arm-boot-dts-aspeed-aspeed-bmc-bytedance-g220a.dtb:gpio-1e780000:pin_gpio_b6-pin_gpio_i3-do-not-match-any-of-the-regexes:hog(-)-pinctrl
    |-- arch-arm-boot-dts-aspeed-aspeed-bmc-delta-ahe50dc.dtb:gpio-1e780000:doom-guardrail-does-not-match-any-of-the-regexes:hog(-)-pinctrl
    |-- arch-arm-boot-dts-aspeed-aspeed-bmc-ibm-bonnell.dtb:gpio-1e780000:usb_power-does-not-match-any-of-the-regexes:hog(-)-pinctrl
    |-- arch-arm-boot-dts-aspeed-aspeed-bmc-ibm-everest.dtb:gpio-1e780000:usb_power-does-not-match-any-of-the-regexes:hog(-)-pinctrl
    |-- arch-arm-boot-dts-aspeed-aspeed-bmc-ibm-rainier-1s4u.dtb:gpio-1e780000:i2c3_mux_oe_n-usb_power-do-not-match-any-of-the-regexes:hog(-)-pinctrl
    |-- arch-arm-boot-dts-aspeed-aspeed-bmc-ibm-rainier-4u.dtb:gpio-1e780000:i2c3_mux_oe_n-usb_power-do-not-match-any-of-the-regexes:hog(-)-pinctrl
    |-- arch-arm-boot-dts-aspeed-aspeed-bmc-ibm-rainier.dtb:gpio-1e780000:i2c3_mux_oe_n-usb_power-do-not-match-any-of-the-regexes:hog(-)-pinctrl
    |-- arch-arm-boot-dts-aspeed-aspeed-bmc-opp-lanyang.dtb:gpio-1e780000:pin_gpio_aa6-pin_gpio_aa7-pin_gpio_ab0-pin_gpio_b0-pin_gpio_b5-pin_gpio_h5-pin_gpio_z2-do-not-match-any-of-the-regexes:hog(-)-pinctrl
    |-- arch-arm-boot-dts-aspeed-aspeed-bmc-opp-nicole.dtb:gpio-1e780000:func_mode0-func_mode1-func_mode2-ncsi_cfg-seq_cont-do-not-match-any-of-the-regexes:hog(-)-pinctrl
    |-- arch-arm-boot-dts-aspeed-aspeed-bmc-opp-romulus.dtb:gpio-1e780000:nic_func_mode0-nic_func_mode1-seq_cont-do-not-match-any-of-the-regexes:hog(-)-pinctrl
    `-- arch-arm-boot-dts-aspeed-aspeed-bmc-opp-zaius.dtb:gpio-1e780000:line_bmc_i2c2_sw_rst_n-line_bmc_i2c5_sw_rst_n-line_iso_u146_en-ncsi_mux_en_n-do-not-match-any-of-the-regexes:hog(-)-pinctrl

elapsed time: 1455m

configs tested: 88
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                           allyesconfig    gcc-14.2.0
alpha                              defconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250225    gcc-13.2.0
arc                  randconfig-002-20250225    gcc-13.2.0
arm                             alldefconfig    gcc-14.2.0
arm                             allmodconfig    gcc-14.2.0
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250225    gcc-14.2.0
arm                  randconfig-002-20250225    gcc-14.2.0
arm                  randconfig-003-20250225    gcc-14.2.0
arm                  randconfig-004-20250225    clang-15
arm64                           allmodconfig    clang-18
arm64                randconfig-001-20250225    clang-19
arm64                randconfig-002-20250225    clang-17
arm64                randconfig-003-20250225    clang-15
arm64                randconfig-004-20250225    clang-21
csky                 randconfig-001-20250225    gcc-14.2.0
csky                 randconfig-002-20250225    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250225    clang-21
hexagon              randconfig-002-20250225    clang-21
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250225    clang-19
i386       buildonly-randconfig-002-20250225    gcc-11
i386       buildonly-randconfig-003-20250225    clang-19
i386       buildonly-randconfig-004-20250225    clang-19
i386       buildonly-randconfig-005-20250225    gcc-12
i386       buildonly-randconfig-006-20250225    clang-19
i386                               defconfig    clang-19
loongarch                       allmodconfig    gcc-14.2.0
loongarch            randconfig-001-20250225    gcc-14.2.0
loongarch            randconfig-002-20250225    gcc-14.2.0
m68k                            allmodconfig    gcc-14.2.0
m68k                            allyesconfig    gcc-14.2.0
m68k                       m5272c3_defconfig    gcc-14.2.0
mips                         eyeq5_defconfig    gcc-14.2.0
nios2                randconfig-001-20250225    gcc-14.2.0
nios2                randconfig-002-20250225    gcc-14.2.0
openrisc                        allyesconfig    gcc-14.2.0
parisc                          allmodconfig    gcc-14.2.0
parisc                          allyesconfig    gcc-14.2.0
parisc               randconfig-001-20250225    gcc-14.2.0
parisc               randconfig-002-20250225    gcc-14.2.0
powerpc                         allmodconfig    gcc-14.2.0
powerpc                         allyesconfig    clang-16
powerpc              randconfig-001-20250225    gcc-14.2.0
powerpc              randconfig-002-20250225    clang-19
powerpc              randconfig-003-20250225    clang-21
powerpc64            randconfig-001-20250225    gcc-14.2.0
powerpc64            randconfig-002-20250225    gcc-14.2.0
powerpc64            randconfig-003-20250225    gcc-14.2.0
riscv                           allmodconfig    clang-21
riscv                           allyesconfig    clang-21
riscv                randconfig-001-20250225    clang-15
riscv                randconfig-002-20250225    clang-21
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250225    clang-15
s390                 randconfig-002-20250225    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250225    gcc-14.2.0
sh                   randconfig-002-20250225    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250225    gcc-14.2.0
sparc                randconfig-002-20250225    gcc-14.2.0
sparc64              randconfig-001-20250225    gcc-14.2.0
sparc64              randconfig-002-20250225    gcc-14.2.0
um                              allmodconfig    clang-21
um                              allyesconfig    gcc-12
um                   randconfig-001-20250225    clang-21
um                   randconfig-002-20250225    gcc-12
x86_64                           allnoconfig    clang-19
x86_64                          allyesconfig    clang-19
x86_64     buildonly-randconfig-001-20250225    gcc-12
x86_64     buildonly-randconfig-002-20250225    clang-19
x86_64     buildonly-randconfig-003-20250225    clang-19
x86_64     buildonly-randconfig-004-20250225    gcc-11
x86_64     buildonly-randconfig-005-20250225    gcc-12
x86_64     buildonly-randconfig-006-20250225    clang-19
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250225    gcc-14.2.0
xtensa               randconfig-002-20250225    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

