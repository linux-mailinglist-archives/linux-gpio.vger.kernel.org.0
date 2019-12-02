Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F198810F230
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2019 22:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbfLBVbQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Dec 2019 16:31:16 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:34980 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbfLBVbQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Dec 2019 16:31:16 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB2LV6E6080747;
        Mon, 2 Dec 2019 15:31:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575322266;
        bh=YOU/tE/GgwM2e8lr07xh4JwbNuzF8RidPoRRVOBtWg8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SoKFJhgXql7/7rMTEHqrsYjnBzabgQAKK/ppNfWhXfC7td1dzd3GI8W7xPAZxMbal
         bGI6rMEKGf2CBS2YA+MJss7jIw2oXRIwVBx0gzHDTs2CXkM3trJp38jr/OJVoqqT4E
         d4Jiv7oqEw298hh9jTa9eS0g6nqJH2KT5ocF5PD4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB2LV5DD099915;
        Mon, 2 Dec 2019 15:31:05 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 2 Dec
 2019 15:31:03 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 2 Dec 2019 15:31:03 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB2LV1NM065806;
        Mon, 2 Dec 2019 15:31:01 -0600
Subject: Re: [RFC 1/2] dt-bindings: gpio: Document shared GPIO line usage
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20191120133409.9217-1-peter.ujfalusi@ti.com>
 <20191120133409.9217-2-peter.ujfalusi@ti.com>
 <CACRpkdbXX3=1EGpGRf6NgwUfY2Q0AKbGM8gJvVpY+BRAo5MQvQ@mail.gmail.com>
 <d423bc53-31df-b1b4-37da-932b7208a29e@ti.com>
 <CACRpkdafEdsN6i16SA175wE4J_4+EhS5Uw4Qsg=cZ=EuDYHmgg@mail.gmail.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <89afb07f-fb70-3f44-2396-df350ca15690@ti.com>
Date:   Mon, 2 Dec 2019 23:31:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdafEdsN6i16SA175wE4J_4+EhS5Uw4Qsg=cZ=EuDYHmgg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 28/11/2019 12.06, Linus Walleij wrote:
> On Fri, Nov 22, 2019 at 2:36 PM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>> On 22/11/2019 14.10, Linus Walleij wrote:
>>> On Wed, Nov 20, 2019 at 2:34 PM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>>>
>>>> Boards might use the same GPIO line to control several external devices.
>>>> Add section to document on how a shared GPIO pin can be described.
>>>>
>>>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>>>
>>> As I've stated earlier I think this information is surplus.
>>> If two devices have a phandle to the same GPIO line
>>> then it is by definition shared.
>>
>> Well, phandle + line number to be precise.
> 
> This is what I mean when I say "phandle to the same GPIO line".
> Like this:
> 
> foo-gpios = <&gpio0 5 GPIO_ACTIVE_LOW>;
> 
> If the phandle <&gpio0 5 *>; appear in some other
> (non-disabled) node it has > 1 users.

I thought so.
Not sure how to look up (and how expensive it is) to find the nodes
which contain any gpio(lib) binding pointing to the given line.

> 
>>>> +               line_a {
>>>> +                       gpio-shared;
>>>
>>> So this is unnecessary: if the same line is referenced
>>> by phandle from two places it is shared, simple as that.
>>
>> phandle is pointing to the gpio controller, not to the line.
> 
> Cleared up above.
> 
>>>> +                       gpios = <5 0>;
>>>> +                       output-low;
>>>
>>> This is overlapping with the use case to define initial
>>> state values for GPIOs, something that has been
>>> brought up repeatedly and I've collected links for
>>> previous discussions several times.
>>
>> I don't mind this to go away and the first set would configure the level.
>> Kept it here so I can reuse the gpio-hog code from gpiolib-of ;)
> 
> People have tried to reuse the hog code to set up
> initial line levels as well, it failed because they could
> not get the DT bindings through the door.

But we are happily using the gpio-hog to control board level muxes to
select functionality...

Initial level is a tricky one, for outputs there is a valid use case for
them for sure. If the GPIO is used to control LCD backlight for example.
You want the backlight to not flicker due to gpio state changes.

It depends on how it is configured when the kernel boots, do we have
users of the given GPIO.

Again, different issue.

>>> I guess if need be I have to look them up again.
>>>
>>> The DT maintainers don't like the hog syntax so
>>> something else is desired for this.
>>
>> I see, so the gpio-hog might change?
> 
> They will not change since they are ABI, but their
> use case will not be extended AFAICT.
> Not my pick, I liked the hog syntax but we need
> consensus.

OK.

>>> (snip)
>>>> +The shared GPIO line management strategy can be selected with either of the
>>>> +following properties:
>>>> +- refcounted-low: The line must be kept low as long as there is at least one
>>>> +               request asking it to be low.
>>>> +- refcounted-high: The line must be kept high as long as there is at least one
>>>> +               request asking it to be high.
>>>
>>> Is this really needed? Isn't it more appropriate to just define the
>>> semantics such that as soon as some consumer requests the line
>>> high it will be refcounted high, and as soon as it is requested
>>> low by any consumer it will be refcounted low.
>>
>> Well. How do we decide which level is the one that should be preserved?
> 
> First come first serve.
> 
> If there is any conflict amongst the consumers we are
> screwed anyway so why try to establish where they should
> agree if they don't agree?

They must agree on the (precious, must be preserved) level _on_ the GPIO
chip side.
It is another matter if one driver will power down it's device at probe,
the other would enable it.
This must not matter, both of them needs the same level to be enabled
and it might not be the level they will request first.

>> How would the core decide what to in a simplest case:
>> two device, they are the same part.
>> ENABLE pin which needs to be high to enable the device.
>> When the driver probes it asks for initial deasserted GPIO as the device
>> is not in active use.
> 
> This makes me think it should be a unique driver
> with a unique compatible string, as it embodies
> use cases.

Like the gpio-shared from the previous RFC ;)

> It is too broad to just define
> refcounted-high or refcounted-low, that is hiding the
> real use case, so I would go for something like a
> resource in the device tree that all other devices that
> need it can take.
> 
> Like a reset controller, precisely:
> 
> reset: reset-controller {
>     compatible = "reset-gpio";
>     gpios = <&gpio0 5 GPIO_ACTIVE_LOW>;
>     #reset-cells = <0>;
> };
> 
> dev0 {
>     resets = <&reset>;
> };
> 
> dev1 {
>     resets = <&reset>;
> };
> 
> The ambition to use refcounted GPIOs to solve this
> usecase is probably wrong, I would say try to go for a
> GPIO-based reset controller instead.

I did that. A bit more lines of code than the gpio-shared.
Only works if all clients are converted to reset controller, all must
use reset_control_get_shared()

But my biggest issue was that how would you put a resets/reset-names to
DT for a device where the gpio is used for enabling an output/input pin
and not to place the device or part of the device to reset.

Sure, one can say that something is in 'reset' when it is not enabled,
but do you put the LCD backlight to 'reset' when you turn it off?

Is your DC motor in 'reset' when it is not working?

GPIO stands for General Purpose Input/Output, one of the purpose is to
enable/disable things, reset things, turn on/off things or anything one
could use 3.3V (or more/less).

> The fact that some Linux drivers are already using explicit
> GPIO's for their reset handling is maybe unfortunate,
> they will simply have to grow code to deal with a reset
> alternatively to GPIO, like first try to grab a reset
> handle and if that doesn't fall back to use a GPIO.

Sure, it can be done, but when we hit a case when the reset framework is
not fitting for some devices use of the shared GPIO, then what we will do?

> I would say don't try to shoehorn this use case into the
> gpio library but instead try to create a reset controller that
> takes care of arbitrating the use of a single GPIO line.

It would certainly cover the use case I have.

How would it satisfy the regulator use case? We put the regulators to
'reset' when they are turned off / disabled?

> 
> Yours,
> Linus Walleij
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
