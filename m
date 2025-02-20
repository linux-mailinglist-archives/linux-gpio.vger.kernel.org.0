Return-Path: <linux-gpio+bounces-16291-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D82BA3DA0E
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46736188264F
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 12:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18FF1F5612;
	Thu, 20 Feb 2025 12:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hAfWuxZH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06BA1F236E;
	Thu, 20 Feb 2025 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740054511; cv=none; b=iwJz+EX1yRgdAJv5/qDbDGjfY3LNpu48rgHfGeo5PtoctPFOi31Uoy3L+ECLsEqY/ZZ0P8hHcLkZwqA6ZaAQGrzboct13mSFq5kCZ/wKMIzktNPUYrECM2RI30jyWQjCfv6Yt37okB6u/GfTgjqtsqYMVoOshRO7F/Ye40qO1rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740054511; c=relaxed/simple;
	bh=o1rmug3+zIYeul0bU23G6irri56m1LeHH0/3fCiMcqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1Hnnxq3X8Tc19agvMRgm9mlCwfgr3LPa3J2WK0NcfL/41uhX+4xdlam+uXc2fIOKY8d1x8v1RD9ELMaJ6RYvvn6c5SFLCyHG9bsupi7mr7kun4RmoYDpXb+ZyIdUh+MV7X23jhwz7h/vWOzGwHOZswiwXpA2sfzNah7pbnFw/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hAfWuxZH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95144526;
	Thu, 20 Feb 2025 13:27:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740054424;
	bh=o1rmug3+zIYeul0bU23G6irri56m1LeHH0/3fCiMcqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hAfWuxZHKtz4+oTsk9SnZ/G5Oote2P/BKuUxWfEIWdoDdlWeSkaN/JWPzfZpZa2C4
	 EwJEeraWjaiAIDo5hWmc1Tfo/g1LloT0D9ZOa5FaAUe/M7c7nKAc3KQkmuBJ6ps9bV
	 aHpVzCZ3q+ARCc3byctOqyONOC9pEo7SUryKwMNI=
Date: Thu, 20 Feb 2025 14:28:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <foss+kernel@0leil.net>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gpio: pcf857x: add support for reset-gpios on (most)
 PCA967x
Message-ID: <20250220122812.GC20111@pendragon.ideasonboard.com>
References: <20250220-pca976x-reset-driver-v1-0-6abbf043050e@cherry.de>
 <20250220-pca976x-reset-driver-v1-2-6abbf043050e@cherry.de>
 <6110750.alqRGMn8q6@diego>
 <5bebdc73-b2e0-483b-8c8e-3737cda34811@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bebdc73-b2e0-483b-8c8e-3737cda34811@cherry.de>

On Thu, Feb 20, 2025 at 01:13:06PM +0100, Quentin Schulz wrote:
> On 2/20/25 11:52 AM, Heiko Stübner wrote:
> > Am Donnerstag, 20. Februar 2025, 10:56:52 MEZ schrieb Quentin Schulz:
> >> From: Quentin Schulz <quentin.schulz@cherry.de>
> >>
> >> The PCA9670, PCA9671, PCA9672 and PCA9673 all have a RESETN input pin
> >> that is used to reset the I2C GPIO expander.
> >>
> >> One needs to hold this pin low for at least 4us and the reset should be
> >> finished after about 100us according to the datasheet[1]. Once the reset
> >> is done, the "registers and I2C-bus state machine will be held in their
> >> default state until the RESET input is once again HIGH.".
> >>
> >> Because the logic is reset, the latch values eventually provided in the
> >> Device Tree via lines-initial-states property are inapplicable so they
> >> are simply ignored if a reset GPIO is provided.
> >>
> >> [1] https://www.nxp.com/docs/en/data-sheet/PCA9670.pdf 8.5 and fig 22.
> >> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> >> ---
> >>   drivers/gpio/gpio-pcf857x.c | 29 ++++++++++++++++++++++++++---
> >>   1 file changed, 26 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
> >> index 7c57eaeb0afeba8953d998d8eec60a65b40efb6d..94077208e24ae99a1e8762e783f0eabc580fa520 100644
> >> --- a/drivers/gpio/gpio-pcf857x.c
> >> +++ b/drivers/gpio/gpio-pcf857x.c
> >> @@ -5,6 +5,7 @@
> >>    * Copyright (C) 2007 David Brownell
> >>    */
> >>   
> >> +#include <linux/delay.h>
> >>   #include <linux/gpio/driver.h>
> >>   #include <linux/i2c.h>
> >>   #include <linux/interrupt.h>
> > 
> > this is missing
> > #include <linux/gpio/consumer.h>
> > 
> > because otherwise you end up with
> > ../drivers/gpio/gpio-pcf857x.c: In function ‘pcf857x_probe’:
> > ../drivers/gpio/gpio-pcf857x.c:300:21: error: implicit declaration of function ‘devm_gpiod_get_optional’; did you mean ‘devm_regulator_get_optional’? [-Wimplicit-function-declaration]
> >    300 |         rstn_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
> >        |                     ^~~~~~~~~~~~~~~~~~~~~~~
> >        |                     devm_regulator_get_optional
> > ../drivers/gpio/gpio-pcf857x.c:300:68: error: ‘GPIOD_OUT_HIGH’ undeclared (first use in this function)
> >    300 |         rstn_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
> >        |                                                                    ^~~~~~~~~~~~~~
> > ../drivers/gpio/gpio-pcf857x.c:300:68: note: each undeclared identifier is reported only once for each function it appears in
> > ../drivers/gpio/gpio-pcf857x.c:309:17: error: implicit declaration of function ‘gpiod_set_value’ [-Wimplicit-function-declaration]
> >    309 |                 gpiod_set_value(rstn_gpio, 0);
> >        |                 ^~~~~~~~~~~~~~~
> > 
> 
> It compiles just fine on my end, this is all very suspicious.
> 
> GPIO_PCF857X symbol depends on GPIOLIB which builds this function.
> 
> Now, I have no clue how it finds the declaration for me without this 
> include. Any clue?

Possibly indirect includes that depend on your kernel config ? The above
functions and macros are declared and defined in linux/gpio/consumer.h,
so you should include it regardless.

> >> @@ -272,12 +273,11 @@ static const struct irq_chip pcf857x_irq_chip = {
> >>   
> >>   static int pcf857x_probe(struct i2c_client *client)
> >>   {
> >> +	struct gpio_desc *rstn_gpio;

I'd call it reset_gpio as in drivers we deal with logical signals. Up to
you.

> >>   	struct pcf857x *gpio;
> >> -	unsigned int n_latch = 0;
> >> +	unsigned int n_latch;
> >>   	int status;
> >>   
> >> -	device_property_read_u32(&client->dev, "lines-initial-states", &n_latch);
> >> -
> >>   	/* Allocate, initialize, and register this gpio_chip. */
> >>   	gpio = devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
> >>   	if (!gpio)
> >> @@ -297,6 +297,29 @@ static int pcf857x_probe(struct i2c_client *client)
> >>   	gpio->chip.direction_output	= pcf857x_output;
> >>   	gpio->chip.ngpio		= (uintptr_t)i2c_get_match_data(client);
> >>   
> >> +	rstn_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
> >> +	if (IS_ERR(rstn_gpio)) {
> >> +		return dev_err_probe(&client->dev, PTR_ERR(rstn_gpio),
> >> +				     "failed to get reset GPIO\n");
> >> +	}

No need for curly braces.

> >> +
> >> +	if (rstn_gpio) {
> >> +		/* Reset already held with devm_gpiod_get_optional with GPIOD_OUT_HIGH */
> >> +		usleep_range(4, 8); /* tw(rst) > 4us */
> >> +		gpiod_set_value(rstn_gpio, 0);
> >> +		usleep_range(100, 200); /* trst > 100uS */

Maybe use fsleep() for both ?

> >> +
> >> +		/*
> >> +		 * Reset "will initialize to their default states of all I/Os to
> >> +		 * inputs with weak current source to VDD", which is the same as
> >> +		 * writing 1 for all I/Os which is 0 in n_latch.
> >> +		 */
> >> +		n_latch = 0;
> >> +	} else {
> >> +		device_property_read_u32(&client->dev, "lines-initial-states",
> >> +					 &n_latch);
> > 
> > device_property_read_u32 will not fill n_latch if the property is missing.
> > Before n_latch was always set to 0 at the declaration point above.
> > I guess that should be kept, because we want 0, except if
> > device_property_read_u32 provides a different value.
> 
> Yes, this was an oversight from me, will restore n_latch = 0 at the top 
> of the function. Thanks for catching that.

-- 
Regards,

Laurent Pinchart

