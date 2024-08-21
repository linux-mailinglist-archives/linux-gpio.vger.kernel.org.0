Return-Path: <linux-gpio+bounces-8960-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A40195A621
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 22:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72EA62866C7
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 20:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE34F170A2C;
	Wed, 21 Aug 2024 20:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="co84FhOn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781D31531C2;
	Wed, 21 Aug 2024 20:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724273524; cv=none; b=kVgjtKDwCJ2kIFNzXqV71DCa5wDpXuFxbVYSAauI0MrBueihR1DK2LD1hXUaq6Kq7GKHAhTdwc8tVlRi0hp6ET+asCGtA9xMtT1n/0bh2BIRH2XKYniACTt5opY+MPv+OI3S/aBHoCZ1UHjK64wImLpaYgPM5PPzpqfmihzEj24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724273524; c=relaxed/simple;
	bh=L92fXwzpvfy6V5aVSsrMQYQc8poFWLPSnWtKPdphpC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5JWPhL6wXQ2RL0tuYH63Sot8rMx/a+z2vT8sNZKFv04VwAUpgzmFKLa+aL+gazxmmWjMv8s02uEyIgaA0F2lSzHFiB49yJQTst9so2RvQhbYMmJ+BqXpslLeRdaeuMhrOfhA7RiaXTj0KMVX1nLRfJYK0PpAZexfQQfIIbTRKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=co84FhOn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724273523; x=1755809523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L92fXwzpvfy6V5aVSsrMQYQc8poFWLPSnWtKPdphpC4=;
  b=co84FhOnZUZpMuNdeKixnwT9hl0AmVxpkHMWZcPp6lvYNwqp2zBrcBZ0
   ao8G27TKZYk95yzd0J1fFdrHjrgtre9zfVtQwtdN1Cj5IeroeINoxlsMn
   fcMcx9/+3spUYxjemiaHWPEspZfnD9F2wUfImZ32PWVYbKX50mLaoxUtn
   o4Kwm8LzKzxFmEKyKX5AlXl/kKbxwr+bb03w+x2q2+2o26pvi+lDh2Sw+
   mh0uxEcnhhz9wpe7WpKvuUFgiTw3qYhyvHELbtkIPHOcrSfTW2U2WUKJN
   upW92sff8AIqCwJdOZhPwKd0FDExXCGlDr3zecU0xt7M8LhHwPOqVRctQ
   g==;
X-CSE-ConnectionGUID: ILtEsulAQ6+SjW3B+6PFTQ==
X-CSE-MsgGUID: v+FvMQS+SEa1e6Hn2cSLGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="26410888"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="26410888"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 13:52:02 -0700
X-CSE-ConnectionGUID: U4dPVaJbT0qrJgLGR4NhPQ==
X-CSE-MsgGUID: APZvwVe7QRWjfRcB7XVWVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="61209335"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Aug 2024 13:51:59 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgsJA-000Bwo-1b;
	Wed, 21 Aug 2024 20:51:56 +0000
Date: Thu, 22 Aug 2024 04:51:03 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org,
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
Message-ID: <202408220439.BUcaNSTv-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-gpio-aspeed-ast2400-gpio-Support-ast2700/20240821-150951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240821070740.2378602-3-billy_tsai%40aspeedtech.com
patch subject: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240822/202408220439.BUcaNSTv-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408220439.BUcaNSTv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220439.BUcaNSTv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-aspeed-g7.c: In function 'aspeed_gpio_g7_request':
>> drivers/gpio/gpio-aspeed-g7.c:474:48: warning: passing argument 1 of 'pinctrl_gpio_request' makes pointer from integer without a cast [-Wint-conversion]
     474 |         return pinctrl_gpio_request(chip->base + offset);
         |                                     ~~~~~~~~~~~^~~~~~~~
         |                                                |
         |                                                unsigned int
   In file included from drivers/gpio/gpio-aspeed-g7.c:16:
   include/linux/pinctrl/consumer.h:30:44: note: expected 'struct gpio_chip *' but argument is of type 'unsigned int'
      30 | int pinctrl_gpio_request(struct gpio_chip *gc, unsigned int offset);
         |                          ~~~~~~~~~~~~~~~~~~^~
   drivers/gpio/gpio-aspeed-g7.c:474:16: error: too few arguments to function 'pinctrl_gpio_request'
     474 |         return pinctrl_gpio_request(chip->base + offset);
         |                ^~~~~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:30:5: note: declared here
      30 | int pinctrl_gpio_request(struct gpio_chip *gc, unsigned int offset);
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed-g7.c: In function 'aspeed_gpio_g7_free':
>> drivers/gpio/gpio-aspeed-g7.c:479:38: warning: passing argument 1 of 'pinctrl_gpio_free' makes pointer from integer without a cast [-Wint-conversion]
     479 |         pinctrl_gpio_free(chip->base + offset);
         |                           ~~~~~~~~~~~^~~~~~~~
         |                                      |
         |                                      unsigned int
   include/linux/pinctrl/consumer.h:31:42: note: expected 'struct gpio_chip *' but argument is of type 'unsigned int'
      31 | void pinctrl_gpio_free(struct gpio_chip *gc, unsigned int offset);
         |                        ~~~~~~~~~~~~~~~~~~^~
   drivers/gpio/gpio-aspeed-g7.c:479:9: error: too few arguments to function 'pinctrl_gpio_free'
     479 |         pinctrl_gpio_free(chip->base + offset);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:31:6: note: declared here
      31 | void pinctrl_gpio_free(struct gpio_chip *gc, unsigned int offset);
         |      ^~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed-g7.c: In function 'aspeed_gpio_g7_set_config':
>> drivers/gpio/gpio-aspeed-g7.c:676:48: warning: passing argument 1 of 'pinctrl_gpio_set_config' makes pointer from integer without a cast [-Wint-conversion]
     676 |                 return pinctrl_gpio_set_config(offset, config);
         |                                                ^~~~~~
         |                                                |
         |                                                unsigned int
   include/linux/pinctrl/consumer.h:36:47: note: expected 'struct gpio_chip *' but argument is of type 'unsigned int'
      36 | int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
         |                             ~~~~~~~~~~~~~~~~~~^~
   drivers/gpio/gpio-aspeed-g7.c:676:24: error: too few arguments to function 'pinctrl_gpio_set_config'
     676 |                 return pinctrl_gpio_set_config(offset, config);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:36:5: note: declared here
      36 | int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed-g7.c: In function 'aspeed_gpio_g7_request':
   drivers/gpio/gpio-aspeed-g7.c:475:1: warning: control reaches end of non-void function [-Wreturn-type]
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
   475	}
   476	
   477	static void aspeed_gpio_g7_free(struct gpio_chip *chip, unsigned int offset)
   478	{
 > 479		pinctrl_gpio_free(chip->base + offset);
   480	}
   481	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

