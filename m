Return-Path: <linux-gpio+bounces-18572-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F12EEA82923
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 17:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C72F463667
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 14:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2073C268695;
	Wed,  9 Apr 2025 14:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WuoN2nV3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD6626F47F;
	Wed,  9 Apr 2025 14:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210219; cv=none; b=HpmPWxOcbpW4/EngKBDpUwkdYV2tuAOEJmK9om7MEHz1MTdtqtAgfyzSM/4ddBl09YxyDe8JXZpO3zBmurNdEcf4R//5eIVn+iNs1haFq9Jh4O1XURYtft+37SMdIZtqrW8FQigrboKuJt+qNPya+S8ehX4zu4F9XlKay1d4jH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210219; c=relaxed/simple;
	bh=uzzVa6ujo5elbHi0dvWx9bf9mrflETKQu6/V1xUTTwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4FNYItqNlmjGUt01r8vpV5TYBaf/LgoQUKoQ2iOlwTZ12Y8rhY/rXsh+5AAC8J7sZ//CoeVqf+sW5A38SNuN5miWaeSKeZn/toGlsjM5hWjWhV9/eiOyAB3ijo9x1BZ05oVli+Esy1gD6tCjAxxq74Z23H+RSLNJKp83t3NaTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WuoN2nV3; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 334FD43302;
	Wed,  9 Apr 2025 14:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744210214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LcBPWF/SWwXw6wvCRjjOvZtDGvjFWa20kEFRqJc6D7U=;
	b=WuoN2nV35tpA/uxozRGyssC//QSUwEIoBIt4x5qTNMbXufukRKBaXC4cvmlDhP43MYz2rp
	xsLOZPwW0skZRipwzdpHCvK50M45Ls+yZXZ0oeNd4rl1Gx9cuWx5GzcJqg8a1DX6whc8nL
	TitmMfheteOjIOlkc3ihYTOFXo96gtZRx2GcaccKGdBgtU2IblaJtqe/Gs0l25v2fGPVqL
	62GCkN5S0SxjmptsDskxtuiSdKSfDPBveF/tni0zFfi45UuQDF3EkMTJyMK8AFK053mVCP
	xjvgXUb/hhkKTnmbr5M7kTqU6K2HCR6CQBqGGsFCrxzDoc7Af43iBbGJkZvNUw==
Message-ID: <6bf787ab-9ed4-43a5-8796-262e234edb42@bootlin.com>
Date: Wed, 9 Apr 2025 16:50:11 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/6] gpio: aggregator: handle runtime registration
 of gpio_desc in gpiochip_fwd
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
References: <20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com>
 <20250317-aaeon-up-board-pinctrl-support-v2-4-36126e30aa62@bootlin.com>
 <Z9hYPHmFYEeeCTZ5@smile.fi.intel.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <Z9hYPHmFYEeeCTZ5@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeivdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteekfeevudduvdduveehgeejuefgieeitdeuvdekgfdvgefhjedtffdufeegheenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrngdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvi
 hhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghu
X-GND-Sasl: thomas.richard@bootlin.com

On 3/17/25 18:13, Andy Shevchenko wrote:
> On Mon, Mar 17, 2025 at 04:38:02PM +0100, Thomas Richard wrote:
>> Add request() callback to check if the GPIO descriptor was well registered
>> in the gpiochip_fwd before to use it. This is done to handle the case
>> where GPIO descriptor is added at runtime in the forwarder.
>>
>> If at least one GPIO descriptor was not added before the forwarder
>> registration, we assume the forwarder can sleep as if a GPIO is added at
>> runtime it may sleep.
> 
> Hmm... This should rather be reformatted each time a new descriptor is added,
> no?
I used the easiest solution.

Otherwise to switch to can_sleep mode:
- gpio_fwd_add_gpio_desc() inits the mutex if a sleeping GPIO line is added.
- gpio_fwd_add_gpio_desc() locks the mutex if the spinlock is locked
(gpio_fwd_get_multiple_locked() or gpio_fwd_set_multiple_locked() was
called).
- gpio_fwd_add_gpio_desc() set can_sleep mode to true
- gpio_fwd_get_multiple_locked() or gpio_fwd_set_multiple_locked() shall
unlock the spinlock and the mutex at end.

I think it is a bit over-engineered, and I probably do not handle all
corner cases.

Regards,

Thomas

