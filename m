Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B039E62DFE5
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 16:32:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbiKQPcB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 10:32:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234758AbiKQPb6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 10:31:58 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E468CE092
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 07:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668699117; x=1700235117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=56haqea2XXoij3OAnOcFxvu7OLoAYc5NUH4P9lnMUpw=;
  b=KQNlDz4rH49Npeay48o70p5xbynh9hBU1ohDoD6cKX0TJcKRBGani9/n
   k7ybY2xZr+BKcRKrzp9i3wKZAebjQ8dqD7vqBh4wyRpHapWOH3Cq6oaqV
   G0gtdo5enP80S9zws5dtN4SpHGNw18HtGuHGxVywHiEl+TLOFWjJrBI54
   MgZXiDa7dVnsYmx3pWb6Tn7guWSQDx0IhaF3hmmbaNIJJ56OMP9PtpCzG
   p5fZU+sFmWm+be7knuMnAH0xX7oFfgDY/COi2zh1nxVgjvd/Ar5Ba9+Cb
   s7uEHx6mxj7lti1YKVA+QM9Re/EVf0lmYLJwrm3d1C/L2ZJBZWlZA0jyh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="375011642"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="375011642"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 07:31:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="634088495"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="634088495"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 17 Nov 2022 07:31:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1ovgro-00DcwA-37;
        Thu, 17 Nov 2022 17:31:52 +0200
Date:   Thu, 17 Nov 2022 17:31:52 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Zeng Heng <zengheng4@huawei.com>
Cc:     brgl@bgdev.pl, linux@roeck-us.net, linus.walleij@linaro.org,
        warthog618@gmail.com, linux-gpio@vger.kernel.org,
        liwei391@huawei.com
Subject: Re: [PATCH v3] gpiolib: fix memory leak in gpiochip_setup_dev()
Message-ID: <Y3ZT6KUkPlSS7whW@smile.fi.intel.com>
References: <f118d0b1-1bf2-b710-c3b4-2745c72f02b3@huawei.com>
 <20221117090247.122980-1-zengheng4@huawei.com>
 <Y3YR0rBSWHu5WhfL@smile.fi.intel.com>
 <3ccf3b72-a3dd-66fe-4d8a-b22140ed9364@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ccf3b72-a3dd-66fe-4d8a-b22140ed9364@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 17, 2022 at 10:12:31PM +0800, Zeng Heng wrote:
> On 2022/11/17 18:49, Andy Shevchenko wrote:
> > On Thu, Nov 17, 2022 at 05:02:47PM +0800, Zeng Heng wrote:

...

> > > +	/*
> > > +	 * If gdev->dev.release has been registered by
> > > +	 * gpiochip_setup_dev(), print err msg and
> > > +	 * call put_device() to release all.
> > > +	 */
> > > +	if (gdev->dev.release)
> > > +		goto err_free_gdev;
> > (1)
> > 
> > >   err_remove_from_list:
> > >   	spin_lock_irqsave(&gpio_lock, flags);
> > >   	list_del(&gdev->list);
> > ...
> > 
> > > -	kfree(gdev);
> > > +	if (gdev->dev.release)
> > > +		put_device(&gdev->dev);
> > Why you can't do this above at (1)?
> > Is there any other hidden way to get here with release set?
> 
> As already mentioned in the mail, keep the error print info.

Can you refactor that to avoid double condition on the ->release() presence?

> > > +	else
> > > +		kfree(gdev);
> > >   	return ret;

-- 
With Best Regards,
Andy Shevchenko


