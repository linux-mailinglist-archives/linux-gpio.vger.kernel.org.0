Return-Path: <linux-gpio+bounces-14613-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B88AFA06E28
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2025 07:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B65D41676A4
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2025 06:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6C91FFC7F;
	Thu,  9 Jan 2025 06:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S0Dv6ZwQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E44B19BBA
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jan 2025 06:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736403654; cv=none; b=oDTaeKEi93jwMES2g9M1L5s116ACpnu59sXM3M97DZfkaz3igwzCjP2I1Ov96PJ/SflWqgbLHeG1459FIjXLmeO5deDILdiJiUJLOckpIcWu7la/8KISz58brIndJzoubJ8ZKylvRxEoAy7n9XiBi4AJ64cF0hUFuyVHH8W7zrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736403654; c=relaxed/simple;
	bh=RBSacx9S8VqsH4Deux603i76oBMgfeAwdT2N+GHaQA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehIBd5+3dDZxXhI9WK7622gOdqaxLSVR8AosoCpR6nhNaPWaf7rFG8A9hqwqPHuw1PuMfB6ZlioOExsL3EPlFejKX2sbnPDY+VflhQlXNvkpkXdAQ8+JDRX7MlOdNWcUHBxjw1PijzNidXBIfyCpE4/a+d6thBsuNZi0GkGPSYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S0Dv6ZwQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736403653; x=1767939653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RBSacx9S8VqsH4Deux603i76oBMgfeAwdT2N+GHaQA4=;
  b=S0Dv6ZwQ+EvUypAY4FGjbiYg980mClxt5xAJ0eRZle6ZAKhgHn+y3ZaX
   hzVHwgz2QVXz1EdGgT9Cn2g2L5UVg5nZRDOh/+a/1tKoqLH/xTzP6q5VX
   tNe9f25ztfPIOGPi4JSP6GrXsC/vxX5gmk5B8Je5hXG0RmHjDYPUZxmOw
   ID4K0RKgq6wDyC7iDq0G67pv2eNhicEq/FIc84LKCZZe407k7EL13ZzLK
   XEa2gxQAVC4KJoDXXZp6xkRTyEesXmS54aW5VTMmMX9qEKN0arx6Cuerm
   SoIbtUzrpYqSAkhdFA/1YpZY0hogzez9mPuAYL1R9puQ2gZ0BV/hnTIKB
   Q==;
X-CSE-ConnectionGUID: ezq6+fgzQiS0DRRyjCl86Q==
X-CSE-MsgGUID: nhtvIIGNSiajECGgZsHOFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="59118478"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="59118478"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 22:20:52 -0800
X-CSE-ConnectionGUID: ivpY+bBhQAypAW1GVloc8A==
X-CSE-MsgGUID: CHdRE4f/Rm6cURmi1xjjMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="103518804"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jan 2025 22:20:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVluR-000H9r-1E;
	Thu, 09 Jan 2025 06:20:47 +0000
Date: Thu, 9 Jan 2025 14:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Mun Yew Tham <mun.yew.tham@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: altera: Drop .mapped_irq from driver data
Message-ID: <202501091340.XKaFRQLa-lkp@intel.com>
References: <20250108094851.3683769-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108094851.3683769-2-u.kleine-koenig@baylibre.com>

Hi Uwe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7b4b9bf203da94fbeac75ed3116c84aa03e74578]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/gpio-altera-Drop-mapped_irq-from-driver-data/20250108-175003
base:   7b4b9bf203da94fbeac75ed3116c84aa03e74578
patch link:    https://lore.kernel.org/r/20250108094851.3683769-2-u.kleine-koenig%40baylibre.com
patch subject: [PATCH] gpio: altera: Drop .mapped_irq from driver data
config: i386-buildonly-randconfig-001-20250109 (https://download.01.org/0day-ci/archive/20250109/202501091340.XKaFRQLa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501091340.XKaFRQLa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501091340.XKaFRQLa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-altera.c:42: warning: Excess struct member 'mapped_irq' description in 'altera_gpio_chip'


vim +42 drivers/gpio/gpio-altera.c

c5abbba932a4af Tien Hock Loh    2015-02-24  26  
c5abbba932a4af Tien Hock Loh    2015-02-24  27  /**
c5abbba932a4af Tien Hock Loh    2015-02-24  28  * struct altera_gpio_chip
50dded8d9d62b6 Andy Shevchenko  2024-10-31  29  * @gc			: GPIO chip structure.
50dded8d9d62b6 Andy Shevchenko  2024-10-31  30  * @regs			: memory mapped IO address for the controller registers.
c5abbba932a4af Tien Hock Loh    2015-02-24  31  * @gpio_lock		: synchronization lock so that new irq/set/get requests
9ce01efe5bdca3 Phil Reid        2019-01-24  32  *			  will be blocked until the current one completes.
c5abbba932a4af Tien Hock Loh    2015-02-24  33  * @interrupt_trigger	: specifies the hardware configured IRQ trigger type
9ce01efe5bdca3 Phil Reid        2019-01-24  34  *			  (rising, falling, both, high)
c5abbba932a4af Tien Hock Loh    2015-02-24  35  * @mapped_irq		: kernel mapped irq number.
c5abbba932a4af Tien Hock Loh    2015-02-24  36  */
c5abbba932a4af Tien Hock Loh    2015-02-24  37  struct altera_gpio_chip {
50dded8d9d62b6 Andy Shevchenko  2024-10-31  38  	struct gpio_chip gc;
50dded8d9d62b6 Andy Shevchenko  2024-10-31  39  	void __iomem *regs;
21d01c9c081ab2 Julia Cartwright 2017-03-09  40  	raw_spinlock_t gpio_lock;
c5abbba932a4af Tien Hock Loh    2015-02-24  41  	int interrupt_trigger;
c5abbba932a4af Tien Hock Loh    2015-02-24 @42  };
c5abbba932a4af Tien Hock Loh    2015-02-24  43  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

