Return-Path: <linux-gpio+bounces-19971-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3877AB3C2C
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 17:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DC581680EC
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 15:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88F923BCE7;
	Mon, 12 May 2025 15:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jWDU0Cf2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7F230BF5;
	Mon, 12 May 2025 15:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064039; cv=none; b=BA7WGfZCcGSjRwynb9GB7oWfyqRoTP8W892JP0JYZl/BrPAlFTHaUDb8cAWPBlm/g9MtTNSTN3pPUL4CuZHXiL6t2IKMA4+VQalL00RLWmqfGEy1QpGU77AVFjJ1gX/ovGqAsLKICjN6SOpI/z3fIpysJqCuO5y9ggzlFByQPUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064039; c=relaxed/simple;
	bh=8kFDe70qaBxmc6z/Z1gNuXvdsiYl3WM8puv+RKmDiaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UkjC9Yck9YaH/YV8swH0pvnYsnuXvaKMGvHbpGDgWl2Y0RbQhh/gGENIxO+gv2ZSD1yig+D3blkgNfYPY/VOWl92D2J5ohjS4R5eNQRfYQ/30MuTyKnCzuUjN8SeNuKFn+WTnckIDSJJYU1J4sJQLa7ltIwAw06VT+lGOdKLDD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jWDU0Cf2; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3ABC43B3A;
	Mon, 12 May 2025 15:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747064035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tqr4mwpC62OuBMSttBJ++MLfd/oZaeC/h6MdIt4o6Dg=;
	b=jWDU0Cf2tHPFa1T6VvkLpuRitJNsHihmOOifZKfM3nHDGeYcC8zu5J6wdAL9JpNhXfkwLd
	9lG1Ee+LZwBf77xLTsNxW+4SCAp8xs7IGbhx4w+CjRxKvHnpAOmOECqN4vC9XXhMs28M6K
	gv2iuARfeRGeHHRylgy+7mR6Pupk/P9T6U39LsPp1EldOZf5Nf6yeoyvISZZ34xJovJK4N
	zdAimCXdjmjR+zVzZkDo54YbqQPXbHDjC97KRTs1QN+8GmN/ShCMMehV2cEZ9uuOsPIN9m
	5ZdrdVLoiVVVF5n4y3QOIj+VwrBGyjjwWSBQ1wmRLPPGI0oXGd7Nn838n17vSw==
Message-ID: <5030b353-85ba-40d7-9b87-619787d99061@bootlin.com>
Date: Mon, 12 May 2025 17:33:53 +0200
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
 <93425f2f-9496-4d18-ad7d-7e631a80e6cf@bootlin.com>
 <CAMuHMdUMVFk+-3akj6nj+XCya9zj_FqkbnpOT1Wc4wSsgttiww@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAMuHMdUMVFk+-3akj6nj+XCya9zj_FqkbnpOT1Wc4wSsgttiww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdduieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteekfeevudduvdduveehgeejuefgieeitdeuvdekgfdvgefhjedtffdufeegheenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrngdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgp
 dhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: thomas.richard@bootlin.com

On 5/12/25 17:14, Geert Uytterhoeven wrote:
> Hi Thomas,
> 
> On Mon, 12 May 2025 at 17:01, Thomas Richard <thomas.richard@bootlin.com> wrote:
>> On 5/12/25 16:39, Geert Uytterhoeven wrote:
>>> On Mon, 12 May 2025 at 16:08, Thomas Richard <thomas.richard@bootlin.com> wrote:
>>>> On 5/9/25 11:07, Geert Uytterhoeven wrote:
>>>>> On Tue, 6 May 2025 at 17:21, Thomas Richard <thomas.richard@bootlin.com> wrote:
>>>>>> Export all symbols and create header file for the GPIO forwarder library.
>>>>>> It will be used in the next changes.
>>>>>>
>>>>>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>>>>
>>>> ...
>>>>
>>>>>> +
>>>>>> +int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
>>>>>> +                       unsigned long config);
>>>>>> +
>>>>>> +int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset);
>>>>>
>>>>> I would expect all of these to take gpiochip_fwd pointers instead of
>>>>> gpio_chip pointers.  What prevents you from passing a gpio_chip pointer
>>>>> that does not correspond to a gpiochip_fwd object, causing a crash?
>>>>
>>>> Indeed nothing prevents from passing gpio_chip pointer which does not
>>>> correspond to a gpiochip_fwd object.
>>>> And it is also a bit weird to pass a gpiochip_fwd pointer in some cases
>>>> (for example gpio_fwd_gpio_add()) and a gpio_chip in other cases.
>>>>
>>>> I can keep GPIO operations as is, and create exported wrappers which
>>>> take a gpiochip_fwd pointer as parameter, for example:
>>>>
>>>> int gpiochip_fwd_get_multiple(struct gpiochip_fwd *fwd,
>>>>                               unsigned long *mask,
>>>>                               unsigned long *bits)
>>>> {
>>>>         struct gpio_chip *gc = gpiochip_fwd_get_gpiochip(fwd);
>>>>
>>>>         return gpio_fwd_get_multiple_locked(chip, mask, bits);
>>>> }
>>>> EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_get_multiple, "GPIO_FORWARDER");
>>>>
>>>> So exported functions are gpiochip_fwd_*().
>>>
>>> That sounds fine to me.
>>>
>>> BTW, do you need to use these functions as gpio_chip callbacks?
>>> If that is the case, they do no need to take struct gpio_chip pointers.
>>>
>> I'm not sure to understand the question, or the idea behind the question.
> 
> Do users of the forwarder library want to use these functions directly
> as callbacks in their own gpiochip?
> E.g. do they want to use:
> 
>     chip->get_multiple_rv = gpiochip_fwd_get_multiple;
> 
> I hope my question is more clear now.

Oh ok I understand now.
The answer is no (gpiochip_fwd_get_multiple() is already by default the
get_multiple_rv operation of the forwarder).

My use case (patch 12/12) is:
I have a pinctrl driver (for a FPGA) which registers a gpiochip_fwd. The
driver has to drive in tandem its configuration and SoC GPIOs (which are
added in the gpiochip_fwd).
During the probe, the driver will change gpiochip operation to use its
own operation.

gc = gpiochip_fwd_get_gpiochip(fwd)
gc->direction_input = my_direction_input;

This function does some custom things and them call
gpiochip_fwd_gpio_direction_input().

my_direction_input()
{
	do_something()
	gpiochip_fwd_gpio_direction_input()
}

It allows you to add custom action before/after default operation.

Regards,

Thomas

