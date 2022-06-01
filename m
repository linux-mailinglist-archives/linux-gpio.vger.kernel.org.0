Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9E8A53A2D5
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 12:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352119AbiFAKjg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 06:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352024AbiFAKjd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 06:39:33 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F2C7CDF3
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 03:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654079972; x=1685615972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0nTuorH00HaJWwhK120/vFdLXCWskMtaueM0sfzLnB0=;
  b=isGIefF2XaWmjL0CZyIvMCN+JOqswTXbKPcYB1u7arSR0aHsD7B9UHHY
   DAfT2/gq0IdAkSKf/HcrsL5C5Z0FXlNyhYtOh5ruh0H0Hx0cT0ayRwEZg
   iM7BRxj27+DXCThzH20dHoe9TVSs/B0NRC4Z/H8BNk2/IQQJZwFUPzsIF
   k4wRdkM1yDR5GAX2WldZv8F7hko78QW7us9V8ueYLUb215wRD72P3pfUe
   e3zum850zljr0Ns0oo67TEm/N7VuBGIdglr7ZfC29bCC+HB+q/6kDt4Jk
   SJi04bnWkybhKYy+J/1nop+lJd4K0LYtVCtYP2WSV7pOqOe0ByH+5Wl6K
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="300896501"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="300896501"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 03:39:31 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="530006439"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 03:39:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nwLl9-000QYz-7t;
        Wed, 01 Jun 2022 13:39:27 +0300
Date:   Wed, 1 Jun 2022 13:39:26 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com
Subject: Re: [PATCH v4 5/6] pinctrl: amd: Add amd_get_iomux_res function
Message-ID: <YpdB3uKjKzvdeha1@smile.fi.intel.com>
References: <20220601100214.828595-1-Basavaraj.Natikar@amd.com>
 <20220601100214.828595-6-Basavaraj.Natikar@amd.com>
 <YpdBsB0asG3wtVdf@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YpdBsB0asG3wtVdf@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 01, 2022 at 01:38:40PM +0300, Andy Shevchenko wrote:
> On Wed, Jun 01, 2022 at 03:32:13PM +0530, Basavaraj Natikar wrote:
> > Presently there is no way to change pinmux configuration run time.
> > Hence add a function to get IOMUX resource which can be used to
> > configure IOMUX GPIO pins run time.

...

> > +static void amd_get_iomux_res(struct amd_gpio *gpio_dev)
> > +{
> > +	struct pinctrl_desc *desc = &amd_pinctrl_desc;
> > +	struct device *dev = &gpio_dev->pdev->dev;
> > +	struct resource *res;
> > +	int index;
> > +
> > +	index = device_property_match_string(dev, "pinctrl-resource-names",  "iomux");

> > +	if (index > 0) {

Btw, why > and not >= ? 0 is valid index.

> > +		res = platform_get_resource(gpio_dev->pdev, IORESOURCE_MEM, index);
> > +		if (!res) {
> > +			dev_warn(dev, "Failed to get iomux %d io resource\n", index);
> > +			return;
> > +		}
> > +
> > +		gpio_dev->iomux_base = devm_ioremap(dev, res->start, resource_size(res));
> > +		if (!gpio_dev->iomux_base) {
> > +			desc->pmxops = NULL;
> > +			dev_warn(dev, "failed to devm_ioremap() iomux_base\n");
> > +		}
> 
> 	iomux_base = devm_platform_ioremap_resource(..., index);
> 	if (IS_ERR(...))
> 		dev_warn();
> 
> > +	} else {
> > +		desc->pmxops = NULL;
> > +		dev_warn(dev, "failed to get iomux index\n");
> > +	}
> > +}

-- 
With Best Regards,
Andy Shevchenko


