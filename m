Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19C866DDB3D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Apr 2023 14:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjDKMxi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Apr 2023 08:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbjDKMx2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Apr 2023 08:53:28 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340FA40FB
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 05:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681217607; x=1712753607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8xgPUgpwML3aPd63DREciOgoyU6AWduU32/sPvLotHc=;
  b=c3ySzitAMuRgdCdnqm/6OuribDRf4+2IB/StOmqS/vqSpStfct9XjFLd
   KR0G2cGNXGWqFGQKUK9uaIhpKtkd7db5SkqQYq7hGjL6dZdHgIEH3GAqU
   IJnuvtOSpOhzO7nOgnbl1KtqDaCzDY1SxgezsAys2xoRZwSw8QdhCD2Y7
   qI4fETO8hxHQa5LoQ2nFhYZ4E8NoiK/wBnsl98p8LV2S7YoH6eXBwImjo
   WjlAw/BOkbDYEqt3UIQyH06tSpAj3Z3IaN2wP9bwbGTKVBp2gadF+GtE/
   vdyxe4Lv9lt8R7Mhmn8DCrXar3lpL79mGIwZXrVEAiUKJo1by3mPWxWmH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="346279618"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="346279618"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 05:53:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="682064974"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="682064974"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 11 Apr 2023 05:53:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pmDUy-00FGXL-0k;
        Tue, 11 Apr 2023 15:53:24 +0300
Date:   Tue, 11 Apr 2023 15:53:23 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] gpio: gpiolib: Simplify gpiochip_add_data_with_key()
 fwnode
Message-ID: <ZDVYQwklXGrvTGYh@smile.fi.intel.com>
References: <20230411082806.41361-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411082806.41361-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 11, 2023 at 10:28:06AM +0200, Linus Walleij wrote:
> The code defaulting to the parents fwnode if no fwnode was assigned
> is unnecessarily convoluted, probably due to refactoring.

Yes, the refactoring patches tried to avoid unneeded churn as you now
consolidated into a separate change.

> Simplify
> it and make it more human-readable.

...

> -	struct fwnode_handle *fwnode = NULL;
>  	struct gpio_device *gdev;
>  	unsigned long flags;
>  	unsigned int i;
> @@ -675,12 +674,12 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>  	int base = 0;
>  	int ret = 0;
>  
> -	/* If the calling driver did not initialize firmware node, do it here */
> -	if (gc->fwnode)
> -		fwnode = gc->fwnode;
> -	else if (gc->parent)
> -		fwnode = dev_fwnode(gc->parent);
> -	gc->fwnode = fwnode;
> +	/*
> +	 * If the calling driver did not initialize firmware node, do it here
> +	 * using the parent device, if any.
> +	 */

I would prefer to have this comment either untouched or being changed where it
appears to be the same (e.g. in IIO core).

> +	if (!gc->fwnode && gc->parent)
> +		gc->fwnode = dev_fwnode(gc->parent);

Otherwise fine by me.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


