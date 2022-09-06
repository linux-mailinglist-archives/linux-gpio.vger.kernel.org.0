Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1DD5AF0D7
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 18:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbiIFQkn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 12:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234168AbiIFQkR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 12:40:17 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C4185AA0
        for <linux-gpio@vger.kernel.org>; Tue,  6 Sep 2022 09:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662481107; x=1694017107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ss+4F9J/CaZwcdY2cXJmGtJLU9XMyJzPA/NDr04u5pk=;
  b=Y28V0tOce0P7ir8AJtc8WN84pzaeXrQ+/R/+E4HjbFvLp0r/wq/bbCqZ
   JMuIWmFqC4cEpd7fbrEahG+vuCZxjNK5RZBx9JWDTFGBlKOn4PICCTgUO
   6E0kI9V5d3HhFGZ9uwYlAJpRv6PidVVxhbhyPTt4x51u2aCb1zwqFkstS
   h1WoB85nmgs0Pqva5KAESmNPbYymkeDBHPz6RiQP9+3e9yqLgEa0gyjv/
   WccAtTFTwtr63Hj3JyICqQ2VBn9z6BX8gHbpDDNDnEafvVxYS6IfAGaYd
   PsFeRweTdi7I+mA82WLqfl6NK94r70BjykLlvHyf0XTCvrsqDGMpfsdo/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="358353075"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="358353075"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 09:18:27 -0700
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="565153728"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 09:18:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oVbHK-009BpZ-0c;
        Tue, 06 Sep 2022 19:18:22 +0300
Date:   Tue, 6 Sep 2022 19:18:21 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     heiko@sntech.de, linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.or, huangtao@rock-chips.com
Subject: Re: [PATCH v2] gpio: rockchip: support acpi
Message-ID: <YxdyzRWDi+jwW2iN@smile.fi.intel.com>
References: <20220906013025.3302530-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906013025.3302530-1-jay.xu@rock-chips.com>
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

On Tue, Sep 06, 2022 at 09:30:25AM +0800, Jianqun Xu wrote:
> This patch fix driver to support acpi by following changes:
>  * support get gpio bank number from uid of acpi
>  * try to get clocks for dt nodes but for acpi
>  * try to get clocks by a char id first, if a dt patch applied

...

> -	bank->domain = irq_domain_add_linear(bank->of_node, 32,
> +	bank->domain = irq_domain_create_linear(dev_fwnode(bank->dev), 32,
>  					&irq_generic_chip_ops, NULL);

Should it be converted to use GPIO_MAX_PINS at the same time?

...

> +static int rockchip_gpio_of_get_bank_id(struct device *dev)
> +{
> +	static int gpio;
> +	int bank_id = -1;

> +	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {

Can't is_of_node() be sufficient check?

> +		bank_id = of_alias_get_id(dev->of_node, "gpio");
> +		if (bank_id < 0)
> +			bank_id = gpio++;
> +	}
> +
> +	return bank_id;
> +}

...

> +#ifdef CONFIG_ACPI

Why?

> +static int rockchip_gpio_acpi_get_bank_id(struct device *dev)
> +{
> +	struct acpi_device *adev;
> +	unsigned long bank_id = -1;
> +	const char *uid;
> +	int ret;
> +
> +	adev = ACPI_COMPANION(dev);
> +	if (!adev)
> +		return -ENXIO;
> +
> +	uid = acpi_device_uid(adev);
> +	if (!uid || !(*uid)) {
> +		dev_err(dev, "Cannot retrieve UID\n");
> +		return -ENODEV;

Why is it a fatal error? Can't be the same approach as for OF be used?

> +	}
> +
> +	ret = kstrtoul(uid, 0, &bank_id);
> +
> +	return !ret ? bank_id : -ERANGE;

Use standard pattern, i.e.

	if (ret)
		return ret;

> +}
> +#else
> +static int rockchip_gpio_acpi_get_bank_id(struct device *dev)
> +{
> +	return -ENOENT;
> +}
> +#endif /* CONFIG_ACPI */

...

> +	int bank_id = 0;

Redundant assignment.

...

> +	if (!ACPI_COMPANION(dev)) {

One of:

	is_of_node()
	!is_acpi_node()

?

...

> +	if (!ACPI_COMPANION(dev)) {

Ditto.

But looking how this disrupts the code, just leave OF and ACPI parts separate,
don't mix them.

...

> +	if (!device_property_read_bool(bank->dev, "gpio-ranges") && pctldev) {
> +		struct gpio_chip *gc = &bank->gpio_chip;
> +
> +		ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
> +					     gc->base, gc->ngpio);
> +		if (ret) {
> +			dev_err(bank->dev, "Failed to add pin range\n");
> +			goto err_unlock;
> +		}
>  	}

Why? What's wrong with GPIO library doing this for all chips?

-- 
With Best Regards,
Andy Shevchenko


