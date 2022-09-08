Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C83E5B1D23
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 14:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbiIHMe6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 08:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231858AbiIHMeb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 08:34:31 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21406356F9
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 05:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662640451; x=1694176451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PrfI4l+5o4OiyZA22z1Fo4qmJ7C/rSZhfad3+necbdw=;
  b=k/oOjEMjrc2xwOdrsMo3LbNr1d5D+5qwvy1sNnMewKQB+ZxKz5mohaFw
   h5BcVCdkySsJhtrDJWBpHyUvW6PgD9hulSCUZwUjIJHuZyx7mpIYuTCQC
   J4sYRyy4wtJdbFT9P+rF+56ROphXAshDyrfgARp5zb4dNHYNYXmVMmEJY
   0hvlM+x1L9ZPwbybHBHE3MHTV4r2OBqV6Ba9NvdXJqSeNAjykHvXAjNr5
   8bq0sOQgDn9mloK6eRE9E83oqy4A/oVZNVhkTShX0r97Fjb82O/AJU1oG
   Y9aOsVUjH3KmTVw62gdZfwNoWC/XU6uAoYVhFk8FOKpQaa4vYrJiX0geq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="280180113"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="280180113"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 05:34:10 -0700
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="676661067"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 05:34:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oWGjO-00A7RX-0B;
        Thu, 08 Sep 2022 15:34:06 +0300
Date:   Thu, 8 Sep 2022 15:34:05 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     heiko@sntech.de, linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4] gpio: rockchip: support acpi
Message-ID: <YxnhPd9CnjfcJfzR@smile.fi.intel.com>
References: <20220908072621.3415957-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908072621.3415957-1-jay.xu@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 08, 2022 at 03:26:21PM +0800, Jianqun Xu wrote:
> This patch fix driver to support acpi by following changes:
>  * support get gpio bank number from uid of acpi
>  * try to get clocks for dt nodes but for acpi
>  * try to get clocks by a char id first, if a dt patch applied

...

> +	if (!gc->label) {

See below.

> +		gc->label = kasprintf(GFP_KERNEL, "gpio%d", bank->bank_num);
> +		if (!gc->label)
> +			return -ENOMEM;
> +	}

...

> -	/*
> -	 * For DeviceTree-supported systems, the gpio core checks the
> -	 * pinctrl's device node for the "gpio-ranges" property.
> -	 * If it is present, it takes care of adding the pin ranges
> -	 * for the driver. In this case the driver can skip ahead.
> -	 *
> -	 * In order to remain compatible with older, existing DeviceTree
> -	 * files which don't set the "gpio-ranges" property or systems that
> -	 * utilize ACPI the driver has to call gpiochip_add_pin_range().
> -	 */

Why did you remove this comment? It's exactly an answer to what I was asking.

> +	if (!device_property_read_bool(bank->dev, "gpio-ranges") && pctldev) {
>  		ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
>  					     gc->base, gc->ngpio);
>  		if (ret) {
>  			dev_err(bank->dev, "Failed to add pin range\n");
> -			goto fail;
> +			goto err_remove;
>  		}
>  	}

...

> +	if (!bank->name)

It's not obvious check for this. Perhaps you can synchronize above to have
the same check and add a comment why bank->name presence guarantees that
label wasn't allocated by us here.

OTOH, why not to use devm_kasprintf()?

> +		kfree(gc->label);

...

> +static int rockchip_gpio_get_clocks(struct rockchip_pin_bank *bank)
> +{
> +	struct device *dev = bank->dev;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	int ret;
> +
> +	if (!is_of_node(fwnode))
> +		return 0;
> +
> +	bank->clk = devm_clk_get(dev, "bus");
> +	if (IS_ERR(bank->clk)) {
> +		bank->clk = of_clk_get(to_of_node(fwnode), 0);
> +		if (IS_ERR(bank->clk)) {
> +			dev_err(dev, "fail to get apb clock\n");
> +			return PTR_ERR(bank->clk);
> +		}
> +	}
> +
> +	ret = clk_prepare_enable(bank->clk);
> +	if (ret < 0)
> +		return ret;
> +
> +	bank->db_clk = devm_clk_get(dev, "db");
> +	if (IS_ERR(bank->db_clk)) {
> +		bank->db_clk = of_clk_get(to_of_node(fwnode), 1);
> +		if (IS_ERR(bank->db_clk))
> +			bank->db_clk = NULL;
> +	}
> +
> +	ret = clk_prepare_enable(bank->db_clk);
> +	if (ret < 0) {

> +		clk_disable_unprepare(bank->clk);

You can't mix devm_ with non-devm_ calls.

> +		return ret;
> +	}

...

> +	if (!bank->name)
> +		kfree(gc->label);

As per above.

-- 
With Best Regards,
Andy Shevchenko


