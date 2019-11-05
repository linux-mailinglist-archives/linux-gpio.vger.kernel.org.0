Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3E06F04B1
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 19:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390476AbfKESHR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 13:07:17 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:51610 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388711AbfKESHQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 13:07:16 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5I76k5038978;
        Tue, 5 Nov 2019 12:07:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572977226;
        bh=BLXyPhYlFgpHXpZNKuPMNoN7RMejmelp1TZNMcnkh1c=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Cjsw63jRToooey3bcDzwZK3piGbsy7+SamjcK5P+YilD1HSgnPjHnFlCiL/0soeUS
         mlYqbFktBRtPVaXLMW/SXj1WMEu0AKAavA//We5tsQDDXWlcMJ9kplQp47DMDgHavL
         hh8FefGrJWlbKPBkFVqOfxVuqvAJ87f0dlLeZ5ko=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5I76sV088470
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 12:07:06 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 5 Nov
 2019 12:06:51 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 5 Nov 2019 12:06:51 -0600
Received: from [10.250.98.116] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5I73D4070611;
        Tue, 5 Nov 2019 12:07:03 -0600
Subject: Re: [RFC v2 0/2] gpio: Support for shared GPIO lines on boards
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
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
 <109f9ff2-81e0-6d3d-db60-d48cb0a4e74f@ti.com>
 <ffb8e042-7f22-0e6e-f855-afa0dc3236bb@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <61c8c126-3061-e297-8dab-7333316b0754@ti.com>
Date:   Tue, 5 Nov 2019 20:07:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ffb8e042-7f22-0e6e-f855-afa0dc3236bb@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 05/11/2019 14:32, Peter Ujfalusi wrote:
> 
> 
> On 05/11/2019 14.15, Grygorii Strashko wrote:
>>
>>
>> On 05/11/2019 11:58, Linus Walleij wrote:
>>> On Mon, Nov 4, 2019 at 8:11 PM Rob Herring <robh+dt@kernel.org> wrote:
>>>> [Peter]
>>>>> The device needs the RST line to be high, otherwise it is not
>>>>> accessible. If it does not have reset control how can we make sure that
>>>>> the GPIO line is in correct state?
>>>>
>>>> Just like the reset code, drivers register their use of the reset and
>>>> the core tracks users and prevents resetting when not safe. Maybe the
>>>> reset subsystem needs to learn about GPIO resets. (...)
>>>
>>> I agree. Certainly the reset subsystem can do what the regulator
>>> subsystem is already doing: request the GPIO line nonexclusive
>>> and handle any reference counting and/or quirks that are needed
>>> in a hypothetical drivers/reset/reset-gpio.c driver.
>>>
>>> There is no such driver today, just a "reset" driver in
>>> drivers/power/reset that resets the whole system.
>>>
>>> But I see no problem in creating a proper reset driver in drivers/reset
>>> to handle a few peripherals with a shared GPIO reset line.
>>
>> Personally, I agree with Mark's comment here:
>>
>>> [Mark]
>>> The theory with that was that any usage of this would need the
>>> higher level code using the GPIO to cooperate so they didn't step
>>> on each other's toes so the GPIO code should just punt to it.
>>>
>>>> But let's say that a board design will pick two components (C1 and C2)
>>>> and use the same GPIO line to enable them. We already have the drivers
>>>> for them and they are used in boards already.
>>>
>>> This is basically an attempt to make a generic implementation of
>>> that cooperation for simple cases.
>>>
>>
>> This looks like unsolvable problem in generic way.
>> Lets assume there are some generic shared reset controller invented, but
>> then
>> - What if some driver is loaded/unloaded and corresponding device uses
>> shared
>>    reset which is de-asserted already?
>>    In this case, driver should never ever expect that target device has all
>>    registers in default state.
>> - What if reset is required as part of error recovery procedure? The
>> error recovery
>>    will not be supported by such design.
>> - PM: Device reset could be part of suspend/resume sequence. if one of
>> the devices
>>    is wake-up source, but other are not, those devices might be in very
>> unexpected state during resume.
>> - There could be dependencies on reset timings, shared reset might work for
>>    similar devices (like set of net phys) and does not work if connected
>> devices are different.
> 
> and some driver shamelessly implements runtime power/reset control while
> other driver does not (they were never used on board where they had
> shared GPIO, probably power at most)
> 
>>
>> It seems, the only one case when it might help is system boot when:
>>   - similar devices are connected to the reset line
>>   - drivers are not expected to be re-loaded
>>   - device reset is not part of any recovery procedure
>>   - safe reset timings can be defined for all connected devices
>> (but hey - if this is boot only then gpio-hogs should work. Are they?)
> 
> That is another thing which almost works ;)
> w/o gpio binding deferred probing is not possible if the GPIO controller
> is probed later.
> In some cases it might be even impossible to make sure that the GPIO
> controller would probe first (GPIO extender on different i2c bus than
> the user(s) of the gpio line)
> In some cases moving around nodes in DT might artificially make things
> work, but then someone compiles the expander as module, or some 'small'
> change in kernel and the probe order on the bus changes.
> I don't think it is a valid thing to have commits on the DT files
> saying: move the expander front/after the hog affected user since since
> Monday the probe order has changed. Then move it back two weeks later ;)
>

Ok. Above sounds like real problem. The implicit dependence is exist, but can't
be resolved if any driver depends on gpio-hog of some gpio-controller.
Probe deferring of gpio-controller will not lead to probe differing of dependent driver.

Question: will gpio-hog mechanism resolve your case if it works (and probe differing issues)?

-- 
Best regards,
grygorii
