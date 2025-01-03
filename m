Return-Path: <linux-gpio+bounces-14457-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FA1A007D2
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 11:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 466B618838EB
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 10:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BB11E04BE;
	Fri,  3 Jan 2025 10:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="REsXMrLt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32631CEEBB;
	Fri,  3 Jan 2025 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735900119; cv=none; b=Io944goiilLOpu+Cy0MhctQJ8x4XaXt/Ykh7NWHqJwk5fs7qRkUyyHvekxyEb4FCI84qVbiXahA4ul7V1cRhpW7rTfhH4jMADT8l1I/Zu48NRV30owM5h2APHjPlmh483a/OKHshlxhCc5I/01oYqSNV4R/VPpk6awFnv8o+xkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735900119; c=relaxed/simple;
	bh=B7blojn5rbAezvzsMCvgQ8xG6Mx88XXqhOOEDgfP4Do=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=U3v+560PJ7xzMuIPFqcaJkLQ+IuZTQ/ulkDGZ9b1iDpLIJnmYoaR7Rkn3/X648BUpTH8Y5vpe8f3fExO1xo0ODQ0b0kWZBypLO0VokZRYbsj1deRmgSQrj3YRhfD3YbPO9/LHVegRxWHfUvlF3QcdFp+O+KzY3bVbv5IUHw7S6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=REsXMrLt; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 816EF1C0007;
	Fri,  3 Jan 2025 10:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735900115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f3Wh5ZGxwy9Oxb9gEOEr8Ee42zTZOwgzqqGrJbszgPE=;
	b=REsXMrLtIrbQCeLg7Mh3E2R4rAyD/7a8Q3VvRGnYKJSlpLYaE3FhLjDY38QkbeHh1pNbHk
	+cyEt++wp60Hg2Rk49qukhToqdwz6E8y0xopMo7wUDVbx6h+qrk2xNPEQ4froT1BaxAVtJ
	5INktUk4OFHbyG70i0ITDDzEvLDb+N+JODcz92bNFPEQMgYpudPp7bd0PPvM+EXW3AQSwj
	HG19H/BOmYspBOpROAsc0CNvm8Hef5+utlFBlEuP4pGPdJ3CKsw1/R25pvZkqi9oUOEiD7
	2+QxrVtcLtoeRZ1K+p1hloaEd/xzlUa+cZxOeJCVCgsO+jFbmNojZ8UHru61Dg==
Message-ID: <7e96dd60-8f72-48f9-a393-5a8a7e5c6b18@bootlin.com>
Date: Fri, 3 Jan 2025 11:28:30 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: Re: [PATCH 4/5] pinctrl: Add pin controller driver for AAEON UP
 boards
To: Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
References: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
 <20241211-aaeon-up-board-pinctrl-support-v1-4-24719be27631@bootlin.com>
 <CACRpkdZ_AwiE+HFX6TFBgscaVquKm_tegNSbTT0fhFmpkM7d_Q@mail.gmail.com>
 <9e692951-86a1-4dda-b843-58173453ffe0@bootlin.com>
 <CACRpkdZ6kmPn9TfO40drJ+vwM2GNKfNaP21R_gEvugg+GJiF1w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACRpkdZ6kmPn9TfO40drJ+vwM2GNKfNaP21R_gEvugg+GJiF1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

On 12/22/24 00:43, Linus Walleij wrote:
> Hi Thomas,
> 
> thanks for your detailed reply!
> 
> On Fri, Dec 20, 2024 at 2:50 PM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
> 
>> Yes my cover letter was a bit short, and maybe some context was missing.
> 
> The text and graphics below explain it very well, so please include them
> into the commit message so we have it there!
> 
>> This FPGA acts as a level shifter between the Intel SoC pins and the pin
>> header, and also makes a kind of switch/mux.
> 
> Since it's Intel we need to notify Andy to help out with this so that
> it gets done in a way that works with how he think consumers
> should interact with Intel pin control and GPIO.
> 
>> +---------+         +--------------+             +---+
>>           |         |              |             | H |
>>           |---------|              |-------------| E |
>>           |         |              |             | A |
>> Intel Soc |---------|    FPGA      |-------------| D |
>>           |         |              |             | E |
>>           |---------|              |-------------| R |
>>           |         |              |             |   |
>> ----------+         +--------------+             +---+
>>
>>
>> For most of the pins, the FPGA opens/closes a switch to enable/disable
>> the access to the SoC pin from a pin header.
>> Each "switch", has a direction flag that shall be set in tandem with the
>> status of the SoC pin.
>> For example, if the SoC pin is in PWM mode, the "switch" shall be
>> configured in output direction.
>> If the SoC pin is set in GPIO mode, the direction of the "switch" shall
>> corresponds to the GPIO direction.
>>
>> +---------+              +--------------+             +---+
>>           |              |              |             | H |
>>           |              |      \       |             | E |
>>           |   PWM1       |       \      |             | A |
>> Intel Soc |--------------|-----   \-----|-------------| D |
>>           |              |              |             | E |
>>           |              |              |             | R |
>>           |              |    FPGA      |             |   |
>> ----------+              +--------------+             +---+
>>
>> (PWM1 pin from Intel SoC can be used as PWM, and also in GPIO mode,
>> thanks to the Intel pinctrl driver).
>>
>>
>> Few pins (PINMUX_* pins) work differently. The FPGA acts as a mux and
>> routes for example the I2C0_SDA pin or GPIOX (of the SoC) to the pin header.
>>
>> +---------+           +--------------+             +---+
>>           | I2C0_SDA  |              |             | H |
>>           |-----------|----- \       |             | E |
>>           |           |       \      |             | A |
>> Intel Soc |           |        \-----|-------------| D |
>>           | GPIOX     |              |             | E |
>>           |-----------|-----         |             | R |
>>           |           |    FPGA      |             |   |
>> ----------+           +--------------+             +---+
>>
>> The pin header looks like this:
>> +--------------------+--------------------+
>> |      3.3V          |       5V           |
>> | GPIO2 / I2C1_SDA   |       5V           |
>> | GPIO3 / I2C1_SCL   |       GND          |
>> | GPIO4 / ADC0       | GPIO14 / UART1_TX  |
>> |      GND           | GPIO15 / UART1_RX  |
>> | GPIO17 / UART1_RTS | GPIO18 / I2S_CLK   |
>> |     GPIO27         |       GND          |
>> |     GPIO22         |      GPIO23        |
>> |      3.3V          |      GPIO24        |
>> | GPIO10 / SPI_MOSI  |       GND          |
>> | GPIO9 / SPI_MISO   |      GPIO25        |
>> | GPIO11 / SPI_CLK   | GPIO8 / SPI_CS0    |
>> |      GND           | GPIO7 / SPI_CS1    |
>> | GPIO0 / I2C0_SDA   | GPIO1 / I2C0_SCL   |
>> |     GPIO5          |       GND          |
>> |     GPIO6          | GPIO12 / PWM0      |
>> | GPIO13 / PWM1      |       GND          |
>> | GPIO19 / I2S_FRM   | GPIO16 / UART1_CTS |
>> |     GPIO26         | GPIO20 / I2S_DIN   |
>> |      GND           | GPIO21 / I2S_DOUT  |
>> +--------------------+--------------------+
>>
>> The GPIOs in the pin header corresponds to the gpiochip I declare in
>> this driver.
>> So when I want to use a pin in GPIO mode, the upboard pinctrl driver
>> requests the corresponding SoC GPIO to the Intel pinctrl driver.
>> The SoC pins connected to the FPGA, are identified with "external" id.
>>
>> The hardware and the FPGA were designed in tandem, so you know for
>> example that for the GPIOX you need to request the Nth "external" GPIO.
>>
>> When you drive your GPIO, the upboard gpiochip manages in the same time
>> the direction of the "switch" and the value/direction of the
>> corresponding SoC pin.
>>
>> +------------------+         +--------------+             +---+
>>                    |---------|              |-------------| H |
>>                    |---------|   GPIOCHIP   |-------------| E |
>>    Intel gpiochip  |---------|              |-------------| A |
>>  provided by Intel |---------|    FPGA      |-------------| D |
>>   pinctrl driver   |---------|              |-------------| E |
>>                    |---------|              |-------------| R |
>>                    |---------|              |-------------|   |
>> +------------------+         +--------------+             +---+
>>
>>
>> About gpiochip_add_pinlist_range(), I added it because the FPGA pins
>> used by the gpiochip are not consecutive.
>>
>> Please let me know if it is not clear.
>> And sorry I'm not very good to make ascii art.
> 
> I get it! We have a similar driver in the kernel already, look into:
> drivers/gpio/gpio-aggregator.c
> 
> The aggregator abstraction is however just software. What you
> need here is a gpio-aggregator that adds some hardware
> control on top. But it has a very nice design using a bitmap
> to keep track of the GPIOs etc, and it supports operations
> on multiple GPIOs (many man-hours of hard coding and
> design went into that driver, ask Geert and Andy...)
> 
> So I would proceed like this:
> 
> - The pin control part of the driver looks sound, except
>   for the way you add ranges.
> 
> - The gpiochip part needs to be refactored using the
>   ideas from gpio-aggregator.c.
> 
> - Look closely at aggregator and see what you can do
>   based on that code, if you can mimic how it picks up
>   and forwards all GPIO functions. Maybe part of it
>   needs to be made into a library?
>  <linux/gpio/gpio-aggregator.h>?
>   For example if you start to feel like "I would really like
>   to just call gpio_fwd_get_multiple() then this is what
>   you want to do. The library can probably still be
>   inside gpio-aggregator.c the way we do it in
>   e.g. gpio-mmio.c, just export and keep library functions
>   separately.

Hi Linus,

Ok I think I understand what you expect.
I started to look at the gpio-aggregator code, play a bit with it, and
refactor it to use it from my driver.

My main issue is about the request of the SoC GPIOs done by the aggregator.
If from my driver I call the aggregator library to create a gpiochip,
the SoC pins will be requested. So the SoC pins will be set in GPIO
mode, and the pins will never be in function mode.
There is no way to set the pins back to function mode (even if the GPIO
is free).

I tried to add a feature in the aggregator to defer the request of the gpio.
So at the beginning of each ops the gpio_desc is checked. If it is
valid, the gpio can be used. Otherwise, the gpio is requested.
For example:

gpio_fwd_get() {
	if (!gpio_desc_is_valid(desc))
		desc = request_gpio()

	return gpiod_get_value(desc)
}

But when a gpiochip is registered, the core calls get_direction() or
direction_input(), so all GPIOs are requested and it does not solve my
problem.

I expect to register a gpiochip without setting all pins in GPIO mode at
probe time (like all pinctrl driver do).
But I did not find a solution.

Best Regards,

Thomas

