Return-Path: <linux-gpio+bounces-15829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9E5A32276
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 10:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B57F163D5F
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 09:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A7C2066FA;
	Wed, 12 Feb 2025 09:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ftY/2LXY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEFB2080FC
	for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 09:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739352997; cv=none; b=Cp1CqrDbaZg/dT2pExgNUqL5MDUwalfb+LVTMkLr54aGDk0bsyAcO75wbAAZ9fmJJklgyLFYi30OOuXHrZA3q0Q93RpjBYek7XZ63/JcQjLN9KprYUr+tNq3a+aYnRGB1ltDfI64XHMkw4k0KzMmohuOpv0Kge9G4yNAsPuz1pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739352997; c=relaxed/simple;
	bh=cNjaSRglYF1vpFh+Ab/sBTN0WiVYSBjbRlYu9AyGoKY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WKtxrI6smvgRtOFxY+0RHVwmiLIMy6dtK26lofQWXjBBjchLULV/fVaAufXNcdc4ZpzSTLBqmeNESbUm0YgN6MwMT5QPMqkIlwCz3mOOGWbmazDPZB4fGo3JiXaaBT91IWgqIy394vLANVmq6VrthlhhD7eiDg0vNFMQ01w+1C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ftY/2LXY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739352995; x=1770888995;
  h=date:from:to:cc:subject:message-id;
  bh=cNjaSRglYF1vpFh+Ab/sBTN0WiVYSBjbRlYu9AyGoKY=;
  b=ftY/2LXYR3uoadLcDr4+n1laQ8iVkLJGxbdV7D7/jJeEbtVAyOH/xfz8
   pzdzTbztLUaQVsZx6VCVqdemVlsP227qEEyCpYeSp91wErpS1K4+gj5bw
   TCjcp9HeV9AOVVggxdBcTsyEMZK5c7R4G9IQtmbDYLSHyslG8OLdbSCWs
   oliGkV5H7HLxZV8l99ARxnYhhMpyIlHPpo+6LwPs8+nTNwZnchp4YqCO1
   UwLx6a0NnJJ/P+/P3wf53KO8192gtxAh9nWBqyo33wZkomejLCjPV5Gy1
   O4sM8TZFrFnxYDQ3uvWaHAY0SxjM8/xhwoUEmA3lL4Br1UtFDQzLdRESc
   A==;
X-CSE-ConnectionGUID: uXvm/J8dQgKVgz5t9bWh4w==
X-CSE-MsgGUID: F9ZQkRc8TxuP6zgLDyXcFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50221196"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="50221196"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 01:36:34 -0800
X-CSE-ConnectionGUID: PVzPvCiZSbauSmHWtkcNvw==
X-CSE-MsgGUID: R1zWgNGBQ/mSJlKferlC7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="112982224"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Feb 2025 01:36:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti9AU-0015Rj-2o;
	Wed, 12 Feb 2025 09:36:30 +0000
Date: Wed, 12 Feb 2025 17:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 5f05e9194ada5609edbefb542c0dbfdbae984958
Message-ID: <202502121732.6RezVYeF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 5f05e9194ada5609edbefb542c0dbfdbae984958  gpiolib: Even more opportunities to use str_high_low() helper

Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-051-20250212
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
|-- arm-randconfig-052-20250212
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
|-- arm-randconfig-053-20250212
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
|-- arm-randconfig-054-20250212
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
`-- arm-randconfig-055-20250212
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

elapsed time: 1458m

configs tested: 120
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250211    gcc-13.2.0
arc                   randconfig-002-20250211    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    clang-21
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250211    gcc-14.2.0
arm                   randconfig-002-20250211    clang-21
arm                   randconfig-003-20250211    gcc-14.2.0
arm                   randconfig-004-20250211    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250211    clang-17
arm64                 randconfig-002-20250211    clang-19
arm64                 randconfig-003-20250211    gcc-14.2.0
arm64                 randconfig-004-20250211    clang-19
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250211    gcc-14.2.0
csky                  randconfig-002-20250211    gcc-14.2.0
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250211    clang-18
hexagon               randconfig-002-20250211    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250211    gcc-12
i386        buildonly-randconfig-002-20250211    gcc-12
i386        buildonly-randconfig-003-20250211    gcc-12
i386        buildonly-randconfig-004-20250211    gcc-12
i386        buildonly-randconfig-005-20250211    gcc-12
i386        buildonly-randconfig-006-20250211    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250211    gcc-14.2.0
loongarch             randconfig-002-20250211    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250211    gcc-14.2.0
nios2                 randconfig-002-20250211    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250211    gcc-14.2.0
parisc                randconfig-002-20250211    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      cm5200_defconfig    clang-21
powerpc               mpc834x_itxgp_defconfig    clang-18
powerpc                      pcm030_defconfig    clang-17
powerpc               randconfig-001-20250211    clang-15
powerpc               randconfig-002-20250211    clang-21
powerpc               randconfig-003-20250211    clang-19
powerpc                        warp_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250211    clang-21
powerpc64             randconfig-002-20250211    gcc-14.2.0
powerpc64             randconfig-003-20250211    clang-17
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250211    gcc-14.2.0
riscv                 randconfig-002-20250211    clang-19
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250211    clang-21
s390                  randconfig-002-20250211    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250211    gcc-14.2.0
sh                    randconfig-002-20250211    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250211    gcc-14.2.0
sparc                 randconfig-002-20250211    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250211    gcc-14.2.0
sparc64               randconfig-002-20250211    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250211    clang-17
um                    randconfig-002-20250211    clang-15
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250211    clang-19
x86_64      buildonly-randconfig-002-20250211    gcc-12
x86_64      buildonly-randconfig-003-20250211    clang-19
x86_64      buildonly-randconfig-004-20250211    gcc-11
x86_64      buildonly-randconfig-005-20250211    clang-19
x86_64      buildonly-randconfig-006-20250211    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250211    gcc-14.2.0
xtensa                randconfig-002-20250211    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

