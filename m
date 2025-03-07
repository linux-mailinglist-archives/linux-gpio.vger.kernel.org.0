Return-Path: <linux-gpio+bounces-17223-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 392F0A562D8
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 09:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A8DA16FD81
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 08:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C6115746E;
	Fri,  7 Mar 2025 08:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvqVIw8H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947B11A5B89
	for <linux-gpio@vger.kernel.org>; Fri,  7 Mar 2025 08:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741337122; cv=none; b=Amzc2h2DcqLufAIR5tyNYq/6hu7ckNGb3CYJScmF+e7qUnONrR3HyXGxB2PdSsuCY8tvBaOOxbHZrU5MAZAJHJiNL4lJbUGUhnbdZ30z7ZJYgRXWx9SiTPuNyZRl2CeXy9YYLJV/T/wqdH+R9k9OlVncD4f/idtZe8NL2lygkBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741337122; c=relaxed/simple;
	bh=EQDPh2GlIEJFBYkBCNx6fvhSI27Fh7wtpC/L+q+4gmI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ClYsGhhbBogmiiB4v2GwvQeFKrsRVEgh13YXLapCshQEQsA/z3T4+a/P+npIfJx6ldNtW8vyzoYWAd+lJ8JPgNaXYmHQDZTn6hl0aX+ieVXC33+VxlQ0Wn5g0KWC9ASR/potrCgXc7JtzkLzVMjj9tK4vLxq7f2F6V4mlYSRJU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvqVIw8H; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741337119; x=1772873119;
  h=date:from:to:cc:subject:message-id;
  bh=EQDPh2GlIEJFBYkBCNx6fvhSI27Fh7wtpC/L+q+4gmI=;
  b=mvqVIw8HynqZABmC8M/jq7AVM/0myrJdqSA8vRAPJGUZysjRg25yBbGt
   o/nPs4snH6golr4ASpWM/bWKc46D1+Tz768v32Ie+GAVJx+O6TMYGdrI4
   f8NMp2U7pZ9ux3Qv2gTmq6soR2wdEWGIzanmtrMKlqkd7/S/o/h1PI4dc
   HLS+vx9z++kcvaB5KDrUP3vVpxygOccnrf/CHvQNbf8iT7Sr/EfgG/UHm
   ia+8/+6kMOB9LIANz2QicNJIMYtFJzzNHRPo3bA0tWrk1LVFoN4PDdwNQ
   adC5ryGDbbR3tin1qrepYpEhvdzs6jNR3BgHcrRq1WBDLOJ7OcJiP8Egh
   w==;
X-CSE-ConnectionGUID: dUr9iJPwSiaS2n94Llh1nw==
X-CSE-MsgGUID: eW5lHKYDQoqxEt/vHNeVGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53019739"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="53019739"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 00:45:19 -0800
X-CSE-ConnectionGUID: PbpQIhVES3CqdjF4o0EkvQ==
X-CSE-MsgGUID: xNYl7nMgQSSN6RIOxhryog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="124189337"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 07 Mar 2025 00:45:17 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqTKV-0000BP-1L;
	Fri, 07 Mar 2025 08:45:15 +0000
Date: Fri, 07 Mar 2025 16:44:17 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 9b443b68d97983dfb9a92009a5c951364fa35985
Message-ID: <202503071611.PVJPjY2y-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 9b443b68d97983dfb9a92009a5c951364fa35985  gpiolib: fix kerneldoc

Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-051-20250307
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
|-- arm-randconfig-052-20250307
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
|-- arm-randconfig-053-20250307
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
|-- arm-randconfig-054-20250307
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
|-- i386-randconfig-141-20250307
|   `-- drivers-gpio-gpiolib.c-gpiochip_set_multiple()-error:uninitialized-symbol-ret-.
`-- x86_64-randconfig-161-20250307
    `-- drivers-gpio-gpiolib.c-gpiochip_set_multiple()-error:uninitialized-symbol-ret-.

elapsed time: 1451m

configs tested: 106
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250306    gcc-13.2.0
arc                   randconfig-002-20250306    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                   randconfig-001-20250306    gcc-14.2.0
arm                   randconfig-002-20250306    gcc-14.2.0
arm                   randconfig-003-20250306    gcc-14.2.0
arm                   randconfig-004-20250306    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250306    gcc-14.2.0
arm64                 randconfig-002-20250306    gcc-14.2.0
arm64                 randconfig-003-20250306    gcc-14.2.0
arm64                 randconfig-004-20250306    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250306    gcc-14.2.0
csky                  randconfig-002-20250306    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250306    clang-21
hexagon               randconfig-002-20250306    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250306    clang-19
i386        buildonly-randconfig-002-20250306    clang-19
i386        buildonly-randconfig-003-20250306    clang-19
i386        buildonly-randconfig-004-20250306    gcc-12
i386        buildonly-randconfig-005-20250306    gcc-12
i386        buildonly-randconfig-006-20250306    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250306    gcc-14.2.0
loongarch             randconfig-002-20250306    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250306    gcc-14.2.0
nios2                 randconfig-002-20250306    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250306    gcc-14.2.0
parisc                randconfig-002-20250306    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     asp8347_defconfig    clang-21
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250306    clang-21
powerpc               randconfig-002-20250306    clang-18
powerpc               randconfig-003-20250306    gcc-14.2.0
powerpc64             randconfig-001-20250306    clang-18
powerpc64             randconfig-002-20250306    clang-21
powerpc64             randconfig-003-20250306    clang-18
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250306    clang-18
riscv                 randconfig-002-20250306    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250306    gcc-14.2.0
s390                  randconfig-002-20250306    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                    randconfig-001-20250306    gcc-14.2.0
sh                    randconfig-002-20250306    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250306    gcc-14.2.0
sparc                 randconfig-002-20250306    gcc-14.2.0
sparc64               randconfig-001-20250306    gcc-14.2.0
sparc64               randconfig-002-20250306    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250306    gcc-12
um                    randconfig-002-20250306    clang-16
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250306    gcc-11
x86_64      buildonly-randconfig-002-20250306    clang-19
x86_64      buildonly-randconfig-003-20250306    clang-19
x86_64      buildonly-randconfig-004-20250306    clang-19
x86_64      buildonly-randconfig-005-20250306    clang-19
x86_64      buildonly-randconfig-006-20250306    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250306    gcc-14.2.0
xtensa                randconfig-002-20250306    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

