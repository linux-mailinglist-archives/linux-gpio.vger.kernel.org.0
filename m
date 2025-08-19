Return-Path: <linux-gpio+bounces-24576-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D50B2CDE2
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 22:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7617B5820E1
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 20:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34159248873;
	Tue, 19 Aug 2025 20:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b="BrDRvXpZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout3.mo534.mail-out.ovh.net (smtpout3.mo534.mail-out.ovh.net [51.210.94.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE7C246BB3;
	Tue, 19 Aug 2025 20:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.210.94.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755635566; cv=none; b=FFOqr9rshuTy6R1IV6MZBNspNzM7f3UyJFVjKe6KhdsyJMokFsJTAtLKpvmpsIjoKRvERQdDppQRsJCDP1D7gQZWgOE2YgFaLRQVwXaK9VIY3aoTQLOTTwyn2ezUUOgx6dgTo1YaCZ6HYhfWGvqmzU76yPNVkNGHU/sJWmYjW7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755635566; c=relaxed/simple;
	bh=d9z9KPgWc/RebMQ/NN6LPYWSBcq8hxVBEnz1IjAr8MY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mCi7hrUEURhsYskLYrW8IGW2Oq1KpwtmiR+NCXnleyw69igRmWRXxsde/raSLJFNmfjo/u2nC9wlnbF/iKv6jVU+GeyXz8b5fC46vLhd4WbUfb3qseNNlvKIwb/eI0P+T2FlndRW4aMG1FgTKk1urTLmpR4zzvF9czDW7pn5Ho0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet; spf=pass smtp.mailfrom=orca.pet; dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b=BrDRvXpZ; arc=none smtp.client-ip=51.210.94.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orca.pet
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net [51.68.80.175])
	by mo534.mail-out.ovh.net (Postfix) with ESMTPS id 4c618V0t2Dz6QPH;
	Tue, 19 Aug 2025 20:17:14 +0000 (UTC)
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net. [127.0.0.1])
        by director1.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <brgl@bgdev.pl>; Tue, 19 Aug 2025 20:17:13 +0000 (UTC)
Received: from mta7.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.109.231.30])
	by director1.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4c618T5HwXz5wGd;
	Tue, 19 Aug 2025 20:17:13 +0000 (UTC)
Received: from orca.pet (unknown [10.1.6.5])
	by mta7.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id B4A10B832B5;
	Tue, 19 Aug 2025 20:17:12 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-110S004bc066b2d-e836-4dd3-aaaa-7501c6da0428,
                    AA15BFB272E6A7B741EAAF10D6CC71057D8BF2C0) smtp.auth=marcos@orca.pet
X-OVh-ClientIp:79.117.22.109
Message-ID: <a36a853d-5f32-409e-8add-c60b7f5d2fa9@orca.pet>
Date: Tue, 19 Aug 2025 22:17:14 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpio: vortex: add new GPIO device driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: William Breathitt Gray <wbg@kernel.org>, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
References: <20250709091542.968968-1-marcos@orca.pet>
 <aHD40TD8MLug0C6b@black.fi.intel.com>
 <99b67e0f-783a-4ac0-971f-07cf1544a651@orca.pet>
 <aHElavFTptu0q4Kj@smile.fi.intel.com>
Content-Language: es-ES
From: Marcos Del Sol Vives <marcos@orca.pet>
In-Reply-To: <aHElavFTptu0q4Kj@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15837189567057254107
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheeigedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeforghrtghoshcuffgvlhcuufholhcugghivhgvshcuoehmrghrtghoshesohhrtggrrdhpvghtqeenucggtffrrghtthgvrhhnpeejvdfggfdujeekgfdvtddulefgtedutedvheegteffkeevveekvefgleehjefhudenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdejledruddujedrvddvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmrghrtghoshesohhrtggrrdhpvghtpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehinhhtvghlrdgtohhmpdhrtghpthhtohepfigsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrh
 hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehfeegmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=jR4BO9CuWigXCVC/KmXkfiep9EZS605uICVWzBc1qQU=;
 c=relaxed/relaxed; d=orca.pet; h=From; s=ovhmo-selector-1; t=1755634634;
 v=1;
 b=BrDRvXpZpGl76V+XoBDwALFMQpJ7wUa3eepn0YZOL36rW3BaEs8HMJQrH6ECN0sYNBCR9uwp
 8g/9nI2MdTi59wNU6XvpZPf7I29U9rx93lF92NruFQJiUnZkvSp8/7dpE0Zf1BBhXOxnUfpEcUd
 j/uHhYWKOLAU4SMFfMQUGTPNlz0af+c+OPOStbMY9hlyNdUQ/i4+WFdiRNNSg/Zf8xyzgEXB9wh
 gIPUXQtJarTjup5oAOItA+jpTdWnOLZlrMCMOWo1vH7izAPeEHW1euDX7PrF0dV6JRt7hhrlFrm
 srp+rYy+zI20SngolX8bYyM+OwdOev6YdJEWL1+HAtWww==

El 11/07/2025 a las 16:53, Andy Shevchenko escribió:
>> Again, I am not an expert on the Linux kernel, but I did not see any code
>> or examples using neither gpio-mmio nor gpio-regmap for I/O-mapped registers.
> 
> $ git grep -lw '\.io_port[[:space:]]\+= true,'
> drivers/counter/104-quad-8.c
> drivers/gpio/gpio-104-dio-48e.c
> drivers/gpio/gpio-104-idi-48.c
> drivers/gpio/gpio-104-idio-16.c
> drivers/gpio/gpio-exar.c
> drivers/gpio/gpio-gpio-mm.c
> drivers/gpio/gpio-pci-idio-16.c
> drivers/gpio/gpio-pcie-idio-24.c
> drivers/gpio/gpio-ws16c48.c
> drivers/iio/addac/stx104.c
> drivers/iio/dac/cio-dac.c
> 
> Take a look.

I've already made a third version of the patch, using gpio-regmap this time.
This time I'm also using a Southbridge driver that pulls it as a platform
device, much like the rdc321x-southbridge.c does. It's not yet ready for
merging, but it's available for now at
https://github.com/socram8888/linux/tree/vortex-gpio

I have found a small issue though regarding gpio-regmap, and before making
a third version of the patch, I'd prefer to know the way to approach it.

The Vortex86 SoCs require the direction of the GPIO pin to be set before
writing the pin's value. Otherwise, writes to the data ports are ignored.

Currently gpio-regmap does it in the opposite order:

> static int gpio_regmap_direction_output(struct gpio_chip *chip,
> 					unsigned int offset, int value)
> {
>	gpio_regmap_set(chip, offset, value);
>
> 	return gpio_regmap_set_direction(chip, offset, true);
> }

(I have also noticed that it does not properly check the return value of
gpio_regmap_set, but that's another thing)

So there are IMO three different approaches:

1. Add a boolean flag that allows changing the behaviour. If set, invert
the order of operations. Else do as before.
2. Same, but with a "flags" bitfield, in case more flags need to be added
in the future.
3. Do an additional "gpio_regmap_set" after setting the direction. This
means no new fields need to be added to the structures but causes an extra
write that may not be needed on other drivers.

>> IRQ is only available for the first two ports out of the five available.
> Would  it be a problem to support them?

I cannot test that on my platform: as mentioned before, only ports 0 and 1
have IRQs, and in my mini PC I only have two pins available, and they're
both on port 4. 

Any code I'd write would be completely untested and IMHO sounds like a
terrible idea to have such code merged.

Thanks,
Marcos


