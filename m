Return-Path: <linux-gpio+bounces-117-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ED07EBAF7
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 02:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C15E22813C3
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 01:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E72139F;
	Wed, 15 Nov 2023 01:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E693B630
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 01:38:04 +0000 (UTC)
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92963DE
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 17:38:03 -0800 (PST)
Received: from localhost (88-113-24-34.elisa-laajakaista.fi [88.113.24.34])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 9b57977f-8357-11ee-b972-005056bdfda7;
	Wed, 15 Nov 2023 03:37:59 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Wed, 15 Nov 2023 03:37:58 +0200
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hans de Goede <hdegoede@redhat.com>,
	Ferry Toth <ftoth@exalondelft.nl>
Subject: Re: [PATCH v1 2/3] gpiolib: Fix debug messaging in
 gpiod_find_and_request()
Message-ID: <ZVQg9hTQwGtNwIhv@surfacebook.localdomain>
References: <20231019173457.2445119-1-andriy.shevchenko@linux.intel.com>
 <20231019173457.2445119-3-andriy.shevchenko@linux.intel.com>
 <ZTGBqEUzgGCcZP1B@google.com>
 <ZVOSd62yCz4lFIP1@smile.fi.intel.com>
 <ZVPkIOk6gvnwkp9F@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVPkIOk6gvnwkp9F@google.com>

Tue, Nov 14, 2023 at 09:18:24PM +0000, Dmitry Torokhov kirjoitti:
> On Tue, Nov 14, 2023 at 05:29:59PM +0200, Andy Shevchenko wrote:
> > On Thu, Oct 19, 2023 at 12:21:12PM -0700, Dmitry Torokhov wrote:
> > > On Thu, Oct 19, 2023 at 08:34:56PM +0300, Andy Shevchenko wrote:


> > > > When consolidating GPIO lookups in ACPI code, the debug messaging
> > > > had been broken and hence lost a bit of sense. Restore debug
> > > > messaging in gpiod_find_and_request() when configuring the GPIO
> > > > line via gpiod_configure_flags().
> > > 
> > > Could you give an example of the before/after messages to show exavtly
> > > what is being improved?
> > 
> > Before your patch:
> > 
> > [    5.266823] gpio-96 (ACPI:OpRegion): no flags found for ACPI:OpRegion
> > [   14.182994] gpio-40 (?): no flags found for gpios
> > 
> > After your patch:
> > 
> > [    5.085048] gpio-96 (ACPI:OpRegion): no flags found for ACPI:OpRegion
> > [   13.401402] gpio-40 (?): no flags found for (null)
> > 
> > After this patch:
> > 
> > [    3.871185] gpio-96 (ACPI:OpRegion): no flags found for ACPI:OpRegion
> > [   12.491998] gpio-40 (?): no flags found for gpios
> > 
> > ...
> > 
> > Looking at this it's definitely a fix.
> 
> If this ("(null)" vs static "gpios" string) is important, can we reduce
> the patch to:
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 76e0c38026c3..b868c016a9be 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4151,7 +4151,7 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
>  
>  	/* No particular flag request, return here... */
>  	if (!(dflags & GPIOD_FLAGS_BIT_DIR_SET)) {
> -		gpiod_dbg(desc, "no flags found for %s\n", con_id);
> +		gpiod_dbg(desc, "no flags found for %s\n", con_id ?: "gpios");
>  		return 0;
>  	}
>  
> 
> instead of plumbing the names through?

Definitely no, because how can you guess that this is "gpios" and not "gpio"?

> Although this (and the original fix patch) are losing information, in
> the sense that "(null)" explicitly communicates that caller used
> default/NULL conn_id, and not something like "gpios-gpios".

This is not true, there was no such information before your patch and NULL
pointer printing is simply a bad style programming. We already had the cases
when users were scary by "NULL device *" and other similar stuff when it's
practically no problems in the flow. This has to be fixed anyway.

And what's the practical meaning of gpios-gpios / gpio-gpios / gpios-gpio /
gpio-gpio? I believe they are so weird that thinking about them would be lowest
priority over the issues with the messaging there.

-- 
With Best Regards,
Andy Shevchenko



