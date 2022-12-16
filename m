Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9572864EC28
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 14:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbiLPNfi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 08:35:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiLPNfh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 08:35:37 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F011A44C;
        Fri, 16 Dec 2022 05:35:35 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="299304385"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="299304385"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 05:35:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="738540009"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="738540009"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Dec 2022 05:35:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1p6As5-00AsGA-17;
        Fri, 16 Dec 2022 15:35:29 +0200
Date:   Fri, 16 Dec 2022 15:35:29 +0200
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
Message-ID: <Y5x0IdXiczdc73qV@smile.fi.intel.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216113013.126881-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 16, 2022 at 12:30:03PM +0100, Hans de Goede wrote:
> led_put() is used to "undo" a successful of_led_get() call,
> of_led_get() uses class_find_device_by_of_node() which returns
> a reference to the device which must be free-ed with put_device()
> when the caller is done with it.
> 
> Add a put_device() call to led_put() to free the reference returned
> by class_find_device_by_of_node().
> 
> And also add a put_device() in the error-exit case of try_module_get()
> failing.

...

>  	led_cdev = dev_get_drvdata(led_dev);
>  
> -	if (!try_module_get(led_cdev->dev->parent->driver->owner))
> +	if (!try_module_get(led_cdev->dev->parent->driver->owner)) {
> +		put_device(led_cdev->dev);
>  		return ERR_PTR(-ENODEV);
> +	}
>  
>  	return led_cdev;

...

>  void led_put(struct led_classdev *led_cdev)
>  {
>  	module_put(led_cdev->dev->parent->driver->owner);
> +	put_device(led_cdev->dev);

Hmm... It was in the original submission.

https://lore.kernel.org/linux-leds/1443605522-1118-2-git-send-email-tomi.valkeinen@ti.com/

Nevertheless, shouldn't you put device before putting module? (It may need to
save the owner of the driver, I think.)

>  }

-- 
With Best Regards,
Andy Shevchenko


