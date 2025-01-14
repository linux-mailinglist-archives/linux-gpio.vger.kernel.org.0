Return-Path: <linux-gpio+bounces-14765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0010A10412
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 11:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E74B3A5309
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 10:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBFC22960A;
	Tue, 14 Jan 2025 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OpuoYHKX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C82229608;
	Tue, 14 Jan 2025 10:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736850525; cv=none; b=RgutzCp+QeB0dntPmLXgCsZkGad6ZNBlYEU1yG8WbP1PYTHRe2bgg4mOvf1wQ/5im7i5r1U9YgciMMLCujpWgPeYzpTYA8WZptXUonQrILJhAT3lY+GmdWiE63bkmtmYq99pI4ActMMsTA3wnjIqk4tCQfBl0bK3XIo3JkqJ0zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736850525; c=relaxed/simple;
	bh=YrC9F54rYJPGqdhhriWEqyHRrzl7y2as8A0EwZG/Dfk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=s1SNLUuJr/6yAIGfX4PPfQTYMqALFkhucutO2j1631DJgT7rP1yPjP9h8HGnWc3eX0rp7NUAhrHq/w7vFWcojlcWfwZx9I7UeZDGiTNJZSj0kbxpS9sm6bNRq8eMz9Q209Qn7UWXm8HwM03owPkr9YikGzOvmbpF6m33bBRzo6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OpuoYHKX; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62C1520003;
	Tue, 14 Jan 2025 10:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736850514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6MS6UHmMa5P5N2KVvksYI9omjTAMVkTYSqs5u1a0TwM=;
	b=OpuoYHKX19YjDc5N6JuvtRh2fVK+q4ZQiU3CNOwmNys7zuUQM7uqqzwXfiBXwgJyvPAUQC
	gzviJwxE539VA8BXnpUPtlO1F/ItzeY747MpUQB6yKbsHTgwqoUz+653jLt92ufiBIt/qE
	dVVStp9Rtc1WFEvd78bcT7Gzozb3NitrpYaUs517Wh0Gcp1r0Q0/Rl/V7Ju+uuQpXqBKyU
	V+j3eFydrw151Jt/bTsLmwzVNxM+dWZ3xru5Y1Q9Ji5NegMST5RAl3HD5Ef7OP80VvaY66
	54IsvanfZwOM2EI67n3z6bf9rhDfFWmiF3INv/g8cWAdX7UfZf3tQ1JW23xH8w==
Message-ID: <b50444f7-4dd1-4440-af36-783b1b4f8625@bootlin.com>
Date: Tue, 14 Jan 2025 11:28:26 +0100
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
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
References: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
 <20241211-aaeon-up-board-pinctrl-support-v1-4-24719be27631@bootlin.com>
 <CACRpkdZ_AwiE+HFX6TFBgscaVquKm_tegNSbTT0fhFmpkM7d_Q@mail.gmail.com>
 <9e692951-86a1-4dda-b843-58173453ffe0@bootlin.com>
 <CACRpkdZ6kmPn9TfO40drJ+vwM2GNKfNaP21R_gEvugg+GJiF1w@mail.gmail.com>
 <7e96dd60-8f72-48f9-a393-5a8a7e5c6b18@bootlin.com>
 <Z4Tg-uTVcOiYK2Dr@smile.fi.intel.com>
Content-Language: en-US
In-Reply-To: <Z4Tg-uTVcOiYK2Dr@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

On 1/13/25 10:46, Andy Shevchenko wrote:
> On Fri, Jan 03, 2025 at 11:28:30AM +0100, Thomas Richard wrote:
>> On 12/22/24 00:43, Linus Walleij wrote:
>>> Hi Thomas,
>>>
>>> thanks for your detailed reply!
>>>
>>> On Fri, Dec 20, 2024 at 2:50 PM Thomas Richard
>>> <thomas.richard@bootlin.com> wrote:
>>>
>>>> Yes my cover letter was a bit short, and maybe some context was missing.
>>>
>>> The text and graphics below explain it very well, so please include them
>>> into the commit message so we have it there!
>>>
>>>> This FPGA acts as a level shifter between the Intel SoC pins and the pin
>>>> header, and also makes a kind of switch/mux.
>>>
>>> Since it's Intel we need to notify Andy to help out with this so that
>>> it gets done in a way that works with how he think consumers
>>> should interact with Intel pin control and GPIO.
>>>
>>>> +---------+         +--------------+             +---+
>>>>           |         |              |             | H |
>>>>           |---------|              |-------------| E |
>>>>           |         |              |             | A |
>>>> Intel Soc |---------|    FPGA      |-------------| D |
>>>>           |         |              |             | E |
>>>>           |---------|              |-------------| R |
>>>>           |         |              |             |   |
>>>> ----------+         +--------------+             +---+
>>>>
>>>>
>>>> For most of the pins, the FPGA opens/closes a switch to enable/disable
>>>> the access to the SoC pin from a pin header.
>>>> Each "switch", has a direction flag that shall be set in tandem with the
>>>> status of the SoC pin.
>>>> For example, if the SoC pin is in PWM mode, the "switch" shall be
>>>> configured in output direction.
>>>> If the SoC pin is set in GPIO mode, the direction of the "switch" shall
>>>> corresponds to the GPIO direction.
>>>>
>>>> +---------+              +--------------+             +---+
>>>>           |              |              |             | H |
>>>>           |              |      \       |             | E |
>>>>           |   PWM1       |       \      |             | A |
>>>> Intel Soc |--------------|-----   \-----|-------------| D |
>>>>           |              |              |             | E |
>>>>           |              |              |             | R |
>>>>           |              |    FPGA      |             |   |
>>>> ----------+              +--------------+             +---+
>>>>
>>>> (PWM1 pin from Intel SoC can be used as PWM, and also in GPIO mode,
>>>> thanks to the Intel pinctrl driver).
>>>>
>>>>
>>>> Few pins (PINMUX_* pins) work differently. The FPGA acts as a mux and
>>>> routes for example the I2C0_SDA pin or GPIOX (of the SoC) to the pin header.
>>>>
>>>> +---------+           +--------------+             +---+
>>>>           | I2C0_SDA  |              |             | H |
>>>>           |-----------|----- \       |             | E |
>>>>           |           |       \      |             | A |
>>>> Intel Soc |           |        \-----|-------------| D |
>>>>           | GPIOX     |              |             | E |
>>>>           |-----------|-----         |             | R |
>>>>           |           |    FPGA      |             |   |
>>>> ----------+           +--------------+             +---+
>>>>
>>>> The pin header looks like this:
>>>> +--------------------+--------------------+
>>>> |      3.3V          |       5V           |
>>>> | GPIO2 / I2C1_SDA   |       5V           |
>>>> | GPIO3 / I2C1_SCL   |       GND          |
>>>> | GPIO4 / ADC0       | GPIO14 / UART1_TX  |
>>>> |      GND           | GPIO15 / UART1_RX  |
>>>> | GPIO17 / UART1_RTS | GPIO18 / I2S_CLK   |
>>>> |     GPIO27         |       GND          |
>>>> |     GPIO22         |      GPIO23        |
>>>> |      3.3V          |      GPIO24        |
>>>> | GPIO10 / SPI_MOSI  |       GND          |
>>>> | GPIO9 / SPI_MISO   |      GPIO25        |
>>>> | GPIO11 / SPI_CLK   | GPIO8 / SPI_CS0    |
>>>> |      GND           | GPIO7 / SPI_CS1    |
>>>> | GPIO0 / I2C0_SDA   | GPIO1 / I2C0_SCL   |
>>>> |     GPIO5          |       GND          |
>>>> |     GPIO6          | GPIO12 / PWM0      |
>>>> | GPIO13 / PWM1      |       GND          |
>>>> | GPIO19 / I2S_FRM   | GPIO16 / UART1_CTS |
>>>> |     GPIO26         | GPIO20 / I2S_DIN   |
>>>> |      GND           | GPIO21 / I2S_DOUT  |
>>>> +--------------------+--------------------+
>>>>
>>>> The GPIOs in the pin header corresponds to the gpiochip I declare in
>>>> this driver.
>>>> So when I want to use a pin in GPIO mode, the upboard pinctrl driver
>>>> requests the corresponding SoC GPIO to the Intel pinctrl driver.
>>>> The SoC pins connected to the FPGA, are identified with "external" id.
>>>>
>>>> The hardware and the FPGA were designed in tandem, so you know for
>>>> example that for the GPIOX you need to request the Nth "external" GPIO.
>>>>
>>>> When you drive your GPIO, the upboard gpiochip manages in the same time
>>>> the direction of the "switch" and the value/direction of the
>>>> corresponding SoC pin.
>>>>
>>>> +------------------+         +--------------+             +---+
>>>>                    |---------|              |-------------| H |
>>>>                    |---------|   GPIOCHIP   |-------------| E |
>>>>    Intel gpiochip  |---------|              |-------------| A |
>>>>  provided by Intel |---------|    FPGA      |-------------| D |
>>>>   pinctrl driver   |---------|              |-------------| E |
>>>>                    |---------|              |-------------| R |
>>>>                    |---------|              |-------------|   |
>>>> +------------------+         +--------------+             +---+
>>>>
>>>>
>>>> About gpiochip_add_pinlist_range(), I added it because the FPGA pins
>>>> used by the gpiochip are not consecutive.
>>>>
>>>> Please let me know if it is not clear.
>>>> And sorry I'm not very good to make ascii art.
>>>
>>> I get it! We have a similar driver in the kernel already, look into:
>>> drivers/gpio/gpio-aggregator.c
>>>
>>> The aggregator abstraction is however just software. What you
>>> need here is a gpio-aggregator that adds some hardware
>>> control on top. But it has a very nice design using a bitmap
>>> to keep track of the GPIOs etc, and it supports operations
>>> on multiple GPIOs (many man-hours of hard coding and
>>> design went into that driver, ask Geert and Andy...)
>>>
>>> So I would proceed like this:
>>>
>>> - The pin control part of the driver looks sound, except
>>>   for the way you add ranges.
>>>
>>> - The gpiochip part needs to be refactored using the
>>>   ideas from gpio-aggregator.c.
>>>
>>> - Look closely at aggregator and see what you can do
>>>   based on that code, if you can mimic how it picks up
>>>   and forwards all GPIO functions. Maybe part of it
>>>   needs to be made into a library?
>>>  <linux/gpio/gpio-aggregator.h>?
>>>   For example if you start to feel like "I would really like
>>>   to just call gpio_fwd_get_multiple() then this is what
>>>   you want to do. The library can probably still be
>>>   inside gpio-aggregator.c the way we do it in
>>>   e.g. gpio-mmio.c, just export and keep library functions
>>>   separately.
>>
>> Hi Linus,
>>
>> Ok I think I understand what you expect.
>> I started to look at the gpio-aggregator code, play a bit with it, and
>> refactor it to use it from my driver.
>>
>> My main issue is about the request of the SoC GPIOs done by the aggregator.
>> If from my driver I call the aggregator library to create a gpiochip,
>> the SoC pins will be requested. So the SoC pins will be set in GPIO
>> mode, and the pins will never be in function mode.
>> There is no way to set the pins back to function mode (even if the GPIO
>> is free).
>>
>> I tried to add a feature in the aggregator to defer the request of the gpio.
>> So at the beginning of each ops the gpio_desc is checked. If it is
>> valid, the gpio can be used. Otherwise, the gpio is requested.
>> For example:
>>
>> gpio_fwd_get() {
>> 	if (!gpio_desc_is_valid(desc))
>> 		desc = request_gpio()
>>
>> 	return gpiod_get_value(desc)
>> }
>>
>> But when a gpiochip is registered, the core calls get_direction() or
>> direction_input(), so all GPIOs are requested and it does not solve my
>> problem.
>>
>> I expect to register a gpiochip without setting all pins in GPIO mode at
>> probe time (like all pinctrl driver do).
>> But I did not find a solution.
> 
> Basically what you need is a pinctrl-aggregattor (an analogue for the pin
> muxing and configuration).
> 

Hi Andy,

I found a trick to workaround the get_direction() issue in the
gpio-aggregator.

I added a "request on first use" feature on the aggregator.
The GPIO is requested during the request() operation of the fowarder.

static int gpio_fwd_request(struct gpio_chip *chip, unsigned int offset)
{
	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);

	if (!IS_ERR_OR_NULL(fwd->descs[offset]))
		return 0;

	fwd->descs[offset] = devm_gpiod_get_index(fwd->dev, NULL,
						offset, GPIOD_ASIS);

	return PTR_ERR_OR_ZERO(fwd->descs[offset]);
}

The remaining problem is that the get_direction() callback is called
during gpiochip registration. For now if the gpio_desc is not valid (so
the GPIO was not yet requested) I return GPIO_LINE_DIRECTION_OUT by
default. But I'm not very convinced by this hack.
Maybe I could retrieve the gpio_chip and call its get_direction()
callback, but it seems not to be a better idea.

For the pinctrl-aggregator you mentioned, if I understand correctly the
idea to aggregate the SoC pins in a pinctrl aggregator (with a
gpio_chip) which just forwards gpio_request_enable(),
gpio_disable_free(), gpio_set_direction() and also all gpio_chip operations.

But how to deal with the pinctrl of my FPGA ? For one of its fake pin
the dummy pinctrl drives the corresponding SoC pin and FPGA pin ? So for
each pin, the aggregator may have multiple pins to drive ?

Was it your idea Andy ?

Other challenge is to retrieve all the pins to add in the
pinctrl-aggregator. As input I have only GPIO descriptors, but I guess
it should be feasible.

Best Regards,

Thomas


