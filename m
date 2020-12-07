Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613242D10C9
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 13:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbgLGMpu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 07:45:50 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8720 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgLGMpt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 07:45:49 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CqNL060spzkmlP;
        Mon,  7 Dec 2020 20:44:24 +0800 (CST)
Received: from [127.0.0.1] (10.57.22.126) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Mon, 7 Dec 2020
 20:44:56 +0800
Subject: Re: [PATCH v1] gpio: dwapb: mask/unmask IRQ when disable/enable it
To:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
CC:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        <bgolaszewski@baylibre.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxarm@huawei.com>
References: <1606728979-44259-1-git-send-email-luojiaxing@huawei.com>
 <20201130112250.GK4077@smile.fi.intel.com>
 <63f7dcc4-a924-515a-2fea-31ec80f3353e@huawei.com>
 <20201205221522.ifjravnir5bzmjff@mobilestation>
From:   luojiaxing <luojiaxing@huawei.com>
Message-ID: <a25a0eaf-f4ce-b2db-dea2-667fac62985f@huawei.com>
Date:   Mon, 7 Dec 2020 20:44:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20201205221522.ifjravnir5bzmjff@mobilestation>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.57.22.126]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2020/12/6 6:15, Serge Semin wrote:
> On Tue, Dec 01, 2020 at 04:59:21PM +0800, luojiaxing wrote:
>> On 2020/11/30 19:22, Andy Shevchenko wrote:
>>> On Mon, Nov 30, 2020 at 05:36:19PM +0800, Luo Jiaxing wrote:
>>>> The mask and unmask registers are not configured in dwapb_irq_enable() and
>>>> dwapb_irq_disable(). In the following situations, the IRQ will be masked by
>>>> default after the IRQ is enabled:
>>>>
>>>> mask IRQ -> disable IRQ -> enable IRQ
>>>>
>>>> In this case, the IRQ status of GPIO controller is inconsistent with it's
>>>> irq_data too. For example, in __irq_enable(), IRQD_IRQ_DISABLED and
>>>> IRQD_IRQ_MASKED are both clear, but GPIO controller do not perform unmask.
>>> Sounds a bit like a papering over the issue which is slightly different.
>>> Can you elaborate more, why ->irq_mask() / ->irq_unmask() are not being called?
>>
>> Sure, The basic software invoking process is as follows:
>>
>> Release IRQ:
>> free_irq() -> __free_irq() -> irq_shutdown() ->__irq_disable()
>>
>> Disable IRQ:
>> disable_irq() -> __disable_irq_nosync() -> __disable_irq -> irq_disable ->
>> __irq_disable()
>>
>> As shown before, both will call __irq_disable(). The code of it is as
>> follows:
>>
>> if (irqd_irq_disabled(&desc->irq_data)) {
>>      if (mask)
>>          mask_irq(desc);
>>
>> } else {
>>          irq_state_set_disabled(desc);
>>              if (desc->irq_data.chip->irq_disable) {
>> desc->irq_data.chip->irq_disable(&desc->irq_data);
>>                  irq_state_set_masked(desc);
>>              } else if (mask) {
>>                  mask_irq(desc);
>>      }
>> }
>>
>> Because gpio-dwapb.c provides the hook function of irq_disable,
>> __irq_disable() will directly calls chip->irq_disable() instead of
>> mask_irq().
>>
>> For irq_enable(), it's similar and the code is as follows:
>>
>> if (!irqd_irq_disabled(&desc->irq_data)) {
>>      unmask_irq(desc);
>> } else {
>>      irq_state_clr_disabled(desc);
>>      if (desc->irq_data.chip->irq_enable) {
>> desc->irq_data.chip->irq_enable(&desc->irq_data);
>>          irq_state_clr_masked(desc);
>>      } else {
>>          unmask_irq(desc);
>>      }
>> }
>>
>> Similarly, because gpio-dwapb.c provides the hook function of irq_enable,
>> irq_enable() will directly calls chip->irq_enable() but does not call
>> unmask_irq().
>>
>>
>> Therefore, the current handle is as follows:
>>
>> API of IRQ:        |   mask_irq()             | disable_irq()
>> |    enable_irq()
>>
>> gpio-dwapb.c:  |   chip->irq_mask()   | chip->irq_diable()   |
>> chip->irq_enable()
>>
>> I do not know why irq_enable() only calls chip->irq_enable(). However, the
>> code shows that irq_enable() clears the disable and masked flags in the
>> irq_data state.
>>
>> Therefore, for gpio-dwapb.c, I thinks ->irq_enable also needs to clear the
>> disable and masked flags in the hardware register.
>>
> Hmm, that sounds like a problem, but the explanation is a bit unclear
> to me. AFAICS you are saying that the only callbacks which are
> called during the IRQ request/release are the irq_enable(), right?


Yes, but one point needs to be clarified, for IRQ requests, it calls 
irq_enable(); for IRQ release, it calls irq_disable().

Actually I am thinking that why only irq_enable()/irq_disable() is 
called since the mask and enable flags of irq_data are both set.

Does IRQ subsystem expect irq_enable to set both mask and enable? If we 
didn't do that, the state machine of the software is different from 
hardware, at least for mask bit.


> If
> so then the only reason why we haven't got a problem reported due to
> that so far is that the IRQs actually unmasked by default.


yes, I think so, Common drivers do not mask the IRQ before releasing it. 
But that's possible.


>
> In anyway I'd suggest to join someone from the kernel IRQs-related
> subsystem to this discussion to ask their opinion whether the IRQs
> setup procedure is supposed to work like you say and the irq_enable
> shall actually also unmask IRQs.
>
> Thomas, Jason, Mark, could you give us your comment about the issue?
>
> -Sergey
>
>>
>>
> .
>

