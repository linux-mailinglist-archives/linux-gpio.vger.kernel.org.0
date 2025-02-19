Return-Path: <linux-gpio+bounces-16227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BECDFA3BD23
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 12:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A83C31898221
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 11:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D4A1DEFF7;
	Wed, 19 Feb 2025 11:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2sY4hA/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B464E1DED70
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 11:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739965269; cv=none; b=pJbfDtfjdilPiTUpa2ETnako9ScJ4ujgIW2sJFNoB7ifkKmGhWbp9ojFbmjcCpOmgxvL7M26xlnY9ALSS6osfd9y58D43Vtla8i0HkfVlbDuAt5Esj/l2z3fBZsXZN5hLyohGBtrAkIdcC1UCinNy6KV7Fg8MK6KZCftFdngrCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739965269; c=relaxed/simple;
	bh=GPWVSHYljCBWyeoxPYcoVky4532YzRJUCV/kA9gfLf4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EJsrppkDiju19vO+B/lLHiSrm9ccXzF35zGL85tUjzp+TXbXZ/drYdSpgXF0SPD+rV0mWiWHk6zzimrFtmE6RRBM/cudOGL4ln0ptZM2JJq9T36oPhmzWBcuQ0GdT3Cx2K4qv5pUZFyovSvDQ33vYPc2RytWBjnmZCkkm5AX2jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2sY4hA/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739965268; x=1771501268;
  h=date:from:to:cc:subject:message-id;
  bh=GPWVSHYljCBWyeoxPYcoVky4532YzRJUCV/kA9gfLf4=;
  b=C2sY4hA/NdatHMO6Zy3N3WshWiuPzTPdUhi0yq8t8aWBD+YI+Ucm0S6j
   WbYVYg7mm0Hjq+iPsgf0YARjUwVDoz0FqaqtCBCHEuO+w9v41K4Dqshqm
   xlBb8eA+FJlNcefeie8fDKQJLWVfqQl8vBTcFpBpdJuHlRi5BYce17yFQ
   F4EvAAj2R/gPo4WApv+rdZ+HCpXRG8MLYn2XCjvHWAYzz/zCzo68hP35h
   aQM388Z716laJ4KYbqHCIQg1DMMJ/7vjgsyMun1jusBCt9K4HeEGXbqd6
   IIj3uVp/Oc2OrjStsTmK9vXo7nDJb75eNbU0YuMlZ+w2tpvWpz65P/TZG
   A==;
X-CSE-ConnectionGUID: Kj5bXJo9QhqIriviydautg==
X-CSE-MsgGUID: kEL2vGG7R1qkqyoqeKfn0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40955450"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="40955450"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 03:41:05 -0800
X-CSE-ConnectionGUID: 8xMkIU7rQUSlX/9I7ZxCCQ==
X-CSE-MsgGUID: aqoV8TG/RKiuvwn0yiNNvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137935325"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Feb 2025 03:41:02 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkiRn-0002rb-0w;
	Wed, 19 Feb 2025 11:40:59 +0000
Date: Wed, 19 Feb 2025 19:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 63cdf6241ac7edd94cb4cd9a8f1ba2c3c61ed219
Message-ID: <202502191929.Ohd9jII4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 63cdf6241ac7edd94cb4cd9a8f1ba2c3c61ed219  gpiolib: don't build HTE code with CONFIG_HTE disabled

Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-051-20250219
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
|-- arm-randconfig-052-20250219
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
|-- arm-randconfig-053-20250219
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
|-- arm-randconfig-054-20250219
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
`-- arm-randconfig-055-20250219
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

configs tested: 103
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250218    gcc-13.2.0
arc                   randconfig-002-20250218    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250218    gcc-14.2.0
arm                   randconfig-002-20250218    gcc-14.2.0
arm                   randconfig-003-20250218    gcc-14.2.0
arm                   randconfig-004-20250218    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250218    clang-21
arm64                 randconfig-002-20250218    clang-21
arm64                 randconfig-003-20250218    gcc-14.2.0
arm64                 randconfig-004-20250218    clang-16
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250218    gcc-14.2.0
csky                  randconfig-002-20250218    gcc-14.2.0
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250218    clang-17
hexagon               randconfig-002-20250218    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250218    gcc-12
i386        buildonly-randconfig-002-20250218    gcc-12
i386        buildonly-randconfig-003-20250218    gcc-12
i386        buildonly-randconfig-004-20250218    clang-19
i386        buildonly-randconfig-005-20250218    clang-19
i386        buildonly-randconfig-006-20250218    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250218    gcc-14.2.0
loongarch             randconfig-002-20250218    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250218    gcc-14.2.0
nios2                 randconfig-002-20250218    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250218    gcc-14.2.0
parisc                randconfig-002-20250218    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250218    gcc-14.2.0
powerpc               randconfig-002-20250218    gcc-14.2.0
powerpc               randconfig-003-20250218    clang-21
powerpc64             randconfig-001-20250218    gcc-14.2.0
powerpc64             randconfig-002-20250218    clang-16
powerpc64             randconfig-003-20250218    clang-18
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                 randconfig-001-20250218    gcc-14.2.0
riscv                 randconfig-002-20250218    clang-21
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250218    clang-21
s390                  randconfig-002-20250218    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250218    gcc-14.2.0
sh                    randconfig-002-20250218    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250218    gcc-14.2.0
sparc                 randconfig-002-20250218    gcc-14.2.0
sparc64               randconfig-001-20250218    gcc-14.2.0
sparc64               randconfig-002-20250218    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250218    clang-21
um                    randconfig-002-20250218    gcc-11
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250218    clang-19
x86_64      buildonly-randconfig-002-20250218    gcc-12
x86_64      buildonly-randconfig-003-20250218    clang-19
x86_64      buildonly-randconfig-004-20250218    gcc-12
x86_64      buildonly-randconfig-005-20250218    clang-19
x86_64      buildonly-randconfig-006-20250218    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250218    gcc-14.2.0
xtensa                randconfig-002-20250218    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

