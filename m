Return-Path: <linux-gpio+bounces-213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A08D97EE990
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Nov 2023 23:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ACCB1F25876
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Nov 2023 22:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451491401A;
	Thu, 16 Nov 2023 22:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PyeEE6z9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48DD3120;
	Thu, 16 Nov 2023 14:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700175427; x=1731711427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DoKsAm90KLbcU8NPakFeOISVTzmaVznKzJBhMC+X33E=;
  b=PyeEE6z9o9pm5RKaUXEOCbrEcnGrOKA7ikECAOuCQ53nWbgmiiEGQhKc
   y95P2rQGoQLopV63Pilg/Tbj39jlucg+oMUfFRtB8MV4JxkipGa1p3CLv
   Y8XwgzzKjROEiFtPwYv7usfqI85SDNZuiLLeH7CEg+MXucDgUyvjBlHhy
   fyK56+7w4am5X2/ZqpDFHHkhL2h4H8WRspC4pzKVPaowDoYJLUhQ5zWEj
   xJyvlEVAMe0r/TuiOftlzME3Tn52jeGuWpBrnQO4YyOcHfMQBlpfooZw9
   DiarPts2rqVIEzufig4+hjaKas8qdhGdvpRYQpO2zgx1WRaVkheRQ1UAC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="455498014"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="455498014"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 14:57:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="938985403"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="938985403"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Nov 2023 14:57:03 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3lID-00027X-0f;
	Thu, 16 Nov 2023 22:57:01 +0000
Date: Fri, 17 Nov 2023 06:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Tzuyi Chang <tychang@realtek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	TY Chang <tychang@realtek.com>
Subject: Re: [PATCH v2 2/2] Add GPIO support for Realtek DHC(Digital Home
 Center) RTD SoCs.
Message-ID: <202311170603.TawAUggC-lkp@intel.com>
References: <20231116111441.2339-3-tychang@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116111441.2339-3-tychang@realtek.com>

Hi Tzuyi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on robh/for-next linus/master v6.7-rc1 next-20231116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tzuyi-Chang/dt-bindings-gpio-realtek-Add-realtek-rtd-gpio/20231116-191928
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20231116111441.2339-3-tychang%40realtek.com
patch subject: [PATCH v2 2/2] Add GPIO support for Realtek DHC(Digital Home Center) RTD SoCs.
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20231117/202311170603.TawAUggC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231117/202311170603.TawAUggC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311170603.TawAUggC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-rtd.c:71: warning: Function parameter or member 'num_dir' not described in 'rtd_gpio_info'
>> drivers/gpio/gpio-rtd.c:71: warning: Function parameter or member 'num_dato' not described in 'rtd_gpio_info'
>> drivers/gpio/gpio-rtd.c:71: warning: Function parameter or member 'num_dati' not described in 'rtd_gpio_info'
>> drivers/gpio/gpio-rtd.c:71: warning: Function parameter or member 'num_ie' not described in 'rtd_gpio_info'
>> drivers/gpio/gpio-rtd.c:71: warning: Function parameter or member 'num_dp' not described in 'rtd_gpio_info'
>> drivers/gpio/gpio-rtd.c:71: warning: Function parameter or member 'num_gpa' not described in 'rtd_gpio_info'
>> drivers/gpio/gpio-rtd.c:71: warning: Function parameter or member 'num_gpda' not described in 'rtd_gpio_info'
>> drivers/gpio/gpio-rtd.c:71: warning: Function parameter or member 'num_deb' not described in 'rtd_gpio_info'


vim +71 drivers/gpio/gpio-rtd.c

    34	
    35	/**
    36	 * struct rtd_gpio_info - Specific GPIO register information
    37	 * @name: GPIO device name
    38	 * @type: RTD GPIO ID
    39	 * @gpio_base: GPIO base number
    40	 * @num_gpios: Number of GPIOs
    41	 * @dir_offset: Offset for GPIO direction registers
    42	 * @dato_offset: Offset for GPIO data output registers
    43	 * @dati_offset: Offset for GPIO data input registers
    44	 * @ie_offset: Offset for GPIO interrupt enable registers
    45	 * @dp_offset: Offset for GPIO detection polarity registers
    46	 * @gpa_offset: Offset for GPIO assert interrupt status registers
    47	 * @gpda_offset: Offset for GPIO deassert interrupt status registers
    48	 * @deb_offset: Offset for GPIO debounce registers
    49	 */
    50	struct rtd_gpio_info {
    51		const char		*name;
    52		enum rtd_gpio_type	type;
    53		unsigned int		gpio_base;
    54		unsigned int		num_gpios;
    55		u8			*dir_offset;
    56		u8			num_dir;
    57		u8			*dato_offset;
    58		u8			num_dato;
    59		u8			*dati_offset;
    60		u8			num_dati;
    61		u8			*ie_offset;
    62		u8			num_ie;
    63		u8			*dp_offset;
    64		u8			num_dp;
    65		u8			*gpa_offset;
    66		u8			num_gpa;
    67		u8			*gpda_offset;
    68		u8			num_gpda;
    69		u8			*deb_offset;
    70		u8			num_deb;
  > 71	};
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

