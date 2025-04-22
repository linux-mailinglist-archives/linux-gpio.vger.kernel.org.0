Return-Path: <linux-gpio+bounces-19132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C10A96F07
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 16:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42438188C5F5
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 14:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F2F28A3E0;
	Tue, 22 Apr 2025 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZEET54vX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119BC28540A;
	Tue, 22 Apr 2025 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745332599; cv=none; b=uTZZT9kws68nInlaJgED1Qm70HfoKXOPAz+UUHJTmh0tpYW2kVVp+0Yuw7nXK38h2bwvdRKPmJ9pmk5wN9ruXDAxiYohRuYaA/wwUet+A8pPNIV3KZcKnX4wj74SBNkhaiiZRJRH8V8dLPtl4cc/46fWNP6118kostQ1MQlI0jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745332599; c=relaxed/simple;
	bh=/8VAwd7no7OKQMYBljjiaM4esfW7+G7Ic/ETQN2GOv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bOXYKAW23Lr6yE8YlzX8J+RzwBmhrButCnz1sBfAquyB2/v31+JLqswuDbty1qihEkKuyAVyjrA48tN4eqwFKGK4l1/uAx463punbVRsTpWlmcLAetpx6twE1LrGK2lYElaFaVwWKE0DcC2zXgU2T3tGXR7PdUHn+bqdEcoeWYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZEET54vX; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40C3943937;
	Tue, 22 Apr 2025 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745332595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WB5PYXKOFvv4oYKH2c2ZCjlkCs3C+rb8SkclvA5VnKg=;
	b=ZEET54vXsXmDWHesXThpA5gmIdkHveBaOcq1ksWUqq8ViqXtM5VF1H4bNk8Ugk0T/obQ5C
	Cezrk9g11ql59U5DqBOLk+bbRFkVixnx3jzeyYwae+rKDXHkYT0fMHW5mrqIYB6bYeQLdx
	BIs4eiZAIJ4Rp9wIRrQ8r440AN2i5gq0k5YUcaLLjUL4g3hvyzi7lPXQRtxAa7m+JUcrjA
	oJPlnondHX7rl7vLyySpgJw2OsHYeMJrNC+iCZ+6lEcRAF3OWwmbzCIkPKoP3u1hGAS9M2
	bXlguNbctISI6lEzAnQt0nMNH9zcKCebODbgewOssc5bU1LrqHBqxBU/lGgZOg==
Message-ID: <e1bb879a-55b3-43fc-8d2d-67401c21ef76@bootlin.com>
Date: Tue, 22 Apr 2025 16:36:33 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] pinctrl: Add pin controller driver for AAEON UP
 boards
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-10-f40776bd06ee@bootlin.com>
 <aAFBwANy47y0DAhY@smile.fi.intel.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <aAFBwANy47y0DAhY@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteekfeevudduvdduveehgeejuefgieeitdeuvdekgfdvgefhjedtffdufeegheenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrngdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvi
 hhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghu
X-GND-Sasl: thomas.richard@bootlin.com

>> +static int upboard_gpio_request(struct gpio_chip *gc, unsigned int offset)
>> +{
>> +	struct gpiochip_fwd *fwd = container_of(gc, struct gpiochip_fwd, chip);
>> +	struct upboard_pinctrl *pctrl = fwd->data;
> 
> Yeah, something like
> 
> 	struct upboard_pinctrl *pctrl = gpio_fwd_get_data(fwd);
> 
>> +	unsigned int pin = pctrl->pctrl_data->pin_header[offset];
>> +	struct gpio_desc *desc;
>> +	int ret;
>> +
>> +	ret = pinctrl_gpio_request(gc, offset);
>> +	if (ret)
>> +		return ret;
> 
>> +	/* GPIO desc is already registered */
>> +	if (fwd->descs[offset])
>> +		return 0;
> 
> As mentioned in another reply, why 0 and even though, why can't it be simply
> filtered by EEXIST from the below?
> 
> In worst scenario, you can add an API gpio_fwd_is_registered(fwd, offset).

I cannot filter using EEXIST, because I have to get the GPIO desc first.
And using the retcode of gpiod_get_index() I cannot detect that I
already requested the GPIO.

As now gpiochip_fwd is an opaque pointer, I will add the
gpio_fwd_is_registered() helper.

It is due to the fact that the forwarder never releases a GPIO desc. An
other solution could be to add the possibility to remove a GPIO desc.
In upboard_gpio_free() the GPIO desc is free, and we can remove the check.

upboard_gpio_free()
{
	gpio_fwd_free_desc(fwd, offset);
	pinctrl_gpio_free(gc, offset);
}


Best Regards,

Thomas

