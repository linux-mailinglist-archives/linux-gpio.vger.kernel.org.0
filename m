Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24146EAB3D
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 09:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbfJaIBF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 04:01:05 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35736 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfJaIBF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 04:01:05 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9V80tYr099287;
        Thu, 31 Oct 2019 03:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572508855;
        bh=TKe46EoF1J60ShuFHgR4qomu3QEwz48sNCBTYx/91/g=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Z82auzUS36CE6SDIajfIV5GVqXyvm0MdUM2vZQwy7QPNnOg7JRHukjfaOarY/WBY5
         iQh3/UuGeO55Qlkz/v23GMqgbe4oBFuaJa/fnJt3sBs+p6ipEwo9jCN1YENffpxO+S
         zKUZkRnJQ2yT2AORtx6k2wFA686JgUYWYe1YRkys=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9V80sEM067010
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 31 Oct 2019 03:00:55 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 31
 Oct 2019 03:00:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 31 Oct 2019 03:00:54 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9V80pDA057797;
        Thu, 31 Oct 2019 03:00:52 -0500
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
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <1258a5bf-a829-d47a-902f-bf2c3db07513@ti.com>
Date:   Thu, 31 Oct 2019 10:01:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJ4WdaRvmZcjQG-jVyOOeKZX9fn1WcQZGWfUPqwunQCFw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 30/10/2019 20.49, Rob Herring wrote:
> On Wed, Oct 30, 2019 at 9:30 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>>
>>
>>
>> On 30/10/2019 16.17, Mark Brown wrote:
>>> On Wed, Oct 30, 2019 at 03:32:09PM +0200, Peter Ujfalusi wrote:
>>>> On 30/10/2019 15.12, Rob Herring wrote:
>>>
>>>>> Why can't we just add a shared flag like we have for interrupts?
>>>>> Effectively, we have that for resets too, it's just hardcoded in the
>>>>> the drivers.
>>>
>>>> This would be kind of the same thing what the
>>>> GPIOD_FLAGS_BIT_NONEXCLUSIVE does, which was a quick workaround for
>>>> fixed-regulators afaik.
>>>
>>> The theory with that was that any usage of this would need the
>>> higher level code using the GPIO to cooperate so they didn't step
>>> on each other's toes so the GPIO code should just punt to it.
>>
>> But from the client driver point of view a GPIO is still GPIO and if the
>> components are unrelated then it is hard to patch things together from
>> the top.
> 
> You can't escape a driver being aware. If a driver depends on that
> GPIO to actually be set to states the driver says, then it can't be
> guaranteed to work. For example, maybe the driver assumes the device
> is in reset state after toggling reset and doesn't work if not in
> reset state. The driver has to be aware no matter what you do in DT.

That's true for some device, but it is also true that some can not
tolerate being reset without them knowing it.

If all users of the shared GPIO have full control over it then they can
just toggle it whatever way they want. How would a regulator, codec,
amplifier would negotiate on what to do with the shared GPIO?

Another not uncommon setup is when the two components needs different level:
C1: ENABLE is high active
C2: RESET is high active

To enable C1, the GPIO should be high. To enable C2 the GPIO must be low.
In the board one of the branch of the shared GPIO needs (and have) a
logic inverter.

If they both control the same GPIO then they must have requested it with
different GPIO_ACTIVE_ since the drivers are written according to chip
spec, so C1 sets the GPIO to 1, C2 sets it to 0, the inversion for one
of them must happen in gpio core, right?

It should be possible to add pass-through mode for gpio-shared so that
all requests would propagate to the root GPIO if that's what needed for
some setups.

That way the gpio-shared would nicely handle the GPIO inversions, would
be able to handle cases to avoid unwanted reset/enable of components or
allow components to be ninja-reset.

I think it would be possible to add gpiod_is_shared(struct gpio_desc
*desc) so users can check if the GPIO is shared - it would only return
true if the gpio-shared is not in pass-through mode so they can know
that the state they see on their gpio desc is not necessary matching
with reality.
Probably another gpiod_shared_get_root_value() to fetch the root's state?

I intentionally not returning that in the driver as clients might skip a
gpio_set_value() seeing that the GPIO line is already in a state they
would want it, but that would not register their needs for the level.

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
