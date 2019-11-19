Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76B8B101D94
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 09:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbfKSIdW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 03:33:22 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56396 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbfKSIdW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 03:33:22 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJ8X35I090806;
        Tue, 19 Nov 2019 02:33:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574152383;
        bh=dA9a/GdWyDBW7nUzzmfy1zXK2B9JaHElz+G4h7oOOfY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=pvzArc5sL54+2uf6XhJ+24Jzf5Y81BBMJNHCbk2qRwKx/vI94Uo1/U+hO4IzEcQNF
         TeBSzTyaZ37taz4EzDNTOijMh8g8HF3BIUkkR4CqBsK2gNx1P1Uepht4tUQWrrKA0q
         JdaQzS9MBsRpbQrslYov2H1t4Vk8ZZUH65wpzD3g=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJ8X2sW049578
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 Nov 2019 02:33:03 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 19
 Nov 2019 02:33:02 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 19 Nov 2019 02:33:02 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJ8WxgN066949;
        Tue, 19 Nov 2019 02:33:00 -0600
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
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <56916577-8d39-f98f-9fd6-2fdc6e1e0023@ti.com>
Date:   Tue, 19 Nov 2019 10:34:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZ-qf3OKAxsoj+36V_N6Y_gFte1LHM+66OqekXBAWxsVA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 13/11/2019 19.06, Linus Walleij wrote:
> On Fri, Nov 8, 2019 at 12:20 PM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
> 
>> To start with I would let GPIO core to allow requesting the same GPIO
>> line by multiple consumers all the time.
> 
> It already allows that with GPIOD_FLAGS_BIT_NONEXCLUSIVE.
> 
>> If the flags for the gpio_request does not contain
>> GPIOD_FLAGS_BIT_NONEXCLUSIVE (probably we can have another define for
>> BIT(4) as GPIOD_FLAGS_BIT_MIGHT_BE_SHARED?) then print with dev_warn()
>> to get the attention of the developer that all users of the shared GPIO
>> line must be checked and change the current dev_info() to dev_dbg() when
>> the flag is provided.
> 
> We already have that. Unless all users request it with the same
> GPIOD_FLAGS_BIT_NONEXCLUSIVE they will simply fail,
> it is an excellent warning since it creates a strict semantic
> requirement for all participating consumer to explicitly specify
> if they want to share a line.
> 
> Adding a GPIOD_FLAGS_BIT_MIGHT_BE_SHARED with some
> soft semantics sort of allowing deviant nonstrict behavior seems
> like a real bad idea to me, it will likely create all kind of ambiguities
> we cannot foresee.

Agree.

>> When the consumer drivers are checked (and modified if needed) that they
>> behave OK in this situation we can snap the
>> GPIOD_FLAGS_BIT_MIGHT_BE_SHARED to silence the warning.
> 
> I have burnt myself a bit on "let's poke in this transitional
> thing that I promise to remove later" and that later never
> happens so I'd say don't do that.
> 
>> gpiod_deassert() would be equivalent to Philipp's
>> gpiod_politely_suggest_value()
> 
> I don't intuitively understand the semantics of these calls.
> Consider Rusty Russells API design manifesto:
> http://sweng.the-davies.net/Home/rustys-api-design-manifesto

imho the gpiod is API level -7 in the Rusty scale.

>> Not sure how the core would refcount things, but to align with what Rob
>> was saying about the misleading API naming:
>> gpiod_set_value(priv->en_gpio, 1/0) against the DT's
>> GPIO_ACTIVE_HIGH/LOW of the line's active state we might want to have:
>> gpiod_assert(priv->en_gpio);
>> gpiod_deassert(priv->en_gpio);
> 
> This is what gpiod_set_value() already does today in a way
> just name
> gpiod_set_value() -> gpio_set_asserted() and change
> the second argument to a bool named "asserted".
> 
> It seems like a totally different and entirely syntactic problem
> separate from the reset business you're trying to solve?
> 
> We had this discussion before this week and yeah, if we
> historically named the logical levels on the line "asserted"
> and "deasserted" everywhere it would be great.

Yeah, it is extremely awkward currently:
rst-gpois = <&gpio0 1 GPIO_ACTIVE_LOW>;

devm_gpiod_get_optional(dev, "rst",  GPIOD_OUT_LOW |
				     GPIOD_FLAGS_BIT_NONEXCLUSIVE);

Would set the initial output level to _high_

> It is up to someone driving the change and changing it
> everywhere in that case. Preferably with a semantic
> coccinelle patch or sed script since it is purely
> syntactic, then plan where and when to
> run that. Then do that first, wait a kernel cycle and scoop up
> any fallout and leftovers and then start the next thing.
> 
>> Basically assert would set the level to the active state defined by the
>> DT.
> 
> Or ACPI. Or machine descriptor tables. I suppose.

Sure.

> Doing APIs becomes generic, the suggestion I had
> above was more like doing something like detecting
> a shared line *specifically* for device tree and nothing
> else and handle it in gpiolib-of.c but maybe that is not
> possible.
> 
>> Gradually drivers can be moved to this API pair from gpiod_set_value()
>> when it makes sense.
> 
> The problem I have right now as subsystem maintainer is people
> starting things like that and never finishing them.
> 
> If you wanna do this I suggest a fix it everywhere in one swift stroke
> approach with broad buy-in from everyone-approach or fail totally.
> We have too many in-transit API changes.

I know, I'm trying to catch up on my promise on DMAengine API ;)

>> The current gpiod_set_* would operate like as it is right now by not
>> asking politely a level, whatever it is.
>>
>> Hrm, probably both gpiod_assert() and gpiod_deassert() should be polite
>> when asking for level change?
> 
> These APIs really need names that can be understood right off
> and they should be compile-time optional (a Kconfig option) so
> that drivers that really need them can select to have them
> explicitly.

At the end the goal is to have only assert/deassert API for GPIO, or do
you want to keep set_value()?
Imho the gpiod_direction_output_raw() should not be allowed to be used
by drivers.

CONFIG_GPIOLIB_ASSER_API as selectable config option?

But it is one thing to change gpiod users as we have heavy use of the
legacy gpio API:
git grep gpio_request | wc -l
1868

That does not really matter in this case.

>> If all consumers of the shared line is using gpiod_assert/deassert, then
>> the core should 'protect' the raw level of the gpiod_assert() calls.
>>
>> At the end we will see drivers converted to assert/deassert API when a
>> developer faces issues that they use shared GPIO line on a board.
> 
>> Another thing is that currently gpio core does not have refcounting and
>> most of the client drivers treat it like that.
> 
> Notably all the drivers specifying GPIOD_FLAGS_BIT_NONEXCLUSIVE
> does not treat it like that and that is why they specify that
> flag. All regulators, I think.
> 
>> It is perfectly fine to
>> gpiod_get(priv->en_gpio,1);
>> gpiod_get(priv->en_gpio,1);
>> gpiod_get(priv->en_gpio,1);
>> gpiod_get(priv->en_gpio,0);
> 
> I guess you mean gpiod_set()

Yes.

>> at the last call the GPIO value is going to be set to 0 no matter if it
>> was set to 1 three times prior, but I guess this can be worked out when
>> the driver(s) are converted to assert/deassert.
> 
> I don't understand why that would not be allowed?
> 
> Again I guess not really related to the original problem,
> so if you want to work on that it can be done in isolation.
> 
> To the overall question of a refcounting GPIO API:
> 
> OK to add a new API like that I would say first convert the
> regulators to use them so we have a strong buy-in from a
> subsystem that already does this. That way we can get rid of
> the existing GPIOD_FLAGS_BIT_NONEXCLUSIVE and pull
> the handling of shared GPIO lines into gpiolib using these
> new APIs.
> 
> I'm all for this.

The refcounting needs to be seeded with a level that needs to be
preserved. It can be low or high.

And we have cases probably when the board does not want to use
refcounting on the shared line, juts pass-through (as it is with the
GPIOD_FLAGS_BIT_NONEXCLUSIVE flag currently).

> But the general usability needs to be proven.
> It is not a very huge task:
>  git grep BIT_NONEXCLUSIVE |wc -l
> 24
> 
> 24 occurrences in the whole kernel.
> 
> If the suggested API doesn't fit regulators as well it is dead
> in the water. Then the usecase is likely specific to resets,
> and what you would need to do is rather improve the
> available semantics in the reset subsystem.

Sure, I agree.

> So begin with creating a way to pull the shared handling of
> regulators into gpiolib with these clearly cut semantics
> delete the NONEXCLUSIVE thing and then when you are
> done with that exploit the same
> infrastructure for GPIO reset.

The logic is relatively simple, 229 lines in gpio-shared, but moving
that into core will explode things a bit and going to add more
complexity to all gpio lines.
For one, we must maintain a list of clients requesting the line to be
able to do proper refcounting and this needs to be done for all pins as
we don't know beforehand that the given line is going to be shared.

Or add gpio-shared block similar to gpio-hog to prepare a given line for
sharing? I think this might be a better thing to do and some of the code
from gpio-shared.c can be reused.

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
