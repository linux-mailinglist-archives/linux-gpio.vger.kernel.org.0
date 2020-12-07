Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEC932D1152
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 14:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgLGNEz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 08:04:55 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9114 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbgLGNEy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 08:04:54 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CqNm435ljzM1ZM;
        Mon,  7 Dec 2020 21:03:32 +0800 (CST)
Received: from [127.0.0.1] (10.57.22.126) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Mon, 7 Dec 2020
 21:04:03 +0800
Subject: Re: [PATCH v1] gpio: dwapb: mask/unmask IRQ when disable/enable it
To:     Linus Walleij <linus.walleij@linaro.org>,
        Serge Semin <fancer.lancer@gmail.com>
CC:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>
References: <1606728979-44259-1-git-send-email-luojiaxing@huawei.com>
 <20201130112250.GK4077@smile.fi.intel.com>
 <63f7dcc4-a924-515a-2fea-31ec80f3353e@huawei.com>
 <20201205221522.ifjravnir5bzmjff@mobilestation>
 <CACRpkdawv2NUahn2gniH=29T6qqqFYSa53giC01PS1wq91+Ksg@mail.gmail.com>
From:   luojiaxing <luojiaxing@huawei.com>
Message-ID: <8592c7f0-a9e9-f48c-e9e4-0e24e22b3f57@huawei.com>
Date:   Mon, 7 Dec 2020 21:04:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdawv2NUahn2gniH=29T6qqqFYSa53giC01PS1wq91+Ksg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.57.22.126]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2020/12/6 23:02, Linus Walleij wrote:
> On Sat, Dec 5, 2020 at 11:15 PM Serge Semin <fancer.lancer@gmail.com> wrote:
>
>> Hmm, that sounds like a problem, but the explanation is a bit unclear
>> to me. AFAICS you are saying that the only callbacks which are
>> called during the IRQ request/release are the irq_enable(), right? If
>> so then the only reason why we haven't got a problem reported due to
>> that so far is that the IRQs actually unmasked by default.
> What we usually do in cases like that (and I have discussed this
> with tglx in the past I think) is to simply mask off all IRQs in probe().
> Then they will be unmasked when requested by drivers.


Yes, I agree. but in this case I mean that they will not unmasked when 
drivers request IRQ.

Drivers request IRQ will only call irq_enable(), so if we mask all IRQ 
in gpio-dwab.'s probe(),

no one will unmask the IRQ for drivers.


Thanks

Jiaxing


>
> See e.g. gpio-pl061 that has this line in probe():
> writeb(0, pl061->base + GPIOIE); /* disable irqs */
>
> Yours,
> Linus Walleij
>
> .
>

