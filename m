Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02B8EEFC2D
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 12:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730757AbfKELPH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 06:15:07 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53478 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbfKELPH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 06:15:07 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5BEjOa001918;
        Tue, 5 Nov 2019 05:14:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572952486;
        bh=Fy91A3N2OFV5GYmqUZ6i9xvY6q3zrmU/FLigLI415zQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=n71rvcnDEP5e01oJ+V0SlbkDMMTbeLL/Q9n2wEkqCG6pDyeaNlPAjuQl3y4oXNfOc
         63/8yTRKVGoHC6mwd+XT/6lZvOLvb6EtGjS2wyDXtZJTNIToxvsRLlNqDz87DgnZ4l
         qqgDMbADkHqrilAsQGV9CRsRgTz88mpuKuFLmB70=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5BEjLa095012
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 05:14:45 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 5 Nov
 2019 05:14:28 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 05:14:28 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5BEewB014951;
        Tue, 5 Nov 2019 05:14:40 -0600
Subject: Re: [RFC v2 0/2] gpio: Support for shared GPIO lines on boards
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
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
 <CACRpkdbiG5mt3WGEeHWsu-L3dzQJUQjxjGwQXK0cLgZNZ74yWg@mail.gmail.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <3beb4b9e-8908-42c8-ee89-369f0329b775@ti.com>
Date:   Tue, 5 Nov 2019 13:15:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbiG5mt3WGEeHWsu-L3dzQJUQjxjGwQXK0cLgZNZ74yWg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 05/11/2019 11.58, Linus Walleij wrote:
> On Mon, Nov 4, 2019 at 8:11 PM Rob Herring <robh+dt@kernel.org> wrote:
>> [Peter]
>>> The device needs the RST line to be high, otherwise it is not
>>> accessible. If it does not have reset control how can we make sure that
>>> the GPIO line is in correct state?
>>
>> Just like the reset code, drivers register their use of the reset and
>> the core tracks users and prevents resetting when not safe. Maybe the
>> reset subsystem needs to learn about GPIO resets. (...)
> 
> I agree. Certainly the reset subsystem can do what the regulator
> subsystem is already doing: request the GPIO line nonexclusive
> and handle any reference counting and/or quirks that are needed
> in a hypothetical drivers/reset/reset-gpio.c driver.

I did wrote the reset-gpio driver first ;)
then it failed the thought test on several levels.

to get a reset control one either use the shared or exclusive API.
Depending on which one you use, the behavior changes. With exclusive it
works like a GPIO (no refcounting of asserts), with shared it refcounts.

It fails flat if I boot with old dtb blob which did not had the "resets"
and "#reset-cells" (from the user's point of view). Even if the old dtb
had rst/enable/reset-gpios defined.

It is kind of hard to use it for 'Output Enable' type of gpios. They are
not reset or enable signals for the peripheral, but to open a gate to
outside, for example allow an amplifier to drive the analog line on (one
of) it's output for example.

> There is no such driver today, just a "reset" driver in
> drivers/power/reset that resets the whole system.

Yep, I have checked that as well before I wrote my own gpio-reset

> But I see no problem in creating a proper reset driver in drivers/reset
> to handle a few peripherals with a shared GPIO reset line.

Even if we have a reset-gpio driver we will have the same issue that the
regulator might reset things underneath the tiddly refcounted reset line
for non regulator users, plus one extra which is using the line as
output enable.

With the gpio-shared all of these can be handled in a nice way and we
can add the pass-through mode to it which is assumed by some setups or
use refcounting as it is in the initial patch.

And we need to modify the drivers to ask for shared/nonexclusive reset/gpio.

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
