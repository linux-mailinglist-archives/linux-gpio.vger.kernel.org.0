Return-Path: <linux-gpio+bounces-19056-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D18AA935D1
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 12:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 574DF3AAE65
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 10:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E8A2571B2;
	Fri, 18 Apr 2025 10:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KX3vn1Ya"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFFA269B11;
	Fri, 18 Apr 2025 10:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744970879; cv=none; b=kIFCTp+sij+y8ZiMEjI4ktLAvVhJqd5fBAuEfn01Bz86Jk1cv/UjEd5RIrgdSHwj+nN9b7G/zdARxIGD/gwmhov4AdxGWs5Po0vUZrkZW+rn4EnCkergcTn8bOpSy/+mqaKT38Lt5rzxf+PBuan4GZFwRu8TmJlhpW8jzTOt3y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744970879; c=relaxed/simple;
	bh=wHvPTYFhf+RaQEZSmf0F3AS7UzZtoRRRZGA83VjMMgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ujnCOcr33dLxo2wzJNxAFrqkznUaD+j0Gq6RYvOYlQ9Vh2Iq+KQH1OAJV3C5I8KWfsxTdTyg4pMbESvFw8TCqlhJV/E7FkbBkSlYnabrEdJCdxy8UmhMmjT+tnHeTcGa+0tTSijUJrXOsxnKBpgQTEBVOKRFaeSYvGpj4TFsi2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KX3vn1Ya; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4FC8442E80;
	Fri, 18 Apr 2025 10:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744970874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tym+kWGInhfgVLk7EdwFIBJKHuBw7p9iE/ylbNK7DjA=;
	b=KX3vn1YaHjXGeu6rxzOwBdSKAcaQe5/TcyeqTvKvYuoxbDVtvh17KI/H8U5Qu8Bf0yZzfe
	sPGGKfblQ5b1qYKUcfRX2AhLS9oAbrzHI3JMjqAjoU0yLOYlTBxx9ppvItBxuZOhLwc7IO
	xfGpUgDxeHn0RedpOxhFeWjCCGlgGG5Emp9Snm9hRhVUbPiARR881pcYCcJEYm9HWoJ5rT
	2JlcQH5xAAyD0+/YGSDMuAXt0XCVzl0gdXmv7alIRFhOTWE8prbEw1rIcvb2sRJ2/vm/ud
	BXqQsPcd30ufFuBLUARk7aALBCSfc/NM6rhItxMoJUedlpaTugMCEYZ7HJW/3g==
Message-ID: <81cd8fd9-15ff-4cd5-b3fa-c2b9e4b64908@bootlin.com>
Date: Fri, 18 Apr 2025 12:07:52 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] gpio: aggregator: refactor the code to add GPIO
 desc in the forwarder
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-4-f40776bd06ee@bootlin.com>
 <aAE3gRH08WuuIFai@smile.fi.intel.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <aAE3gRH08WuuIFai@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedukeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteekfeevudduvdduveehgeejuefgieeitdeuvdekgfdvgefhjedtffdufeegheenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrngdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvi
 hhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghu
X-GND-Sasl: thomas.richard@bootlin.com

Hi Andy,

Thanks a lot for the review !!

On 4/17/25 19:16, Andy Shevchenko wrote:
> On Wed, Apr 16, 2025 at 04:08:12PM +0200, Thomas Richard wrote:
>> Create a dedicated function to add a GPIO desc in the forwarder. Instead of
>> passing an array of GPIO desc, now the GPIO desc are passed on by one to
>> the forwarder.
> 
> ...
> 
>> +static int gpiochip_fwd_add_gpio_desc(struct gpiochip_fwd *fwd,
>> +				      struct gpio_desc *desc,
>> +				      unsigned int offset)
>> +{
>> +	struct gpio_chip *parent = gpiod_to_chip(desc);
>> +	struct gpio_chip *chip = &fwd->chip;
>> +
>> +	if (offset > chip->ngpio)
> 
>> = ?
> 
>> +		return -EINVAL;
> 
>> +	if (fwd->descs[offset])
>> +		return -EEXIST;
> 
> Not sure we need this. I would rather think that something inside struct
> gpiochip_fwd should track this. OTOH, I understand that you want to have
> sparse lists perhaps. I;m wondering why GPIO valid mask can't be used for
> this purposes?

The valid_mask in the gpio_chip is allocated in
gpiochip_add_data_with_key() which is too late for us.

But as you suggested, something (a valid_mask like in gpio_chip) inside
struct gpiochip_fwd should work.

> 
>> +	/*
>> +	 * If any of the GPIO lines are sleeping, then the entire forwarder
>> +	 * will be sleeping.
>> +	 * If any of the chips support .set_config(), then the forwarder will
>> +	 * support setting configs.
>> +	 */
>> +	if (gpiod_cansleep(desc))
>> +		chip->can_sleep = true;
>> +
>> +	if (parent && parent->set_config)
>> +		chip->set_config = gpio_fwd_set_config;
>> +
>> +	fwd->descs[offset] = desc;
>> +
>> +	dev_dbg(chip->parent, "%u => gpio %d irq %d\n", offset,
>> +		desc_to_gpio(desc), gpiod_to_irq(desc));
>> +
>> +	return 0;
>> +}
> 
> The bottom line is that I'm fine with this change without additional checks,
> add them when function will be used not only in the original loop.

Ok so for this patch I do not add checks.
Then I implement a valid_mask (in struct gpiochip_fwd) in patch 08/10
"gpio: aggregator: handle runtime registration of gpio_desc in gpiochip_fwd"

Best Regards,

Thomas

