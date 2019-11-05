Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 429B8EFD07
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 13:16:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730894AbfKEMQ3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 07:16:29 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60148 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbfKEMQ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 07:16:29 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5CGMSt016434;
        Tue, 5 Nov 2019 06:16:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572956182;
        bh=J4BEpU/N6/Oxb2b5/LtAcYX01H5ycdx3Kno1gFw5vSA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=mDuRAvy14zR8lx8Y2JwG5vqINJJtK83X0YcGOJyz1xctRQBBZH8V4x0gjb6MBB4Rq
         THyVWe+9qeHPj7lwQcP3UQGwcVj3I3w3vGKJNadKOxqzNeo8TXKQmaAjafiRnkBk5K
         ewu0KC8uBZUabaAIaI08r/H3lABHcTGQ7NAlW930=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5CGMvr125639
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 06:16:22 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 5 Nov
 2019 06:16:07 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 06:16:07 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5CGI88018698;
        Tue, 5 Nov 2019 06:16:19 -0600
Subject: Re: [RFC v2 0/2] gpio: Support for shared GPIO lines on boards
To:     Rob Herring <robh+dt@kernel.org>
CC:     Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <devicetree@vger.kernel.org>
References: <20191030120440.3699-1-peter.ujfalusi@ti.com>
 <CAL_JsqK-eqoyU7RWiVXMpPZ8BfT8a0WB47756s8AUtyOqbkPXA@mail.gmail.com>
 <5bca4eb6-6379-394f-c95e-5bbbba5308f1@ti.com>
 <20191030141736.GN4568@sirena.org.uk>
 <f9c181d1-5e0c-5e82-a740-f4e97822604f@ti.com>
 <CAL_JsqJ4WdaRvmZcjQG-jVyOOeKZX9fn1WcQZGWfUPqwunQCFw@mail.gmail.com>
 <1258a5bf-a829-d47a-902f-bf2c3db07513@ti.com>
 <CAL_Jsq+V0oAdVCaW+S12CUa4grCJhZD8OGDeu=0ohcGgxOkPVg@mail.gmail.com>
 <5669a4c1-2bc1-423b-1407-073317f7df7e@ti.com>
 <CAL_JsqJbhG+-zVs9bjHg8asGuM1+FNnGJ0xx7qcPBwuRX35ijw@mail.gmail.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <7d60ec02-9f00-eb6f-919e-9bab1704e93e@ti.com>
Date:   Tue, 5 Nov 2019 14:17:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJbhG+-zVs9bjHg8asGuM1+FNnGJ0xx7qcPBwuRX35ijw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 04/11/2019 21.11, Rob Herring wrote:
>> If one driver toggles the GPIO line directly then the GPIO line is going
>> to be toggled for all the devices the GPIO line is connected to.
> 
> Of course. That would be the typical case. I'd assume we would want to
> handle that the same way as shared resets. Reset can only be asserted
> when all clients want reset asserted. I guess when the first client
> probes, it asserts and deasserts the reset.

The exclusive flavor of reset API acts like a GPIO, while the shared
ones will result in refcounted behavior.

With describing the hw via gpio-shared we could support different modes:
- pass-through: like a GPIO with nonexclusive, any request will
propagate to the root-gpio
- refcounted low: the line is kept low as long as at least one client is
requiring to to be low
- refcounted high: the line is kept high as long as at least one client
is requiring to to be high

>>> I don't think you can have any reset control in
>>> the drivers in that case.
>>
>> The device needs the RST line to be high, otherwise it is not
>> accessible. If it does not have reset control how can we make sure that
>> the GPIO line is in correct state?
> 
> Just like the reset code, drivers register their use of the reset and
> the core tracks users and prevents resetting when not safe. Maybe the
> reset subsystem needs to learn about GPIO resets. It could even
> default to knowing 'reset-gpios' property as we've somewhat
> standardized that. Then you just register your GPIO reset line with
> the reset subsystem. When it gets the same line registered more than
> once, then it knows to handle sharing the line. If you need to know
> the line is shared before then, then you need something in DT. A flag
> is enough for that.

What about things where the gpio is not a reset or enable for the chip,
but an enable for one of it's output?
Or if a shared GPIO is connected to address select pins?

>>> No, drivers are written to set the state to active/inactive.
>>
>> I think the drivers are written in a way to follow what their datasheets
>> are tells. If it say that the GPIO line must be high to enable the
>> device then they gpiod_set_value(1), if the line must be low to enable
>> them then they will gpiod_set_value(0).
> 
> gpiod_set_value(1) sets the line to the active state defined in DT
> GPIO flags, not the electrical level of the signal. This issue is a
> good example of precisely why the gpiod API was defined this way. I do
> think it is a bit confusing though. Perhaps reusing _{get,set}_value
> API was not the best naming.

Yes, it is confusing and I think most drivers are using it following
their corresponding datasheets, iow if the datasheet say the line must
be low then set_value(0) is used.

It does look weird to use set_value(reset_gpio, 1) in the code when the
documentation say that the reset pin must be _low_ to place the part
into reset, even if you look up the DT documentation and dts files for
GPIO_ACTIVE_HIGH/LOW usage among boards.

Especially if you have two peripherals where both is enabled when their
pin is LOW, but one names it RST and is high active, the other names it
EN and it is low active. especially that lots of devices do not even
states any active mode for the pin, just if high, it is in reset, if low
then it is enabled.

I get the notion of how it is, but it does feel a bit unnatural in times.

>>> The DT GPIO_ACTIVE_ flags can depend on an inverter being present (BTW, there
>>> was a recent attempt to do an inverter binding).
>>
>> Yes.
>> If the line is inverted on the board, than the DT GPIO_ACTIVE_LOW will
>> invert it to the correct level.
> 
> Yes, if the signal is normally GPIO_ACTIVE_HIGH.
> 
>> We have two off the shelf components, C1 and C2. They have a driver
>> written based on the datasheets.
>> C1 needs HIGH (LOW reset/disable)
>>  uses gpiod_set_value(1) to enable the device
> 
> No. The active state for a 'reset-gpios' is the state in which reset
> is active/asserted. So gpiod_set_value(1) should always mean 'assert
> reset'.
> 
> If we're talking about an 'enable-gpios', then the active state is
> when the device is active/enabled. So it's the inverse of
> 'reset-gpios'.
> 
>> C2 needs LOW (HIGH reset/disable)
>>  uses gpiod_set_value(0) to enable the device
> 
> Yes. The GPIO flag would be GPIO_ACTIVE_HIGH and gpiod_set_value(0) is
> reset de-asserted.
> 
>> When they are connected to a dedicated GPIO the DT binding has
>> GPIO_ACTIVE_HIGH since when the GPIO is set to 1 it goes HIGH, right?
> 
> No, as explained above. C2 would be GPIO_ACTIVE_HIGH, C1 would be
> GPIO_ACTIVE_LOW normally.
> 
>> If two device is connected to one GPIO one of them needs an inverter on
>> the GPIO line after it is split into two, let say C2 got inverted line:
>> C1 tells in DT that the line is not inverted: GPIO_ACTIVE_HOGH
>> C2 tells in DT that the line is inverted: GPIO_ACTIVE_LOW
> 
> C1 needs GPIO_ACTIVE_LOW here.

Hrm, so the GPIO_ACTIVE_ can not be used as a means to tell that if the
gpio line is active (set to 1) at the source then the signal at the
component's pin is going to be high (GPIO_ACTIVE_HIGH) or low
(GPIO_ACTIVE_LOW)?

> 
>> GPIO HIGH -> D1 is enabled
>>           -> !HIGH -> LOW -> D2 is enabled
>>
>> If both would request the same physical GPIO then how would this work? A
>> single GPIO can not be handled in inverted and non inverted way at the
>> same time.
>>
>> But this is just a side effect that this would be easy to handle with
>> this DT binding and driver.
>> After all, it will describe the GPIO line split.
>>
>>>> It should be possible to add pass-through mode for gpio-shared so that
>>>> all requests would propagate to the root GPIO if that's what needed for
>>>> some setups.
>>>>
>>>> That way the gpio-shared would nicely handle the GPIO inversions, would
>>>> be able to handle cases to avoid unwanted reset/enable of components or
>>>> allow components to be ninja-reset.
>>>
>>> What does ninja-reset mean?
>>
>> Ninjas attack from ambush ;)
>> The device is reset w/o it's driver being aware that it ever happened as
>> other driver toggled the shared GPIO line.
>>
>>>> I think it would be possible to add gpiod_is_shared(struct gpio_desc
>>>> *desc) so users can check if the GPIO is shared - it would only return
>>>> true if the gpio-shared is not in pass-through mode so they can know
>>>> that the state they see on their gpio desc is not necessary matching
>>>> with reality.
>>>> Probably another gpiod_shared_get_root_value() to fetch the root's state?
>>>>
>>>> I intentionally not returning that in the driver as clients might skip a
>>>> gpio_set_value() seeing that the GPIO line is already in a state they
>>>> would want it, but that would not register their needs for the level.
>>>>
>>>> - Péter
>>>>
>>>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>>>> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>>
>> - Péter
>>
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
