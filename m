Return-Path: <linux-gpio+bounces-9464-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8013796667A
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 18:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3CAB1C2136C
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 16:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEE01B86DB;
	Fri, 30 Aug 2024 16:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Em0t3yBR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DA41B5EC2;
	Fri, 30 Aug 2024 16:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725034103; cv=none; b=VO+04gMULc1ZFQ4anmh5JpTDbRO7605TVs7UIpIrEG+d+7BPPnWq6HsXnxaBHvcHtCcZdqTtZMXE9cFLd/pK62BUBQZgypxyD/7UIq0lSPHpygq5KF5a6uNMZYd4Hbdn0Wbmw6CQBvfCkw+jqioTvhy9QuzJBZa1Cpcwgk2Pu/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725034103; c=relaxed/simple;
	bh=NQvkHbKFvCNmAk13O0Hw0+Go2GG2xCkOaQ+cBqqlySY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTPynz9TZZ7gLF8LwKIPGRXWZ9Gt355h/L6E1yIllRO/qH9r+zSw3mgiAHBbBiqPLXEz98EWl1WGCHezPJzm1QyF5sNiw3x9h6A4KHmJoRrTm7YlAsVyuZUd6H0d62d52hpHAMC99NcTe/3/T0E+dF7nltWGwLQkJ/aW+jxOQzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Em0t3yBR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725034102; x=1756570102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NQvkHbKFvCNmAk13O0Hw0+Go2GG2xCkOaQ+cBqqlySY=;
  b=Em0t3yBRqOUmsfaPqA4IAQq8Q7ow5sL6oiubbBhZ8MSXW3VMFvKFlHSJ
   0q676kWrPqEeORiM756nHYwTiagO1Edn6F8E/slxoRJFgvE820dgXlv0w
   FyIQcrTtAExlgXCR78lK4XwfyvCMSrBbxb1FGkq806wO3AtAFDZwSmV1E
   XD5pGE/czFbuV1i8BGcQZwQ7ddNprbBWQmgKuHF3mj4DO6pKORYyNCauB
   WtlYY+UOPWsk/6jMO8t7OLZxZtoq2EnvCa1mN6QMXvdtjdhZbJhmDUXbG
   o+cywhEkXllkyVToAGuLzE+aUtSHcWTLYITtOWQlgDQQtaXPHO0RILDo4
   A==;
X-CSE-ConnectionGUID: zYjzy1UES4OWZY7xxII6oQ==
X-CSE-MsgGUID: DwiCuyqNTzC0w1aoRHk49Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="34255326"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="34255326"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 09:08:21 -0700
X-CSE-ConnectionGUID: dUUB7NMLS0i/oQh7OvxTUA==
X-CSE-MsgGUID: LVikeV91R/i9tICoQsoktg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="94674482"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Aug 2024 09:08:17 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk4AY-0001cu-2r;
	Fri, 30 Aug 2024 16:08:14 +0000
Date: Sat, 31 Aug 2024 00:07:37 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org,
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 3/4] gpio: aspeed: Create llops to handle hardware
 access
Message-ID: <202408302344.bCpCF6bu-lkp@intel.com>
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
config: i386-buildonly-randconfig-004-20240830 (https://download.01.org/0day-ci/archive/20240830/202408302344.bCpCF6bu-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408302344.bCpCF6bu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408302344.bCpCF6bu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-aspeed.c:394:6: warning: variable 'copro' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     394 |         if (gpio->llops->copro_request)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:399:6: note: uninitialized use occurs here
     399 |         if (copro && gpio->llops->copro_release)
         |             ^~~~~
   drivers/gpio/gpio-aspeed.c:394:2: note: remove the 'if' if its condition is always true
     394 |         if (gpio->llops->copro_request)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     395 |                 copro = gpio->llops->copro_request(gpio, offset);
   drivers/gpio/gpio-aspeed.c:391:12: note: initialize the variable 'copro' to silence this warning
     391 |         bool copro;
         |                   ^
         |                    = 0
   drivers/gpio/gpio-aspeed.c:415:6: warning: variable 'copro' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     415 |         if (gpio->llops->copro_request)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:418:6: note: uninitialized use occurs here
     418 |         if (copro && gpio->llops->copro_release)
         |             ^~~~~
   drivers/gpio/gpio-aspeed.c:415:2: note: remove the 'if' if its condition is always true
     415 |         if (gpio->llops->copro_request)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     416 |                 copro = gpio->llops->copro_request(gpio, offset);
   drivers/gpio/gpio-aspeed.c:408:12: note: initialize the variable 'copro' to silence this warning
     408 |         bool copro;
         |                   ^
         |                    = 0
   drivers/gpio/gpio-aspeed.c:438:6: warning: variable 'copro' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     438 |         if (gpio->llops->copro_request)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:443:6: note: uninitialized use occurs here
     443 |         if (copro && gpio->llops->copro_release)
         |             ^~~~~
   drivers/gpio/gpio-aspeed.c:438:2: note: remove the 'if' if its condition is always true
     438 |         if (gpio->llops->copro_request)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     439 |                 copro = gpio->llops->copro_request(gpio, offset);
   drivers/gpio/gpio-aspeed.c:431:12: note: initialize the variable 'copro' to silence this warning
     431 |         bool copro;
         |                   ^
         |                    = 0
   drivers/gpio/gpio-aspeed.c:502:6: warning: variable 'copro' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     502 |         if (gpio->llops->copro_request)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:507:6: note: uninitialized use occurs here
     507 |         if (copro && gpio->llops->copro_release)
         |             ^~~~~
   drivers/gpio/gpio-aspeed.c:502:2: note: remove the 'if' if its condition is always true
     502 |         if (gpio->llops->copro_request)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |                 copro = gpio->llops->copro_request(gpio, offset);
   drivers/gpio/gpio-aspeed.c:495:12: note: initialize the variable 'copro' to silence this warning
     495 |         bool copro;
         |                   ^
         |                    = 0
   drivers/gpio/gpio-aspeed.c:528:6: warning: variable 'copro' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     528 |         if (gpio->llops->copro_request)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:533:6: note: uninitialized use occurs here
     533 |         if (copro && gpio->llops->copro_release)
         |             ^~~~~
   drivers/gpio/gpio-aspeed.c:528:2: note: remove the 'if' if its condition is always true
     528 |         if (gpio->llops->copro_request)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     529 |                 copro = gpio->llops->copro_request(gpio, offset);
   drivers/gpio/gpio-aspeed.c:517:12: note: initialize the variable 'copro' to silence this warning
     517 |         bool copro;
         |                   ^
         |                    = 0
   drivers/gpio/gpio-aspeed.c:589:6: warning: variable 'copro' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     589 |         if (gpio->llops->copro_request)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:596:6: note: uninitialized use occurs here
     596 |         if (copro && gpio->llops->copro_release)
         |             ^~~~~
   drivers/gpio/gpio-aspeed.c:589:2: note: remove the 'if' if its condition is always true
     589 |         if (gpio->llops->copro_request)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     590 |                 copro = gpio->llops->copro_request(gpio, offset);
   drivers/gpio/gpio-aspeed.c:561:12: note: initialize the variable 'copro' to silence this warning
     561 |         bool copro;
         |                   ^
         |                    = 0
   drivers/gpio/gpio-aspeed.c:659:6: warning: variable 'copro' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     659 |         if (gpio->llops->copro_request)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-aspeed.c:664:6: note: uninitialized use occurs here
     664 |         if (copro && gpio->llops->copro_release)
         |             ^~~~~
   drivers/gpio/gpio-aspeed.c:659:2: note: remove the 'if' if its condition is always true
     659 |         if (gpio->llops->copro_request)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     660 |                 copro = gpio->llops->copro_request(gpio, offset);
   drivers/gpio/gpio-aspeed.c:656:12: note: initialize the variable 'copro' to silence this warning
     656 |         bool copro;
         |                   ^
         |                    = 0
   7 warnings generated.


vim +394 drivers/gpio/gpio-aspeed.c

   385	
   386	static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
   387				    int val)
   388	{
   389		struct aspeed_gpio *gpio = gpiochip_get_data(gc);
   390		unsigned long flags;
   391		bool copro;
   392	
   393		raw_spin_lock_irqsave(&gpio->lock, flags);
 > 394		if (gpio->llops->copro_request)
   395			copro = gpio->llops->copro_request(gpio, offset);
   396	
   397		__aspeed_gpio_set(gc, offset, val);
   398	
   399		if (copro && gpio->llops->copro_release)
   400			gpio->llops->copro_release(gpio, offset);
   401		raw_spin_unlock_irqrestore(&gpio->lock, flags);
   402	}
   403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

