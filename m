Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C420A164028
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 10:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgBSJUw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 04:20:52 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:3710 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726210AbgBSJUw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Feb 2020 04:20:52 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01J9Dklq019115;
        Wed, 19 Feb 2020 10:20:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=drNFQy5Nym5BRpRAJATahkWJTxzhFZMOhGlvwzCfLzo=;
 b=myvt75/wzffVMTxrJAGDUUJara5rP6SUyX1Ms6XdIRUiiVVjeMxAPz/nTFe/fmY+/jVF
 sQ2EKRrNZrSBJDqV8isAI9U9vqcI36UMqlb9cHIuaBaaX1xV0zLkqKCrR+VGn05UIdCP
 258g8FeQWS2kNCJLnwNf/lDzlOz2HwT/ajbv+m8XkRbj9QnrF5YwZVzDEQFggM9cMf+f
 QF/L8eGg1kFPIKd6f38bioUViLibtSCavrboGVFuxaoW8dguCQBY9bwb5iXsKkqIntn6
 TCwB9Rf+Q8KbeEk3zXhSWm09GFHWSnDhnPOyNTzHazMlWzPi1qFROQM0wWJCDImsvENW 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y8ub020hm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Feb 2020 10:20:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB05B100039;
        Wed, 19 Feb 2020 10:20:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9657D2A6C79;
        Wed, 19 Feb 2020 10:20:27 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 19 Feb
 2020 10:20:26 +0100
Subject: Re: [PATCH v2 0/2] Add GPIO level-sensitive interrupt support
To:     Marek Vasut <marex@denx.de>, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
References: <20200218131218.10789-1-alexandre.torgue@st.com>
 <b5a2dcab-06db-4863-ac5c-28f4ef0c5ac9@denx.de>
 <32e409e6-d475-802a-6a90-c8ba6c0cf6d5@st.com>
 <088e786c-511e-cf95-fc41-5343b8134407@denx.de>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <d271f09b-6391-779a-b133-66bcdfbb0ec6@st.com>
Date:   Wed, 19 Feb 2020 10:20:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <088e786c-511e-cf95-fc41-5343b8134407@denx.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-19_02:2020-02-19,2020-02-19 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 2/18/20 7:13 PM, Marek Vasut wrote:
> On 2/18/20 7:10 PM, Alexandre Torgue wrote:
>> Hi Marek
> 
> Hi,
> 
>> On 2/18/20 5:25 PM, Marek Vasut wrote:
>>> On 2/18/20 2:12 PM, Alexandre Torgue wrote:
>>>> This series adds the possibility to handle gpio interrupts on level.
>>>>
>>>> GPIO hardware block is directly linked to EXTI block but EXTI handles
>>>> external interrupts only on edge. To be able to handle GPIO interrupt on
>>>> level a "hack" is done in gpio irq chip: parent interrupt (exti irq
>>>> chip)
>>>> is retriggered following interrupt type and gpio line value.
>>>>
>>>> In exti irq chip, retrigger ops function is added.
>>>
>>> btw. this might be unrelated, but is it possible to have e.g. gpioC2 set
>>> as trigger-level-low and gpioD2 set as trigger-edge-falling ? It seems
>>> 8eb2dfee9fb1 ("pinctrl: stm32: add lock mechanism for irqmux selection")
>>> prevents that.
>>>
>>
>> No it's not possible. Each gpio line doesn't have a dedicated Exti line
>> Each Exti line is muxing between gpio banks.
> 
> OK, that confirms my assumption.
> 
>> Mapping is done as following:
>>
>> EXTI0 = A0 or B0 or C0 .... or Z0 : selected by Mux
>> EXTI1 = A1 or B1 or C1 ....or Z1 : selected by Mux
>> EXTI2 = A2 or B2 or C2 ....or Z2 : selected by Mux
>> ...
> 
> Is it at least possible to have IRQs of the same type on the same exti
> line? E.g. gpioA2 of trigger-edge-falling and gpioB2 trigger-edge-falling ?
> 

Sorry I don't catch your point. If you already succeed to get gpioA2, 
then you will failed to get gpioB2 but looking at function call stack we 
could get an other issue.

Lets take example where you succeed to get gpioa2 as interrupt (using 
interrupt bindings) and now you try to do the same for gpiob2, you will 
have (roughly):

stm32_gpio_irq_request_resources (for gpiob2) --> succeed

stm32_gpio_set_type
  |
  |--> stm32_exti_set_type type -> change exti line 2 trigger registers
                                   with gpiob2 binding.

stm32_gpio_domain_activate --> failed as exti line2 is already used
			       by gpioa2.

So as stm32_gpio_set_type is called before checking than exti line is 
available, type could be changed and behavior of gpioa2 interrupt broken.

Solution would be to move the exti line mux check from 
stm32_gpio_domain_activate to  stm32_gpio_irq_request_resources callback.

Regards
Alex




