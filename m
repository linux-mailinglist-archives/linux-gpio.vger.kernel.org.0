Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDD60164525
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 14:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgBSNSB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 08:18:01 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:15292 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726671AbgBSNSA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Feb 2020 08:18:00 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01JDE98i013103;
        Wed, 19 Feb 2020 14:17:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=zifsjtq8jgW/VpIDS+qc8/zgoiL+Ci7sDrNfN7sef08=;
 b=te5G1smDpNOhPSlD+LLVY/1ijJNoOY1sRCQFnyTh7je65xUWwx5mkF8EQgsjhVcOn6j5
 U7d87r9UfnJJFcyO3+4aoujeY4Ld0GBabd665tb+afBx7W4fcmGNan/2/shRsrZlQMB8
 nlbe1nKZ34NuV14k1eOXfi1bACWdpWIy/pb5l04fX5xwBXL6R9CFz+Ucjn6tj7VLyfEW
 Pj2zMN9e6nhvnHr6XVamGnuPi3IqdFi7ZTHYFpJIcqa4HM/zK9k9RpTfM7lorirbH8Me
 LVN0lkmJcdaZhFWloStXUvNpze34lvH8JttQEl4kyUOnwGAs9a+RggPqYIkjA68m/G/P 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y8ub5k72h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Feb 2020 14:17:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2A8BC10002A;
        Wed, 19 Feb 2020 14:17:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 169002B8970;
        Wed, 19 Feb 2020 14:17:38 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 19 Feb
 2020 14:17:36 +0100
Subject: Re: [PATCH v2 1/2] irqchip/stm32: Add irq retrigger support
To:     Marc Zyngier <maz@kernel.org>
CC:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>, <marex@denx.de>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200218131218.10789-1-alexandre.torgue@st.com>
 <20200218131218.10789-2-alexandre.torgue@st.com>
 <16d27f75-8157-7a92-ae61-b5b3ab05bdd9@st.com>
 <608d9c84813323ee3839f6ac21aa8f4e@kernel.org>
 <ae69e38a-78f9-ca68-c48c-86275e41b3bb@st.com>
 <10cabf9edf901fb148a1a2a5e2448845@kernel.org>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <716c20a0-bc18-8bb5-b380-14046a384a98@st.com>
Date:   Wed, 19 Feb 2020 14:17:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <10cabf9edf901fb148a1a2a5e2448845@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-19_03:2020-02-19,2020-02-19 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 2/19/20 2:13 PM, Marc Zyngier wrote:
> On 2020-02-19 13:07, Alexandre Torgue wrote:
>> On 2/19/20 12:43 PM, Marc Zyngier wrote:
>>> On 2020-02-19 11:33, Alexandre Torgue wrote:
>>>> Fix Marc email address
>>>>
>>>> On 2/18/20 2:12 PM, Alexandre Torgue wrote:
>>>>> This commit introduces retrigger support for stm32_ext_h chip.
>>>>> It consists to rise the GIC interrupt mapped to an EXTI line.
>>>>>
>>>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>>>>>
>>>>> diff --git a/drivers/irqchip/irq-stm32-exti.c 
>>>>> b/drivers/irqchip/irq-stm32-exti.c
>>>>> index e00f2fa27f00..c971d115edb4 100644
>>>>> --- a/drivers/irqchip/irq-stm32-exti.c
>>>>> +++ b/drivers/irqchip/irq-stm32-exti.c
>>>>> @@ -604,12 +604,24 @@ static void stm32_exti_h_syscore_deinit(void)
>>>>>       unregister_syscore_ops(&stm32_exti_h_syscore_ops);
>>>>>   }
>>>>>   +static int stm32_exti_h_retrigger(struct irq_data *d)
>>>>> +{
>>>>> +    struct stm32_exti_chip_data *chip_data = 
>>>>> irq_data_get_irq_chip_data(d);
>>>>> +    const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
>>>>> +    void __iomem *base = chip_data->host_data->base;
>>>>> +    u32 mask = BIT(d->hwirq % IRQS_PER_BANK);
>>>>> +
>>>>> +    writel_relaxed(mask, base + stm32_bank->swier_ofst);
>>>>> +
>>>>> +    return irq_chip_retrigger_hierarchy(d);
>>>
>>> Calling irq_chip_retrigger_hierarchy here is really odd. If the write
>>> above has the effect of making the interrupt pending again, why do you
>>> need to force the retrigger any further?
>>
>> To be honest, as we use hierarchical irq_chip, I thought it was the
>> way to follow (to retrigger parent irq_chip). It makes maybe no sens
>> here.
> 
> Indeed, it looks perfectly pointless. What irq_chip_retrigger_hierarchy()
> does is to look for the first parent irqchip that is able to retrigger
> the interrupt. Guess what, you've just done that already. And once you've
> generated the interrupt, you don't need to ask the other irqchips in the
> chain to do the same thing.

I agree. I gonna remove it v3.

Thanks for the feeback.
Alex

>> The most important to regenerate gic interrupt (associate to the exti
>> line) is to write in SWIER register.
> 
> Quite. Hence my question.
> 
>          M.
