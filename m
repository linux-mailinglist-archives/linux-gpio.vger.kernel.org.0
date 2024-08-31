Return-Path: <linux-gpio+bounces-9487-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F1A966F20
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 05:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E68EB1C214D9
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 03:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F4178289;
	Sat, 31 Aug 2024 03:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9+cKLg0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78ED2F2E;
	Sat, 31 Aug 2024 03:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725075596; cv=none; b=ZbdXQgtCO6utmIcVaGnb8jjzLcLdPc1e70KEEYV/EXgwHpLylE81DrbtuzReeD3Hl55R6k7yXoErrRbWe8iFJpSTpcpr6vd7G7QmT3BYPdXXByJ7gGotEhSWh2yzMbUamx6rLYDiENAkYoh3hm6uDCMdsxXi2ViNFnB/0fsqNjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725075596; c=relaxed/simple;
	bh=E3vRu46hlWxy6N2bSPsweS01OPMGvsArMoRLzr9AZOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFER2nUjy1Q41Wk6eN5L1+gcOJVPPhEG/g0nzAhRk4UvvIqKmCxqNjv4RA+2YZ0HJTmxHKRUBlGiUrkyiw2brvILg4gRYgIpm3h7TLF09MwzK05LQ2soHUqnmjZkMolmFKvvR1gZTgCGVlrY1UfOZO2fBng72Jxo8SrrnUfFHIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9+cKLg0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725075595; x=1756611595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E3vRu46hlWxy6N2bSPsweS01OPMGvsArMoRLzr9AZOA=;
  b=L9+cKLg0WZ2Cr9JyIwKfGGX96jbr2yrtMT3BTULMudwPp3+aKNxjDySc
   Ncba3EjidJI7weOZw6IGj2gjKZvb1DpQU5opc3HZ+n8WO8IblfAM99jlT
   O03OFMZB2zdc145kWjAyOm+Dne+LRdm5V2tVhzUAYcsLJ6TABZmZgaQWj
   NaoTAf1W0d9N1zKn4GsPWOBhG70JufkEXqCtQSJ8GJ7i72vvie61jrptV
   gQwLANGfETJzVj6us4YZnZcRU8SN2J1kYCmP3qGxFNasExkG4+voHJM/l
   GM4xUOJw3DLzS0VPAyGmwnGtPL1wxhdZHJzry+PMZmzr33D2QvEfHBDRC
   w==;
X-CSE-ConnectionGUID: /CjWC7IrSoqKniAQTwLhyw==
X-CSE-MsgGUID: MOe9c4Y8Sp2bAsjnK47jFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23592806"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="23592806"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 20:39:54 -0700
X-CSE-ConnectionGUID: e3zhyya4TkGgJU8661giWg==
X-CSE-MsgGUID: FVPujpNEQdiXXGkrmCT8Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="68740810"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Aug 2024 20:39:45 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skExj-0002KF-1g;
	Sat, 31 Aug 2024 03:39:43 +0000
Date: Sat, 31 Aug 2024 11:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org,
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 4/4] gpio: aspeed: Support G7 Aspeed gpio controller
Message-ID: <202408311104.T3i0AxEf-lkp@intel.com>
References: <20240830034047.2251482-5-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034047.2251482-5-billy_tsai@aspeedtech.com>

Hi Billy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-gpio-aspeed-ast2400-gpio-Support-ast2700/20240830-114325
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240830034047.2251482-5-billy_tsai%40aspeedtech.com
patch subject: [PATCH v2 4/4] gpio: aspeed: Support G7 Aspeed gpio controller
config: openrisc-randconfig-r131-20240830 (https://download.01.org/0day-ci/archive/20240831/202408311104.T3i0AxEf-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240831/202408311104.T3i0AxEf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311104.T3i0AxEf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpio/gpio-aspeed.c:1181:26: sparse: sparse: symbol 'aspeed_g4_llops' was not declared. Should it be static?
>> drivers/gpio/gpio-aspeed.c:1215:26: sparse: sparse: symbol 'aspeed_g7_llops' was not declared. Should it be static?

vim +/aspeed_g7_llops +1215 drivers/gpio/gpio-aspeed.c

  1214	
> 1215	struct aspeed_gpio_llops aspeed_g7_llops = {
  1216		.copro_request = NULL,
  1217		.copro_release = NULL,
  1218		.reg_bits_set = aspeed_g7_reg_bits_set,
  1219		.reg_bits_read = aspeed_g7_reg_bits_read,
  1220	};
  1221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

