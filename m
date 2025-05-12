Return-Path: <linux-gpio+bounces-19969-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE2EAB3B90
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 17:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFFD219E3546
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 15:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3400238C2F;
	Mon, 12 May 2025 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IDWIfuPV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C531134D4;
	Mon, 12 May 2025 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747062064; cv=none; b=RNNXlIILRA0xXNhKhURc0qUBSKeJZEKz+EYMVwBmpANAkCDdVRcKQ1mKBZRuKH5LqdYzbg7b/++scpDGGAkBR9wzIweA3KJNQmMK24nLBDY7/L6N0YHM0nM4HiHdvGB+WFYZG+1F2lcZkzNffGAiEHrCuKpr1Au+uMoyAMVy4gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747062064; c=relaxed/simple;
	bh=BpVAMfgxeWrcHIBM77sPD51+M1orCvMXMQ5loTu3QLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRgr0Z4SOcv1AopcVF9CigZD/0syoOVx94+sjmfzJWORez+CfnpzT9H5mqGxHiy9wih2gI/4xeusqI82m4Sidc0YBAlLHSR3vQwoDyTwDDx77yVnFtWi8GxdhIVG31awjDWKkR7x4D2vJxWf4zE1MQUiOfvmClNtgc1qokJeZ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IDWIfuPV; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1C1C43A33;
	Mon, 12 May 2025 15:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747062060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3FbUwJDtVYEZp145ab6kdJucg73/MeorJWo0dy1T+o=;
	b=IDWIfuPV/MHbtEClxe47NJ2Gy9AtBrn9FvHI9dRMzz/YGvXQ6ExPLODm2QmEmzetp8FF+1
	sDwRarjUROcoud7QIb4rELwN9VncNKGFmLC1dNbTvk3YgTB30nBSWVZLhxbtPBM0cj6lzZ
	4qJaXDyBB2SW/gtPsdOeDMLdnz9i9LRnBn/+5ru7nUOlxN1VENB3hGZW5ibCRfs3YKt4B3
	0JQk/qY1Ihas1nrCqD8EeFCkOP8fQ5ekPVuEC2Ukq4p3ugg2z6IDJK69Je5q88rp3mUN2a
	Ggjd9F/fdstjkAQKPfv/U3zVfnndde6gmdD3bZ2tLDq1yKx8LTUP+lSqP+0Etw==
Message-ID: <93425f2f-9496-4d18-ad7d-7e631a80e6cf@bootlin.com>
Date: Mon, 12 May 2025 17:00:58 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] gpio: aggregator: export symbols of the GPIO
 forwarder library
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-8-3906529757d2@bootlin.com>
 <CAMuHMdXzU1k_JZ0UhUh33XCq_zpq6MBJgAjo9F9Cw4gckA12EQ@mail.gmail.com>
 <c10b7752-cec5-483c-90a9-ada16aa0904a@bootlin.com>
 <CAMuHMdUtEtZH0MuS7TA6RTa1-LB=K47sEGzo9BJM_RvfCRmRAw@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAMuHMdUtEtZH0MuS7TA6RTa1-LB=K47sEGzo9BJM_RvfCRmRAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdduheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteekfeevudduvdduveehgeejuefgieeitdeuvdekgfdvgefhjedtffdufeegheenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrngdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgp
 dhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: thomas.richard@bootlin.com

On 5/12/25 16:39, Geert Uytterhoeven wrote:
> Hi Thomas,
> 
> On Mon, 12 May 2025 at 16:08, Thomas Richard <thomas.richard@bootlin.com> wrote:
>> On 5/9/25 11:07, Geert Uytterhoeven wrote:
>>> On Tue, 6 May 2025 at 17:21, Thomas Richard <thomas.richard@bootlin.com> wrote:
>>>> Export all symbols and create header file for the GPIO forwarder library.
>>>> It will be used in the next changes.
>>>>
>>>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>>
>> ...
>>
>>>> +
>>>> +int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
>>>> +                       unsigned long config);
>>>> +
>>>> +int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset);
>>>
>>> I would expect all of these to take gpiochip_fwd pointers instead of
>>> gpio_chip pointers.  What prevents you from passing a gpio_chip pointer
>>> that does not correspond to a gpiochip_fwd object, causing a crash?
>>
>> Indeed nothing prevents from passing gpio_chip pointer which does not
>> correspond to a gpiochip_fwd object.
>> And it is also a bit weird to pass a gpiochip_fwd pointer in some cases
>> (for example gpio_fwd_gpio_add()) and a gpio_chip in other cases.
>>
>> I can keep GPIO operations as is, and create exported wrappers which
>> take a gpiochip_fwd pointer as parameter, for example:
>>
>> int gpiochip_fwd_get_multiple(struct gpiochip_fwd *fwd,
>>                               unsigned long *mask,
>>                               unsigned long *bits)
>> {
>>         struct gpio_chip *gc = gpiochip_fwd_get_gpiochip(fwd);
>>
>>         return gpio_fwd_get_multiple_locked(chip, mask, bits);
>> }
>> EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_get_multiple, "GPIO_FORWARDER");
>>
>> So exported functions are gpiochip_fwd_*().
> 
> That sounds fine to me.
> 
> BTW, do you need to use these functions as gpio_chip callbacks?
> If that is the case, they do no need to take struct gpio_chip pointers.
> 
I'm not sure to understand the question, or the idea behind the question.

Regards,

Thomas

