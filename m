Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31B805B3544
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Sep 2022 12:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbiIIKbg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Sep 2022 06:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbiIIKbS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2022 06:31:18 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45710ADCFA
        for <linux-gpio@vger.kernel.org>; Fri,  9 Sep 2022 03:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662719477; x=1694255477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QsTlIXNYY9wOwZUxZWW7SwOCiSdRiMnoXXpyCa36zLU=;
  b=f66bPMfN0fekIR66m1vlWXMtnrrNZ/HQXyhWn09ldGS54uiEEFVAdwyG
   FLpBl7lfe5WRXKKx5e+wUIYdkxAMDYfRRz6GmpeKQvkBrm812YEmY+/0x
   Yl6icwru0ECdOYBKQUytJCgVPIRe6WHHVLR2aVBdz5cnTKiXDCxJ4+/AB
   pdYT5uwhIPA2j+JGrA4VounSM3DLvzNJTnjtBUIRTCaQ+gBX6k8IwU4cu
   d7kBsviN6B2vJE4OyBEnOsh+qletTNNnhX1Jual+inXf8z5JnA5rXWVb1
   Gk5BaPjP7PbTKXBUC8Oyfr+FoJzh8hm+N2eTLY0QJaSq1u6Fvn0yklJmw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359171347"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; 
   d="scan'208";a="359171347"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 03:31:16 -0700
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; 
   d="scan'208";a="704365297"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 03:31:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oWbI0-00AWIO-02;
        Fri, 09 Sep 2022 13:31:12 +0300
Date:   Fri, 9 Sep 2022 13:31:11 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     heiko@sntech.de, linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 6/6] gpio: rockchip: support acpi
Message-ID: <YxsV735hZmzr1xPp@smile.fi.intel.com>
References: <20220909090558.3609190-1-jay.xu@rock-chips.com>
 <20220909090558.3609190-7-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909090558.3609190-7-jay.xu@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 09, 2022 at 05:05:58PM +0800, Jianqun Xu wrote:
> The gpio driver for rockchip gpio controller is seperated from rockchip
> pinctrl driver, at the first version, it keeps things original to make
> the patch easy to be reviewed, such as the gpio driver must work with
> the pinctrl dt node to be its parent node.
> 
> This patch wants to fix driver to support acpi since gpio controller
> should work well during acpi is enabled. But during upstream, driver is
> better to fix other thing together includes:
>  - add 'clock-names' to allow driver to get clocks by devm_clk_get().
>  - get io resource and irq by platform common apis.
>  - use fwnode instead of of_node from device structure.

The dependency patch is the part of another series. Dunno what will happen
to that series. In either way we would need maintainer's (Rafael) tag.

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
> +		dev_err(dev, "fail to get apb clock\n");
> +		return PTR_ERR(bank->clk);
> +	}

> +	ret = clk_prepare_enable(bank->clk);
> +	if (ret < 0)
> +		return ret;

Now, you are mixinig devm_ with non-devm_ APIs. Perhaps you wanted
to use devm_clk_get_enabled()?

> +	bank->db_clk = devm_clk_get(dev, "db");
> +	if (IS_ERR(bank->db_clk)) {
> +		bank->db_clk = NULL;
> +	}
> +
> +	ret = clk_prepare_enable(bank->db_clk);
> +	if (ret < 0) {
> +		clk_disable_unprepare(bank->clk);
> +		return ret;
> +	}
>  
>  	return 0;
>  }

...

> +	if (is_acpi_node(fwnode)) {
> +		if (!acpi_dev_uid_to_integer(ACPI_COMPANION(dev), &uid))
> +			bank_id = (int)uid;

It probably needs to be

	if (is_acpi_node(fwnode)) {
		ret = acpi_dev_uid_to_integer(ACPI_COMPANION(dev), &uid);
		if (ret)
			return ret;
		bank_id = uid;
> +	} else {
> +		bank_id = of_alias_get_id(to_of_node(fwnode), "gpio");
> +		if (bank_id < 0)
> +			bank_id = gpio++;
> +	}

-- 
With Best Regards,
Andy Shevchenko


