Return-Path: <linux-gpio+bounces-15386-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E60B9A28908
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 12:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADDBB188564F
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 11:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BD421505A;
	Wed,  5 Feb 2025 11:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LVrFooQF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFF315199B;
	Wed,  5 Feb 2025 11:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738754259; cv=none; b=E6fuFDUqlsn251O8BmVLxhMrcGpIfhmbTfEiE+hOSHdkpFHwWkDGrJHdk5HZFjCQkwHJYfcNekSo0QPOcxL0Dan2CFzCaG2GEi1Pqq89sQrxH/nAyHPLxRTbuCx1c6vjrAcJPJ0aDCgHKQIWu3gIfQQ0ueQDvWWfMbP5E/UbgCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738754259; c=relaxed/simple;
	bh=Fstel8MewRboMuOBRJPiAyiBN7GmsnoZEkbOqwwmQKA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=P0GrVfkJHQVmkKjfUoTzO1chaC4OPsjFgkfHmA+NK3/WB239AKWpoTFZ1ptlK03Mf94IodTlLPfppwPXWrOIugFMuH+ktf5GwKg0sk5K+J3CnMnfKCNVLt5flaELPwotHq0mlYshAr96Q/ijkThpIYoohuZNVxAX1QQqRdTh/8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LVrFooQF; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5CB043152;
	Wed,  5 Feb 2025 11:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738754254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L/z7rNkSBlFN0Ix65GAREkVxA/L30C8elgllk90K5gs=;
	b=LVrFooQFfX9fC43/mOS3cB8iutYtBceApkRYoWSg+wvaynAshro8XsBRC63c1xaGAI+O0b
	uSqA6RVNet7v+5LGJGB/IMm6rpU13p27Vv2DckrD9d0GhYaO2W5Q4/Br6BG7MbIYTzO/s1
	NlKK98SoOYVa0X9kzseVwB6iuWpLwjA5pB81H/VgLN3UszN4Z1Xokm9hcWrqTp8JQIpGAx
	n5iaYQzgIQ92Ef2YpDhRd2g24bLN4i2oOKRolciou+IuQW54J/IDcKcyIBlZKTAQ3DQTd0
	huUfYe86nbOXxzItCuQBN/OgmPRQzdaieDMxTYpvPcWV4Jm5mSlAY/nSwSNjeg==
Message-ID: <5e5f7635-86ed-4814-b26f-b1c45fa4f29a@bootlin.com>
Date: Wed, 5 Feb 2025 12:17:29 +0100
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
References: <CACRpkdZ_AwiE+HFX6TFBgscaVquKm_tegNSbTT0fhFmpkM7d_Q@mail.gmail.com>
 <9e692951-86a1-4dda-b843-58173453ffe0@bootlin.com>
 <CACRpkdZ6kmPn9TfO40drJ+vwM2GNKfNaP21R_gEvugg+GJiF1w@mail.gmail.com>
 <7e96dd60-8f72-48f9-a393-5a8a7e5c6b18@bootlin.com>
 <Z4Tg-uTVcOiYK2Dr@smile.fi.intel.com>
 <b50444f7-4dd1-4440-af36-783b1b4f8625@bootlin.com>
 <Z4jNZPcDd89-HfAd@smile.fi.intel.com>
 <e273428e-3ebd-4116-b317-9aae0c8c603b@bootlin.com>
 <Z4j8NmKMEL7PALmw@smile.fi.intel.com>
 <8b9dd766-ae7e-4817-a093-536ae9646cd3@bootlin.com>
 <Z4kUWxR9VWkzQ9aW@smile.fi.intel.com>
Content-Language: en-US
In-Reply-To: <Z4kUWxR9VWkzQ9aW@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfhffuvfevfhgjtgfgsehtkeertddtvdejnecuhfhrohhmpefvhhhomhgrshcutfhitghhrghrugcuoehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeviedufeeuhffftefhiedvveeiledvvedtieduffffleffkeehtdduudettedtnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgdphhgvlhhopeglkffrggeimedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurggnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghij
 heslhhinhgrrhhordhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrvhgvlhesuhgtfidrtgiipdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: thomas.richard@bootlin.com

On 1/16/25 15:14, Andy Shevchenko wrote:
> On Thu, Jan 16, 2025 at 02:23:57PM +0100, Thomas Richard wrote:
>> On 1/16/25 13:31, Andy Shevchenko wrote:
>>> On Thu, Jan 16, 2025 at 01:21:16PM +0100, Thomas Richard wrote:
>>>> On 1/16/25 10:12, Andy Shevchenko wrote:
>>>>> On Tue, Jan 14, 2025 at 11:28:26AM +0100, Thomas Richard wrote:
>>>>>> On 1/13/25 10:46, Andy Shevchenko wrote:
>>>>>>> On Fri, Jan 03, 2025 at 11:28:30AM +0100, Thomas Richard wrote:
>>>>>>>> On 12/22/24 00:43, Linus Walleij wrote:
>>>>>>>>> On Fri, Dec 20, 2024 at 2:50 PM Thomas Richard
>>>>>>>>> <thomas.richard@bootlin.com> wrote:
> 
> ...
> 
>>>>>>>>>> Yes my cover letter was a bit short, and maybe some context was missing.
>>>>>>>>>
>>>>>>>>> The text and graphics below explain it very well, so please include them
>>>>>>>>> into the commit message so we have it there!
>>>>>>>>>
>>>>>>>>>> This FPGA acts as a level shifter between the Intel SoC pins and the pin
>>>>>>>>>> header, and also makes a kind of switch/mux.
>>>>>>>>>
>>>>>>>>> Since it's Intel we need to notify Andy to help out with this so that
>>>>>>>>> it gets done in a way that works with how he think consumers
>>>>>>>>> should interact with Intel pin control and GPIO.
>>>>>>>>>
>>>>>>>>>> +---------+         +--------------+             +---+
>>>>>>>>>>           |         |              |             | H |
>>>>>>>>>>           |---------|              |-------------| E |
>>>>>>>>>>           |         |              |             | A |
>>>>>>>>>> Intel Soc |---------|    FPGA      |-------------| D |
>>>>>>>>>>           |         |              |             | E |
>>>>>>>>>>           |---------|              |-------------| R |
>>>>>>>>>>           |         |              |             |   |
>>>>>>>>>> ----------+         +--------------+             +---+
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> For most of the pins, the FPGA opens/closes a switch to enable/disable
>>>>>>>>>> the access to the SoC pin from a pin header.
>>>>>>>>>> Each "switch", has a direction flag that shall be set in tandem with the
>>>>>>>>>> status of the SoC pin.
>>>>>>>>>> For example, if the SoC pin is in PWM mode, the "switch" shall be
>>>>>>>>>> configured in output direction.
>>>>>>>>>> If the SoC pin is set in GPIO mode, the direction of the "switch" shall
>>>>>>>>>> corresponds to the GPIO direction.
>>>>>>>>>>
>>>>>>>>>> +---------+              +--------------+             +---+
>>>>>>>>>>           |              |              |             | H |
>>>>>>>>>>           |              |      \       |             | E |
>>>>>>>>>>           |   PWM1       |       \      |             | A |
>>>>>>>>>> Intel Soc |--------------|-----   \-----|-------------| D |
>>>>>>>>>>           |              |              |             | E |
>>>>>>>>>>           |              |              |             | R |
>>>>>>>>>>           |              |    FPGA      |             |   |
>>>>>>>>>> ----------+              +--------------+             +---+
>>>>>>>>>>
>>>>>>>>>> (PWM1 pin from Intel SoC can be used as PWM, and also in GPIO mode,
>>>>>>>>>> thanks to the Intel pinctrl driver).
>>>>>>>>>>
>>>>>>>>>> Few pins (PINMUX_* pins) work differently. The FPGA acts as a mux and
>>>>>>>>>> routes for example the I2C0_SDA pin or GPIOX (of the SoC) to the pin header.
>>>>>
>>>>> Yep, that's clear.
>>>>>
>>>>>>>>>> +---------+           +--------------+             +---+
>>>>>>>>>>           | I2C0_SDA  |              |             | H |
>>>>>>>>>>           |-----------|----- \       |             | E |
>>>>>>>>>>           |           |       \      |             | A |
>>>>>>>>>> Intel Soc |           |        \-----|-------------| D |
>>>>>>>>>>           | GPIOX     |              |             | E |
>>>>>>>>>>           |-----------|-----         |             | R |
>>>>>>>>>>           |           |    FPGA      |             |   |
>>>>>>>>>> ----------+           +--------------+             +---+
>>>>>>>>>>
>>>>>>>>>> The pin header looks like this:
>>>>>>>>>> +--------------------+--------------------+
>>>>>>>>>> |      3.3V          |       5V           |
>>>>>>>>>> | GPIO2 / I2C1_SDA   |       5V           |
>>>>>>>>>> | GPIO3 / I2C1_SCL   |       GND          |
>>>>>>>>>> | GPIO4 / ADC0       | GPIO14 / UART1_TX  |
>>>>>>>>>> |      GND           | GPIO15 / UART1_RX  |
>>>>>>>>>> | GPIO17 / UART1_RTS | GPIO18 / I2S_CLK   |
>>>>>>>>>> |     GPIO27         |       GND          |
>>>>>>>>>> |     GPIO22         |      GPIO23        |
>>>>>>>>>> |      3.3V          |      GPIO24        |
>>>>>>>>>> | GPIO10 / SPI_MOSI  |       GND          |
>>>>>>>>>> | GPIO9 / SPI_MISO   |      GPIO25        |
>>>>>>>>>> | GPIO11 / SPI_CLK   | GPIO8 / SPI_CS0    |
>>>>>>>>>> |      GND           | GPIO7 / SPI_CS1    |
>>>>>>>>>> | GPIO0 / I2C0_SDA   | GPIO1 / I2C0_SCL   |
>>>>>>>>>> |     GPIO5          |       GND          |
>>>>>>>>>> |     GPIO6          | GPIO12 / PWM0      |
>>>>>>>>>> | GPIO13 / PWM1      |       GND          |
>>>>>>>>>> | GPIO19 / I2S_FRM   | GPIO16 / UART1_CTS |
>>>>>>>>>> |     GPIO26         | GPIO20 / I2S_DIN   |
>>>>>>>>>> |      GND           | GPIO21 / I2S_DOUT  |
>>>>>>>>>> +--------------------+--------------------+
>>>>>>>>>>
>>>>>>>>>> The GPIOs in the pin header corresponds to the gpiochip I declare in
>>>>>>>>>> this driver.
>>>>>>>>>> So when I want to use a pin in GPIO mode, the upboard pinctrl driver
>>>>>>>>>> requests the corresponding SoC GPIO to the Intel pinctrl driver.
>>>>>>>>>> The SoC pins connected to the FPGA, are identified with "external" id.
>>>>>>>>>>
>>>>>>>>>> The hardware and the FPGA were designed in tandem, so you know for
>>>>>>>>>> example that for the GPIOX you need to request the Nth "external" GPIO.
>>>>>>>>>>
>>>>>>>>>> When you drive your GPIO, the upboard gpiochip manages in the same time
>>>>>>>>>> the direction of the "switch" and the value/direction of the
>>>>>>>>>> corresponding SoC pin.
>>>>>>>>>>
>>>>>>>>>> +------------------+         +--------------+             +---+
>>>>>>>>>>                    |---------|              |-------------| H |
>>>>>>>>>>                    |---------|   GPIOCHIP   |-------------| E |
>>>>>>>>>>    Intel gpiochip  |---------|              |-------------| A |
>>>>>>>>>>  provided by Intel |---------|    FPGA      |-------------| D |
>>>>>>>>>>   pinctrl driver   |---------|              |-------------| E |
>>>>>>>>>>                    |---------|              |-------------| R |
>>>>>>>>>>                    |---------|              |-------------|   |
>>>>>>>>>> +------------------+         +--------------+             +---+
>>>>>>>>>>
>>>>>>>>>> About gpiochip_add_pinlist_range(), I added it because the FPGA pins
>>>>>>>>>> used by the gpiochip are not consecutive.
>>>>>>>>>>
>>>>>>>>>> Please let me know if it is not clear.
>>>>>>>>>> And sorry I'm not very good to make ascii art.
>>>>>>>>>
>>>>>>>>> I get it! We have a similar driver in the kernel already, look into:
>>>>>>>>> drivers/gpio/gpio-aggregator.c
>>>>>>>>>
>>>>>>>>> The aggregator abstraction is however just software. What you
>>>>>>>>> need here is a gpio-aggregator that adds some hardware
>>>>>>>>> control on top. But it has a very nice design using a bitmap
>>>>>>>>> to keep track of the GPIOs etc, and it supports operations
>>>>>>>>> on multiple GPIOs (many man-hours of hard coding and
>>>>>>>>> design went into that driver, ask Geert and Andy...)
>>>>>>>>>
>>>>>>>>> So I would proceed like this:
>>>>>>>>>
>>>>>>>>> - The pin control part of the driver looks sound, except
>>>>>>>>>   for the way you add ranges.
>>>>>>>>>
>>>>>>>>> - The gpiochip part needs to be refactored using the
>>>>>>>>>   ideas from gpio-aggregator.c.
>>>>>>>>>
>>>>>>>>> - Look closely at aggregator and see what you can do
>>>>>>>>>   based on that code, if you can mimic how it picks up
>>>>>>>>>   and forwards all GPIO functions. Maybe part of it
>>>>>>>>>   needs to be made into a library?
>>>>>>>>>  <linux/gpio/gpio-aggregator.h>?
>>>>>>>>>   For example if you start to feel like "I would really like
>>>>>>>>>   to just call gpio_fwd_get_multiple() then this is what
>>>>>>>>>   you want to do. The library can probably still be
>>>>>>>>>   inside gpio-aggregator.c the way we do it in
>>>>>>>>>   e.g. gpio-mmio.c, just export and keep library functions
>>>>>>>>>   separately.
>>>>>>>>
>>>>>>>> Ok I think I understand what you expect.
>>>>>>>> I started to look at the gpio-aggregator code, play a bit with it, and
>>>>>>>> refactor it to use it from my driver.
>>>>>>>>
>>>>>>>> My main issue is about the request of the SoC GPIOs done by the aggregator.
>>>>>>>> If from my driver I call the aggregator library to create a gpiochip,
>>>>>>>> the SoC pins will be requested. So the SoC pins will be set in GPIO
>>>>>>>> mode, and the pins will never be in function mode.
>>>>>>>> There is no way to set the pins back to function mode (even if the GPIO
>>>>>>>> is free).
>>>>>>>>
>>>>>>>> I tried to add a feature in the aggregator to defer the request of the gpio.
>>>>>>>> So at the beginning of each ops the gpio_desc is checked. If it is
>>>>>>>> valid, the gpio can be used. Otherwise, the gpio is requested.
>>>>>>>> For example:
>>>>>>>>
>>>>>>>> gpio_fwd_get() {
>>>>>>>> 	if (!gpio_desc_is_valid(desc))
>>>>>>>> 		desc = request_gpio()
>>>>>>>>
>>>>>>>> 	return gpiod_get_value(desc)
>>>>>>>> }
>>>>>>>>
>>>>>>>> But when a gpiochip is registered, the core calls get_direction() or
>>>>>>>> direction_input(), so all GPIOs are requested and it does not solve my
>>>>>>>> problem.
>>>>>>>>
>>>>>>>> I expect to register a gpiochip without setting all pins in GPIO mode at
>>>>>>>> probe time (like all pinctrl driver do).
>>>>>>>> But I did not find a solution.
>>>>>>>
>>>>>>> Basically what you need is a pinctrl-aggregattor (an analogue for the pin
>>>>>>> muxing and configuration).
>>>>>>
>>>>>> I found a trick to workaround the get_direction() issue in the
>>>>>> gpio-aggregator.
>>>>>>
>>>>>> I added a "request on first use" feature on the aggregator.
>>>>>> The GPIO is requested during the request() operation of the fowarder.
>>>>>>
>>>>>> static int gpio_fwd_request(struct gpio_chip *chip, unsigned int offset)
>>>>>> {
>>>>>> 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
>>>>>>
>>>>>> 	if (!IS_ERR_OR_NULL(fwd->descs[offset]))
>>>>>> 		return 0;
>>>>>>
>>>>>> 	fwd->descs[offset] = devm_gpiod_get_index(fwd->dev, NULL,
>>>>>> 						offset, GPIOD_ASIS);
>>>>>>
>>>>>> 	return PTR_ERR_OR_ZERO(fwd->descs[offset]);
>>>>>> }
>>>>>>
>>>>>> The remaining problem is that the get_direction() callback is called
>>>>>> during gpiochip registration. For now if the gpio_desc is not valid (so
>>>>>> the GPIO was not yet requested) I return GPIO_LINE_DIRECTION_OUT by
>>>>>> default. But I'm not very convinced by this hack.
>>>>>> Maybe I could retrieve the gpio_chip and call its get_direction()
>>>>>> callback, but it seems not to be a better idea.
>>>>>>
>>>>>> For the pinctrl-aggregator you mentioned, if I understand correctly the
>>>>>> idea to aggregate the SoC pins in a pinctrl aggregator (with a
>>>>>> gpio_chip) which just forwards gpio_request_enable(),
>>>>>> gpio_disable_free(), gpio_set_direction() and also all gpio_chip operations.
>>>>>
>>>>> No only these, all of the pin mux, pin configuration, and GPIO operations
>>>>> should be proxied.
>>>>
>>>> Why should I proxy operations that will never be used (pin mux, pin
>>>> conf) ? I mean there will never be a driver that will configure FPGA pins.
>>>
>>> According to your picture above the FPGA works as a pin function selector,
>>> which also implies different pin configuration (e.g., slew rate for I²C pins).
>>> Did I get it wrong?
>>
>> Yes you are right. In function mode the FPGA selects the I2C pin. When
>> the FPGA GPIO is requested, the FPGA changes the mux to select a SoC
>> GPIO pin (a pure GPIO pin).
>>
>>>>>> But how to deal with the pinctrl of my FPGA ? For one of its fake pin
>>>>>> the dummy pinctrl drives the corresponding SoC pin and FPGA pin ?
>>>>>
>>>>> What's the "fake pin"? I can't find the one up in your schemas.
>>>>
>>>> I thought that the idea was a virtual pinctrl which drive the SoC
>>>> pinctrl and the FPGA pinctrl. But what you mean is the FPGA pinctrl acts
>>>> as a proxy.
>>>
>>> When one wants to configure the pin parameters (let's say pin bias) the driver
>>> delegates that to the SoC, in case the FPGA doesn't repeat this itself. Or both,
>>> but this makes things too complicated already.
>>
>> The FPGA cannot configure pin parameter. It can only configures the
>> forward direction.
>> For example, for UART_TX pin the FPGA will set direction as "output" and
>> for UART_RX pin the FPGA will set direction as "input".
>> It can also enable/disable the forward of the SoC pin. If the forward of
>> a pin is disabled, the FPGA pin is in HIGH-Z.
> 
> So, which is exactly why proxying is needed:
> 1) it delegates pin configuration when user asks for a change;
> 2) it properly configures SoC pin directions, etc in accordance to the signal
> on the header and the user ask.

Hi Andy, Linus,

I did some tests/experiments to implement a proxy pinctrl as requested
by Andy.
I have made progress, but now I have questions and blocking points.

First thing, to identify the SoC pins used by the FPGA, I have to
request the corresponding GPIOs (defined in the ACPI tables). Using the
GPIO descriptor I'm able to find the corresponding pinctrl device and
the pin number (thanks to pinctrl_get_device_gpio_range()).

I store all the pinctrl device an pin number couples in a radix tree.

struct pin_fwd {
	struct pinctrl_dev *pctldev;
	int pin;
};

struct pinctrl_fwd {
	struct device *dev;
	struct radix_tree_root pin_fwd_tree;
	unsigned int num_pins;
};

So for a FPGA pin, I can easily get find the corresponding SoC pin.
I request the SoC pins (thanks to pin_request()) during the probe to
lock access.
I'm able to forward some pinctrl or pinconf ops like dbg_show(),
config_get() ...

But I don't really know how to deal with pinmux ops, groups and functions.
I cannot just forward a set_mux() call.
Should I have a mapping between SoC pinctrl and FPGA pinctrl for all
groups and functions ?
Other issue with GPIO mode, in gpio_request_enable() I'm able to request
the SoC pin using pin_request() and a gpio_range. But in this case
gpiolib does not know the GPIO is requested.
And how to deal with set() and get() ?

Other problem I noticed, but maybe only due to the fact I implemented
everything in my driver, I had to export symbols of many static
functions like pin_request(), pinctrl_get_device_gpio_range(),
pinconf_dump_pin() ...

An other problem is that as I requested GPIO to identify all SoC pins
connected to the FPGA, I have to set it back to function mode, and I'm
not sure it is possible to do it for all pins (some pins are not
registered in a group, maybe they are not writable ?).

So I'm not really convinced by all this complexity for only one driver.

In the same time I had an other idea and I would like your advises.

The FPGA pinctrl is a consumer of SoC pins, so I can add some
pinctrl_map to request the SoC pins and mark them as used by the FPGA:

PIN_MAP_MUX_GROUP("upboard-pinctrl", "soc_pins", "INT3452:00",
		"pwm0_grp", "pwm0"),
PIN_MAP_MUX_GROUP("upboard-pinctrl", "soc_pins", "INT3452:00",
		"uart1_grp", "uart1"),

And in the probe() I call devm_pinctrl_get_select() to request and
configure SoC pins.

Pros:
- the SoC pins are marked as used by the FPGA.
- less complex solution, no change in the core.

Cons:
- probably one mapping for each board as Intel pinctrl device, groups
and functions may change depending the board. So the right mapping
should be selected based on DMI table.

This solution also implies to make some changes in Intel pinctrl driver
to create missing groups. Or maybe the pins which are not in a group are
not writeable (so no need to request them) ?

For the GPIO part, no changes, the SoC GPIO are requested at runtime
using gpiod (Linus I did not forget you mentioned to use/rework
gpio-aggregator).

Best Regards,

Thomas


