Return-Path: <linux-gpio+bounces-16965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13846A4C8A5
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 18:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B82D3A7D4B
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 16:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A6E21884A;
	Mon,  3 Mar 2025 16:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="azrHG4+U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565C8215191;
	Mon,  3 Mar 2025 16:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741019789; cv=none; b=PJX8ENmzZW0Zu5TH3/azRfRRx5ygeycbWnvR2v8ZHjKv5ZqRDNPZILQ3oUV2jaA0AY0AkzzcM+e24K+U4ZijMesyKlIKjxaak4pYq+h0qMTg2nvNzeK05ETiVLhb10Ow7nStWNTq7PqtPrJuFgkj3AQ+G/mOsqo6pBQuYBz93kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741019789; c=relaxed/simple;
	bh=xaN0Z9STeRU3x7d05JOsDuCx42/1AlGaaAsdDktb1YY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XttWGI2nRPdaZ4yX7SSjyihVTA1D8Lr8pGs4omIeHJ05EdG9csoTAMz0sWcQzXkraF8kesr2wns4ZoUBCgMDUk4Bu29P8BhHNbQgZS+gxMir5pCL7UXdJq5FZ0iNEkqsp18gbDpZtsAMAfpZK+hLP+E2Gf59U70saw6gtJYb1fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=azrHG4+U; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 306E9204D3;
	Mon,  3 Mar 2025 16:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741019780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S6RTe4/EaQ9JN6jTa2Zt6y/07I+0OzAWBVKZO29P9Yo=;
	b=azrHG4+U+TrJfwpTjCXkZMz/cp4WTInac2QQvtNhQ+BZbolsf6qfTaM5RvnLo/Onhzek9o
	HZ6D5t1doWHHvswS2t1x1ZByie19oLGvM9YbeB8xNweq2GolI/vDP77cpYaHUuh67J4rQL
	fl7zIqVMIE+8ocfJoo7NLNAN+23bdsiSfmDTo9SQ0I7uP6G/WgIFyXT5At1Le3jOkP7ei0
	vVwshgAS8nLgRjqoSrz5X4vNufYdjsey7H++GaitLcLsj+jBP+zYHJk4jCfzWaNa15H+Fs
	+xbvG6wJZqqhLqhIKF/aMhJKarlmV4VfYzMcqUtBoa6dTK0JhVqvKk6MdzEDnw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-wpan@vger.kernel.org,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-gpio@vger.kernel.org,  Alexander
 Aring <alex.aring@gmail.com>,  Stefan Schmidt <stefan@datenfreihafen.org>,
  Andrew Lunn <andrew+netdev@lunn.ch>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Linus
 Walleij <linus.walleij@linaro.org>,  Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH net-next v1 2/2] ieee802154: ca8210: Switch to using
 gpiod API
In-Reply-To: <Z8XYuY2idCVrAfdm@smile.fi.intel.com> (Andy Shevchenko's message
	of "Mon, 3 Mar 2025 18:28:41 +0200")
References: <20250303150855.1294188-1-andriy.shevchenko@linux.intel.com>
	<20250303150855.1294188-3-andriy.shevchenko@linux.intel.com>
	<8734fu84r8.fsf@bootlin.com> <Z8XYuY2idCVrAfdm@smile.fi.intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 03 Mar 2025 17:36:18 +0100
Message-ID: <87v7sq5awt.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelleeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgesthdtredttdertdenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhleekvdevffeluefhiefgvdevhffgjefggffhieetgeetiedugeeftdejheekfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqfihprghnsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhin
 hhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdgrrhhinhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhtvghfrghnsegurghtvghnfhhrvghihhgrfhgvnhdrohhrghdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghh
X-GND-Sasl: miquel.raynal@bootlin.com

On 03/03/2025 at 18:28:41 +02, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Mar 03, 2025 at 05:20:59PM +0100, Miquel Raynal wrote:
>
> ...
>
>> > - * @gpio_reset:     gpio number of ca8210 reset line
>> > - * @gpio_irq:       gpio number of ca8210 interrupt line
>> > + * @reset_gpio:     GPIO of ca8210 reset line
>> 
>> What about "CA8210 Reset GPIO line"? Or Just "Reset GPIO line"? Or even
>> "Reset GPIO descriptor" (whatever).
>> 
>> > + * @irq_gpio:       GPIO of ca8210 interrupt line
>> 
>> Same
>
> Sure.
>
> [...]
>
>> > -	int ret;
>> > -	struct ca8210_platform_data *pdata = spi->dev.platform_data;
>> > +	struct device *dev = &spi->dev;
>> > +	struct ca8210_platform_data *pdata = dev_get_platdata(dev);
>> 
>> Can you either mention the additional cleanup that you do in the commit
>> log or split it in a separate commit? (splitting is probably not
>> necessary here given that most of the cleanup anyway is related to the
>> actual changes.
>
> Do you mean the platform_data accessors?

Yes.

> I can actually split it to a separate
> change as I had done some of that in the past in other drivers.

Up to you, either way, as long as it is mentioned in the commit log, I'm
happy.

>
> ...
>
>> > -	ret = gpio_direction_output(pdata->gpio_reset, 1);
>> > -	if (ret < 0) {
>> > -		dev_crit(
>> > -			&spi->dev,
>> > -			"Reset GPIO %d did not set to output mode\n",
>> > -			pdata->gpio_reset
>> > -		);
>> > -	}
>> > -
>> > -	return ret;
>> > +	return PTR_ERR_OR_ZERO(pdata->reset_gpio);
>> 
>> This is not a strong request, but in general I think it is preferred to return
>> immediately, so this looks easier to understand:
>
> I used the same logic as in the original flow.

That's true, and I understand your choice in the first place. But given
that you're also doing a bit of cleanup, one more misc change feels okay.

>
>> +	pdata->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(pdata->reset_gpio)) {
>> +		dev_crit(dev, "Reset GPIO did not set to output mode\n");
>> +                return PTR_ERR(pdata->reset_pgio);
>> +       }
>> +
>> +       return 0;
>
> Sure I can do this in v2.

Great!

> ...
>
>> Otherwise the rest lgtm.
>
> Thank you for the review!

