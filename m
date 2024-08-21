Return-Path: <linux-gpio+bounces-8963-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B86195A812
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 01:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 905EF1C21E2C
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 23:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1514A17C7BF;
	Wed, 21 Aug 2024 23:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKiFdI6X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14441494AD;
	Wed, 21 Aug 2024 23:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724282051; cv=none; b=TXXzSdFVPDKLtsX7MwbDVvNVaCt+2IwLxiPT2GitLvy0QFtyIbnLnfMcMwEAMPpwQrtswMW1gNlRuELDCi/Q6czsJVchljHKwYSgLqzr7IJiAxrIz3EtV5Z651EiDO/qZ05vJM42mku2inVEer3Z1X4Z5nhYAu1hsL4J0FZyxyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724282051; c=relaxed/simple;
	bh=5jrbVAdo6wAYvsEzV739oZ/MNr2YMBA+5HAAwIrmh+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7Xnt+zLDdmFlNdS6p6WbLe7Q4nC5FgpIy3xvxoo7yJHYzZyC2wPXodeEATWTw2KoaryH+BrGriZXEANnw3cfv84sq9qq77ieM4+9RY/34CcY+rRoc35+BH35f8tUPpljji+zHpIYjeIAiwh/m4M09vdOcvk0+2sb1HePLA0TSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKiFdI6X; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724282049; x=1755818049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5jrbVAdo6wAYvsEzV739oZ/MNr2YMBA+5HAAwIrmh+I=;
  b=OKiFdI6XwImVVyCo0/WEqk8PsPfph9ky+BggGF7xB7aKdtTlnpZq5zTL
   7KjCWIYd87v1ed/9DJk5lx3upcHgiwhk7f9ieMoXu8ENKYDFx1pMtExJs
   RFQ+I5o29o+3YEtvnvo/huxWz77Ao6pvTh1irjEz5TDnx34cEoGUAlpJT
   uBCArattqBTgnJa6ozdH7gi9wpo6zaM/fjW2iBJPjWYa2xXLGW/F+tWiA
   G19OgXRx5O1skQuSzPTw6a1TM1wRsLfJAH2Lmz2mEdqgNdRC7T5D5QNKZ
   H39ni93XiOPJptSlODwZxOMx8guCopsrAYnaztHvZEPKJNITDcPmheF9I
   Q==;
X-CSE-ConnectionGUID: Mf//EcDZSqOasYCao1N7Lw==
X-CSE-MsgGUID: 3NcqAnf3QlCnLPhwTv/NMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="48066171"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="48066171"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 16:14:08 -0700
X-CSE-ConnectionGUID: 3IVNMZUQSgeppVVPDSfDxw==
X-CSE-MsgGUID: 1sJH8KpESnyRhMvJMrQQyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="66126930"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Aug 2024 16:14:04 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sguWf-000C2W-2C;
	Wed, 21 Aug 2024 23:14:01 +0000
Date: Thu, 22 Aug 2024 07:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org,
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
Message-ID: <202408220503.hxIARcuf-lkp@intel.com>
References: <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821070740.2378602-3-billy_tsai@aspeedtech.com>

Hi Billy,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-gpio-aspeed-ast2400-gpio-Support-ast2700/20240821-150951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240821070740.2378602-3-billy_tsai%40aspeedtech.com
patch subject: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20240822/202408220503.hxIARcuf-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408220503.hxIARcuf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220503.hxIARcuf-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpio/gpio-aspeed-g7.c: In function 'aspeed_gpio_g7_request':
>> drivers/gpio/gpio-aspeed-g7.c:474:48: error: passing argument 1 of 'pinctrl_gpio_request' makes pointer from integer without a cast [-Wint-conversion]
     474 |         return pinctrl_gpio_request(chip->base + offset);
         |                                     ~~~~~~~~~~~^~~~~~~~
         |                                                |
         |                                                unsigned int
   In file included from drivers/gpio/gpio-aspeed-g7.c:16:
   include/linux/pinctrl/consumer.h:30:44: note: expected 'struct gpio_chip *' but argument is of type 'unsigned int'
      30 | int pinctrl_gpio_request(struct gpio_chip *gc, unsigned int offset);
         |                          ~~~~~~~~~~~~~~~~~~^~
>> drivers/gpio/gpio-aspeed-g7.c:474:16: error: too few arguments to function 'pinctrl_gpio_request'
     474 |         return pinctrl_gpio_request(chip->base + offset);
         |                ^~~~~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:30:5: note: declared here
      30 | int pinctrl_gpio_request(struct gpio_chip *gc, unsigned int offset);
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed-g7.c: In function 'aspeed_gpio_g7_free':
>> drivers/gpio/gpio-aspeed-g7.c:479:38: error: passing argument 1 of 'pinctrl_gpio_free' makes pointer from integer without a cast [-Wint-conversion]
     479 |         pinctrl_gpio_free(chip->base + offset);
         |                           ~~~~~~~~~~~^~~~~~~~
         |                                      |
         |                                      unsigned int
   include/linux/pinctrl/consumer.h:31:42: note: expected 'struct gpio_chip *' but argument is of type 'unsigned int'
      31 | void pinctrl_gpio_free(struct gpio_chip *gc, unsigned int offset);
         |                        ~~~~~~~~~~~~~~~~~~^~
>> drivers/gpio/gpio-aspeed-g7.c:479:9: error: too few arguments to function 'pinctrl_gpio_free'
     479 |         pinctrl_gpio_free(chip->base + offset);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:31:6: note: declared here
      31 | void pinctrl_gpio_free(struct gpio_chip *gc, unsigned int offset);
         |      ^~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed-g7.c: In function 'aspeed_gpio_g7_set_config':
>> drivers/gpio/gpio-aspeed-g7.c:676:48: error: passing argument 1 of 'pinctrl_gpio_set_config' makes pointer from integer without a cast [-Wint-conversion]
     676 |                 return pinctrl_gpio_set_config(offset, config);
         |                                                ^~~~~~
         |                                                |
         |                                                unsigned int
   include/linux/pinctrl/consumer.h:36:47: note: expected 'struct gpio_chip *' but argument is of type 'unsigned int'
      36 | int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
         |                             ~~~~~~~~~~~~~~~~~~^~
>> drivers/gpio/gpio-aspeed-g7.c:676:24: error: too few arguments to function 'pinctrl_gpio_set_config'
     676 |                 return pinctrl_gpio_set_config(offset, config);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:36:5: note: declared here
      36 | int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed-g7.c: In function 'aspeed_gpio_g7_request':
>> drivers/gpio/gpio-aspeed-g7.c:475:1: warning: control reaches end of non-void function [-Wreturn-type]
     475 | }
         | ^


vim +/pinctrl_gpio_request +474 drivers/gpio/gpio-aspeed-g7.c

   468	
   469	static int aspeed_gpio_g7_request(struct gpio_chip *chip, unsigned int offset)
   470	{
   471		if (!have_gpio(gpiochip_get_data(chip), offset))
   472			return -ENODEV;
   473	
 > 474		return pinctrl_gpio_request(chip->base + offset);
 > 475	}
   476	
   477	static void aspeed_gpio_g7_free(struct gpio_chip *chip, unsigned int offset)
   478	{
 > 479		pinctrl_gpio_free(chip->base + offset);
   480	}
   481	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

