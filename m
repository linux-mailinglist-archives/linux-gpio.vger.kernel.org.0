Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD4BEFD05
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 13:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730930AbfKEMPX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 07:15:23 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60030 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbfKEMPX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 07:15:23 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5CFDu6016240;
        Tue, 5 Nov 2019 06:15:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572956113;
        bh=IVNt6UdC+cTi5VGpdmF0jAp3b1Ldz7m97HfdaslKCB4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=MEGlyWElvKKhEuuTXd5X4l/OOn4ud76iwcj6QMrikXC91bhaSb+Ly6URy5oZsNJRV
         ZjRD592cI7lea9aBhZXcfWMMqb2WJ5eDiM+OePmOp9KQbRqXRagNxo5kJ/xqXOv+A7
         EHnqzIJSKoM388KkZ21SGNTpsDfZfgGT8kDRA678=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5CFDp6065907;
        Tue, 5 Nov 2019 06:15:13 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 5 Nov
 2019 06:15:13 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 5 Nov 2019 06:15:12 -0600
Received: from [10.250.98.116] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5CFAOK017000;
        Tue, 5 Nov 2019 06:15:10 -0600
Subject: Re: [RFC v2 0/2] gpio: Support for shared GPIO lines on boards
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Mark Brown <broonie@kernel.org>,
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
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <109f9ff2-81e0-6d3d-db60-d48cb0a4e74f@ti.com>
Date:   Tue, 5 Nov 2019 14:15:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbiG5mt3WGEeHWsu-L3dzQJUQjxjGwQXK0cLgZNZ74yWg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 05/11/2019 11:58, Linus Walleij wrote:
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
> 
> There is no such driver today, just a "reset" driver in
> drivers/power/reset that resets the whole system.
> 
> But I see no problem in creating a proper reset driver in drivers/reset
> to handle a few peripherals with a shared GPIO reset line.

Personally, I agree with Mark's comment here:

> [Mark]
> The theory with that was that any usage of this would need the
> higher level code using the GPIO to cooperate so they didn't step
> on each other's toes so the GPIO code should just punt to it.
> 
>> But let's say that a board design will pick two components (C1 and C2)
>> and use the same GPIO line to enable them. We already have the drivers
>> for them and they are used in boards already.
> 
> This is basically an attempt to make a generic implementation of
> that cooperation for simple cases.
> 

This looks like unsolvable problem in generic way.
Lets assume there are some generic shared reset controller invented, but then
- What if some driver is loaded/unloaded and corresponding device uses shared
   reset which is de-asserted already?
   In this case, driver should never ever expect that target device has all
   registers in default state.
- What if reset is required as part of error recovery procedure? The error recovery
   will not be supported by such design.
- PM: Device reset could be part of suspend/resume sequence. if one of the devices
   is wake-up source, but other are not, those devices might be in very unexpected state during resume.
- There could be dependencies on reset timings, shared reset might work for
   similar devices (like set of net phys) and does not work if connected devices are different.

It seems, the only one case when it might help is system boot when:
  - similar devices are connected to the reset line
  - drivers are not expected to be re-loaded
  - device reset is not part of any recovery procedure
  - safe reset timings can be defined for all connected devices
(but hey - if this is boot only then gpio-hogs should work. Are they?)

Actually, MDIO bus is one such example where reset line can be toggled by
as by MDIO bus controller as by PHY drivers.

So, even thing will move forward with this - it'll be good to have noted
above restrictions in documentation.

-- 
Best regards,
grygorii
