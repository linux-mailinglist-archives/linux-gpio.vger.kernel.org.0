Return-Path: <linux-gpio+bounces-25700-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D6EB4734D
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Sep 2025 18:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F8381B21140
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Sep 2025 16:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4745722A813;
	Sat,  6 Sep 2025 16:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2ntx3js"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230342264D6;
	Sat,  6 Sep 2025 16:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757174406; cv=none; b=tbQ5MVcVUuFtq1JHKzDMYcwSpb3ljEUNWLmegQDq5dDr7mbKHnfcpE5b+cMuyEKW0Jcx9cg4rAqFeuBG9WBGPMLwkpgdXognJgcznK1ly8rX0vgopctTyxutTpI8mo/VMlcMSJbsX7Z6k635Eq+J4gsdCTH/9avlmf3UEmVggqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757174406; c=relaxed/simple;
	bh=WUhsfst+t0XA7eALQAuAAQ1QqyE/1cJqSc+0vKr5M+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xm4lNKQh9K39WbgfA4FvPE+TnlmgWJ12aVfsI9nA+iHiOTy3FmhM1+llVrf5VMcln2Yjiehtteay0fua5N4C7Bqgk6c3ZbN/AZcVnl9O8hxC3yF60jT4RmukmVQ8TZPupOsAPScRnYUvFGmcYjCUkiE0yNWFhSonv4Vuijr4Pmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2ntx3js; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757174404; x=1788710404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WUhsfst+t0XA7eALQAuAAQ1QqyE/1cJqSc+0vKr5M+8=;
  b=I2ntx3js75/Qk1Bu41HaWodYEUpCoDemF71qRcx83bKErOkuePJkEE4Y
   PNaTfvdWGuipcWMLgGKBj7As+SCMEkwLTwVQP506VsjbjtmdhJT5fmCmE
   XIxKlF8Iv7YjPcPEEuDpEbFWtR2uhfFcLvZ9YwOCnqNyVm/MJDWHUzJ1Y
   ujfYK25NXAJ30SKhwKhB9ABspkBFvk8lUQsL380Q2JjzZIBWvUqFXSOaI
   kYvFsjyfW7+DzhYC1wewAP8Hfb/A3rjHokbA/0RSsE9oAEdok4R06oxvt
   ajSMBTnByui3+dt9U6y91wt9IkfP0MIe+xp5NJCfucFv9Tn0Z2FLsrZPu
   A==;
X-CSE-ConnectionGUID: rMFKnipaQFWviunRXFMkzw==
X-CSE-MsgGUID: 17WONNIgQwefNS4MOamrOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="63135057"
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="63135057"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 09:00:04 -0700
X-CSE-ConnectionGUID: /80grLjnS9W6VoqG2YW13A==
X-CSE-MsgGUID: gvZKXpPfS72uzbhb/gOiQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="172513740"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Sep 2025 08:59:59 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuvKW-0001bD-0V;
	Sat, 06 Sep 2025 15:59:56 +0000
Date: Sat, 6 Sep 2025 23:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, linus.walleij@linaro.org,
	brgl@bgdev.pl, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 3/4] pinctrl: aspeed: Add AST2700 pinmux support
Message-ID: <202509062340.wX64fW0j-lkp@intel.com>
References: <20250904103401.88287-4-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904103401.88287-4-billy_tsai@aspeedtech.com>

Hi Billy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next robh/for-next lee-leds/for-leds-next linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-mfd-aspeed-ast2x00-scu-Support-ast2700-pinctrl/20250904-184115
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250904103401.88287-4-billy_tsai%40aspeedtech.com
patch subject: [PATCH v2 3/4] pinctrl: aspeed: Add AST2700 pinmux support
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20250906/202509062340.wX64fW0j-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509062340.wX64fW0j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509062340.wX64fW0j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pinctrl/aspeed/pinctrl-aspeed.h:15,
                    from drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c:18:
>> drivers/pinctrl/aspeed/pinmux-aspeed.h:741:26: warning: 'group_pins_LTPI_I2C3' defined but not used [-Wunused-const-variable=]
     741 | #define GROUP_SYM(group) group_pins_ ## group
         |                          ^~~~~~~~~~~
   drivers/pinctrl/aspeed/pinmux-aspeed.h:743:26: note: in expansion of macro 'GROUP_SYM'
     743 |         static const int GROUP_SYM(group)[] = { __VA_ARGS__ }
         |                          ^~~~~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c:479:1: note: in expansion of macro 'GROUP_DECL'
     479 | GROUP_DECL(LTPI_I2C3, J9, J10);
         | ^~~~~~~~~~
>> drivers/pinctrl/aspeed/pinmux-aspeed.h:741:26: warning: 'group_pins_LTPI_I2C2' defined but not used [-Wunused-const-variable=]
     741 | #define GROUP_SYM(group) group_pins_ ## group
         |                          ^~~~~~~~~~~
   drivers/pinctrl/aspeed/pinmux-aspeed.h:743:26: note: in expansion of macro 'GROUP_SYM'
     743 |         static const int GROUP_SYM(group)[] = { __VA_ARGS__ }
         |                          ^~~~~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c:478:1: note: in expansion of macro 'GROUP_DECL'
     478 | GROUP_DECL(LTPI_I2C2, H10, H11);
         | ^~~~~~~~~~
>> drivers/pinctrl/aspeed/pinmux-aspeed.h:741:26: warning: 'group_pins_LTPI_I2C1' defined but not used [-Wunused-const-variable=]
     741 | #define GROUP_SYM(group) group_pins_ ## group
         |                          ^~~~~~~~~~~
   drivers/pinctrl/aspeed/pinmux-aspeed.h:743:26: note: in expansion of macro 'GROUP_SYM'
     743 |         static const int GROUP_SYM(group)[] = { __VA_ARGS__ }
         |                          ^~~~~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c:477:1: note: in expansion of macro 'GROUP_DECL'
     477 | GROUP_DECL(LTPI_I2C1, H8, H9);
         | ^~~~~~~~~~
>> drivers/pinctrl/aspeed/pinmux-aspeed.h:741:26: warning: 'group_pins_LTPI_I2C0' defined but not used [-Wunused-const-variable=]
     741 | #define GROUP_SYM(group) group_pins_ ## group
         |                          ^~~~~~~~~~~
   drivers/pinctrl/aspeed/pinmux-aspeed.h:743:26: note: in expansion of macro 'GROUP_SYM'
     743 |         static const int GROUP_SYM(group)[] = { __VA_ARGS__ }
         |                          ^~~~~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c:476:1: note: in expansion of macro 'GROUP_DECL'
     476 | GROUP_DECL(LTPI_I2C0, G11, H7);
         | ^~~~~~~~~~


vim +/group_pins_LTPI_I2C3 +741 drivers/pinctrl/aspeed/pinmux-aspeed.h

efa5623981b72f Andrew Jeffery 2019-06-28  655  
7b388970816665 Andrew Jeffery 2019-07-29  656  #define PIN_DECL_(pin, ...) \
efa5623981b72f Andrew Jeffery 2019-06-28  657  	static const struct aspeed_sig_expr **PIN_EXPRS_SYM(pin)[] = \
efa5623981b72f Andrew Jeffery 2019-06-28  658  		{ __VA_ARGS__, NULL }; \
efa5623981b72f Andrew Jeffery 2019-06-28  659  	static const struct aspeed_pin_desc PIN_SYM(pin) = \
efa5623981b72f Andrew Jeffery 2019-06-28  660  		{ #pin, PIN_EXPRS_PTR(pin) }
efa5623981b72f Andrew Jeffery 2019-06-28  661  
efa5623981b72f Andrew Jeffery 2019-06-28  662  /**
efa5623981b72f Andrew Jeffery 2019-06-28  663   * Declare a single signal pin
efa5623981b72f Andrew Jeffery 2019-06-28  664   *
efa5623981b72f Andrew Jeffery 2019-06-28  665   * @pin: The pin number
efa5623981b72f Andrew Jeffery 2019-06-28  666   * @other: Macro name for "other" functionality (subjected to stringification)
efa5623981b72f Andrew Jeffery 2019-06-28  667   * @sig: Macro name for the signal (subjected to stringification)
efa5623981b72f Andrew Jeffery 2019-06-28  668   *
efa5623981b72f Andrew Jeffery 2019-06-28  669   * For example:
efa5623981b72f Andrew Jeffery 2019-06-28  670   *
efa5623981b72f Andrew Jeffery 2019-06-28  671   *     #define E3 80
efa5623981b72f Andrew Jeffery 2019-06-28  672   *     SIG_EXPR_LIST_DECL_SINGLE(SCL5, I2C5, I2C5_DESC);
7b388970816665 Andrew Jeffery 2019-07-29  673   *     PIN_DECL_1(E3, GPIOK0, SCL5);
efa5623981b72f Andrew Jeffery 2019-06-28  674   */
7b388970816665 Andrew Jeffery 2019-07-29  675  #define PIN_DECL_1(pin, other, sig) \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  676  	SIG_EXPR_LIST_DECL_SESG(pin, other, other); \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  677  	PIN_DECL_(pin, SIG_EXPR_LIST_PTR(pin, sig), \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  678  		  SIG_EXPR_LIST_PTR(pin, other))
efa5623981b72f Andrew Jeffery 2019-06-28  679  
efa5623981b72f Andrew Jeffery 2019-06-28  680  /**
efa5623981b72f Andrew Jeffery 2019-06-28  681   * Single signal, single function pin declaration
efa5623981b72f Andrew Jeffery 2019-06-28  682   *
efa5623981b72f Andrew Jeffery 2019-06-28  683   * @pin: The pin number
efa5623981b72f Andrew Jeffery 2019-06-28  684   * @other: Macro name for "other" functionality (subjected to stringification)
efa5623981b72f Andrew Jeffery 2019-06-28  685   * @sig: Macro name for the signal (subjected to stringification)
efa5623981b72f Andrew Jeffery 2019-06-28  686   * @...: Signal descriptors that define the function expression
efa5623981b72f Andrew Jeffery 2019-06-28  687   *
efa5623981b72f Andrew Jeffery 2019-06-28  688   * For example:
efa5623981b72f Andrew Jeffery 2019-06-28  689   *
efa5623981b72f Andrew Jeffery 2019-06-28  690   *    SSSF_PIN_DECL(A4, GPIOA2, TIMER3, SIG_DESC_SET(SCU80, 2));
efa5623981b72f Andrew Jeffery 2019-06-28  691   */
efa5623981b72f Andrew Jeffery 2019-06-28  692  #define SSSF_PIN_DECL(pin, other, sig, ...) \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  693  	SIG_EXPR_LIST_DECL_SESG(pin, sig, sig, __VA_ARGS__); \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  694  	SIG_EXPR_LIST_DECL_SESG(pin, other, other); \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  695  	PIN_DECL_(pin, SIG_EXPR_LIST_PTR(pin, sig), \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  696  		  SIG_EXPR_LIST_PTR(pin, other)); \
efa5623981b72f Andrew Jeffery 2019-06-28  697  	FUNC_GROUP_DECL(sig, pin)
27d1f73670774e Andrew Jeffery 2019-07-29  698  /**
27d1f73670774e Andrew Jeffery 2019-07-29  699   * Declare a two-signal pin
27d1f73670774e Andrew Jeffery 2019-07-29  700   *
27d1f73670774e Andrew Jeffery 2019-07-29  701   * @pin: The pin number
27d1f73670774e Andrew Jeffery 2019-07-29  702   * @other: Macro name for "other" functionality (subjected to stringification)
27d1f73670774e Andrew Jeffery 2019-07-29  703   * @high: Macro name for the highest priority signal functions
27d1f73670774e Andrew Jeffery 2019-07-29  704   * @low: Macro name for the low signal functions
27d1f73670774e Andrew Jeffery 2019-07-29  705   *
27d1f73670774e Andrew Jeffery 2019-07-29  706   * For example:
27d1f73670774e Andrew Jeffery 2019-07-29  707   *
27d1f73670774e Andrew Jeffery 2019-07-29  708   *     #define A8 56
27d1f73670774e Andrew Jeffery 2019-07-29  709   *     SIG_EXPR_DECL(ROMD8, ROM16, SIG_DESC_SET(SCU90, 6));
27d1f73670774e Andrew Jeffery 2019-07-29  710   *     SIG_EXPR_DECL(ROMD8, ROM16S, SIG_DESC_SET(HW_STRAP1, 4),
27d1f73670774e Andrew Jeffery 2019-07-29  711   *              { HW_STRAP1, GENMASK(1, 0), 0, 0 });
27d1f73670774e Andrew Jeffery 2019-07-29  712   *     SIG_EXPR_LIST_DECL(ROMD8, SIG_EXPR_PTR(ROMD8, ROM16),
27d1f73670774e Andrew Jeffery 2019-07-29  713   *              SIG_EXPR_PTR(ROMD8, ROM16S));
27d1f73670774e Andrew Jeffery 2019-07-29  714   *     SIG_EXPR_LIST_DECL_SINGLE(NCTS6, NCTS6, SIG_DESC_SET(SCU90, 7));
27d1f73670774e Andrew Jeffery 2019-07-29  715   *     PIN_DECL_2(A8, GPIOH0, ROMD8, NCTS6);
27d1f73670774e Andrew Jeffery 2019-07-29  716   */
27d1f73670774e Andrew Jeffery 2019-07-29  717  #define PIN_DECL_2(pin, other, high, low) \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  718  	SIG_EXPR_LIST_DECL_SESG(pin, other, other); \
27d1f73670774e Andrew Jeffery 2019-07-29  719  	PIN_DECL_(pin, \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  720  			SIG_EXPR_LIST_PTR(pin, high), \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  721  			SIG_EXPR_LIST_PTR(pin, low), \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  722  			SIG_EXPR_LIST_PTR(pin, other))
27d1f73670774e Andrew Jeffery 2019-07-29  723  
27d1f73670774e Andrew Jeffery 2019-07-29  724  #define PIN_DECL_3(pin, other, high, medium, low) \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  725  	SIG_EXPR_LIST_DECL_SESG(pin, other, other); \
27d1f73670774e Andrew Jeffery 2019-07-29  726  	PIN_DECL_(pin, \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  727  			SIG_EXPR_LIST_PTR(pin, high), \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  728  			SIG_EXPR_LIST_PTR(pin, medium), \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  729  			SIG_EXPR_LIST_PTR(pin, low), \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  730  			SIG_EXPR_LIST_PTR(pin, other))
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  731  
0b9714845935ae Steven Lee     2021-05-25  732  #define PIN_DECL_4(pin, other, prio1, prio2, prio3, prio4) \
0b9714845935ae Steven Lee     2021-05-25  733  	SIG_EXPR_LIST_DECL_SESG(pin, other, other); \
0b9714845935ae Steven Lee     2021-05-25  734  	PIN_DECL_(pin, \
0b9714845935ae Steven Lee     2021-05-25  735  			SIG_EXPR_LIST_PTR(pin, prio1), \
0b9714845935ae Steven Lee     2021-05-25  736  			SIG_EXPR_LIST_PTR(pin, prio2), \
0b9714845935ae Steven Lee     2021-05-25  737  			SIG_EXPR_LIST_PTR(pin, prio3), \
0b9714845935ae Steven Lee     2021-05-25  738  			SIG_EXPR_LIST_PTR(pin, prio4), \
0b9714845935ae Steven Lee     2021-05-25  739  			SIG_EXPR_LIST_PTR(pin, other))
0b9714845935ae Steven Lee     2021-05-25  740  
e7a96b0b7d1669 Andrew Jeffery 2019-07-29 @741  #define GROUP_SYM(group) group_pins_ ## group
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  742  #define GROUP_DECL(group, ...) \
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  743  	static const int GROUP_SYM(group)[] = { __VA_ARGS__ }
e7a96b0b7d1669 Andrew Jeffery 2019-07-29  744  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

