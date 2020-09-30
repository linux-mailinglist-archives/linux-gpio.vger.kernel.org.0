Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F9927E782
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 13:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729353AbgI3LPd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 07:15:33 -0400
Received: from mga17.intel.com ([192.55.52.151]:24023 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729285AbgI3LPc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Sep 2020 07:15:32 -0400
IronPort-SDR: Wjgbvhl3jeGpHSLHkR0d8D7vQS8mcT3YIm61Ftl+3UuPKpFpNl7xs5c3k9UowJPg1s1NEHi7Co
 b2GNs7pATVYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="142436403"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="142436403"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 04:15:29 -0700
IronPort-SDR: hL/o8Ck/578luRZItdOAa7VFrWz5KwS/ejD0f3ib/pd+8GqAA/noVH21W80FGDbs64Pmd3PXU9
 7VIw7GfMEsRg==
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="339049885"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 04:15:27 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kNa4w-00306u-EN; Wed, 30 Sep 2020 14:15:22 +0300
Date:   Wed, 30 Sep 2020 14:15:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Nikhil Devshatwar <nikhil.nd@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Adam Ford <aford173@gmail.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] gpio: pca953x: Use irqchip template
Message-ID: <20200930111522.GP3956970@smile.fi.intel.com>
References: <20200717144040.63253-1-linus.walleij@linaro.org>
 <20200930104729.ajufkrklfhf25d55@NiksLab>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930104729.ajufkrklfhf25d55@NiksLab>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 30, 2020 at 04:17:29PM +0530, Nikhil Devshatwar wrote:
> On 16:40-20200717, Linus Walleij wrote:
> > This makes the driver use the irqchip template to assign
> > properties to the gpio_irq_chip instead of using the
> > explicit calls to gpiochip_irqchip_add_nested() and
> > gpiochip_set_nested_irqchip(). The irqchip is instead
> > added while adding the gpiochip.

> I am getting a kernel crash on K3 j721e common processor board
> when HDMI is plugged in. Following is the full log with crash
> for NULL pointer derefence
> 
> https://pastebin.ubuntu.com/p/wBPS2ymmqR/
> 
> Upon inspection, I found that the "irq_find_mapping" call
> in the "pca953x_irq_handler" returns 0 and the same is passed
> to "handle_nested_irq"

Thanks for the report!

I would like to clarify the following:
- with the above patch reverted everything is fine, correct?
- v5.9-rc7 doesn't make any differences, correct?
- patch [1] doesn't help, correct?

[1]: https://lore.kernel.org/linux-gpio/1600851824-4608-1-git-send-email-ye.li@nxp.com/T/#u

-- 
With Best Regards,
Andy Shevchenko


