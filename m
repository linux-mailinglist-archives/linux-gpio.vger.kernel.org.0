Return-Path: <linux-gpio+bounces-22781-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA40AAF8984
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 09:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 001841CA0E6A
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 07:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932D927F4F5;
	Fri,  4 Jul 2025 07:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHZeYaLY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9712227F18B;
	Fri,  4 Jul 2025 07:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614287; cv=none; b=g9JDrgWVCU8YImCJ9UIZpa2hxh7T0fVqr88lLm5LtR0gv46tG/1EIbK79ecanA3F/nYElr4+1cNPA8XZcMvVX1G7kgkwtwE7tfCfuhyHjNVYmyWxdLSWc3myQBcCmUY7/bXibI38hxKCxuSvXGgsXKeBnqOAa3XdSSAmK2LPd3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614287; c=relaxed/simple;
	bh=I0BQB5Y0sAR1ONC1TeJSE+OpNExr7IsFBX7iMmg16MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ii5DmzTDQHZ2THQZ6lizjwWEaXsr66aeGoWtVREnj9cNKGX72jzyLjT8iJ1EjjS5gI7ZXIG2QN4Pnbo8pv99Fp0zWuX1FfxwuK4QmMC26pq7te0tVy2ApEKZC85hOUF8f9oRIoP5hysjNdQJ41ETaWKDQh+unk3EDEaVpJZL5Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHZeYaLY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751614286; x=1783150286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I0BQB5Y0sAR1ONC1TeJSE+OpNExr7IsFBX7iMmg16MA=;
  b=AHZeYaLYKkLhsBO3qpELo4KicLw7pHGxZNqL6tJL/yN4exoIh5ihiHUZ
   fXh3FWRT1DXapA4oOzX/Hh0MGhlz5wsCYlWxTC3MPGNBgOHmCXT0/jVmG
   hVI8ghPGNjcB/LyQAG15HZ7Y67hw2l/kGdJKrVKmtPpf4NP2WEqjN1+dy
   lb/3fgOh9C58m4aPkiI6AsO9CUOFRlJj69a433RgsJA65QUtUGK+aHxie
   tHXrVOGJiK2PdtSxu7HXl5KPRtK4y+HY6p+E9nBDgCppHxcSDxFyXLBwB
   kqakufG6Qtu8hqbgK7ed8CGbOn+ZooFnI5Nvc0F/2UmrMA9pBAkORRuZc
   A==;
X-CSE-ConnectionGUID: hYpzsugWTXqB1k3VPtp8yw==
X-CSE-MsgGUID: tPNspjYyS+yhQKppjTZRng==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53871627"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="53871627"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:31:25 -0700
X-CSE-ConnectionGUID: NOGy6WoYRjKXVfBseLKXdA==
X-CSE-MsgGUID: ob6MCjr8SRKu3k2TGvctbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="155337062"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Jul 2025 00:31:21 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXatD-0003Rn-10;
	Fri, 04 Jul 2025 07:31:19 +0000
Date: Fri, 4 Jul 2025 15:31:09 +0800
From: kernel test robot <lkp@intel.com>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi,
	andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org,
	tony@atomide.com, linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, m-leonard@ti.com,
	praneeth@ti.com, jcormier@criticallink.com
Subject: Re: [PATCH v6 2/2] gpio: tps65219: Add support for TI TPS65214 PMIC
Message-ID: <202507041537.da8R2iEX-lkp@intel.com>
References: <20250703180751.168755-3-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703180751.168755-3-s-ramamoorthy@ti.com>

Hi Shree,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.16-rc4]
[also build test ERROR on linus/master next-20250703]
[cannot apply to tmlind-omap/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shree-Ramamoorthy/gpio-tps65219-Update-_IDX-_OFFSET-macro-prefix/20250704-021048
base:   v6.16-rc4
patch link:    https://lore.kernel.org/r/20250703180751.168755-3-s-ramamoorthy%40ti.com
patch subject: [PATCH v6 2/2] gpio: tps65219: Add support for TI TPS65214 PMIC
config: hexagon-randconfig-002-20250704 (https://download.01.org/0day-ci/archive/20250704/202507041537.da8R2iEX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041537.da8R2iEX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041537.da8R2iEX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-tps65219.c:208:14: error: incompatible function pointer types initializing 'int (*)(struct gpio_chip *, unsigned int, int)' with an expression of type 'void (struct gpio_chip *, unsigned int, int)' [-Wincompatible-function-pointer-types]
     208 |         .set_rv                 = tps65219_gpio_set,
         |                                   ^~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-tps65219.c:221:14: error: incompatible function pointer types initializing 'int (*)(struct gpio_chip *, unsigned int, int)' with an expression of type 'void (struct gpio_chip *, unsigned int, int)' [-Wincompatible-function-pointer-types]
     221 |         .set_rv                 = tps65219_gpio_set,
         |                                   ^~~~~~~~~~~~~~~~~
   2 errors generated.


vim +208 drivers/gpio/gpio-tps65219.c

   200	
   201	static const struct gpio_chip tps65214_template_chip = {
   202		.label			= "tps65214-gpio",
   203		.owner			= THIS_MODULE,
   204		.get_direction		= tps65214_gpio_get_direction,
   205		.direction_input	= tps65219_gpio_direction_input,
   206		.direction_output	= tps65219_gpio_direction_output,
   207		.get			= tps65219_gpio_get,
 > 208		.set_rv			= tps65219_gpio_set,
   209		.base			= -1,
   210		.ngpio			= 2,
   211		.can_sleep		= true,
   212	};
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

