Return-Path: <linux-gpio+bounces-10484-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0CB987F19
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 09:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11CB5280EE8
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 07:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CABD17C98C;
	Fri, 27 Sep 2024 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tu+jZSzR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7688517A5B6;
	Fri, 27 Sep 2024 07:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727420651; cv=none; b=V5sOJ1iKRDiOBkMolRciLCVgnoW7uAHKANvWrEagMWuJB/0TcOGd4wNibMmg5NYHb8HsUYX6lLFmz1w3WRy11FG8UAys024anTfigJL/GixkNwc3cn9Z/RfJDZ/Y4I9e5pC6rGAxt0lGYdHedr2yFOaUVSJGWLl86Df67Y43vNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727420651; c=relaxed/simple;
	bh=nWh818rj5AhbrxF8NjTX5z1Pkd7RgEinEYr2g/FLkLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mOmnQoJB4v+oWIWYAPbgYUqGdL0ymxnHB0/EE8wCBhqMCIJ3f5RaLv5X2CrB2oFclkmAHpEmilRQth/y4FNeS1uHPJsDRiPOHxNJG/xlSJlk9u5ltQ5fubvyz+a1BNVdSUxCnT/urxrWBxWWT9jMTQujm2q2v8XSsSHIwiEPPow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tu+jZSzR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727420647; x=1758956647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nWh818rj5AhbrxF8NjTX5z1Pkd7RgEinEYr2g/FLkLU=;
  b=Tu+jZSzRjoarjt0Te9iykphBpcuXu4ozXmHfAApDqHX9R8vYLOvd9f3N
   qQPB5b6pH1n8JpHruI1dhWfae0k8CtRlGfT2ucAT7Vybs5c0fVk6jE5Bf
   SCH1clMZBqCfIn6CI8eJ39IOW5YqqvcSdOOtAOWJN6IWEj05cJAsu9ons
   9BWZZjFFRrc+cJQ+AhoPBMyotgMCRTW9hmSIGxBqeoUou5qhrACoNrkN2
   2mb71rOn2H77jQDRXOzNnwdd+23W2TGTyJMZts/XcAQDBaVgrIqnNC0nw
   848JwqcEl71aCphCkSZl+jTsj9ZzbeXDFjdJazc6Q6im3ZSz7yGMH58mr
   w==;
X-CSE-ConnectionGUID: dIlF71ejTxaNq0NQEJ/Tqw==
X-CSE-MsgGUID: F6BOMGI8RRCpZL0dF9+NNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37692415"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="37692415"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 00:04:07 -0700
X-CSE-ConnectionGUID: uzfPGVUgQD2k7HG11eH5+A==
X-CSE-MsgGUID: dtCoeqF4R2uSnFM6N1QkfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="77264334"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Sep 2024 00:04:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su51E-000LdB-0Q;
	Fri, 27 Sep 2024 07:04:00 +0000
Date: Fri, 27 Sep 2024 15:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: Re: [PATCH v4 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
Message-ID: <202409271406.SOjGw98h-lkp@intel.com>
References: <20240926143122.1385658-4-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926143122.1385658-4-andrei.stefanescu@oss.nxp.com>

Hi Andrei,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus robh/for-next linus/master v6.11 next-20240926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Stefanescu/drivers-provide-devm_platform_get_and_ioremap_resource_byname/20240926-223448
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240926143122.1385658-4-andrei.stefanescu%40oss.nxp.com
patch subject: [PATCH v4 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs support
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20240927/202409271406.SOjGw98h-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271406.SOjGw98h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271406.SOjGw98h-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/openrisc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:27,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/openrisc/include/asm/pgalloc.h:20,
                    from arch/openrisc/include/asm/io.h:18,
                    from include/linux/io.h:14,
                    from drivers/gpio/gpio-siul2-s32g2.c:11:
   drivers/gpio/gpio-siul2-s32g2.c: In function 'common_regmap_init':
   include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/gpio/gpio-siul2-s32g2.c:296:46: note: in expansion of macro 'do_div'
     296 |                 conf->num_reg_defaults_raw = do_div(size, conf->reg_stride);
         |                                              ^~~~~~
   In file included from include/linux/err.h:5,
                    from drivers/gpio/gpio-siul2-s32g2.c:9:
   include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/gpio/gpio-siul2-s32g2.c:296:46: note: in expansion of macro 'do_div'
     296 |                 conf->num_reg_defaults_raw = do_div(size, conf->reg_stride);
         |                                              ^~~~~~
>> include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    resource_size_t * {aka unsigned int *}
   drivers/gpio/gpio-siul2-s32g2.c:296:46: note: in expansion of macro 'do_div'
     296 |                 conf->num_reg_defaults_raw = do_div(size, conf->reg_stride);
         |                                              ^~~~~~
   include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'resource_size_t *' {aka 'unsigned int *'}
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~


vim +/__div64_32 +238 include/asm-generic/div64.h

^1da177e4c3f41 Linus Torvalds     2005-04-16  215  
^1da177e4c3f41 Linus Torvalds     2005-04-16  216  /* The unnecessary pointer compare is there
^1da177e4c3f41 Linus Torvalds     2005-04-16  217   * to check for type safety (n must be 64bit)
^1da177e4c3f41 Linus Torvalds     2005-04-16  218   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  219  # define do_div(n,base) ({				\
^1da177e4c3f41 Linus Torvalds     2005-04-16  220  	uint32_t __base = (base);			\
^1da177e4c3f41 Linus Torvalds     2005-04-16  221  	uint32_t __rem;					\
^1da177e4c3f41 Linus Torvalds     2005-04-16  222  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  223  	if (__builtin_constant_p(__base) &&		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  224  	    is_power_of_2(__base)) {			\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  225  		__rem = (n) & (__base - 1);		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  226  		(n) >>= ilog2(__base);			\
c747ce4706190e Geert Uytterhoeven 2021-08-11  227  	} else if (__builtin_constant_p(__base) &&	\
461a5e51060c93 Nicolas Pitre      2015-10-30  228  		   __base != 0) {			\
461a5e51060c93 Nicolas Pitre      2015-10-30  229  		uint32_t __res_lo, __n_lo = (n);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  230  		(n) = __div64_const32(n, __base);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  231  		/* the remainder can be computed with 32-bit regs */ \
461a5e51060c93 Nicolas Pitre      2015-10-30  232  		__res_lo = (n);				\
461a5e51060c93 Nicolas Pitre      2015-10-30  233  		__rem = __n_lo - __res_lo * __base;	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  234  	} else if (likely(((n) >> 32) == 0)) {		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  235  		__rem = (uint32_t)(n) % __base;		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  236  		(n) = (uint32_t)(n) / __base;		\
c747ce4706190e Geert Uytterhoeven 2021-08-11  237  	} else {					\
^1da177e4c3f41 Linus Torvalds     2005-04-16 @238  		__rem = __div64_32(&(n), __base);	\
c747ce4706190e Geert Uytterhoeven 2021-08-11  239  	}						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  240  	__rem;						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  241   })
^1da177e4c3f41 Linus Torvalds     2005-04-16  242  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

