Return-Path: <linux-gpio+bounces-14081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2982E9F93DA
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 15:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8F25189623E
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 13:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2962421770C;
	Fri, 20 Dec 2024 13:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VJTBDAbx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75D02163B3;
	Fri, 20 Dec 2024 13:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734702648; cv=none; b=lwaNO0CEOG67JgYLAumDLv/MjLg9uJQuEaQ4ajTt1wMxqOD/CuPhETbsILcYsM7kffPQEfSdqNF1uw6nEwpCsRmYhkt5TzBl1CN1VtQm8+k0dgQufXh6T1GFnz2E90NFSOzGvFzrLjggNQ3usEviybRBdktqdmATpaujo6RTGFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734702648; c=relaxed/simple;
	bh=B2gPlWxRg8uKKnBEPxdaaXKEvBG2lZUDJUOTU64pjtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=urdHvlp6MRt4HJV05QH7MU2HC62dydKkne/yDdEbKK/yKVTIpTpRWPdHsiXgYUrUpIosksPFBrICNQ9WiwBkaA2EZOpplPYtRPsaZj1QRe9XBH2gUN80nOTIWegRsdn/HSUnG1OFMuu/tu7z1A/RhhY4VuVX+CryoPKt2p+R3ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VJTBDAbx; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0320A240002;
	Fri, 20 Dec 2024 13:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734702638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Ah9W7v5bDjx9uNFsI+U+Xhjs4ztYp9P2xXsjn3iiZ4=;
	b=VJTBDAbx9ogL1ACAc5jt6RFdy9vn+otK5zmlY8DhkXpomPjeup7sPsTND2CXKUFR6kbLPF
	NFSsGknaE3t/SlNkth+8jUR37ZR6uYE10ZSpiZI9M4JUo054jJtads4ULviuqXgmcT6Vf1
	cs7E7SvjzmHzm2XjAvIC4haSswuYRmMFcnJg8bUjK8VPjP/nifSwJgD1aQO0q1wxV+fJ1N
	Ef30XgRmfIQZpS9Y/0d4cixNYGzkey42/WeGIZJGwqyhvEr8Jao/pS88gsEjcYaCjgku86
	v3FWLcG2OA9bWyGijakOogeM7asyEk5qpwjHV0RBXfv/4vR+7/HX8JJyPBap1w==
Message-ID: <9e692951-86a1-4dda-b843-58173453ffe0@bootlin.com>
Date: Fri, 20 Dec 2024 14:50:36 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] pinctrl: Add pin controller driver for AAEON UP
 boards
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
References: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
 <20241211-aaeon-up-board-pinctrl-support-v1-4-24719be27631@bootlin.com>
 <CACRpkdZ_AwiE+HFX6TFBgscaVquKm_tegNSbTT0fhFmpkM7d_Q@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CACRpkdZ_AwiE+HFX6TFBgscaVquKm_tegNSbTT0fhFmpkM7d_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

On 12/20/24 13:22, Linus Walleij wrote:
> Hi Thomas,
> 
> thanks for your patch!

Hi Linus,

Thanks for the review !!

> 
> On Wed, Dec 11, 2024 at 5:27 PM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
> 
>> This enables the pin control support of the onboard FPGA on AAEON UP
>> boards.
>> Due to the hardware design, the driver shall control its pins in tandem
>> with their corresponding Intel SoC GPIOs.
>>
>> UP boards and UP Squared boards are supported.
>>
>> Based on the work done by Gary Wang <garywang@aaeon.com.tw>, largely
>> rewritten.
>>
>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> 
> Overall this looks as a good start, some comments below.
> 
>> +config PINCTRL_UPBOARD
>> +       tristate "AAeon UP board FPGA pin controller"
>> +       depends on MFD_UPBOARD_FPGA
>> +       select PINMUX
>> +       select GENERIC_PINCTRL_GROUPS
>> +       select GENERIC_PINMUX_FUNCTIONS
> 
> This implements GPIO so you need:
> select GPIOLIB
> 
> But I'm not sure because of some oddities, see below.
> 
>> +#include <linux/device.h>
>> +#include <linux/gpio/consumer.h>
> 
> Questionable include, see below.
> 
>> +static int __upboard_pinctrl_gpio_request_enable(struct pinctrl_dev *pctldev,
>> +                                                unsigned int offset)
> 
> I'm not a fan of functions named with __inner_function() double-underscore
> convention. The reason is that double underscore is also used for
> compiler intrinsics. Can you just name it
> 
> committ_upboard_pinctrl_gpio_request_enable()?

ack

> 
>> +static void __upboard_pinctrl_gpio_disable_free(struct pinctrl_dev *pctldev, unsigned int offset)
> 

[...]

>> +static int upboard_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
>> +{
>> +       struct upboard_pinctrl *pctrl = container_of(gc, struct upboard_pinctrl, chip);
>> +       int ret;
>> +
>> +       ret = pinctrl_gpio_direction_output(gc, offset);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return gpiod_direction_output(pctrl->gpio[offset], value);
>> +}
> 
> This looks dangerous and I guess also the reason you are including consumer.h.
> 
> Explain with a comment in the code what is going on here, like if this
> GPIO comes from a completely different hardware unit, it looks like
> a recepie for an eternal loop if it would point back to the same GPIO.
> 
> All of these have the same "loop out to another hardware" feature
> that looks weird to me, but explain what's going on so I understand
> it.
> 
> To me usually pin control works like this:
> 
> linux gpio <-> gpio driver <-> pin control driver
> 
> so the pin control driver is a pure "backend" for GPIO,
> typically implements in struct pinmux_ops:
> .gpio_request_enable()
> .gpio_disable_free()
> .gpio_set_direction()
> 
> that just set up the pin in the corresponding way. If your hardware
> cannot mux back a pin from GPIO mode (as a comment says)
> I would say that gpio_disable_free() can just return -ENODEV
> or something if the pin has been put into gpio mode, maybe
> some experimentation is needed there.
> 
> The corresponding GPIO driver typically uses GPIO ranges
> to access the corresponding pin. It usually call
> gpiochip_add_pin_range() to map its pins to the pin control
> driver (if e.g. device tree is not used for the ranges).
> 
> What you do here is confusing to me, it looks like:
> 
> linux gpio <-> this gpio shim <-> pin control <-> other gpio driver
> 
> I think it is better to try to keep things separate if you can,
> the current design seems to come from an attempt to be
> "complete" and protect users from themselves, but we can
> never protect users from themselves.
> 
>> +static int upboard_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
>> +{
>> +       struct upboard_pinctrl *pctrl = container_of(gc, struct upboard_pinctrl, chip);
>> +
>> +       return gpiod_to_irq(pctrl->gpio[offset]);
>> +}
> 
> If you use the GPIOLIB_IRQCHIP, you do not need to define this function
> at all, it is handled by gpiolib.
> 
>> +       ret = gpiochip_add_pinlist_range(chip, dev_name(dev), 0, pctrl->pctrl_data->pin_header,
>> +                                        pctrl->pctrl_data->ngpio);
> 
> I would rather have it that the actual gpio chip (the one that write
> something into hardware registers) do this without another gpio chip
> inbetween if you see what I mean.
> 
> But explain what's going on! I'm curious.

Yes my cover letter was a bit short, and maybe some context was missing.

This FPGA acts as a level shifter between the Intel SoC pins and the pin
header, and also makes a kind of switch/mux.

+---------+         +--------------+             +---+
          |         |              |             | H |
          |---------|              |-------------| E |
          |         |              |             | A |
Intel Soc |---------|    FPGA      |-------------| D |
          |         |              |             | E |
          |---------|              |-------------| R |
          |         |              |             |   |
----------+         +--------------+             +---+


For most of the pins, the FPGA opens/closes a switch to enable/disable
the access to the SoC pin from a pin header.
Each "switch", has a direction flag that shall be set in tandem with the
status of the SoC pin.
For example, if the SoC pin is in PWM mode, the "switch" shall be
configured in output direction.
If the SoC pin is set in GPIO mode, the direction of the "switch" shall
corresponds to the GPIO direction.

+---------+              +--------------+             +---+
          |              |              |             | H |
          |              |      \       |             | E |
          |   PWM1       |       \      |             | A |
Intel Soc |--------------|-----   \-----|-------------| D |
          |              |              |             | E |
          |              |              |             | R |
          |              |    FPGA      |             |   |
----------+              +--------------+             +---+

(PWM1 pin from Intel SoC can be used as PWM, and also in GPIO mode,
thanks to the Intel pinctrl driver).


Few pins (PINMUX_* pins) work differently. The FPGA acts as a mux and
routes for example the I2C0_SDA pin or GPIOX (of the SoC) to the pin header.

+---------+           +--------------+             +---+
          | I2C0_SDA  |              |             | H |
          |-----------|----- \       |             | E |
          |           |       \      |             | A |
Intel Soc |           |        \-----|-------------| D |
          | GPIOX     |              |             | E |
          |-----------|-----         |             | R |
          |           |    FPGA      |             |   |
----------+           +--------------+             +---+

The pin header looks like this:
+--------------------+--------------------+
|      3.3V	     |       5V           |
| GPIO2 / I2C1_SDA   |       5V           |
| GPIO3 / I2C1_SCL   |       GND          |
| GPIO4 / ADC0       | GPIO14 / UART1_TX  |
|      GND	     | GPIO15 / UART1_RX  |
| GPIO17 / UART1_RTS | GPIO18 / I2S_CLK   |
|     GPIO27         |       GND          |
|     GPIO22         |      GPIO23        |
|      3.3V          |      GPIO24        |
| GPIO10 / SPI_MOSI  |       GND          |
| GPIO9 / SPI_MISO   |      GPIO25        |
| GPIO11 / SPI_CLK   | GPIO8 / SPI_CS0    |
|      GND	     | GPIO7 / SPI_CS1    |
| GPIO0 / I2C0_SDA   | GPIO1 / I2C0_SCL   |
|     GPIO5          |       GND          |
|     GPIO6	     | GPIO12 / PWM0      |
| GPIO13 / PWM1      |       GND          |
| GPIO19 / I2S_FRM   | GPIO16 / UART1_CTS |
|     GPIO26	     | GPIO20 / I2S_DIN   |
|      GND	     | GPIO21 / I2S_DOUT  |
+--------------------+--------------------+

The GPIOs in the pin header corresponds to the gpiochip I declare in
this driver.
So when I want to use a pin in GPIO mode, the upboard pinctrl driver
requests the corresponding SoC GPIO to the Intel pinctrl driver.
The SoC pins connected to the FPGA, are identified with "external" id.

The hardware and the FPGA were designed in tandem, so you know for
example that for the GPIOX you need to request the Nth "external" GPIO.

When you drive your GPIO, the upboard gpiochip manages in the same time
the direction of the "switch" and the value/direction of the
corresponding SoC pin.

+------------------+         +--------------+             +---+
                   |---------|              |-------------| H |
                   |---------|   GPIOCHIP   |-------------| E |
   Intel gpiochip  |---------|              |-------------| A |
 provided by Intel |---------|    FPGA      |-------------| D |
  pinctrl driver   |---------|              |-------------| E |
                   |---------|              |-------------| R |
                   |---------|              |-------------|   |
+------------------+         +--------------+             +---+


About gpiochip_add_pinlist_range(), I added it because the FPGA pins
used by the gpiochip are not consecutive.

Please let me know if it is not clear.
And sorry I'm not very good to make ascii art.

Best Regards,

Thomas

