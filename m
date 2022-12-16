Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0774464EC63
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 14:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbiLPNz5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 08:55:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiLPNzz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 08:55:55 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6374B10066;
        Fri, 16 Dec 2022 05:55:54 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="383303330"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="383303330"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 05:55:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="895252418"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="895252418"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 16 Dec 2022 05:55:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1p6BBP-00AshK-39;
        Fri, 16 Dec 2022 15:55:27 +0200
Date:   Fri, 16 Dec 2022 15:55:27 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 01/11] leds: led-class: Add missing put_device() to
 led_put()
Message-ID: <Y5x4z6N5ZjdomP4c@smile.fi.intel.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-2-hdegoede@redhat.com>
 <Y5x0IdXiczdc73qV@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5x0IdXiczdc73qV@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 16, 2022 at 03:35:29PM +0200, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 12:30:03PM +0100, Hans de Goede wrote:

...

> >  	led_cdev = dev_get_drvdata(led_dev);
> >  
> > -	if (!try_module_get(led_cdev->dev->parent->driver->owner))
> > +	if (!try_module_get(led_cdev->dev->parent->driver->owner)) {
> > +		put_device(led_cdev->dev);
> >  		return ERR_PTR(-ENODEV);
> > +	}
> >  
> >  	return led_cdev;
> 
> ...
> 
> >  void led_put(struct led_classdev *led_cdev)
> >  {
> >  	module_put(led_cdev->dev->parent->driver->owner);
> > +	put_device(led_cdev->dev);
> 
> Hmm... It was in the original submission.
> 
> https://lore.kernel.org/linux-leds/1443605522-1118-2-git-send-email-tomi.valkeinen@ti.com/

...

> Nevertheless, shouldn't you put device before putting module? (It may need to
> save the owner of the driver, I think.)

I think this is wrong, the symmetry is kept correct in your patch.

-- 
With Best Regards,
Andy Shevchenko


