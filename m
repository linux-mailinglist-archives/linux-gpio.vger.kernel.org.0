Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A57B162DFF
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 19:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgBRSNg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 13:13:36 -0500
Received: from mail-out.m-online.net ([212.18.0.9]:52340 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgBRSNg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 13:13:36 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 48MTW20VCjz1qrLd;
        Tue, 18 Feb 2020 19:13:34 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 48MTW16kd1z1qwyJ;
        Tue, 18 Feb 2020 19:13:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 64VmRsFO5-ZX; Tue, 18 Feb 2020 19:13:32 +0100 (CET)
X-Auth-Info: 5DiJPN7ZEXVIoN5xaMax7fvwgUZjZzcYczFxU4VoA6k=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 18 Feb 2020 19:13:32 +0100 (CET)
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
From:   Marek Vasut <marex@denx.de>
Message-ID: <088e786c-511e-cf95-fc41-5343b8134407@denx.de>
Date:   Tue, 18 Feb 2020 19:13:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <32e409e6-d475-802a-6a90-c8ba6c0cf6d5@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/18/20 7:10 PM, Alexandre Torgue wrote:
> Hi Marek

Hi,

> On 2/18/20 5:25 PM, Marek Vasut wrote:
>> On 2/18/20 2:12 PM, Alexandre Torgue wrote:
>>> This series adds the possibility to handle gpio interrupts on level.
>>>
>>> GPIO hardware block is directly linked to EXTI block but EXTI handles
>>> external interrupts only on edge. To be able to handle GPIO interrupt on
>>> level a "hack" is done in gpio irq chip: parent interrupt (exti irq
>>> chip)
>>> is retriggered following interrupt type and gpio line value.
>>>
>>> In exti irq chip, retrigger ops function is added.
>>
>> btw. this might be unrelated, but is it possible to have e.g. gpioC2 set
>> as trigger-level-low and gpioD2 set as trigger-edge-falling ? It seems
>> 8eb2dfee9fb1 ("pinctrl: stm32: add lock mechanism for irqmux selection")
>> prevents that.
>>
> 
> No it's not possible. Each gpio line doesn't have a dedicated Exti line
> Each Exti line is muxing between gpio banks.

OK, that confirms my assumption.

> Mapping is done as following:
> 
> EXTI0 = A0 or B0 or C0 .... or Z0 : selected by Mux
> EXTI1 = A1 or B1 or C1 ....or Z1 : selected by Mux
> EXTI2 = A2 or B2 or C2 ....or Z2 : selected by Mux
> ...

Is it at least possible to have IRQs of the same type on the same exti
line? E.g. gpioA2 of trigger-edge-falling and gpioB2 trigger-edge-falling ?
