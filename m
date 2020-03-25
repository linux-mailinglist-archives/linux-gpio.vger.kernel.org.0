Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 323A519326F
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2020 22:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgCYVQx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Mar 2020 17:16:53 -0400
Received: from smtp105.ord1d.emailsrvr.com ([184.106.54.105]:40404 "EHLO
        smtp105.ord1d.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727355AbgCYVQx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 25 Mar 2020 17:16:53 -0400
X-Greylist: delayed 463 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Mar 2020 17:16:52 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=softiron.com;
        s=20191119-3p77dzn5; t=1585170548;
        bh=DZa5lxBToOiGxVENeDrpTYmvyQ/rLx72PLYeWo0dYe4=;
        h=Subject:To:From:Date:From;
        b=h+c0aKcKzMD+/JrrLz0/CeJZviWgw9gS46UzFR3HZqD5fSJINbrTj/kpQmpkIY0Ys
         Dnq0Kfz9EUNV+FsXLkZY7lSoCT5ZOYJMSLo2hXGwcVhJpTlzI8M2Z0WIj0WBuyL0aj
         wcXy2rs/JB+fjAspIyEpDgYE5iHPgBKAQ30hBOII=
X-Auth-ID: alan@softiron.com
Received: by smtp14.relay.ord1d.emailsrvr.com (Authenticated sender: alan-AT-softiron.com) with ESMTPSA id 12BE3400F6;
        Wed, 25 Mar 2020 17:09:07 -0400 (EDT)
X-Sender-Id: alan@softiron.com
Received: from [10.1.1.115] (99-117-187-177.lightspeed.dybhfl.sbcglobal.net [99.117.187.177])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA)
        by 0.0.0.0:465 (trex/5.7.12);
        Wed, 25 Mar 2020 17:09:08 -0400
Subject: Re: pinctrl states vs pinmux vs gpio (i2c bus recovery)
To:     Ludovic.Desroches@microchip.com, linux@armlinux.org.uk,
        linus.walleij@linaro.org
Cc:     kamel.bouhara@bootlin.com, wsa@the-dreams.de,
        linux-gpio@vger.kernel.org, Codrin.Ciubotariu@microchip.com,
        linux-arm-kernel@lists.infradead.org
References: <20191206173343.GX25745@shell.armlinux.org.uk>
 <CACRpkdZv2rzA8AbFZKq0XVBaXNJR8c5tsb+1KTZ7fNuWjm5cbQ@mail.gmail.com>
 <20191213002010.GO25745@shell.armlinux.org.uk>
 <1ca5d81d-5aa9-8f8d-8731-4d34de9c6bfa@softiron.com>
 <4f9bb480-ba8d-b70e-961b-d6032232d250@softiron.com>
 <edb09f97-7748-f7d0-cad6-e79db7950b0d@microchip.com>
From:   Alan Ott <alan@softiron.com>
Message-ID: <c193dd83-4cdc-9f3f-560e-828cf6e8a8db@softiron.com>
Date:   Wed, 25 Mar 2020 17:09:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <edb09f97-7748-f7d0-cad6-e79db7950b0d@microchip.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Classification-ID: 6d67751f-e8cd-4b91-a995-d4b80ee8fecd-1-1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/25/20 4:06 PM, Ludovic.Desroches@microchip.com wrote:
> On 3/25/2020 1:42 PM, Alan Ott wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>> the content is safe
>>
>> On 2/27/20 11:47 AM, Alan Ott wrote:
>>> On 12/12/19 7:20 PM, Russell King - ARM Linux admin wrote:
>>>> On Mon, Dec 09, 2019 at 01:20:15AM +0100, Linus Walleij wrote:
>>>>> Hi Russell,
>>>>>
>>>>> very nice description of this dual-mode problem.
>>>>>
>>>>> I wish I had a simple and elegant way we could make it
>>>>> unambiguous and simple to use ... but it beats me right
>>>>> now.
>>>>>
>>>>> On Fri, Dec 6, 2019 at 6:33 PM Russell King - ARM Linux admin
>>>>> <linux@armlinux.org.uk> wrote:
>>>>>
>>>>>> One may expect:
>>>>>>
>>>>>>           pinctrl_select_state(i2c_imx->pinctrl,
>>>>>> i2c_imx->pinctrl_pins_default);
>>>>>>
>>>>>> to change them back to the default state, but that would be incorrect.
>>>>>> The first thing that pinctrl_select_state() does is check whether
>>>>>>
>>>>>>           p->state == state
>>>>>>
>>>>>> which it will do, as the pinctrl layer hasn't been informed of the
>>>>>> change that has happened behind its back at the pinmux level.
>>>>> Some pin controllers have the .strict property set
>>>>> in their struct pinmux_ops:
>>>>>
>>>>> * @strict: do not allow simultaneous use of the same pin for GPIO and
>>>>> another
>>>>> *      function. Check both gpio_owner and mux_owner strictly before
>>>>> approving
>>>>> *      the pin request.
>>>>>
>>>>> The non-strict pin controllers are those that actually allow GPIO
>>>>> and device functions to be used on the same physical line at the
>>>>> same time. In this case there is not special GPIO mode for the
>>>>> line in some muxing registers, they are just physically connected
>>>>> somehow.
>>>>>
>>>>> One usecase is sort of like how tcpdump work for
>>>>> ethernet interfaces: a GPIO register can "snoop" on a pin while
>>>>> in used by another device.
>>>>>
>>>>> But it would notably also allow you to drive the line and interfere
>>>>> with the device. Which is exactly what this I2C recovery mechanism
>>>>> does, just that its pin controller is actually strict, will not allow
>>>>> the same line to be used for GPIO and some other function at the
>>>>> same time, so I suppose i.MX should probably explore the
>>>>> strict mode.
>>>>>
>>>>> Enabling that will sadly make the problem MORE complex
>>>>> for this I2C recovery, requiring a cycle of
>>>>> gpiod_put()/gpiod_get() to get it released from GPIO mode, i.e.
>>>>> we would need to just get the GPIO when this is strictly needed.
>>>>> Using devm_gpiod_get() and keeping a reference descriptor
>>>>> around would not work all of a sudden.
>>>>>
>>>>> I am thinking whether we can handle the non-strict controllers
>>>>> in a more elegant way, or add some API to explicitly hand over
>>>>> between device function and GPIO function. But I can't really
>>>>> see some obvious solution.
>>>> What I'm currently trying is (error handling removed for brevity):
>>>>
>>>>      struct i2c_bus_recovery_info *bri = &i2c->recovery;
>>>>
>>>>           i2c->pinctrl = devm_pinctrl_get(dev);
>>>>           i2c->pinctrl_default = pinctrl_lookup_state(i2c->pinctrl,
>>>>
>>>> PINCTRL_STATE_DEFAULT);
>>>>           i2c->pinctrl_recovery = pinctrl_lookup_state(i2c->pinctrl,
>>>>                               "recovery");
>>>>           bri->sda_gpiod = devm_gpiod_get(dev, "sda",
>>>> GPIOD_OUT_HIGH_OPEN_DRAIN);
>>>>           bri->scl_gpiod = devm_gpiod_get(dev, "scl",
>>>> GPIOD_OUT_HIGH_OPEN_DRAIN);
>>>>
>>>>      pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_recovery);
>>>>      return pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_default);
>>>>
>>>> which seems good enough to get the pins back into i2c mode after the
>>>> gpios are obtained.  Then we switch the pinctrl state between
>>>> pinctrl_recovery and pinctrl_default as we have need to.
>>>>
>>>> The problem is, the generic i2c bus recovery code wants the gpiod
>>>> descriptors to be setup and inplace by the time i2c_init_recovery()
>>>> is called (which is called when the adapter is registered) so
>>>> holding off until we need to do recovery doesn't work.
>>>>
>>>> This seems to work for this SoC I'm currently working with, but I
>>>> think there's more on the horizon - I'm having the same problems
>>>> on another SoC which also needs bus recovery implemented, and as
>>>> the problem device is behind an I2C bus mux, when it locks the I2C
>>>> bus, it kills all I2C buses rooted at that particular SoC I2C
>>>> controller.  However, there's a problem - the pinctrls for that SoC
>>>> are set by ROM firmware at boot time by reading a table from the
>>>> boot media.  *Unprintables about firmware being too way limiting*. :p
>>>>
>>   >
>>> Hi all, what's the current state of this? I can confirm that this is
>>> broken with the at91 i2c controller's recovery mode[1], which is
>>> implemented exactly the same as other i2c master recovery modes, so I
>>> suspect them to be broken as well.
>>>
>>> I'm using 5.5.6 with this patch applied (which adds the recovery):
>>>       https://patchwork.kernel.org/cover/11333883/
>>>
>>> It worked fine with 5.2, but has now broken, the way Russell describes,
>>> in 5.5.6 and also on the latest 5.6-rc3. Russell's suggested workaround
>>> of setting the pinctrl to recovery (gpio) and then back to default does
>>> make it work.
>>>
>>> Alan.
>>>
>>> [1] currently the patch for i2c recovery for at91 is accepted to Wolfram
>>> Sang's for-next tree.
>>>
>>
>> Is there any word on this?
>>
> 
> Internally we have managed it in the same way as the one suggested by
> Russell.
> 
> We wondered if we should mainline it or not as it's really tricky to
> proceed like this.

Certainly it needs to work in mainline though, right? Not just in the 
linux4sam vendor kernel?

> 
> In the future, we may declare our pinctrl as strict which should cause
> another breakage... It's not done yet because when I tried to do it,
> maybe it has changed now, I was not able to apply the pin configuration
> to the pin muxed as a gpio.
> 

The larger question I think is, is this a breakage in gpio? i2c-at91 is 
not the only i2c driver which uses gpio-based bus recovery, and many of 
them use nearly the exact same code as i2c-at91. Are they all broken 
with this kernel update too?

Alan.
