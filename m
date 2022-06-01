Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF44E53A5FC
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 15:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353251AbiFANfs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 09:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232808AbiFANfs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 09:35:48 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB0770363
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 06:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654090547; x=1685626547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+KHpuO1JLvtPC4epEWj8OaSWLJJKWmcCFZKEmte5rUY=;
  b=OEAZCfzijoPIP1uPNfNIYG3v84Ot370pmBnZLdMhW3HTL/MWZ9a3eG41
   qdjy1HcAXSBtaVoUeGQ8piBixYrwPaZn+xQZ7R3nX1tNKmP03rwywnRg1
   VTDvTi+/6uAYyQcDGJqtEjaB0FcARAWd2IEbkZE32EbNg57JRtzcnVy2X
   bEz5tqLIV9ozPhAR3araF1E4vyBckDXvoTsVhoqOI6Br3ywJS/K6YnHXi
   jSTicvg/Yj5cyVqyJlnPQGRvH1TLVgLiHA09OrJRCQml/416E7GDObDE5
   cVNWzZ7akf0/5XsdCoTMccadzQUV8qmIdlU1dnvxZrsG3dBzEXEyU97ie
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="257658929"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="257658929"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 06:35:47 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="707061150"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 06:35:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nwOVg-000QgB-RQ;
        Wed, 01 Jun 2022 16:35:40 +0300
Date:   Wed, 1 Jun 2022 16:35:40 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com
Subject: Re: [PATCH v5 5/6] pinctrl: amd: Add amd_get_iomux_res function
Message-ID: <YpdrLOToG4jB6oQH@smile.fi.intel.com>
References: <20220601121438.999369-1-Basavaraj.Natikar@amd.com>
 <20220601121438.999369-6-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601121438.999369-6-Basavaraj.Natikar@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 01, 2022 at 05:44:37PM +0530, Basavaraj Natikar wrote:
> Presently there is no way to change pinmux configuration run time.
> Hence add a function to get IOMUX resource which can be used to
> configure IOMUX GPIO pins run time.

With below comment addressed,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/pinctrl/pinctrl-amd.c | 20 ++++++++++++++++++++
>  drivers/pinctrl/pinctrl-amd.h |  1 +
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index 0645c2c24f50..6bd85660287d 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -963,6 +963,25 @@ static struct pinctrl_desc amd_pinctrl_desc = {
>  	.owner = THIS_MODULE,
>  };
>  
> +static void amd_get_iomux_res(struct amd_gpio *gpio_dev)
> +{
> +	struct pinctrl_desc *desc = &amd_pinctrl_desc;
> +	struct device *dev = &gpio_dev->pdev->dev;
> +	int index;
> +
> +	index = device_property_match_string(dev, "pinctrl-resource-names",  "iomux");
> +	if (index >= 0) {
> +		gpio_dev->iomux_base = devm_platform_ioremap_resource(gpio_dev->pdev, index);
> +		if (IS_ERR(gpio_dev->iomux_base)) {
> +			desc->pmxops = NULL;
> +			dev_warn(dev, "Failed to get iomux %d io resource\n", index);
> +		}
> +	} else {
> +		desc->pmxops = NULL;
> +		dev_warn(dev, "failed to get iomux index\n");
> +	}

So, now it's much cleaner, but we may do even better (no nested conditionals):

	index = device_property_match_string(dev, "pinctrl-resource-names",  "iomux");
	if (index < 0) {
		desc->pmxops = NULL;
		dev_warn(dev, "failed to get iomux index\n");
		return;
	}

	gpio_dev->iomux_base = devm_platform_ioremap_resource(gpio_dev->pdev, index);
	if (IS_ERR(gpio_dev->iomux_base)) {
		desc->pmxops = NULL;
		dev_warn(dev, "Failed to get iomux %d io resource\n", index);
	}

Alternatively (error path consolidated):

	index = device_property_match_string(dev, "pinctrl-resource-names",  "iomux");
	if (index < 0) {
		dev_warn(dev, "failed to get iomux index\n");
		goto out_no_pinmux;
	}

	gpio_dev->iomux_base = devm_platform_ioremap_resource(gpio_dev->pdev, index);
	if (IS_ERR(gpio_dev->iomux_base)) {
		dev_warn(dev, "Failed to get iomux %d io resource\n", index);
		goto out_no_pinmux;
	}

	return;

out_no_pinmux:
	desc->pmxops = NULL;

(Personally I prefer the latter, but okay with the former)

> +}
> +
>  static int amd_gpio_probe(struct platform_device *pdev)
>  {
>  	int ret = 0;
> @@ -1020,6 +1039,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
>  	gpio_dev->ngroups = ARRAY_SIZE(kerncz_groups);
>  
>  	amd_pinctrl_desc.name = dev_name(&pdev->dev);
> +	amd_get_iomux_res(gpio_dev);
>  	gpio_dev->pctrl = devm_pinctrl_register(&pdev->dev, &amd_pinctrl_desc,
>  						gpio_dev);
>  	if (IS_ERR(gpio_dev->pctrl)) {
> diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
> index e2523738fe51..76538792ac78 100644
> --- a/drivers/pinctrl/pinctrl-amd.h
> +++ b/drivers/pinctrl/pinctrl-amd.h
> @@ -83,6 +83,7 @@ struct amd_function {
>  struct amd_gpio {
>  	raw_spinlock_t          lock;
>  	void __iomem            *base;
> +	void __iomem            *iomux_base;
>  
>  	const struct pingroup *groups;
>  	u32 ngroups;
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


