Return-Path: <linux-gpio+bounces-19740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3437BAAE215
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 16:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A34D4A2ADE
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 14:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF92228AAF3;
	Wed,  7 May 2025 13:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RWcUEBVG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EED628936D;
	Wed,  7 May 2025 13:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626072; cv=none; b=XqnupDncxV9KAoKqbNRRnh1wEjIOB4YbaiT3dnhMLPyOKKA7JLG6FH9ViE79H3xhQsvXQ/66o94v/gkO0B2aSfgBgivUt+kSuj0Gv0NXwu92QqYhfEfZ7vw2t8r0N89JoliWOd/u6n7wTbkl6r5QwkwDUQfUwG4UmSEIhcgsgi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626072; c=relaxed/simple;
	bh=C02ObScTFbiaNdWfFXvVyCLtKf11sLD6lCT0jJlOvwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGTLDcCDBu3RL5ZtFKPJxAUMy+kRaIBsMRN0bqVTnUScfLvIg5oHEy0Gw0/UEEGY3Akfhp8bt5jkcWBBlKGe2BuzuFVZWaGelUBe2CJaeDeouIx0LpMqpYiWxufYDyw1c84LjlWa3q+pfDfAahQUP2E5r6Zjq+uvZ0vRBSt8/vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RWcUEBVG; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 437C843989;
	Wed,  7 May 2025 13:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746626068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CZ2N7o6h8qE4U3KVspLCs0bJ9tD0zoPZrZLgbdQrquw=;
	b=RWcUEBVGojXNeqqjDdOmecevKuK2UFooi2yT5TIDhRowDMIgazVgUuwKMhr/r+ueMjOgBh
	bjBNvV8U0XZFFeMhSBSeISa1ovvPbc17tqHTYWbe2h3wBQ17twTcwtbRwU8RnO4qbLuaLN
	dZFwwu030ylFvHVWZUIrUZbdC/bqbktpAI65Y4cVqzXLKJ2PnO8aNUN5AKGy8gakvMsZ6z
	JPVEJlYSFiklVxTGPeIOqKKiWJD89ZuUN4f5bhr5vEKAqfvwMuWYd+KDDkLK0nrgMKH88x
	CWZP+eHSlnXJ5gWrva4cv0O4vpq2+w/VjtacPF9c/lMHzc3G95M4EJP7MG7/SQ==
Message-ID: <2f02284d-2922-4bc3-ab2a-8848023019b7@bootlin.com>
Date: Wed, 7 May 2025 15:54:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/12] gpio: aggregator: handle runtime registration of
 gpio_desc in gpiochip_fwd
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-9-3906529757d2@bootlin.com>
 <CAHp75Vdg2LE885+qjpYLkQrdNqaahJc3=Ki7op=6jJUJfJM+sw@mail.gmail.com>
 <c3b9c494-599e-4d99-8645-589c1c0c106c@bootlin.com>
 <CAHp75VcKsq5_+uwwVKeq8++H+Rw1giH-TKUErsFmdKPiu5kY+A@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAHp75VcKsq5_+uwwVKeq8++H+Rw1giH-TKUErsFmdKPiu5kY+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetueefgeetveffheevkedvffeugfevhefgueegieelveejjeefgfeigefggfdvkeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrngdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheprghnugihrdhshhgvvhgthhgvnhhkohesghhmrghilhdrtghomhdprhgtphhtthhop
 ehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: thomas.richard@bootlin.com

On 5/7/25 15:24, Andy Shevchenko wrote:
> On Wed, May 7, 2025 at 1:10 PM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
>> On 5/7/25 08:34, Andy Shevchenko wrote:
>>> On Tue, May 6, 2025 at 6:21 PM Thomas Richard
>>> <thomas.richard@bootlin.com> wrote:
> 
> ...
> 
>>>> +       /*
>>>> +        * get_direction() is called during gpiochip registration, return input
>>>> +        * direction if there is no descriptor for the line.
>>>> +        */
>>>> +       if (!test_bit(offset, fwd->valid_mask))
>>>> +               return GPIO_LINE_DIRECTION_IN;
>>>
>>> Can you remind me why we choose a valid return for invalid line? From
>>> a pure code perspective this should return an error.
>>
>> I reproduced gpiolib behavior. During gpiochip registration, we get the
>> direction of all lines. In the case the line is not valid, it is marked
>> as input if direction_input operation exists, otherwise it is marked as
>> output. [1]
>>
>> But in fact we could return an error and the core will mark the line as
>> input. Maybe ENODEV ?
> 
> I am fine with this error code, but do we have similar cases already
> in the kernel? Do they use the same or different error code(s)?

I dumped all get_direction() operations in drivers/gpio and
drivers/pinctrl and returned values are:
- GPIO_LINE_DIRECTION_OUT and GPIO_LINE_DIRECTION_IN (make sense).
- -EINVAL (for example [1]).
- -EBADE in gpiochip_get_direction() [2].
- regmap_read() return code.

But from my point of view -EINVAL and -EBADE do not match our case.

[1]
https://elixir.bootlin.com/linux/v6.15-rc5/source/drivers/gpio/gpio-cros-ec.c#L70
[2]
https://elixir.bootlin.com/linux/v6.15-rc5/source/drivers/gpio/gpiolib.c#L359

Regards,

Thomas

