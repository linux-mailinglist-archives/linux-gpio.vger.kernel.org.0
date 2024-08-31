Return-Path: <linux-gpio+bounces-9486-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A76AF966EA2
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 03:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CC8C1F23F70
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 01:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E770722F1C;
	Sat, 31 Aug 2024 01:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QiaEgRyn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0A31BC5C;
	Sat, 31 Aug 2024 01:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725068809; cv=none; b=Lgea9KGLKhZATadONTQQons4uROXiU/zY5HHiSc9wNZTFXXPhBPa1hG6dG+Xx/y0UauCad18oiZDrw5yZ/hpau7sQsY4OfLYB8+UNqGSQbQ+sFWYNWZNJw5/ZLoPU58WcLpxwzw4BWoMwLZK+mhjDZtoiFSUZ8QwFH/UNoGEHxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725068809; c=relaxed/simple;
	bh=JH7/oxYMhrd5K0tQtkbX38c7uRzIq1POnaw6jGBwBAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dI1WD5bM8kVMtzecfoLufXah6yh/Ua9mn8JCCxHzbuUPQp5TJQ73htKH/WsdGDE7PoWNpNFw0lX2wsu8QwBBpOaosCimyw5NutGHHuRuiYgp2kllfqycGMaLQ6WP1M3ivNZLiKJo90Y4wQCZf++LK5RFzYfUYES4NM8E9OR8N7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QiaEgRyn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725068808; x=1756604808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JH7/oxYMhrd5K0tQtkbX38c7uRzIq1POnaw6jGBwBAg=;
  b=QiaEgRyn/nNlRE1JKSCP3kJrD8cub365elCuHTVFDU6h2shd7zTDLbsk
   npkZaf++G6txtQ7X7d9+iz/zUkiMr2EUerIZX/SE1Kqnaklgk2c/gocoQ
   tdHdFm1w9buee7RAbtJyHLMih53h0//S0YfR3DHhdTtJseVbydGPEp0/r
   OncOq5vbMMNREuzpUs8+3VX75wrlusZmCYHNFU7umXvFBYGAnKYeSxZr5
   N+rKYWmCEI+gbLAKvWbCxz1Ntd0NhdBLq1D9Vwx+9OEOzuA22lAqGekD3
   kgUrgNBUA5dz1KL/Gs7g0Jc3M2bx35VFU07DdUkvS3Xkig9Qbr1U6V2Ai
   A==;
X-CSE-ConnectionGUID: 23LINpTMSYeBGsz+VJLzPQ==
X-CSE-MsgGUID: utxGHHXeTCWVrjRIF+jS9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="41204763"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="41204763"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 18:46:47 -0700
X-CSE-ConnectionGUID: zTL1yrceTkmGa+A5aSN7Ww==
X-CSE-MsgGUID: 4Ct7P5J8SlSFEmV+B8gtnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="64559992"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Aug 2024 18:46:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skDCL-0002H4-2O;
	Sat, 31 Aug 2024 01:46:41 +0000
Date: Sat, 31 Aug 2024 09:46:38 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org,
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 3/4] gpio: aspeed: Create llops to handle hardware
 access
Message-ID: <202408310953.Z0c7NIuz-lkp@intel.com>
References: <20240830034047.2251482-4-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034047.2251482-4-billy_tsai@aspeedtech.com>

Hi Billy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-gpio-aspeed-ast2400-gpio-Support-ast2700/20240830-114325
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240830034047.2251482-4-billy_tsai%40aspeedtech.com
patch subject: [PATCH v2 3/4] gpio: aspeed: Create llops to handle hardware access
config: openrisc-randconfig-r131-20240830 (https://download.01.org/0day-ci/archive/20240831/202408310953.Z0c7NIuz-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240831/202408310953.Z0c7NIuz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408310953.Z0c7NIuz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-aspeed.c:1107:26: sparse: sparse: symbol 'aspeed_g4_llops' was not declared. Should it be static?

vim +/aspeed_g4_llops +1107 drivers/gpio/gpio-aspeed.c

  1106	
> 1107	struct aspeed_gpio_llops aspeed_g4_llops = {
  1108		.copro_request = aspeed_gpio_copro_request,
  1109		.copro_release = aspeed_gpio_copro_release,
  1110		.reg_bits_set = aspeed_g4_reg_bits_set,
  1111		.reg_bits_read = aspeed_g4_reg_bits_read,
  1112	};
  1113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

