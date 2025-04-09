Return-Path: <linux-gpio+bounces-18564-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1ACA826B7
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 15:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D0858A6FA9
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 13:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5DA925E828;
	Wed,  9 Apr 2025 13:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VgbQkN/E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEF3172767;
	Wed,  9 Apr 2025 13:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744206560; cv=none; b=uaPj6Ysx5DIw9GC84QbeJn4DjZOzRM5A1fxssRHizylARDwBrFHoiu9cJ7+iaqr4fz2C/RHnyofrDENtCnw6rYBWEWbwfF3kXEL4vjlKr2WUMUtKs+9bPvwrygY7mfbHYl6DPax9CHdIv4kOKH26zd90yPLcDGbeafLERG8RMqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744206560; c=relaxed/simple;
	bh=WuFi5WxDOjwYO+v4iSL+NcvF0aGqoFkfTYyrrnJZPAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uetkPeJ4S/CWOMNNVeTMKNDdQUqZEcNSvBfr0lRjGs5pRrgVqMfG9grGvVT645Ewpry0T3CoODwz22X21jLYtFnMkQXCgZbLalV+mwozETnXzZM30seikhFyMc2D01nlb3P7a38zR/nMCvtn2WmO8tNyCe0CYzA89TkukLNxD6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VgbQkN/E; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CD2C442AD;
	Wed,  9 Apr 2025 13:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744206555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9xeX2kVjkPhLiEYJ2iMcuYrOxRPfWkVGsnYctyA6TY4=;
	b=VgbQkN/Ex5RX8SlcxZZ29dSexUPcKW8POqYdekIixiM0OyrQBnunq3b8nMN/RAdKDhQ6t0
	Y2GklLrIfFLxf+Si2Rr6l+KblZnfY98AIAtQlFW3nly1IxTl5Zkax+FK430CIzfZtUuiPg
	pwVJrGfx2unAvwe0ZBlxOrsl1NhZHu5PmKfd20uM1GREr6HLGrskbPhWcwztSBFxPAl9rq
	1b7GTQK85Q7Hrr4IPg22soNPPjnD60+iZC6qacdkcOyVRFxP8xeHmXY5c69Vpyc4V+Gg6a
	d9y9pyVP9e5NqLfbUObf3Ggjb8pCB4GOPidhlKH3KEvajbrsjSYkeBMxCHySWw==
Message-ID: <d7433fe4-289a-4b56-83bb-98073543367b@bootlin.com>
Date: Wed, 9 Apr 2025 15:49:13 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/6] gpiolib: add gpiochip_add_pin_range_sparse()
 function
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com>
 <20250317-aaeon-up-board-pinctrl-support-v2-1-36126e30aa62@bootlin.com>
 <Z9hU11aHeIB2VZPN@smile.fi.intel.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <Z9hU11aHeIB2VZPN@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeiudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuhefgfeehveeggfeggfekhfehgfffkeeghfeuffeikeekjeehkeetvedthedtieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrngdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghom
 hdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghu
X-GND-Sasl: thomas.richard@bootlin.com

On 3/17/25 17:59, Andy Shevchenko wrote:
> On Mon, Mar 17, 2025 at 04:37:59PM +0100, Thomas Richard wrote:
>> Add gpiochip_add_pin_range_sparse() function to add a range for GPIO<->pin
>> mapping, using a list of non consecutive pins.
>> Previously, it was only possible to add range of consecutive pins using
>> gpiochip_add_pin_range_sparse().
>>
>> The struct pinctrl_gpio_range has a 'pins' member which allows to set a
>> list of pins (which can be non consecutive).
>> gpiochip_add_pin_range_sparse() is identical to gpiochip_add_pin_range(),
>> except it set 'pins' member instead of 'pin_base' member.
> 
> ...
> 
>> +static int __gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
>> +				    unsigned int gpio_offset, unsigned int pin_offset,
>> +				    unsigned int const *pins, unsigned int npins)
> 
> I really do not like the __ naming here.
> Can we rather create a better one? E.g., gpiochip_add_pin_range_with_pins().
> 
> ...
> 
>> +/**
>> + * gpiochip_add_pin_range_sparse() - add a range for GPIO <-> pin mapping
>> + * @gc: the gpiochip to add the range for
>> + * @pinctl_name: the dev_name() of the pin controller to map to
>> + * @gpio_offset: the start offset in the current gpio_chip number space
>> + * @pin_list: the list of pins to accumulate in this range
>> + * @npins: the number of pins to accumulate in this range
> 
>> + * Calling this function directly from a DeviceTree-supported
>> + * pinctrl driver is DEPRECATED. Please see Section 2.1 of
>> + * Documentation/devicetree/bindings/gpio/gpio.txt on how to
>> + * bind pinctrl and gpio drivers via the "gpio-ranges" property.
> 
> New API can't be deprecated. You probably want to say
> "NOTE, this API is not supposed to be used on DeviceTree-supported platforms."
> or something like that.
> 
> Also it's not clear which function should be used to clean up this. I would
> clarify that: "When tearing down the driver don't forget to remove added ranges
> with help of gpiochip_remove_pin_ranges()."

gpiochip_remove_pin_ranges() is automatically called when the gpiochip
is removed [1]

[1]
https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/gpio/gpiolib.c#L1189

Regards,

Thomas

