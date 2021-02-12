Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84235319DA6
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 12:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbhBLLzE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 06:55:04 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50784 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbhBLLyr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 06:54:47 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11CBrJfK053185;
        Fri, 12 Feb 2021 05:53:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1613130799;
        bh=fBXXLq6KfeaXtjCrONVqVRjVy8lzIgiUm/maW9F9qvQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eEMwLeXAj1ozQgUECeXOg/2JT1IEbuKUiLK6kj/DtT2TkMQD7CyIIg9G5DdZCJgTp
         VrPFTY7nnNHzhgyrWcb1MvDgChPFLEIbhC/lJIaEFFO04yvINClSbToqz+0Cp9zdyw
         j1aUHR4XHrsk0OjI3Hlq3iRXG3uoEEC32sNsU3wU=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11CBrJh3123338
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 12 Feb 2021 05:53:19 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 12
 Feb 2021 05:53:18 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 12 Feb 2021 05:53:19 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11CBrEVs093445;
        Fri, 12 Feb 2021 05:53:15 -0600
Subject: Re: [Linuxarm] Re: [PATCH for next v1 1/2] gpio: omap: Replace
 raw_spin_lock_irqsave with raw_spin_lock in omap_gpio_irq_handler()
To:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Arnd Bergmann <arnd@kernel.org>,
        luojiaxing <luojiaxing@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxarm@openeuler.org" <linuxarm@openeuler.org>
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <1612774577-55943-2-git-send-email-luojiaxing@huawei.com>
 <fab1e871-08e4-fc71-9dbf-9bcacf18e2e1@ti.com>
 <CAK8P3a0m4ocfLyJZ5wMxyKESYUJ5um5sb5MyAzC8ckCb6qAH5g@mail.gmail.com>
 <d5465b81-bb53-49ee-a556-40d208deb765@ti.com>
 <a61ef337fd1c4538a47fe855920f95d3@hisilicon.com>
 <CAK8P3a3SHQNjF5ZpqHQweG7BQ52Xi1hQKDiMVKq4aNK_7VDw6w@mail.gmail.com>
 <e34a4085-268f-1cd0-a5dc-a87a2e655fe2@ti.com>
 <2a12cf7a21f74a0c9e2552a467b77fae@hisilicon.com>
 <YCZfBMPwmzD2U/4c@smile.fi.intel.com>
 <c4a07bef5dd24fd2af0aa7fe4c78b903@hisilicon.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <33720e72-a438-8ffe-1b5f-38756738ad9b@ti.com>
Date:   Fri, 12 Feb 2021 13:53:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c4a07bef5dd24fd2af0aa7fe4c78b903@hisilicon.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 12/02/2021 13:29, Song Bao Hua (Barry Song) wrote:
> 
> 
>> -----Original Message-----
>> From: Andy Shevchenko [mailto:andy.shevchenko@gmail.com]
>> Sent: Friday, February 12, 2021 11:57 PM
>> To: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>
>> Cc: Grygorii Strashko <grygorii.strashko@ti.com>; Arnd Bergmann
>> <arnd@kernel.org>; luojiaxing <luojiaxing@huawei.com>; Linus Walleij
>> <linus.walleij@linaro.org>; Santosh Shilimkar <ssantosh@kernel.org>; Kevin
>> Hilman <khilman@kernel.org>; open list:GPIO SUBSYSTEM
>> <linux-gpio@vger.kernel.org>; linux-kernel@vger.kernel.org;
>> linuxarm@openeuler.org
>> Subject: Re: [Linuxarm] Re: [PATCH for next v1 1/2] gpio: omap: Replace
>> raw_spin_lock_irqsave with raw_spin_lock in omap_gpio_irq_handler()
>>
>> On Fri, Feb 12, 2021 at 10:42:19AM +0000, Song Bao Hua (Barry Song) wrote:
>>>> From: Grygorii Strashko [mailto:grygorii.strashko@ti.com]
>>>> Sent: Friday, February 12, 2021 11:28 PM
>>>> On 12/02/2021 11:45, Arnd Bergmann wrote:
>>>>> On Fri, Feb 12, 2021 at 6:05 AM Song Bao Hua (Barry Song)
>>>>> <song.bao.hua@hisilicon.com> wrote:
>>
>>>>>>> Note. there is also generic_handle_irq() call inside.
>>>>>>
>>>>>> So generic_handle_irq() is not safe to run in thread thus requires
>>>>>> an interrupt-disabled environment to run? If so, I'd rather this
>>>>>> irqsave moved into generic_handle_irq() rather than asking everyone
>>>>>> calling it to do irqsave.
>>>>>
>>>>> In a preempt-rt kernel, interrupts are run in task context, so they clearly
>>>>> should not be called with interrupts disabled, that would defeat the
>>>>> purpose of making them preemptible.
>>>>>
>>>>> generic_handle_irq() does need to run with in_irq()==true though,
>>>>> but this should be set by the caller of the gpiochip's handler, and
>>>>> it is not set by raw_spin_lock_irqsave().
>>>>
>>>> It will produce warning from __handle_irq_event_percpu(), as this is IRQ
>>>> dispatcher
>>>> and generic_handle_irq() will call one of handle_level_irq or
>> handle_edge_irq.
>>>>
>>>> The history behind this is commit 450fa54cfd66 ("gpio: omap: convert to
>> use
>>>> generic irq handler").
>>>>
>>>> The resent related discussion:
>>>> https://lkml.org/lkml/2020/12/5/208
>>>
>>> Ok, second thought. irqsave before generic_handle_irq() won't defeat
>>> the purpose of preemption too much as the dispatched irq handlers by
>>> gpiochip will run in their own threads but not in the thread of
>>> gpiochip's handler.
>>>
>>> so looks like this patch can improve by:
>>> * move other raw_spin_lock_irqsave to raw_spin_lock;
>>> * keep the raw_spin_lock_irqsave before generic_handle_irq() to mute
>>> the warning in genirq.
>>
>> Isn't the idea of irqsave is to prevent dead lock from the process context when
>> we get interrupt on the *same* CPU?
> 
> Anyway, gpiochip is more tricky as it is also a irq dispatcher. Moving
> spin_lock_irq to spin_lock in the irq handler of non-irq dispatcher
> driver is almost always correct.
> 
> But for gpiochip, would the below be true though it is almost alway true
> for non-irq dispatcher?
> 
> 1. While gpiochip's handler runs in hardIRQ, interrupts are disabled, so no more
> interrupt on the same cpu -> No deadleak.
> 
> 2. While gpiochip's handler runs in threads
> * other non-threaded interrupts such as timer tick might come on same cpu,
> but they are an irrelevant driver and thus they are not going to get the
> lock gpiochip's handler has held. -> no deadlock.
> * other devices attached to this gpiochip might get interrupts, since
> gpiochip's handler is running in threads, raw_spin_lock can help avoid
> messing up the critical data by two threads -> still no deadlock.

The worst RT case I can imagine is when gpio API is still called from hard IRQ context by some
other device driver - some toggling for example.
Note. RT or "threadirqs" does not mean gpiochip become sleepable.

In this case:
  threaded handler
    raw_spin_lock
	IRQ from other device
           hard_irq handler
             gpiod_x()
		raw_spin_lock_irqsave() -- oops

But in general, what are the benefit of such changes at all, except better marking call context annotation,
so we are spending so much time on it?


-- 
Best regards,
grygorii
