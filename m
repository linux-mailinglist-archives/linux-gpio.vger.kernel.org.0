Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0FBB538EC6
	for <lists+linux-gpio@lfdr.de>; Tue, 31 May 2022 12:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240046AbiEaK0Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 May 2022 06:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235863AbiEaK0X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2022 06:26:23 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4131880DE
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 03:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653992782; x=1685528782;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YZfe9yUNeZTLMbKpZJyUVXHxhaK1M3vsthDVJ4FIwUw=;
  b=YF+DH3CJ58wRHnarXp96ZilGPcgJtlbXQ85Sy12RQoyqIL2xKU4sDZVq
   q+udjFKSyKqkk+Vr8QEPGdOatznyGyv5GUB8gQg8kXCaYbgksNDoW8YLq
   jBsag+pB95TaIeOFLe/w69lQUUwgIOz55Yj8s69bVKGUghGLy1vH4wuVM
   4+k/xHY4en7YnhANcnGnxnnYFAuXkJ2jlkGwuXBCG294pMnp95ireolqt
   bjhdiWZm3dcKXXi5cyrg4uQuup9dH5KI1ToZGhnB/ZJ/5cow5OJaaWxKI
   4MNnnleaZkJDmPgA5sDztUgXXEAPSatMO61kD219DNpZ7iazRJRpgn14X
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="255693947"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="255693947"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 03:26:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="754908459"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 03:26:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nvz4r-000PhW-Eu;
        Tue, 31 May 2022 13:26:17 +0300
Date:   Tue, 31 May 2022 13:26:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com
Subject: Re: [PATCH v3 5/6] pinctrl: amd: Add amd_get_iomux_res function
Message-ID: <YpXtSQ7609x/yLqV@smile.fi.intel.com>
References: <20220531084322.1310250-1-Basavaraj.Natikar@amd.com>
 <20220531084322.1310250-6-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531084322.1310250-6-Basavaraj.Natikar@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 31, 2022 at 02:13:21PM +0530, Basavaraj Natikar wrote:
> Presently there is no way to change pinmux configuration run time.
> Hence add a function to get IOMUX resource which can be used to
> configure IOMUX GPIO pins run time.

> +static void amd_get_iomux_res(struct amd_gpio *gpio_dev)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(&gpio_dev->pdev->dev);


No need. See below.

	struct device *dev = &gpio_dev->pdev->dev;


and use it everywhere in this function. It makes lines shorter.

> +	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
> +	struct resource *res;
> +	int index;

> +	if (!adev)
> +		return;

No need.

> +	index = fwnode_property_match_string(acpi_fwnode_handle(adev),
> +					     "pinctrl-resource-names",  "iomux");


	index = device_property_match_string(dev, ...);

> +	if (index > 0) {
> +		res = platform_get_resource(gpio_dev->pdev, IORESOURCE_MEM, index);
> +		if (!res) {
> +			dev_warn(&gpio_dev->pdev->dev, "Failed to get iomux %d io resource\n",
> +				 index);

	dev_warn(dev, ...);

> +			return;
> +		}
> +
> +		gpio_dev->iomux_base = devm_ioremap(&gpio_dev->pdev->dev, res->start,
> +						    resource_size(res));
> +		if (!gpio_dev->iomux_base) {
> +			desc->pmxops = NULL;
> +			dev_warn(&gpio_dev->pdev->dev, "failed to devm_ioremap() iomux_base\n");
> +		}
> +	} else {
> +		desc->pmxops = NULL;
> +		dev_warn(&gpio_dev->pdev->dev, "failed to get iomux index\n");
> +	}
> +}

-- 
With Best Regards,
Andy Shevchenko


