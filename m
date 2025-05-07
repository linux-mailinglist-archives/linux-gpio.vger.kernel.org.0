Return-Path: <linux-gpio+bounces-19756-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE89AAE831
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 19:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 928E47AA22B
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 17:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB1328DB5E;
	Wed,  7 May 2025 17:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1+FsNHT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C8C28C2B9;
	Wed,  7 May 2025 17:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746640235; cv=none; b=oemnmG32NtajQF6+MEnuCN+Pp+39tEv/NnntWfZIdOxjTgU6SAaiJDjhncrrohzq02Jv7ZjyFHqykJfPzIvhKNzTh5ciNUeRYw5Cs2QthCdm4PGV85mM/Qx4jZspw/WFNSj9GOYQ39QDXn/9Nc6dWH0dkDgHsl6MGZTSnS1J/ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746640235; c=relaxed/simple;
	bh=HFwdVXzZ1CNYZyQqaj1DLzkkPltpMegQ5LnWNpViWgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/OZFbQTz8A6Ug9aS4kvUqCOjd130LwxsjqjBVJRvX8l9YO1YrDyY1XckEH41C95QnNIRe7QQmPDaIYmlmhOKP4L6bcLl0JIxemjIVx85yGityA6mVF+CnuIxXie/b+xgPJ3vsyy5kSl0We1ZZjqrUxruBlcPMFF0zopdY7h8Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1+FsNHT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746640232; x=1778176232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HFwdVXzZ1CNYZyQqaj1DLzkkPltpMegQ5LnWNpViWgA=;
  b=f1+FsNHTrBbeVbDgnsQf/L+mJoENB8E/XlVHCbYhY2OcWenk/x+2ZZQ3
   ANA8qkpEWeZ+XJXZ53tocCLv1oggJLSljk26cTyczJ8oYfvOPHTPa+pUV
   qN8IYQxV7HjwkTwYpPnNmpX1SpoPeNftzl7kd1O1Q4dA/j5aArX7WtPQw
   e7Ykk1VAUe1y3mB5ealYm7iY0aLhT0lhyujMbDJnsntb6hQhSgHJC7y6X
   Xgi+z02uiw+dy7B9ye2YLAeeSntwxQ8YCwGe3vdUn8/VKT+wXugHTr0nn
   kR9X42DhgRYXSjwNiH+53buJE0Zv+ttVoeTf8T1YzD/v70AUHyAXsM7wT
   A==;
X-CSE-ConnectionGUID: jgYpmaxgRkuVeadXt1eOdQ==
X-CSE-MsgGUID: PDVCZpogSx6bw7qnn6buRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52203190"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="52203190"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 10:50:31 -0700
X-CSE-ConnectionGUID: SILCjCe0Ss2Uji0a6Ysddg==
X-CSE-MsgGUID: +nYK3GBoTGmI8yeTxN/+Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="135731386"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 May 2025 10:50:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCiuX-0008FN-28;
	Wed, 07 May 2025 17:50:25 +0000
Date: Thu, 8 May 2025 01:49:51 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org,
	Thomas Richard <thomas.richard@bootlin.com>
Subject: Re: [PATCH v5 01/12] gpiolib: add support to register sparse pin
 range
Message-ID: <202505080122.v2Lm1rIa-lkp@intel.com>
References: <20250506-aaeon-up-board-pinctrl-support-v5-1-3906529757d2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-1-3906529757d2@bootlin.com>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8a834b0ac9ceb354a6e0b8cf5b363edca8221bdd]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Richard/gpiolib-add-support-to-register-sparse-pin-range/20250506-232604
base:   8a834b0ac9ceb354a6e0b8cf5b363edca8221bdd
patch link:    https://lore.kernel.org/r/20250506-aaeon-up-board-pinctrl-support-v5-1-3906529757d2%40bootlin.com
patch subject: [PATCH v5 01/12] gpiolib: add support to register sparse pin range
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250508/202505080122.v2Lm1rIa-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505080122.v2Lm1rIa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505080122.v2Lm1rIa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpio/gpiolib.c:32:
>> include/linux/gpio/driver.h:836:10: error: expected ';' after return statement
     836 |         return 0
         |                 ^
         |                 ;
   1 error generated.
--
   In file included from drivers/gpio/gpiolib-cdev.c:15:
>> include/linux/gpio/driver.h:836:10: error: expected ';' after return statement
     836 |         return 0
         |                 ^
         |                 ;
   drivers/gpio/gpiolib-cdev.c:1665:2: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1665 |         INIT_KFIFO(lr->events);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:135:69: note: expanded from macro 'INIT_KFIFO'
     135 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : ARRAY_SIZE(__tmp->buf) - 1;\
         |                       ~                             ~~~~~~~~~~~~~~~~~~~~~~~^~~
   1 warning and 1 error generated.
--
   In file included from drivers/gpio/gpiolib-swnode.c:20:
>> include/linux/gpio/driver.h:836:10: error: expected ';' after return statement
     836 |         return 0
         |                 ^
         |                 ;
   In file included from drivers/gpio/gpiolib-swnode.c:22:
   In file included from drivers/gpio/gpiolib.h:12:
   In file included from include/linux/cdev.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpio/gpiolib-swnode.c:22:
   In file included from drivers/gpio/gpiolib.h:12:
   In file included from include/linux/cdev.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpio/gpiolib-swnode.c:22:
   In file included from drivers/gpio/gpiolib.h:12:
   In file included from include/linux/cdev.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpio/gpiolib-swnode.c:22:
   In file included from drivers/gpio/gpiolib.h:12:
   In file included from include/linux/cdev.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpio/gpiolib-swnode.c:22:
   In file included from drivers/gpio/gpiolib.h:12:
   In file included from include/linux/cdev.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~


vim +836 include/linux/gpio/driver.h

   830	
   831	static inline int
   832	gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
   833			       unsigned int gpio_offset, unsigned int pin_offset,
   834			       unsigned int npins)
   835	{
 > 836		return 0
   837	}
   838	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

