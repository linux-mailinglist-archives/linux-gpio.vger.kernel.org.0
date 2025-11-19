Return-Path: <linux-gpio+bounces-28722-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D24D0C6CB3F
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 05:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E08E54EE7DD
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 04:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FC52F532F;
	Wed, 19 Nov 2025 04:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBwQ2d2d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75D61F5437;
	Wed, 19 Nov 2025 04:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526002; cv=none; b=RpFRF5A0eVcFxbkqH/3Ir6kV9IBlpr1pPEmyvsd8ch4xXL8Kn+2I/LqHYxBnuBmJujwYktY8fh/6K3MmYAyApFTnSH8p+MU5pQOd/tFNZNv1XzRfiU9h+rAuZrXW2T6yl093DACXnS8q5eC8ivNwiljlPCsfUsDcb1Cp/VmXGq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526002; c=relaxed/simple;
	bh=QPlpJezva1DjLD+z12sxscD3jz8U3HsGEFiTlU4O0kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4sCcumrcskbh0/rJmBiwkELu5iO7EcFJM87ICqhBq0yrvwEb6MRSs5w3ZQBDRIuDFjhk0sZCRJoVyVBKWARBEANlJHvvGgIFsFGUnqZIBlcL1kgvrDcB9xRRa4zAKTm0bkV7LvHuUY8+KC6+cG7vB+vpbBTQxtq9UzoHKNqFzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBwQ2d2d; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763526000; x=1795062000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QPlpJezva1DjLD+z12sxscD3jz8U3HsGEFiTlU4O0kM=;
  b=IBwQ2d2drjp2Oaex9RAMt+qnx4Zb445jYUyow2LveVOJ+BpbnvR29F6O
   2KLBnYvWTpt3xEs3Kfi9TLhlycakcMSiOF1cO6a+MSRcpAc7s7ofqcdsr
   2fQ9r2yXKgLWWkkJCS7cOHp/b1Uu01Zyhm1bKF0Vq1QjANZV+599Tbdc/
   wOa+SXuxaJeCZeYpLnwiShR0vm4jM8f/xuzgJywwa5FodznK4Y/dhkeNu
   stinMyUYjDRFi12FRdUI4LkMYM+JaTIJzhSVljjLI9Ip7wDmLUgEulU4b
   CNaU+up2AJz36pD6uCEHysdsrDWl6qpiuzhgHN9f4VVfaVm0GaRoUaB4G
   Q==;
X-CSE-ConnectionGUID: bvka5bweRjysvXjMff3Sfg==
X-CSE-MsgGUID: 81Kio38CQyix28jScIow9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="75885017"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="75885017"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 20:19:59 -0800
X-CSE-ConnectionGUID: SDP+mGTGTNmYxMSomAoDJg==
X-CSE-MsgGUID: 6xrds3+0QhKkawtHpSI/nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190196117"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Nov 2025 20:19:56 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLZfd-0002Rj-0T;
	Wed, 19 Nov 2025 04:19:53 +0000
Date: Wed, 19 Nov 2025 12:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sander Vanheule <sander@svanheule.net>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Sander Vanheule <sander@svanheule.net>
Subject: Re: [PATCH v7 4/6] pinctrl: Add RTL8231 pin control and GPIO support
Message-ID: <202511191158.bVKUDrKa-lkp@intel.com>
References: <20251117215138.4353-5-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117215138.4353-5-sander@svanheule.net>

Hi Sander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes lee-leds/for-leds-next linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.18-rc6 next-20251118]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sander-Vanheule/dt-bindings-leds-Binding-for-RTL8231-scan-matrix/20251118-055707
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20251117215138.4353-5-sander%40svanheule.net
patch subject: [PATCH v7 4/6] pinctrl: Add RTL8231 pin control and GPIO support
config: i386-randconfig-063-20251119 (https://download.01.org/0day-ci/archive/20251119/202511191158.bVKUDrKa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191158.bVKUDrKa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191158.bVKUDrKa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-rtl8231.c:28:27: sparse: sparse: missing identifier in declaration
   drivers/pinctrl/pinctrl-rtl8231.c:28:27: sparse: sparse: Expected ; at the end of type declaration
   drivers/pinctrl/pinctrl-rtl8231.c:28:27: sparse: sparse: got :
>> drivers/pinctrl/pinctrl-rtl8231.c:52:44: sparse: sparse: invalid bitfield specifier for type incomplete type enum rtl8231_pin_function.
   drivers/pinctrl/pinctrl-rtl8231.c:46:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:47:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:48:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_PWM'
   drivers/pinctrl/pinctrl-rtl8231.c:77:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:77:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:78:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:78:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:79:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:79:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:80:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:80:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:81:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:81:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:82:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:82:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:83:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:83:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:84:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:84:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:85:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:85:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:86:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:86:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:87:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:87:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:88:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:88:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:89:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:89:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:90:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:90:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:91:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:91:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:92:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:92:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:93:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:93:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:94:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:94:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:95:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:95:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:96:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:96:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:97:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:97:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:98:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:98:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:99:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:99:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:100:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:100:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:101:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:101:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:102:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:102:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:103:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:103:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:104:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:104:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:105:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:105:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:106:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:106:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:107:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:107:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:108:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:108:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:109:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:109:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:110:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:110:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:111:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:111:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_LED'
   drivers/pinctrl/pinctrl-rtl8231.c:112:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:112:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_PWM'
   drivers/pinctrl/pinctrl-rtl8231.c:113:9: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
>> drivers/pinctrl/pinctrl-rtl8231.c:204:31: sparse: sparse: incompatible types for operation (&):
   drivers/pinctrl/pinctrl-rtl8231.c:204:31: sparse:    incomplete type enum rtl8231_pin_function const functions
   drivers/pinctrl/pinctrl-rtl8231.c:204:31: sparse:    incomplete type enum rtl8231_pin_function func_flag
   drivers/pinctrl/pinctrl-rtl8231.c:210:26: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'
   drivers/pinctrl/pinctrl-rtl8231.c:339:61: sparse: sparse: incompatible types for operation (&):
   drivers/pinctrl/pinctrl-rtl8231.c:339:61: sparse:    incomplete type enum rtl8231_pin_function const functions
   drivers/pinctrl/pinctrl-rtl8231.c:339:61: sparse:    incomplete type enum rtl8231_pin_function flag
   drivers/pinctrl/pinctrl-rtl8231.c:347:61: sparse: sparse: incompatible types for operation (&):
   drivers/pinctrl/pinctrl-rtl8231.c:347:61: sparse:    incomplete type enum rtl8231_pin_function const functions
   drivers/pinctrl/pinctrl-rtl8231.c:347:61: sparse:    incomplete type enum rtl8231_pin_function flag
   drivers/pinctrl/pinctrl-rtl8231.c:351:29: sparse: sparse: undefined identifier 'RTL8231_PIN_FUNCTION_GPIO'

vim +28 drivers/pinctrl/pinctrl-rtl8231.c

    24	
    25	/*
    26	 * Pin controller functionality
    27	 */
  > 28	enum rtl8231_pin_function : uintptr_t {
    29		RTL8231_PIN_FUNCTION_GPIO = BIT(0),
    30		RTL8231_PIN_FUNCTION_LED = BIT(1),
    31		RTL8231_PIN_FUNCTION_PWM = BIT(2),
    32	};
    33	
    34	struct rtl8231_function_info {
    35		enum rtl8231_pin_function flag;
    36		const char *name;
    37	};
    38	
    39	#define RTL8231_FUNCTION(_name, _flag)	\
    40	((struct rtl8231_function_info) {	\
    41			.flag = (_flag),	\
    42			.name = (_name),	\
    43		})
    44	
    45	static const struct rtl8231_function_info rtl8231_pin_functions[] = {
    46		RTL8231_FUNCTION("gpio", RTL8231_PIN_FUNCTION_GPIO),
    47		RTL8231_FUNCTION("led", RTL8231_PIN_FUNCTION_LED),
    48		RTL8231_FUNCTION("pwm", RTL8231_PIN_FUNCTION_PWM),
    49	};
    50	
    51	struct rtl8231_pin_desc {
  > 52		enum rtl8231_pin_function functions:8;
    53		u8 reg;
    54		u8 offset;
    55		u8 gpio_function_value;
    56	};
    57	
    58	#define RTL8231_PIN_DESC(_num, _func, _reg, _fld, _val)			\
    59		[(_num)] = ((struct rtl8231_pin_desc) {				\
    60			.functions = RTL8231_PIN_FUNCTION_GPIO | (_func),	\
    61			.reg = (_reg),						\
    62			.offset = (_fld),					\
    63			.gpio_function_value = (_val),				\
    64		})
    65	#define RTL8231_GPIO_PIN_DESC(_num, _reg, _fld)			\
    66		RTL8231_PIN_DESC(_num, 0, _reg, _fld, RTL8231_PIN_MODE_GPIO)
    67	#define RTL8231_LED_PIN_DESC(_num, _reg, _fld)			\
    68		RTL8231_PIN_DESC(_num, RTL8231_PIN_FUNCTION_LED, _reg, _fld, RTL8231_PIN_MODE_GPIO)
    69	#define RTL8231_PWM_PIN_DESC(_num, _reg, _fld)			\
    70		RTL8231_PIN_DESC(_num, RTL8231_PIN_FUNCTION_PWM, _reg, _fld, 0)
    71	
    72	/*
    73	 * All pins have a GPIO/LED mux bit, but the bits for pins 35/36 are read-only. Use this bit
    74	 * for the GPIO-only pin instead of a placeholder, so the rest of the logic can stay generic.
    75	 */
    76	static const struct rtl8231_pin_desc rtl8231_pin_data[RTL8231_NUM_GPIOS] = {
    77		RTL8231_LED_PIN_DESC(0, RTL8231_REG_PIN_MODE0, 0),
    78		RTL8231_LED_PIN_DESC(1, RTL8231_REG_PIN_MODE0, 1),
    79		RTL8231_LED_PIN_DESC(2, RTL8231_REG_PIN_MODE0, 2),
    80		RTL8231_LED_PIN_DESC(3, RTL8231_REG_PIN_MODE0, 3),
    81		RTL8231_LED_PIN_DESC(4, RTL8231_REG_PIN_MODE0, 4),
    82		RTL8231_LED_PIN_DESC(5, RTL8231_REG_PIN_MODE0, 5),
    83		RTL8231_LED_PIN_DESC(6, RTL8231_REG_PIN_MODE0, 6),
    84		RTL8231_LED_PIN_DESC(7, RTL8231_REG_PIN_MODE0, 7),
    85		RTL8231_LED_PIN_DESC(8, RTL8231_REG_PIN_MODE0, 8),
    86		RTL8231_LED_PIN_DESC(9, RTL8231_REG_PIN_MODE0, 9),
    87		RTL8231_LED_PIN_DESC(10, RTL8231_REG_PIN_MODE0, 10),
    88		RTL8231_LED_PIN_DESC(11, RTL8231_REG_PIN_MODE0, 11),
    89		RTL8231_LED_PIN_DESC(12, RTL8231_REG_PIN_MODE0, 12),
    90		RTL8231_LED_PIN_DESC(13, RTL8231_REG_PIN_MODE0, 13),
    91		RTL8231_LED_PIN_DESC(14, RTL8231_REG_PIN_MODE0, 14),
    92		RTL8231_LED_PIN_DESC(15, RTL8231_REG_PIN_MODE0, 15),
    93		RTL8231_LED_PIN_DESC(16, RTL8231_REG_PIN_MODE1, 0),
    94		RTL8231_LED_PIN_DESC(17, RTL8231_REG_PIN_MODE1, 1),
    95		RTL8231_LED_PIN_DESC(18, RTL8231_REG_PIN_MODE1, 2),
    96		RTL8231_LED_PIN_DESC(19, RTL8231_REG_PIN_MODE1, 3),
    97		RTL8231_LED_PIN_DESC(20, RTL8231_REG_PIN_MODE1, 4),
    98		RTL8231_LED_PIN_DESC(21, RTL8231_REG_PIN_MODE1, 5),
    99		RTL8231_LED_PIN_DESC(22, RTL8231_REG_PIN_MODE1, 6),
   100		RTL8231_LED_PIN_DESC(23, RTL8231_REG_PIN_MODE1, 7),
   101		RTL8231_LED_PIN_DESC(24, RTL8231_REG_PIN_MODE1, 8),
   102		RTL8231_LED_PIN_DESC(25, RTL8231_REG_PIN_MODE1, 9),
   103		RTL8231_LED_PIN_DESC(26, RTL8231_REG_PIN_MODE1, 10),
   104		RTL8231_LED_PIN_DESC(27, RTL8231_REG_PIN_MODE1, 11),
   105		RTL8231_LED_PIN_DESC(28, RTL8231_REG_PIN_MODE1, 12),
   106		RTL8231_LED_PIN_DESC(29, RTL8231_REG_PIN_MODE1, 13),
   107		RTL8231_LED_PIN_DESC(30, RTL8231_REG_PIN_MODE1, 14),
   108		RTL8231_LED_PIN_DESC(31, RTL8231_REG_PIN_MODE1, 15),
   109		RTL8231_LED_PIN_DESC(32, RTL8231_REG_PIN_HI_CFG, 0),
   110		RTL8231_LED_PIN_DESC(33, RTL8231_REG_PIN_HI_CFG, 1),
   111		RTL8231_LED_PIN_DESC(34, RTL8231_REG_PIN_HI_CFG, 2),
   112		RTL8231_PWM_PIN_DESC(35, RTL8231_REG_FUNC1, 3),
   113		RTL8231_GPIO_PIN_DESC(36, RTL8231_REG_PIN_HI_CFG, 4),
   114	};
   115	static const unsigned int PWM_PIN = 35;
   116	
   117	#define RTL8231_PIN(_num)					\
   118		((struct pinctrl_pin_desc) {				\
   119			.number = (_num),				\
   120			.name = "gpio" #_num,				\
   121			.drv_data = (void *) &rtl8231_pin_data[(_num)]	\
   122		})
   123	
   124	static const struct pinctrl_pin_desc rtl8231_pins[RTL8231_NUM_GPIOS] = {
   125		RTL8231_PIN(0),
   126		RTL8231_PIN(1),
   127		RTL8231_PIN(2),
   128		RTL8231_PIN(3),
   129		RTL8231_PIN(4),
   130		RTL8231_PIN(5),
   131		RTL8231_PIN(6),
   132		RTL8231_PIN(7),
   133		RTL8231_PIN(8),
   134		RTL8231_PIN(9),
   135		RTL8231_PIN(10),
   136		RTL8231_PIN(11),
   137		RTL8231_PIN(12),
   138		RTL8231_PIN(13),
   139		RTL8231_PIN(14),
   140		RTL8231_PIN(15),
   141		RTL8231_PIN(16),
   142		RTL8231_PIN(17),
   143		RTL8231_PIN(18),
   144		RTL8231_PIN(19),
   145		RTL8231_PIN(20),
   146		RTL8231_PIN(21),
   147		RTL8231_PIN(22),
   148		RTL8231_PIN(23),
   149		RTL8231_PIN(24),
   150		RTL8231_PIN(25),
   151		RTL8231_PIN(26),
   152		RTL8231_PIN(27),
   153		RTL8231_PIN(28),
   154		RTL8231_PIN(29),
   155		RTL8231_PIN(30),
   156		RTL8231_PIN(31),
   157		RTL8231_PIN(32),
   158		RTL8231_PIN(33),
   159		RTL8231_PIN(34),
   160		RTL8231_PIN(35),
   161		RTL8231_PIN(36),
   162	};
   163	
   164	static int rtl8231_get_groups_count(struct pinctrl_dev *pctldev)
   165	{
   166		return ARRAY_SIZE(rtl8231_pins);
   167	}
   168	
   169	static const char *rtl8231_get_group_name(struct pinctrl_dev *pctldev, unsigned int selector)
   170	{
   171		return rtl8231_pins[selector].name;
   172	}
   173	
   174	static int rtl8231_get_group_pins(struct pinctrl_dev *pctldev, unsigned int selector,
   175		const unsigned int **pins, unsigned int *num_pins)
   176	{
   177		if (selector >= ARRAY_SIZE(rtl8231_pins))
   178			return -EINVAL;
   179	
   180		*pins = &rtl8231_pins[selector].number;
   181		*num_pins = 1;
   182	
   183		return 0;
   184	}
   185	
   186	static const struct pinctrl_ops rtl8231_pinctrl_ops = {
   187		.get_groups_count = rtl8231_get_groups_count,
   188		.get_group_name = rtl8231_get_group_name,
   189		.get_group_pins = rtl8231_get_group_pins,
   190		.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
   191		.dt_free_map = pinconf_generic_dt_free_map,
   192	};
   193	
   194	static int rtl8231_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
   195		unsigned int group_selector)
   196	{
   197		const struct function_desc *func = pinmux_generic_get_function(pctldev, func_selector);
   198		const struct rtl8231_pin_desc *desc = rtl8231_pins[group_selector].drv_data;
   199		const struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
   200		enum rtl8231_pin_function func_flag = (uintptr_t) func->data;
   201		unsigned int function_mask;
   202		unsigned int gpio_function;
   203	
 > 204		if (!(desc->functions & func_flag))
   205			return -EINVAL;
   206	
   207		function_mask = BIT(desc->offset);
   208		gpio_function = desc->gpio_function_value << desc->offset;
   209	
   210		if (func_flag == RTL8231_PIN_FUNCTION_GPIO)
   211			return regmap_update_bits(ctrl->map, desc->reg, function_mask, gpio_function);
   212		else
   213			return regmap_update_bits(ctrl->map, desc->reg, function_mask, ~gpio_function);
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

