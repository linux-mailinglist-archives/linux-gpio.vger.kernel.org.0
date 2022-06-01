Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49ABD53A2CB
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 12:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344617AbiFAKir (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 06:38:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243940AbiFAKiq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 06:38:46 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3256351A
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 03:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654079925; x=1685615925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hg2pbApqPBLj/lDp4Sti2ndvTpOMhsGJIglJzErJLgo=;
  b=Xmc87gxFqPk1tDs4dDcUku5crfRpA7RAvGpYK02V15fnMDm6vuYcpn6e
   6wz3TOZWOACPWmrS4fvrHjzWySW6qVq7t09FMg4+6V/dDj+dcXvbu4KWG
   nJ9bh0t/EexTWFJyXjXnCCMcnQrTt2RbU1BtE02Be6Q8stE/BXr3agwgV
   e58pgkTiZpDx/aI9/Jo3An4wkJu9ATCF7vnSzoxr1ARYwe+/xyqvjrSEB
   Ly93dkSCtU2rjmPc9hKqDQhxRjG0wIDWFn8He4jgBBSi6ZPCXf40D3TQP
   xqzIfP9j+lRbivj73bK8BFQOa1Crfh2AsZX5+qQvyvvHA8VwrZZkf1JCY
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="336200929"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="336200929"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 03:38:44 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="755857906"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 03:38:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nwLkO-000QYs-O4;
        Wed, 01 Jun 2022 13:38:40 +0300
Date:   Wed, 1 Jun 2022 13:38:40 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com
Subject: Re: [PATCH v4 5/6] pinctrl: amd: Add amd_get_iomux_res function
Message-ID: <YpdBsB0asG3wtVdf@smile.fi.intel.com>
References: <20220601100214.828595-1-Basavaraj.Natikar@amd.com>
 <20220601100214.828595-6-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601100214.828595-6-Basavaraj.Natikar@amd.com>
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

On Wed, Jun 01, 2022 at 03:32:13PM +0530, Basavaraj Natikar wrote:
> Presently there is no way to change pinmux configuration run time.
> Hence add a function to get IOMUX resource which can be used to
> configure IOMUX GPIO pins run time.

...

> +static void amd_get_iomux_res(struct amd_gpio *gpio_dev)
> +{
> +	struct pinctrl_desc *desc = &amd_pinctrl_desc;
> +	struct device *dev = &gpio_dev->pdev->dev;
> +	struct resource *res;
> +	int index;
> +
> +	index = device_property_match_string(dev, "pinctrl-resource-names",  "iomux");
> +	if (index > 0) {

> +		res = platform_get_resource(gpio_dev->pdev, IORESOURCE_MEM, index);
> +		if (!res) {
> +			dev_warn(dev, "Failed to get iomux %d io resource\n", index);
> +			return;
> +		}
> +
> +		gpio_dev->iomux_base = devm_ioremap(dev, res->start, resource_size(res));
> +		if (!gpio_dev->iomux_base) {
> +			desc->pmxops = NULL;
> +			dev_warn(dev, "failed to devm_ioremap() iomux_base\n");
> +		}

	iomux_base = devm_platform_ioremap_resource(..., index);
	if (IS_ERR(...))
		dev_warn();

> +	} else {
> +		desc->pmxops = NULL;
> +		dev_warn(dev, "failed to get iomux index\n");
> +	}
> +}

-- 
With Best Regards,
Andy Shevchenko


