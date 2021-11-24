Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2B545C7FC
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Nov 2021 15:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353150AbhKXOxJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 09:53:09 -0500
Received: from mga04.intel.com ([192.55.52.120]:61860 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351238AbhKXOxF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Nov 2021 09:53:05 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="234015714"
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; 
   d="scan'208";a="234015714"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 06:49:55 -0800
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; 
   d="scan'208";a="554203445"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 06:49:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mptao-00A8Ul-Pi;
        Wed, 24 Nov 2021 16:49:50 +0200
Date:   Wed, 24 Nov 2021 16:49:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] gpiolib: check the 'ngpios' property in core
 gpiolib code
Message-ID: <YZ5RDnDNIsWz+TC2@smile.fi.intel.com>
References: <20211124122850.7095-1-brgl@bgdev.pl>
 <20211124122850.7095-2-brgl@bgdev.pl>
 <YZ5QYsu2ed5FiSWE@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZ5QYsu2ed5FiSWE@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 24, 2021 at 04:46:58PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 24, 2021 at 01:28:50PM +0100, Bartosz Golaszewski wrote:
> > Several drivers read the 'ngpios' device property on their own, but
> > since it's defined as a standard GPIO property in the device tree bindings
> > anyway, it's a good candidate for generalization. If the driver didn't
> > set its gc->ngpio, try to read the 'ngpios' property from the GPIO
> > device's firmware node before bailing out.

...

> What about the modified suggestion from previous version:
> 
> 	if (gc->ngpio == 0) {
> 		ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
> 		/*
> 		 * -ENODATA means that there is no property found and
> 		 * we want to issue the error message to the user. Besides
> 		 * that, we want to return different error code to state
> 		 * that supplied value is not valid.
> 		 */
> 		if (ret == -ENODATA)
> 			ngpios = 0;
> 		else if (ret)
> 			return ret;
> 
> 		gc->ngpio = ngpios;
> 	}
> 
> 	if (gc->ngpio == 0) {
> 		chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> 		ret = -EINVAL;
> 		goto err_free_descs;
> 	}
> 
> ?

If you okay to go with this code,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


