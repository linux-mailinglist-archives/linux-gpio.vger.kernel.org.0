Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D488EC58A
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 16:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbfKAPU6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 11:20:58 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38830 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727326AbfKAPU6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 11:20:58 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA1FKlYb015196;
        Fri, 1 Nov 2019 10:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572621647;
        bh=eeA3umD584w/bAmDdnoCxBa6AsPCzlgHuHEtXWEal/s=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=shkONEcfODmBLwI/jnS5yqQNMP1gCfKDwc8qE4YXsaaZgJobWZNtWIk7LNcDVtFt/
         GVsnaaqsh4XwAjyOg/KvuB4s2OG8lbfRnAP94OXLJ/KnClkFjXtuAu+81+eZdHUbjj
         rEHDvcz4nUv1RcQ97hU1JSnMhCfN7dqgm96qT2Y8=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA1FKlxT052853
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 1 Nov 2019 10:20:47 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 1 Nov
 2019 10:20:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 1 Nov 2019 10:20:33 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA1FKiSv064409;
        Fri, 1 Nov 2019 10:20:44 -0500
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
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <5669a4c1-2bc1-423b-1407-073317f7df7e@ti.com>
Date:   Fri, 1 Nov 2019 17:21:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+V0oAdVCaW+S12CUa4grCJhZD8OGDeu=0ohcGgxOkPVg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 01/11/2019 15.46, Rob Herring wrote:
> On Thu, Oct 31, 2019 at 3:00 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>>
>>
>>
>> On 30/10/2019 20.49, Rob Herring wrote:
>>> On Wed, Oct 30, 2019 at 9:30 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>>>>
>>>>
>>>>
>>>> On 30/10/2019 16.17, Mark Brown wrote:
>>>>> On Wed, Oct 30, 2019 at 03:32:09PM +0200, Peter Ujfalusi wrote:
>>>>>> On 30/10/2019 15.12, Rob Herring wrote:
>>>>>
>>>>>>> Why can't we just add a shared flag like we have for interrupts?
>>>>>>> Effectively, we have that for resets too, it's just hardcoded in the
>>>>>>> the drivers.
>>>>>
>>>>>> This would be kind of the same thing what the
>>>>>> GPIOD_FLAGS_BIT_NONEXCLUSIVE does, which was a quick workaround for
>>>>>> fixed-regulators afaik.
>>>>>
>>>>> The theory with that was that any usage of this would need the
>>>>> higher level code using the GPIO to cooperate so they didn't step
>>>>> on each other's toes so the GPIO code should just punt to it.
>>>>
>>>> But from the client driver point of view a GPIO is still GPIO and if the
>>>> components are unrelated then it is hard to patch things together from
>>>> the top.
>>>
>>> You can't escape a driver being aware. If a driver depends on that
>>> GPIO to actually be set to states the driver says, then it can't be
>>> guaranteed to work. For example, maybe the driver assumes the device
>>> is in reset state after toggling reset and doesn't work if not in
>>> reset state. The driver has to be aware no matter what you do in DT.
>>
>> That's true for some device, but it is also true that some can not
>> tolerate being reset without them knowing it.
> 
> You mean a reset when the driver is not loaded would not work? How
> could that ever work?

No, what I mean is that one device is reset because the driver for the
other device toggles the GPIO line.

If one driver toggles the GPIO line directly then the GPIO line is going
to be toggled for all the devices the GPIO line is connected to.

> I don't think you can have any reset control in
> the drivers in that case.

The device needs the RST line to be high, otherwise it is not
accessible. If it does not have reset control how can we make sure that
the GPIO line is in correct state?

gpio-hog does not work all the time because we can not trust probe order
and w/o gpio binding on the user deferred probing is not possible.
If for some reason the gpio controller is probed after the drivers
depending on the reset/enable GPIO then there's not much we can do.

>> If all users of the shared GPIO have full control over it then they can
>> just toggle it whatever way they want. How would a regulator, codec,
>> amplifier would negotiate on what to do with the shared GPIO?
>>
>> Another not uncommon setup is when the two components needs different level:
>> C1: ENABLE is high active
>> C2: RESET is high active
>>
>> To enable C1, the GPIO should be high. To enable C2 the GPIO must be low.
>> In the board one of the branch of the shared GPIO needs (and have) a
>> logic inverter.
>>
>> If they both control the same GPIO then they must have requested it with
>> different GPIO_ACTIVE_ since the drivers are written according to chip
>> spec, so C1 sets the GPIO to 1, C2 sets it to 0, the inversion for one
>> of them must happen in gpio core, right?
> 
> No, drivers are written to set the state to active/inactive.

I think the drivers are written in a way to follow what their datasheets
are tells. If it say that the GPIO line must be high to enable the
device then they gpiod_set_value(1), if the line must be low to enable
them then they will gpiod_set_value(0).

> The DT GPIO_ACTIVE_ flags can depend on an inverter being present (BTW, there
> was a recent attempt to do an inverter binding).

Yes.
If the line is inverted on the board, than the DT GPIO_ACTIVE_LOW will
invert it to the correct level.

We have two off the shelf components, C1 and C2. They have a driver
written based on the datasheets.
C1 needs HIGH (LOW reset/disable)
 uses gpiod_set_value(1) to enable the device

C2 needs LOW (HIGH reset/disable)
 uses gpiod_set_value(0) to enable the device

When they are connected to a dedicated GPIO the DT binding has
GPIO_ACTIVE_HIGH since when the GPIO is set to 1 it goes HIGH, right?

If two device is connected to one GPIO one of them needs an inverter on
the GPIO line after it is split into two, let say C2 got inverted line:
C1 tells in DT that the line is not inverted: GPIO_ACTIVE_HOGH
C2 tells in DT that the line is inverted: GPIO_ACTIVE_LOW

GPIO HIGH -> D1 is enabled
	  -> !HIGH -> LOW -> D2 is enabled

If both would request the same physical GPIO then how would this work? A
single GPIO can not be handled in inverted and non inverted way at the
same time.

But this is just a side effect that this would be easy to handle with
this DT binding and driver.
After all, it will describe the GPIO line split.

>> It should be possible to add pass-through mode for gpio-shared so that
>> all requests would propagate to the root GPIO if that's what needed for
>> some setups.
>>
>> That way the gpio-shared would nicely handle the GPIO inversions, would
>> be able to handle cases to avoid unwanted reset/enable of components or
>> allow components to be ninja-reset.
> 
> What does ninja-reset mean?

Ninjas attack from ambush ;)
The device is reset w/o it's driver being aware that it ever happened as
other driver toggled the shared GPIO line.

>> I think it would be possible to add gpiod_is_shared(struct gpio_desc
>> *desc) so users can check if the GPIO is shared - it would only return
>> true if the gpio-shared is not in pass-through mode so they can know
>> that the state they see on their gpio desc is not necessary matching
>> with reality.
>> Probably another gpiod_shared_get_root_value() to fetch the root's state?
>>
>> I intentionally not returning that in the driver as clients might skip a
>> gpio_set_value() seeing that the GPIO line is already in a state they
>> would want it, but that would not register their needs for the level.
>>
>> - Péter
>>
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
