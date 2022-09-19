Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A80A75BCDB2
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Sep 2022 15:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbiISNy0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Sep 2022 09:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbiISNyY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Sep 2022 09:54:24 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7982409F
        for <linux-gpio@vger.kernel.org>; Mon, 19 Sep 2022 06:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663595663; x=1695131663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nx6HBJI7uvCdWTMDx2d8dye/IOgzQFEegWesbW4VNT0=;
  b=G9KkFGpvlMocjbkjJfAaJmbfsmYArb9qAHWxNFQSWWMPT91iRXdkWPeg
   RosYJmSPJ26FBw1K4JYEjZM0Bsbijzni1BPkRj4lNo/tDvHwBIY31Juxb
   E48oDHMLzcKf1MHGY/Ys6PeXwJn7HX5UXDPHZQGjU3GPg0LNm2PDYUGHG
   tLsOuVHZmGIxDj0q87UaSdryKiJgAo64NpVklHlFOPNvxOtm4n1XTSyng
   OoUnvfJVs1cHYYS4tlokwGTsqWcFxPUaz6Y7VpRORia7RCytUyfy1m6/5
   9jStQDeC6sc4o6a6wCmL7M0HRAbEen/8sNZTZ3em8h68tCX+mf3hmXGmd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="300778111"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="300778111"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 06:54:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="760874595"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 19 Sep 2022 06:54:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oaHDs-004Zuc-1K;
        Mon, 19 Sep 2022 16:54:08 +0300
Date:   Mon, 19 Sep 2022 16:54:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     jbx6244@gmail.com, heiko@sntech.de, linus.walleij@linaro.org,
        brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/2] gpio: rockchip: support acpi
Message-ID: <YyR1mNSUD6zrnnQV@smile.fi.intel.com>
References: <20220916084347.458619-1-jay.xu@rock-chips.com>
 <20220916084347.458619-3-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916084347.458619-3-jay.xu@rock-chips.com>
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>) id 1oZB6G-003Ed1-2Q;
 Fri, 16 Sep 2022 16:09:44 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 16, 2022 at 04:43:47PM +0800, Jianqun Xu wrote:
> The gpio driver for rockchip gpio controller is seperated from rockchip

GPIO

Rockchip (?)

GPIO

> pinctrl driver, at the first version, it keeps things original to make
> the patch easy to be reviewed, such as the gpio driver must work with

GPIO

> the pinctrl dt node to be its parent node.
> 
> This patch wants to fix driver to support acpi since gpio controller

the driver
ACPI
GPIO

> should work well during acpi is enabled. But during upstream, driver is

ACPI

> better to fix other thing together includes:

Consider splitting to a few patches, if possible.

>  - only get clocks when is_of_node.
>  - get io resource and irq by platform common apis.
>  - use fwnode instead of of_node from device structure.
>  - drop pinctrl related codes.

...

> +struct rockchip_pin_bank {
> +	struct device			*dev;
> +	void __iomem			*reg_base;
> +	struct clk			*clk;
> +	struct clk			*db_clk;
> +	int				irq;
> +	u32				saved_masks;
> +	u32				pin_base;

> +	u8				nr_pins;
> +	char				*name;
> +	u8				bank_num;

Have you ran pahole against this data type? I believe it wastes a lot of bytes
for peanuts on 64-bit machines (due to padding). Grouping u8:s may help.

> +	struct device_node		*of_node;
> +	struct irq_domain		*domain;

> +	struct gpio_chip		gpio_chip;

I would suggest to move this to be first member of the struct as it may save
some bytes of the code (but this needs to be checked by bloat-o-meter to
support or be against the proposal) due to pointer arithmetics.

> +	raw_spinlock_t			slock;
> +	const struct rockchip_gpio_regs	*gpio_regs;
> +	u32				gpio_type;
> +	u32				toggle_edge_mode;
> +};

...

> +#ifdef CONFIG_OF_GPIO
> +	gc->of_node = of_node_get(bank->dev->of_node);
> +#endif

No, please fill the gc->fwnode.

...

> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	int version_id;
> +	int ret;
>  
> +	if (is_of_node(fwnode)) {
> +		bank->clk = of_clk_get(to_of_node(fwnode), 0);
> +		if (IS_ERR(bank->clk))
> +			return PTR_ERR(bank->clk);
>  
> +		ret = clk_prepare_enable(bank->clk);
> +		if (ret < 0)

Where the clock will be put?

> +			return ret;
> +	}
>  
> +	version_id = readl(bank->reg_base + gpio_regs_v2.version_id);
> +	if (version_id == GPIO_TYPE_V2 || version_id == GPIO_TYPE_V2_1) {
>  		bank->gpio_regs = &gpio_regs_v2;
>  		bank->gpio_type = GPIO_TYPE_V2;
>  	} else {
>  		bank->gpio_regs = &gpio_regs_v1;
>  		bank->gpio_type = GPIO_TYPE_V1;
>  	}
>  
> +	if (bank->gpio_type == GPIO_TYPE_V2 && is_of_node(fwnode)) {
> +		bank->db_clk = of_clk_get(to_of_node(fwnode), 1);
> +		if (IS_ERR(bank->db_clk))

Where the clock will be unprepared, disabled, and put?

> +			return PTR_ERR(bank->db_clk);
> +
> +		ret = clk_prepare_enable(bank->db_clk);
> +		if (ret < 0)

Where the clock will be put?

> +			return ret;
> +	}


...

>  	ret = rockchip_gpiolib_register(bank);
>  	if (ret) {
> +		dev_err(bank->dev, "Failed to register gpio %d\n", ret);
>  		clk_disable_unprepare(bank->clk);
> +		clk_disable_unprepare(bank->db_clk);
>  		return ret;
>  	}

See above questions.

-- 
With Best Regards,
Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko


