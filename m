Return-Path: <linux-gpio+bounces-16061-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F96AA36D5F
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 11:38:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEF9D16F1C7
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 10:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C271A23AA;
	Sat, 15 Feb 2025 10:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcYdvcVm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB60719ABDE
	for <linux-gpio@vger.kernel.org>; Sat, 15 Feb 2025 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739615913; cv=none; b=mb/DaQLdT4Uyz7BiicUd0a3+Gn3K4TwcoRVAaGdjqYheLHHzujOnLq7KNBIhjHbB6bh0EXeTRTvKJvQyicYFfx0itlcZObhEJxr86pCn73uu480Zar+SsUJ3cHn8Vqg9DG8cW9OK9kD8LA5cfxB3WIu1MyK4kvCRk6oVjlTgxZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739615913; c=relaxed/simple;
	bh=8UhiVaCdGuWfKJiFaABKkj/nJ3OmSlRhjv9/cugpidA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ksX0isDAbU79TrUquDu6P6UHoaTYsDnwZwoYmvGnzhjhnRzcvz59TEppm8pZMdJlYBTbyWiy0D8gfhZbcPnYuWVwfxHkjzFtLShc3xklki3n5nQ1TeCHGXhLN16i1a4O+wXAfUJo3flOWmVE++WvHe9bdS12+XlFBNaXdvLoru0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcYdvcVm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739615911; x=1771151911;
  h=date:from:to:cc:subject:message-id;
  bh=8UhiVaCdGuWfKJiFaABKkj/nJ3OmSlRhjv9/cugpidA=;
  b=XcYdvcVm/7O6h858wEnRck9zUDap+gPupZTDd80Pc2JcXs90GbeJ2cou
   qBaBmx9tPkzPQVVAjoWtyRpO0hZwTYrDhxO9hnBU4kJKjsfE3pboZJL7s
   1Cag2OE4PTIn+PNNUKeMBb8sJD7EeE+1NpnAxAvuEvPZHy+HjX1LBhmt7
   H6BoPjB1MKytmUycc2t+slooMTeq0oz3rtLeo1gZtK9LoEuZViapNsUDL
   CvHBR8bqQw1BtTvEW5CvBvxTaFV2QJ1FcQytmgQ94lrrk3wGFeZgaG7wo
   Jjkz7pViyFRE2Pw9NpYlJg/s2G16oxO+TLDKCOfNIh4VWILJYY7NGtBv0
   g==;
X-CSE-ConnectionGUID: UFczLcBYTA+RvwM+ucUn1g==
X-CSE-MsgGUID: ZEoIsoPmQDiqNrNLLEJdMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50576220"
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="50576220"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 02:38:30 -0800
X-CSE-ConnectionGUID: zWeaTEqcSpuZB0vtSvl5yA==
X-CSE-MsgGUID: X3a8ODXdTa6EQxOlqAUZHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113543675"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Feb 2025 02:38:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjFZ5-001Aii-0W;
	Sat, 15 Feb 2025 10:38:27 +0000
Date: Sat, 15 Feb 2025 18:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 c88aa68297390695b16fd9b7a33612257d8ef548
Message-ID: <202502151839.0GNXeUsl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: c88aa68297390695b16fd9b7a33612257d8ef548  phy: mapphone-mdm6600: use gpiod_multi_set_value_cansleep

Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-051-20250215
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
|-- arm-randconfig-052-20250215
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
|-- arm-randconfig-053-20250215
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
|-- arm-randconfig-054-20250215
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
`-- arm-randconfig-055-20250215
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

elapsed time: 1454m

configs tested: 91
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250214    gcc-13.2.0
arc                   randconfig-002-20250214    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250214    clang-16
arm                   randconfig-002-20250214    gcc-14.2.0
arm                   randconfig-003-20250214    clang-21
arm                   randconfig-004-20250214    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                 randconfig-001-20250214    gcc-14.2.0
arm64                 randconfig-002-20250214    gcc-14.2.0
arm64                 randconfig-003-20250214    gcc-14.2.0
arm64                 randconfig-004-20250214    gcc-14.2.0
csky                  randconfig-001-20250214    gcc-14.2.0
csky                  randconfig-002-20250214    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250214    clang-21
hexagon               randconfig-002-20250214    clang-15
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250214    gcc-12
i386        buildonly-randconfig-002-20250214    gcc-12
i386        buildonly-randconfig-003-20250214    clang-19
i386        buildonly-randconfig-004-20250214    gcc-12
i386        buildonly-randconfig-005-20250214    gcc-12
i386        buildonly-randconfig-006-20250214    gcc-12
i386                                defconfig    clang-19
loongarch             randconfig-001-20250214    gcc-14.2.0
loongarch             randconfig-002-20250214    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250214    gcc-14.2.0
nios2                 randconfig-002-20250214    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250214    gcc-14.2.0
parisc                randconfig-002-20250214    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250214    gcc-14.2.0
powerpc               randconfig-002-20250214    clang-18
powerpc               randconfig-003-20250214    clang-21
powerpc64             randconfig-001-20250214    clang-18
powerpc64             randconfig-002-20250214    gcc-14.2.0
powerpc64             randconfig-003-20250214    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250214    clang-18
riscv                 randconfig-002-20250214    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250214    gcc-14.2.0
s390                  randconfig-002-20250214    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250214    gcc-14.2.0
sh                    randconfig-002-20250214    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250214    gcc-14.2.0
sparc                 randconfig-002-20250214    gcc-14.2.0
sparc64               randconfig-001-20250214    gcc-14.2.0
sparc64               randconfig-002-20250214    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250214    gcc-12
um                    randconfig-002-20250214    clang-16
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250214    clang-19
x86_64      buildonly-randconfig-002-20250214    clang-19
x86_64      buildonly-randconfig-003-20250214    gcc-12
x86_64      buildonly-randconfig-004-20250214    clang-19
x86_64      buildonly-randconfig-005-20250214    gcc-12
x86_64      buildonly-randconfig-006-20250214    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250214    gcc-14.2.0
xtensa                randconfig-002-20250214    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

