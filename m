Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD545B0721
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Sep 2022 16:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiIGOj6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Sep 2022 10:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiIGOj5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2022 10:39:57 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76DF6240BF
        for <linux-gpio@vger.kernel.org>; Wed,  7 Sep 2022 07:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662561596; x=1694097596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pCBoguZ2cZf9r95igyqtoCKywCPfDO+dd+pmxVMQZ4k=;
  b=Hmzw2aL6yW966fterdE6SlTb9Hc7cxiLL9J9CPilziLfBapGNxrkluLD
   QoZlhDWxFWX6gA91fXcynGUG9n3ARZs9TUv9qL55nJfFo436Tep3pZjlr
   538gOZYHhq+yeUzi0eiVPstEjy+ZYaU5j32pmq4b9I/GQ90qlYg+iJtcF
   rSEQtleFWJf8NccBF8xlvAvCI3p8xnxm/cgLhjE22CurjrR4F2QXobJoO
   HyPbsg7kJya7D4DHaT0tIRKZMlij3kbxLSkHWZS263FyQqe1FONlxeu2V
   WOgS6oFUDwVBB93DrQ0HTr7Bse1T2Qimca4F9+bJfqWFiTfq/1TtbqfRn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="323078283"
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208";a="323078283"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 07:39:56 -0700
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208";a="591727716"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 07:39:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oVwDX-009gbI-0u;
        Wed, 07 Sep 2022 17:39:51 +0300
Date:   Wed, 7 Sep 2022 17:39:50 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     heiko@sntech.de, linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 RESEND] gpio: rockchip: support acpi
Message-ID: <YxitNjAcb5RsKUWT@smile.fi.intel.com>
References: <20220907092722.3333752-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907092722.3333752-1-jay.xu@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 07, 2022 at 05:27:22PM +0800, Jianqun Xu wrote:
> This patch fix driver to support acpi by following changes:
>  * support get gpio bank number from uid of acpi
>  * try to get clocks for dt nodes but for acpi
>  * try to get clocks by a char id first, if a dt patch applied

...

> -	ret = irq_alloc_domain_generic_chips(bank->domain, 32, 1,
> +	ret = irq_alloc_domain_generic_chips(bank->domain, GPIO_MAX_PINS , 1,

Extra space.

>  					     "rockchip_gpio_irq",
>  					     handle_level_irq,
>  					     clr, 0, 0);

...

> +	if (!gc->label) {
> +		gc->label = kasprintf(GFP_KERNEL, "gpio%d", bank->bank_num);

In the below code will be a memory leak. Also at ->remove().

> +		if (!gc->label)
> +			return -ENOMEM;
> +	}

...

> +static int rockchip_gpio_of_get_bank_id(struct device *dev)
> +{
> +	static int gpio;
> +	int bank_id = -1;

> +	if (is_of_node(dev->of_node)) {

	struct fwnode_handle *fwnode = dev_fwnode(...);

> +		bank_id = of_alias_get_id(dev->of_node, "gpio");

to_of_node(fwnode)

> +		if (bank_id < 0)
> +			bank_id = gpio++;
> +	}
> +
> +	return bank_id;
> +}

...

> +	bank_id = rockchip_gpio_acpi_get_bank_id(dev);
> +	if (bank_id < 0) {
> +		bank_id = rockchip_gpio_of_get_bank_id(dev);
> +		if (bank_id < 0)
> +			return bank_id;
> +	}

Easier to read:

	bank_id = rockchip_gpio_acpi_get_bank_id(dev);
	if (bank_id < 0)
		bank_id = rockchip_gpio_of_get_bank_id(dev);
	if (bank_id < 0)
		return bank_id;

...

> +	if (!is_acpi_node(dev_fwnode(dev)) {
> +		struct device_node *pctlnp = of_get_parent(dev->of_node);
>  
> +		pctldev = of_pinctrl_get(pctlnp);
> +		if (!pctldev)
> +			return -EPROBE_DEFER;
>  
> +		bank = rockchip_gpio_find_bank(pctldev, bank_id);
> +		if (!bank)
> +			return -ENODEV;

> +	}
> +	if (!bank) {

Simply '} else {' ?

> +		bank = devm_kzalloc(dev, sizeof(*bank), GFP_KERNEL);
> +		if (!bank)
> +			return -ENOMEM;
> +	}

...

> +	if (is_of_node(dev_fwnode(dev)) {
> +		bank->clk = devm_clk_get(dev, "bus");
> +		if (IS_ERR(bank->clk)) {
> +			bank->clk = of_clk_get(dev->of_node, 0);
> +			if (IS_ERR(bank->clk)) {
> +				dev_err(dev, "fail to get apb clock\n");
> +				return PTR_ERR(bank->clk);
> +			}
> +		}
> +
> +		bank->db_clk = devm_clk_get(dev, "db");
> +		if (IS_ERR(bank->db_clk)) {
> +			bank->db_clk = of_clk_get(dev->of_node, 1);
> +			if (IS_ERR(bank->db_clk))
> +				bank->db_clk = NULL;
> +		}
> +	}

This can be split to a separate

	int rockchip_gpio_get_clocks(...)

...

> +	clk_prepare_enable(bank->clk);
> +	clk_prepare_enable(bank->db_clk);

Either of them may fail.

...

> +	if (!device_property_read_bool(bank->dev, "gpio-ranges") && pctldev) {

Same question as before, why the GPIO library code is not okay for this?

> +		struct gpio_chip *gc = &bank->gpio_chip;
> +
> +		ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
> +					     gc->base, gc->ngpio);
> +		if (ret) {
> +			dev_err(bank->dev, "Failed to add pin range\n");
> +			goto err_unlock;
> +		}
>  	}


-- 
With Best Regards,
Andy Shevchenko


