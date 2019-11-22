Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCD3910726F
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 13:49:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbfKVMtY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 07:49:24 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45194 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfKVMtX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 07:49:23 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAMCnAWd101152;
        Fri, 22 Nov 2019 06:49:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574426950;
        bh=IyA3GnJOidDmr6zbtVXqyjBBkemvxjeaTk/PDNqwAO8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=WeqYeJJiWFX4ttxaajsKWURnjvE69QM4ZuRq6Z7c8XWT/oNdLVT4I7Blz5SpbX9X4
         BqIterdFfPmkLPr/i+BQaOW7JXqLPy5oKLGbppoZn0wIF2Tsu2Ger8zXFLFt6ENqC8
         OJYX1H2yJhvBW1QCFkw1zewEVZ9J/hiB7JeH8bDE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAMCn9NT034074;
        Fri, 22 Nov 2019 06:49:10 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 22
 Nov 2019 06:49:09 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 22 Nov 2019 06:49:09 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAMCn6mX126473;
        Fri, 22 Nov 2019 06:49:06 -0600
Subject: Re: [RFC 0/2] gpio: Support for shared GPIO lines on boards
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Rajendra Nayak <rnayak@codeaurora.org>,
        Grant Likely <glikely@secretlab.ca>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20191030114530.872-1-peter.ujfalusi@ti.com>
 <CACRpkdbw9MVrQMSgVMenSqAOiti1pAy4d2LvWY-ssx9dhzWEcw@mail.gmail.com>
 <8bd0f286-dc54-72a6-0aaf-2dc7b9972883@ti.com>
 <CACRpkdZ-qf3OKAxsoj+36V_N6Y_gFte1LHM+66OqekXBAWxsVA@mail.gmail.com>
 <56916577-8d39-f98f-9fd6-2fdc6e1e0023@ti.com>
 <CACRpkdYLn2p+smpcqLj=mD1=NRNAXHbqL25Y6OB93+ZCWk6PAw@mail.gmail.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <b2c292e7-5703-c57d-f81d-6a035e58f828@ti.com>
Date:   Fri, 22 Nov 2019 14:49:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdYLn2p+smpcqLj=mD1=NRNAXHbqL25Y6OB93+ZCWk6PAw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 21/11/2019 16.47, Linus Walleij wrote:
> On Tue, Nov 19, 2019 at 9:33 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>> On 13/11/2019 19.06, Linus Walleij wrote:
>>> On Fri, Nov 8, 2019 at 12:20 PM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
> 
>>>> gpiod_deassert() would be equivalent to Philipp's
>>>> gpiod_politely_suggest_value()
>>>
>>> I don't intuitively understand the semantics of these calls.
>>> Consider Rusty Russells API design manifesto:
>>> http://sweng.the-davies.net/Home/rustys-api-design-manifesto
>>
>> imho the gpiod is API level -7 in the Rusty scale.
> 
> I would agree that the double-inversion of DT or machine flags
> for active low/high and then gpiod_set_value() to high makes it
> low and vice versa mutatis mutandis is pretty -7
> 
> But my comment was not about that, but about the ambiguity
> of some *_politely_suggest_* API.

Yep, this is really a bad idea..

>>> These APIs really need names that can be understood right off
>>> and they should be compile-time optional (a Kconfig option) so
>>> that drivers that really need them can select to have them
>>> explicitly.
>>
>> At the end the goal is to have only assert/deassert API for GPIO, or do
>> you want to keep set_value()?
> 
> The problem can me split in two, non-conflated things:
> 
> 1. Rename gpiod_set_value() to e.g. gpiod_set_state(bool asserted)
>     this is a purely syntactic change with no semantic effect.
>     This makes it clear what happens and fixes the issue with
>     the hard to understand name of the function, but does not
>     change the semantic allowing you to say assert a GPIO line
>     several times after another, as that would wreak havoc in the
>     kernel. And after all there is nothing about that name that
>     suggest it would be reference counting anything.

An intuitive name in place of gpiod_set_value()/gpiod_get_value() family
would be really nice...

Another thing which bugged me for a while is the _cansleep postfixing of
the get/set.
In most cases drivers do not care if the gpio access sleeps or not, but
there are (few) cases when the access should not sleep.

I think if a cleaner API is proposed it might worth to make the normal
API to not warn when it might sleep and _nosleep postfixed versions must
be used in place where it is not desired to sleep (and WARN if it would
sleep).

> 2. Add a new reference-counted stateful API that does not allow you to
>    handle your usecase.

Not sure if we really need refcounted access just for fun. Imho even the
shared GPIO access should not be refcounted as such, but have a logic to
use the user's requested level to set the line's level.

As the gpio-shared driver is doing in this RFC.

> I would recommend not conflating the two things.
> 
>> Imho the gpiod_direction_output_raw() should not be allowed to be used
>> by drivers.
> 
> So how do you suggest that drivers/w1/masters/w1-gpio.c
> handle the usecase of overriding a nominally open drain-flagged
> line to pump some voltage in the line at some regular intervals,
> notwithstanding the logical level of the line?

Sure, if there is a real use for it then it should be preserved.

> This use of GPIO isn't dealing with something boolean logical,
> but something directly electromagnetic.
>> It would be nice if GPIO was only about logical levels,
> but it is not, and that is why gpiod_set_raw() exists.

I believe my problem starts with that I also see this from
electromagnetic point and not logical level point ;)

> There are other users in the kernel that are just cheating
> or thinking wrong, it'd be nice if those could be fixed.
> It doesn't mean the API has no valid usecases.
> 
>> CONFIG_GPIOLIB_ASSER_API as selectable config option?
> 
> CONFIG_GPIOLIB_REFCOUNTING_API is more to the
> point I think, because that is what you want to achieve.
> 
> Then the function calls can very well be named something
> with *assert* in them.

I'm still not convinced that refcounting API would help or give anything
useful at the table.

>> But it is one thing to change gpiod users as we have heavy use of the
>> legacy gpio API:
>> git grep gpio_request | wc -l
>> 1868
> 
> That can be done with a sed script if someone takes on the
> task.

Which went nicely with the regulators ;)

Adding GPIOD_FLAGS_BIT_NONEXCLUSIVE:
b0ce7b29bfcd regulator/gpio: Allow nonexclusive GPIO access

to fix:
efdfeb079cc3 regulator: fixed: Convert to use GPIO descriptor only

> 
>> That does not really matter in this case.
> 
> Nope.
> 
>>> So begin with creating a way to pull the shared handling of
>>> regulators into gpiolib with these clearly cut semantics
>>> delete the NONEXCLUSIVE thing and then when you are
>>> done with that exploit the same
>>> infrastructure for GPIO reset.
>>
>> The logic is relatively simple, 229 lines in gpio-shared, but moving
>> that into core will explode things a bit and going to add more
>> complexity to all gpio lines.
> 
> I would just add a flag such as in drivers/gpio/gpiolib.h:
> 
> #define FLAG_REFERENCE_COUNTED  15      /* GPIO uses the reference
> counting API */
> 
> If anyone grabs a GPIO with this flag it needs to be accessed
> using the refcounting API and all other uses with the
> regular API denied.

You mean that everyone must request it with this flag, right?
At the first request this flag would be set to the gpio_desc. The
upcoming requests would be denied if the requester is not using the
proper API/flag to request it, right?

For single user this does not matter apart from the fact that the gpio
accesses will be refcounted for a single client as well (and API check
as well).

> The same the other direction, if FLAG_REQUESTED is already
> set, the refcounting API should bail out.

Hrm, so you want FLAG_REQUESTED / FLAG_REFERENCE_COUNTED to be exclusive?
I don't see why FLAG_REQUESTED would be in the way of
FLAG_REFERENCE_COUNTED.

> Do not try to support a use case such as allowing the gpiod
> to be grabbed unrefcounted and later turned into a refcounted
> gpiod. Only grab it through the refcount-specific API.

Sure, that would not work anyways.

> This way it's almost as cleanly separated as the code is
> separated into regulator right now, just that it lives in
> a place where it can be reused by others needing
> reference counting.
> 
> Then surround code with:
> 
> if (IS_ENABLED(CONFIG_GPIOLIB_REFCOUNTING_API)
>      /* test flag */
> 
> Then the code size impact should be zero if the refcounting API
> is not selected.
> 
> Then just create an add-on that only affects the lines that explicitly
> want refcounting. Wrap a gpiod in another struct or something
> struct gpio_refcount_desc?

Ah, I see where you are heading now..

struct gpio_refcount_desc *gpiod_refcounted_get() and it's family with
own set of API operating on top of struct gpio_refcount_desc?

>> For one, we must maintain a list of clients requesting the line to be
>> able to do proper refcounting and this needs to be done for all pins as
>> we don't know beforehand that the given line is going to be shared.
> 
> If you want to deny the same client to ask for the same line
> twice then you need a list like that indeed. (It's a good strict semantic
> check anyways.)

It is not just that.

Global refcounting is just not going to work.

For simplicity: you have three codecs connected to same GPIO for ENABLE
(active high).

When the driver probes it will ask for the gpio to deasserted (no need
to power on things when they are not in use).

We have registered three low requests.

Then one needs to be powered up, which gives us two low requests and one
high request, but we must set the line high.

How does the core know this?

We should care for the asserted state?

What if they have RESET pin which is active low?
they will ask it to be asserted initially and when any of them needs to
be powered it will ask for deassert.

>> Or add gpio-shared block similar to gpio-hog to prepare a given line for
>> sharing? I think this might be a better thing to do and some of the code
>> from gpio-shared.c can be reused.
> 
> I would just add a flag and try to keep this API entirely on the
> side for now.
> 
> Yours,
> Linus Walleij
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
