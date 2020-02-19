Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6E5164BE3
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 18:28:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgBSR2y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 12:28:54 -0500
Received: from mail-out.m-online.net ([212.18.0.9]:38158 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgBSR2y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 12:28:54 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 48N4Sy0XBmz1qrMV;
        Wed, 19 Feb 2020 18:28:50 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 48N4Sx6ZC6z1qx0K;
        Wed, 19 Feb 2020 18:28:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 3JamWYMpJdr7; Wed, 19 Feb 2020 18:28:48 +0100 (CET)
X-Auth-Info: +eqKCJ9/Kpkal2WS3YfV5JluqC+AvVPDD2Bszf4YLMU=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 19 Feb 2020 18:28:48 +0100 (CET)
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
From:   Marek Vasut <marex@denx.de>
Message-ID: <38e7cf57-2f89-7615-0841-316355a9102f@denx.de>
Date:   Wed, 19 Feb 2020 18:24:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <d271f09b-6391-779a-b133-66bcdfbb0ec6@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/19/20 10:20 AM, Alexandre Torgue wrote:
Hi,
[...]
>>>>> This series adds the possibility to handle gpio interrupts on level.
>>>>>
>>>>> GPIO hardware block is directly linked to EXTI block but EXTI handles
>>>>> external interrupts only on edge. To be able to handle GPIO
>>>>> interrupt on
>>>>> level a "hack" is done in gpio irq chip: parent interrupt (exti irq
>>>>> chip)
>>>>> is retriggered following interrupt type and gpio line value.
>>>>>
>>>>> In exti irq chip, retrigger ops function is added.
>>>>
>>>> btw. this might be unrelated, but is it possible to have e.g. gpioC2
>>>> set
>>>> as trigger-level-low and gpioD2 set as trigger-edge-falling ? It seems
>>>> 8eb2dfee9fb1 ("pinctrl: stm32: add lock mechanism for irqmux
>>>> selection")
>>>> prevents that.
>>>>
>>>
>>> No it's not possible. Each gpio line doesn't have a dedicated Exti line
>>> Each Exti line is muxing between gpio banks.
>>
>> OK, that confirms my assumption.
>>
>>> Mapping is done as following:
>>>
>>> EXTI0 = A0 or B0 or C0 .... or Z0 : selected by Mux
>>> EXTI1 = A1 or B1 or C1 ....or Z1 : selected by Mux
>>> EXTI2 = A2 or B2 or C2 ....or Z2 : selected by Mux
>>> ...
>>
>> Is it at least possible to have IRQs of the same type on the same exti
>> line? E.g. gpioA2 of trigger-edge-falling and gpioB2
>> trigger-edge-falling ?
>>
> 
> Sorry I don't catch your point. If you already succeed to get gpioA2,
> then you will failed to get gpioB2 but looking at function call stack we
> could get an other issue.

Considering the EXTI line limitations, I'd like to know what kind of IRQ
input configuration is allowed/valid and what kind of configuration is
not valid.

> Lets take example where you succeed to get gpioa2 as interrupt (using
> interrupt bindings) and now you try to do the same for gpiob2, you will
> have (roughly):
> 
> stm32_gpio_irq_request_resources (for gpiob2) --> succeed
> 
> stm32_gpio_set_type
>  |
>  |--> stm32_exti_set_type type -> change exti line 2 trigger registers
>                                   with gpiob2 binding.
> 
> stm32_gpio_domain_activate --> failed as exti line2 is already used
>                    by gpioa2.
> 
> So as stm32_gpio_set_type is called before checking than exti line is
> available, type could be changed and behavior of gpioa2 interrupt broken.
> 
> Solution would be to move the exti line mux check from
> stm32_gpio_domain_activate to  stm32_gpio_irq_request_resources callback.

So the hardware does support using both gpioA2 and gpioB2 as an
interrupt source, for different drivers, if they are of the same
interrupt type. Except the current implementation does not permit that.

If the interrupt types are different, that is not supported by the hardware.

Correct ?
