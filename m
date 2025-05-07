Return-Path: <linux-gpio+bounces-19729-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EC500AADC40
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 12:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE0B17A7817
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 10:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D95F209F2E;
	Wed,  7 May 2025 10:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CEapo+ua"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB2638F9C;
	Wed,  7 May 2025 10:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612650; cv=none; b=RVc0JKbCjV5s1FwgSuo9mr+dyBWIbRiG7X0T2oEowu5ei0MbKBJK9xY+IJ7IIIPfgSEX2vIHC+S83Y7r4ZLAJiMIhsghGy0wEHwoz3SB96/osacvPo1/km7AnTp5WLjagx8Dv8/zSPMScffqliK7lUeFCyWqHV0FkFhh7W04ofw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612650; c=relaxed/simple;
	bh=gza/MOq50ChUay0E0DpEA6I4RfwVm/dyTI5sPhwVRY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p+mpMkbdfTa2QnK49+dez6oK7WZ39MRccOYY7GwncNkeH6vxlgq7Lm5zT8BMYlJbQ7ME/38m/LG7j1oVwBJgUgOk3fGidOKy/ofIJglhjLuki/p5N+XxGKaALmtRr4bC7k0YUZzYFV+XTXH1iAc8QY6AnNCWw03rtHNQ3SockAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CEapo+ua; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE0FF43196;
	Wed,  7 May 2025 10:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746612646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vBBo8w/w0Mv2gCQOaR7DDY38mmWSZESYCGslHTTWp6Y=;
	b=CEapo+uaeI/8s9l4kL5cMd+py3hRodTLtFh3o+l0+a66QwzIvdRTQeyuKd4B8N1betfShT
	bgY5r1gfYyhoaDVutAlf96JOA4t2ImnXtMTKoEmObt7AMG2LRX9BYs6Xp1cChQqyupaLGi
	rZpks8oUcZEKrDsqoK94mIvwdCfLCpux3Ruo5KSNQMiwYMFjmSgKTbZ7w1uaB4XRf3boDd
	G0JQy0V46OdI5PgyCOe+KU+6UjagXDX120xg44kxBVHyk2qzbUv+rj0DUzwM3jcth956jH
	fHsB4Vv85IkdLFRAujNOOf5aWvwjEXGhkDwxekkc1J4V4r5ydqFAzIT8azJkfA==
Message-ID: <c3b9c494-599e-4d99-8645-589c1c0c106c@bootlin.com>
Date: Wed, 7 May 2025 12:10:44 +0200
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
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAHp75Vdg2LE885+qjpYLkQrdNqaahJc3=Ki7op=6jJUJfJM+sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeiheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetueefgeetveffheevkedvffeugfevhefgueegieelveejjeefgfeigefggfdvkeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrngdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheprghnugihrdhshhgvvhgthhgvnhhkohesghhmrghilhdrtghomhdprhgtphhtthhop
 ehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: thomas.richard@bootlin.com

Hi Andy,

Thanks again for the review.

On 5/7/25 08:34, Andy Shevchenko wrote:
> On Tue, May 6, 2025 at 6:21 PM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
>>
>> Add request() callback to check if the GPIO descriptor was well registered
>> in the gpiochip_fwd before using it. This is done to handle the case where
>> GPIO descriptor is added at runtime in the forwarder.
>>
>> If at least one GPIO descriptor was not added before the forwarder
>> registration, we assume the forwarder can sleep as if a GPIO is added at
>> runtime it may sleep.
> 
> ...
> 
>>  {
>>         struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
>>
>> +       /*
>> +        * get_direction() is called during gpiochip registration, return input
>> +        * direction if there is no descriptor for the line.
>> +        */
>> +       if (!test_bit(offset, fwd->valid_mask))
>> +               return GPIO_LINE_DIRECTION_IN;
> 
> Can you remind me why we choose a valid return for invalid line? From
> a pure code perspective this should return an error.

I reproduced gpiolib behavior. During gpiochip registration, we get the
direction of all lines. In the case the line is not valid, it is marked
as input if direction_input operation exists, otherwise it is marked as
output. [1]

But in fact we could return an error and the core will mark the line as
input. Maybe ENODEV ?

[1]
https://elixir.bootlin.com/linux/v6.15-rc5/source/drivers/gpio/gpiolib.c#L1105-L1123

Regards,

Thomas


