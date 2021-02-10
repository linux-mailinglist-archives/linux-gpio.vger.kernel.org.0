Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07EA5315DEA
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 04:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbhBJDoG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 22:44:06 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:12887 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbhBJDoF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 22:44:05 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Db5D75nRfz7j2F;
        Wed, 10 Feb 2021 11:41:59 +0800 (CST)
Received: from [127.0.0.1] (10.40.192.131) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Wed, 10 Feb 2021
 11:43:19 +0800
Subject: Re: [Linuxarm] [PATCH for next v1 0/2] gpio: few clean up patches to
 replace spin_lock_irqsave with spin_lock
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        "Kevin Hilman" <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        <linuxarm@openeuler.org>
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <2b8001bb-0bcd-3fea-e15c-2722e7243209@huawei.com>
 <CAHp75VcpeYpsW6B85F0u=B+GToNh=1fYdRSMeQqE0vOtOdSi8A@mail.gmail.com>
 <1a5dfcf2-11a2-f549-782d-447d58e21305@huawei.com>
 <CAHp75Vd5UV3E79sdq8uQ4pgjFORdJknpm-g7No3tomnKhinMnw@mail.gmail.com>
From:   luojiaxing <luojiaxing@huawei.com>
Message-ID: <c2458ac9-669b-bd46-df98-7d86d38459b1@huawei.com>
Date:   Wed, 10 Feb 2021 11:43:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd5UV3E79sdq8uQ4pgjFORdJknpm-g7No3tomnKhinMnw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.40.192.131]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2021/2/9 17:42, Andy Shevchenko wrote:
> On Tue, Feb 9, 2021 at 11:24 AM luojiaxing <luojiaxing@huawei.com> wrote:
>> On 2021/2/8 21:28, Andy Shevchenko wrote:
>>> On Mon, Feb 8, 2021 at 11:11 AM luojiaxing <luojiaxing@huawei.com> wrote:
>>>> Sorry, my operation error causes a patch missing from this patch set. I
>>>> re-send the patch set. Please check the new one.
>>> What is the new one?! You have to give proper versioning and change
>>> log for your series.
>> sure, I will send a new one later, but let me answer your question first.
>>
>>>> On 2021/2/8 16:56, Luo Jiaxing wrote:
>>>>> There is no need to use API with _irqsave in hard IRQ handler, So replace
>>>>> those with spin_lock.
>>> How do you know that another CPU in the system can't serve the
> The keyword here is: *another*.


ooh, sorry, now I got your point.


As to me, I don't think another CPU can serve the IRQ when one CPU 
runing hard IRQ handler,

except it's a per CPU interrupts.


The following is a simple call logic when IRQ come.

elx_irq -> handle_arch_irq -> __handle_domain_irq -> desc->handle_irq -> 
handle_irq_event


Assume that two CPUs receive the same IRQ and enter the preceding 
process. Both of them will go to desc->handle_irq().

In handle_irq(), raw_spin_lock(&desc->lock) always be called first. 
Therefore, even if two CPUs are running handle_irq(),

only one can get the spin lock. Assume that CPU A obtains the spin lock. 
Then CPU A will sets the status of irq_data to

IRQD_IRQ_INPROGRESS in handle_irq_event() and releases the spin lock. 
Even though CPU B gets the spin lock later and

continue to run handle_irq(), but the check of irq_may_run(desc) causes 
it to exit.


so, I think we don't own the situation that two CPU server the hard IRQ 
handler at the same time.


>
>>> following interrupt from the hardware at the same time?
>> Yes, I have some question before.
>>
>> There are some similar discussion here,  please take a look, Song baohua
>> explained it more professionally.
>>
>> https://lore.kernel.org/lkml/e949a474a9284ac6951813bfc8b34945@hisilicon.com/
>>
>> Here are some excerpts from the discussion:
>>
>> I think the code disabling irq in hardIRQ is simply wrong.
> Why?


I mention the following call before.

elx_irq -> handle_arch_irq -> __handle_domain_irq -> desc->handle_irq -> 
handle_irq_event


__handle_domain_irq() will call irq_enter(), it ensures that the IRQ 
processing of the current CPU can not be preempted.

So I think this is the reason why Song baohua said it's not need to 
disable IRQ in hardIRQ handler.


>
>> Since this commit
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e58aa3d2d0cc
>> genirq: Run irq handlers with interrupts disabled
>>
>> interrupt handlers are definitely running in a irq-disabled context
>> unless irq handlers enable them explicitly in the handler to permit
>> other interrupts.
> This doesn't explain any changes in the behaviour on SMP.
> IRQ line can be disabled on a few stages:
>   a) on the source (IP that generates an event)
>   b) on IRQ router / controller
>   c) on CPU side


yes, you are right.


>
> The commit above is discussing (rightfully!) the problem when all
> interrupts are being served by a *single* core. Nobody prevents them
> from being served by *different* cores simultaneously. Also, see [1].
>
> [1]: https://www.kernel.org/doc/htmldocs/kernel-locking/cheatsheet.html


I check [1], quite useful description about locking, thanks. But you can

see Table of locking Requirements


Between IRQ handler A and IRQ handle A, it's no need for a SLIS.


Thanks

Jiaxing


>

