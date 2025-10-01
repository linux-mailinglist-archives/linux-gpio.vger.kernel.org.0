Return-Path: <linux-gpio+bounces-26686-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 293CABAEE90
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 02:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2F5A3A7BE8
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 00:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B83C213E6D;
	Wed,  1 Oct 2025 00:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlmwr6dN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB38F1F4CBF;
	Wed,  1 Oct 2025 00:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759279503; cv=none; b=otKK6T3Mbu04jwoZ8jWURq1nJ3f74r1s+gU8rifl5PjBtS5XdIzaR8O+HOOfuDNIM4LWfU79O4IDdeH13nP0ECqdtAI12SfWC4mZI17KIi0qskG7ukw/RVsiCq9XidPJ/r+6IbcK/Plpg/0WcxUUhFg77zIaeFqznXKtVe0SsD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759279503; c=relaxed/simple;
	bh=tphxb6DI5+DwhHBI73v7hYTP6GVyWqcs3Q7BvKryrmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHDIwk9o/T81j9YB+foDr4TAgh/J5TzbUKvb62p+aCxXXnollF7lCU5qzuIymFTKc2OJwyBjxWKaI3XyukSBp+choIJlEi67cjkYhdTkA70F8fKy6PuQ+8IV6RYa2kwNLHDukENL3c1nIEKC0ehpt/f8ii9OubI8nUpjMv2IIRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlmwr6dN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759279501; x=1790815501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tphxb6DI5+DwhHBI73v7hYTP6GVyWqcs3Q7BvKryrmA=;
  b=dlmwr6dN4X0H3ltv/heoS9MtGXbF3UWSLRziR99/md8XmWytq3AxsEt0
   a63zsQb3zq2Qp0/kFmbdqSasKn6OaWFPgM7kd6nNRUYOq+zoWfVPJxEM0
   nj05GthN/e03w8cFyCexZAUlem194Z7AXeTdqkalV/olEIbh+TotSKvRa
   /yzQcTJcTCEQGmW6eC5UOLvks4KhI0MQPSBxIYOfSLGcDsBk+1HheD3sj
   r8m+9jRPXf2MVitB8haLWVrifWXgr+JmEWBlVceu9YRLVwkpGW2aapZl1
   UtFYITByEf0KCM8wWWJHZJr1QbbTaLQYcpV3WoNGgNJVg48sLAeztXZNL
   A==;
X-CSE-ConnectionGUID: SDuH6xGITkuCDEZJEYc/tw==
X-CSE-MsgGUID: EPHKIM26RlGiexbmnZz30g==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="86995095"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="86995095"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 17:45:01 -0700
X-CSE-ConnectionGUID: DLZQLaqsScmamOqEfRPxUw==
X-CSE-MsgGUID: K75oPXxHTEWVRq5WeL5BKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="209609693"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Sep 2025 17:44:58 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3kxi-0002b5-30;
	Wed, 01 Oct 2025 00:44:54 +0000
Date: Wed, 1 Oct 2025 08:44:05 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/6] pinctrl: bcm: bcmbca: Add support for BCM6846
Message-ID: <202510010811.0pbFyQ24-lkp@intel.com>
References: <20250930-bcmbca-pinctrl-v1-6-73218459a094@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-bcmbca-pinctrl-v1-6-73218459a094@linaro.org>

Hi Linus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f5ae30d69d7543eee0d70083daf4de8fe15d585]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/pinctrl-bcm-Rename-bcm4908-to-bcmbca/20250930-200534
base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
patch link:    https://lore.kernel.org/r/20250930-bcmbca-pinctrl-v1-6-73218459a094%40linaro.org
patch subject: [PATCH 6/6] pinctrl: bcm: bcmbca: Add support for BCM6846
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251001/202510010811.0pbFyQ24-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510010811.0pbFyQ24-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510010811.0pbFyQ24-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:371:9: note: previous definition is here
     371 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/pinctrl/bcm/pinctrl-bcmbca.c:527:27: warning: unused variable 'bcm6846_spis_groups' [-Wunused-const-variable]
     527 | static const char * const bcm6846_spis_groups[] = {
         |                           ^~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/bcm6846_spis_groups +527 drivers/pinctrl/bcm/pinctrl-bcmbca.c

   499	
   500	static const char * const bcm6846_led_0_groups[] = { "led_0_grp_a", "led_0_grp_b" };
   501	static const char * const bcm6846_led_1_groups[] = { "led_1_grp_a", "led_1_grp_b" };
   502	static const char * const bcm6846_led_2_groups[] = { "led_2_grp_a", "led_2_grp_b" };
   503	static const char * const bcm6846_led_3_groups[] = { "led_3_grp_a", "led_3_grp_b" };
   504	static const char * const bcm6846_led_4_groups[] = { "led_4_grp_a", "led_4_grp_b" };
   505	static const char * const bcm6846_led_5_groups[] = { "led_5_grp_a", "led_5_grp_b" };
   506	static const char * const bcm6846_led_6_groups[] = { "led_6_grp_a", "led_6_grp_b" };
   507	static const char * const bcm6846_led_7_groups[] = { "led_7_grp_a", "led_7_grp_b" };
   508	static const char * const bcm6846_led_8_groups[] = { "led_8_grp_a", "led_8_grp_b" };
   509	static const char * const bcm6846_led_9_groups[] = { "led_9_grp_a", "led_9_grp_b" };
   510	static const char * const bcm6846_led_10_groups[] = { "led_10_grp_a", "led_10_grp_b" };
   511	static const char * const bcm6846_led_11_groups[] = { "led_11_grp_a", "led_11_grp_b" };
   512	static const char * const bcm6846_led_12_groups[] = { "led_12_grp_a", "led_12_grp_b" };
   513	static const char * const bcm6846_led_13_groups[] = { "led_13_grp" };
   514	static const char * const bcm6846_led_14_groups[] = { "led_14_grp" };
   515	static const char * const bcm6846_led_15_groups[] = { "led_15_grp" };
   516	static const char * const bcm6846_led_16_groups[] = { "led_16_grp" };
   517	static const char * const bcm6846_led_17_groups[] = { "led_17_grp" };
   518	static const char * const bcm6846_ser_led_groups[] = { "ser_led_grp_a", "ser_led_grp_b" };
   519	/* We use these three groups with the NAND function to get as many pins as we want */
   520	static const char * const bcm6846_nand_groups[] = { "nand_ctrl_grp", "nand_data_grp", "nand_wp_grp" };
   521	static const char * const bcm6846_emmc_groups[] = { "emmc_ctrl_grp" };
   522	/* Activate SPIM with "spim_grp" and then as many selects as used with "spim_ssN_grp" groups */
   523	static const char * const bcm6846_spim_groups[] = {
   524		"spim_grp_a", "spim_ss0_grp_a",	"spim_ss1_grp_a", "spim_ss2_grp_a", "spim_ss3_grp_a",
   525		"spim_grp_b", "spim_ss0_grp_b",	"spim_ss1_grp_b", "spim_ss2_grp_b", "spim_ss3_grp_b",
   526		"spim_grp_c", "spim_ss0_grp_c",	"spim_ss1_grp_c" };
 > 527	static const char * const bcm6846_spis_groups[] = {
   528		"spis_grp_a", "spim_ss_grp_a",
   529		"spis_grp_b", "spis_ss_grp_b" };
   530	static const char * const bcm6846_usb0_pwr_groups[] = { "usb0_pwr_grp" };
   531	static const char * const bcm6846_usb1_pwr_groups[] = { "usb1_pwr_grp" };
   532	static const char * const bcm6846_i2c_groups[] = { "i2c_grp" };
   533	static const char * const bcm6846_rgmii_groups[] = { "rgmii_grp", "rgmii_rx_ok_grp", "rgmii_start_stop_grp" };
   534	static const char * const bcm6846_mii_groups[] = { "mii_grp" };
   535	static const char * const bcm6846_signal_detect_groups[] = { "signal_detect_grp_a", "signal_detect_grp_b" };
   536	static const char * const bcm6846_one_sec_pls_groups[] = { "one_sec_pls_grp_a", "one_sec_pls_grp_b" };
   537	static const char * const bcm6846_rogue_onu_groups[] = { "rogue_onu_grp_a", "rogue_onu_grp_b" };
   538	static const char * const bcm6846_wan_groups[] = { "wan_mdio_grp", "wan_nco_grp",
   539		"wan_early_txen_grp_a", "wan_early_txen_grp_b", "wan_nco_1pps_sig_grp_a", "wan_nco_1pps_sig_grp_b" };
   540	static const char * const bcm6846_uart0_groups[] = { "uart0_grp" };
   541	static const char * const bcm6846_uart2_groups[] = { "uart2_grp" };
   542	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

