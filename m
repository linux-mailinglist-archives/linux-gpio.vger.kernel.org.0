Return-Path: <linux-gpio+bounces-5001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7619A895622
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 16:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65E09B27CC7
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 13:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5874D58AB0;
	Tue,  2 Apr 2024 13:54:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EF265BBB
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 13:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712066087; cv=none; b=sQ4FGFcy68M3ncDGu6dY6djKHpz96HCch4rVcXr5o8wsQcP+gy+rI0zaS7EpwH+uSJ43y22WcoSBfPDfOw7jZWZcaXguW8uLa7tpXDtl30/F6bqSFdBLfi8K1eDsP5sWemFmeA8DM5dz3XsH7/UT0GCCugcGBKGVP0arvwM1SXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712066087; c=relaxed/simple;
	bh=C0d2OdFVl52N9KQjWfmCBziGrAJ2y0ngEmDx8Jocesk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6cJPW1GNi2juffIlqUejwP4PmaBkw7iN3rJMtJBFA6cmoeSggi/CF1BZqi8pv3DcCei+aLrM0pDAy+HoUHP/et9oRIN2zGdtzUA/sTakTtPr6ZVt+Za1WCjnWVkwQfsisL9zVkQRru9BDCf+2xVZNX0kpUqSxmUaBE3kbiYfbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: 3MzrB6HdTEq1q6Td9h++3g==
X-CSE-MsgGUID: VrnXIaX8RhiSGOoeAwVXrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="18686745"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="18686745"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 06:54:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="915141786"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="915141786"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 06:54:43 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rreb2-00000000pDr-3N2n;
	Tue, 02 Apr 2024 16:54:40 +0300
Date: Tue, 2 Apr 2024 16:54:40 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Hans de Goede <hans@hansg.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [6.9 gpiolib regression] gpiolib: triggers: kobject: 'gpiochipX'
 is not, initialized, yet kobject_get() errors
Message-ID: <ZgwOIKSRcK5X9-vu@smile.fi.intel.com>
References: <bdea97a5-93e5-471f-88fc-a3c6ae74970a@hansg.org>
 <CAMRc=MdM0hNf73jVVd7kSchUVVBXmtQqSwmhNXus4TVovBSeHQ@mail.gmail.com>
 <634bbfb6-a5a4-40ae-b89f-5fc50db43d4f@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <634bbfb6-a5a4-40ae-b89f-5fc50db43d4f@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 02, 2024 at 03:41:00PM +0200, Hans de Goede wrote:
> On 3/29/24 4:16 PM, Bartosz Golaszewski wrote:
> > On Fri, 29 Mar 2024 15:11:21 +0100, Hans de Goede <hans@hansg.org> said:

...

> > Thanks for the report. I hope I'm not being naive here but would the following
> > one-liner work?
> > 
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index ce94e37bcbee..69f365ccbfd8 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -1179,7 +1179,7 @@ struct gpio_device *gpio_device_find(const void *data,
> > 
> >  		gc = srcu_dereference(gdev->chip, &gdev->srcu);
> > 
> > -		if (gc && match(gc, data))
> > +		if (device_is_registered(&gdev->dev) && gc && match(gc, data))
> >  			return gpio_device_get(gdev);
> >  	}
> > 
> > This would make gpio_device_find() ignore any GPIO device that's not yet
> > registered on the GPIO bus which is almost the last step of the registration
> > process right before creating the sysfs attributes.
> 
> Yes that should work and it has the added advantage that it also waits
> for things like the irqchip to be setup before gpio_device_find() will
> find the gpio-device.
> 
> I cannot trigger the race every boot, but I do hit it quite regularly
> and with this change I've done 10 successful consecutive boots, so
> I believe that this indeed fixes the race.
> 
> I've prepared a patch with this fix now which I'll send out shortly.
> 
> As for Andy's suggestion I'm not all that familiar with the RCU stuff,
> but I think that if we were to go that route then the device_is_registered()
> check should be moved up to above the "guard(srcu)(&gdev->srcu);"
> line rather then above the "gc = srcu_deref..." line, since in that
> case we are not using the gdev->chip pointer at all if we bail ?

I believe you are right and we need to move this check out of SRCU scope.
(FWIW, I also thought the very same way after I had sent the message and
 was hesitating to reply with that.)

-- 
With Best Regards,
Andy Shevchenko



