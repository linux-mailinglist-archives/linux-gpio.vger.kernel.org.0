Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6A119CAC4
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 22:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388571AbgDBUJ4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 16:09:56 -0400
Received: from mga11.intel.com ([192.55.52.93]:44044 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726617AbgDBUJ4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 2 Apr 2020 16:09:56 -0400
IronPort-SDR: hVf/UZ+GlhY+sjmWJJgGU+LAbDbMRqAKjnd9Rxpqf9gRPFh/+ufenOeYb5fKgC1wGQxhlq/WI1
 BOAxSEfraZ3w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 13:09:55 -0700
IronPort-SDR: i9E1zUXz5FnY7cHf5h3QlZf5STC6xiiZi8xPb8xAwZIulgnxZjSfmWzAyLpvfXGsyLhlo2MB9R
 dOKz8IfgAPkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,336,1580803200"; 
   d="scan'208";a="396491259"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 02 Apr 2020 13:09:53 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jK69z-00FFTF-Ux; Thu, 02 Apr 2020 23:09:55 +0300
Date:   Thu, 2 Apr 2020 23:09:55 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1] gpio: Extend TODO to cover code duplication avoidance
Message-ID: <20200402200955.GD1922688@smile.fi.intel.com>
References: <20200402192145.17239-1-andriy.shevchenko@linux.intel.com>
 <CAP+cEOO-G=4_txK3dtOxOoRS51GWBzEwa5FfpRzYxDKHo=MdiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP+cEOO-G=4_txK3dtOxOoRS51GWBzEwa5FfpRzYxDKHo=MdiA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 03, 2020 at 01:05:51AM +0530, Vaibhav Gupta wrote:
> On Fri, Apr 3, 2020 at 12:51 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > It appears at least two drivers has a lot of duplication code in
> > GPIO subsystem.
> Yes, I was surprised too. I studied the gpio-pch to understand how
> conversions are going to take place. But when I started working
> on gpio-ml-ioh, It was exactly same and I could do it in no other
> way, except like that of gpio-pch.

I guess this answers the question in the previous thread.
To be clear, scrap your patch and don't touch just gpio-ml-ioh alone.
Basically it should be one patch to get rid the driver.

JFYI, I will send couple of clean ups against gpio-pch.

> 
> -- Vaibhav Gupta
> To avoid adding more and get rid of existing duplication
> > extend TODO.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/gpio/TODO | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
> > index 3a44e6ae52bd..b989c9352da2 100644
> > --- a/drivers/gpio/TODO
> > +++ b/drivers/gpio/TODO
> > @@ -99,6 +99,10 @@ similar and probe a proper driver in the gpiolib subsystem.
> >  In some cases it makes sense to create a GPIO chip from the local driver
> >  for a few GPIOs. Those should stay where they are.
> >
> > +At the same time it makes sense to get rid of code duplication in existing or
> > +new coming drivers. For example, gpio-ml-ioh should be incorporated into
> > +gpio-pch. In similar way gpio-intel-mid into gpio-pxa.
> > +
> >
> >  Generic MMIO GPIO
> >
> > --
> > 2.25.1
> >

-- 
With Best Regards,
Andy Shevchenko


