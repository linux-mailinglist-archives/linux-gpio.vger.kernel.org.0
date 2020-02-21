Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 753F91683CA
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 17:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgBUQlN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 11:41:13 -0500
Received: from mail-out.m-online.net ([212.18.0.10]:56838 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgBUQlN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 11:41:13 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 48PHK21SMHz1rd1Q;
        Fri, 21 Feb 2020 17:41:10 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 48PHK20WlYz1r0bZ;
        Fri, 21 Feb 2020 17:41:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id T2YKWe-QNZdI; Fri, 21 Feb 2020 17:41:08 +0100 (CET)
X-Auth-Info: tPcD5NT6YuYT6cAPtv9wImntzVhf6GYyvo9WLMRjP8E=
Received: from [127.0.0.1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri, 21 Feb 2020 17:41:08 +0100 (CET)
Subject: Re: [PATCH v2 0/2] Add GPIO level-sensitive interrupt support
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20200218131218.10789-1-alexandre.torgue@st.com>
 <b5a2dcab-06db-4863-ac5c-28f4ef0c5ac9@denx.de>
 <32e409e6-d475-802a-6a90-c8ba6c0cf6d5@st.com>
 <088e786c-511e-cf95-fc41-5343b8134407@denx.de>
 <d271f09b-6391-779a-b133-66bcdfbb0ec6@st.com>
 <38e7cf57-2f89-7615-0841-316355a9102f@denx.de>
 <66520848-f630-e210-aecb-96c8828605b7@st.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <faf55c81-e28f-20ed-ffdc-d20f00e3aefc@denx.de>
Date:   Fri, 21 Feb 2020 17:41:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <66520848-f630-e210-aecb-96c8828605b7@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/20/20 2:09 PM, Alexandre Torgue wrote:
> Hi Marek

Hi,

> On 2/19/20 6:24 PM, Marek Vasut wrote:
>> On 2/19/20 10:20 AM, Alexandre Torgue wrote:
>> Hi,
>> [...]
>>>>>>> This series adds the possibility to handle gpio interrupts on level.
>>>>>>>
>>>>>>> GPIO hardware block is directly linked to EXTI block but EXTI
>>>>>>> handles
>>>>>>> external interrupts only on edge. To be able to handle GPIO
>>>>>>> interrupt on
>>>>>>> level a "hack" is done in gpio irq chip: parent interrupt (exti irq
>>>>>>> chip)
>>>>>>> is retriggered following interrupt type and gpio line value.
>>>>>>>
>>>>>>> In exti irq chip, retrigger ops function is added.
>>>>>>
>>>>>> btw. this might be unrelated, but is it possible to have e.g. gpioC2
>>>>>> set
>>>>>> as trigger-level-low and gpioD2 set as trigger-edge-falling ? It
>>>>>> seems
>>>>>> 8eb2dfee9fb1 ("pinctrl: stm32: add lock mechanism for irqmux
>>>>>> selection")
>>>>>> prevents that.
>>>>>>
>>>>>
>>>>> No it's not possible. Each gpio line doesn't have a dedicated Exti
>>>>> line
>>>>> Each Exti line is muxing between gpio banks.
>>>>
>>>> OK, that confirms my assumption.
>>>>
>>>>> Mapping is done as following:
>>>>>
>>>>> EXTI0 = A0 or B0 or C0 .... or Z0 : selected by Mux
>>>>> EXTI1 = A1 or B1 or C1 ....or Z1 : selected by Mux
>>>>> EXTI2 = A2 or B2 or C2 ....or Z2 : selected by Mux
>>>>> ...
>>>>
>>>> Is it at least possible to have IRQs of the same type on the same exti
>>>> line? E.g. gpioA2 of trigger-edge-falling and gpioB2
>>>> trigger-edge-falling ?
>>>>
>>>
>>> Sorry I don't catch your point. If you already succeed to get gpioA2,
>>> then you will failed to get gpioB2 but looking at function call stack we
>>> could get an other issue.
>>
>> Considering the EXTI line limitations, I'd like to know what kind of IRQ
>> input configuration is allowed/valid and what kind of configuration is
>> not valid.
> 
> As a mux is used to select which GPIO[A..Z]_X has to be mapped on exti_X
> line, only one GPIO can be used on the EXTI line.
> 
> For example, on EXTI2 you could map either gpioa2 or gpiob2 or
> ....gpioz2 but not gpioa2 and gpiob2 in the same time.

Got it, thank you for the clarification.

Maybe that could be something to improve for MP2 :-)
