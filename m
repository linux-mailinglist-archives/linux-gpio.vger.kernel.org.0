Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E7F319CA1
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 11:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbhBLK3N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 05:29:13 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55478 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhBLK3M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 05:29:12 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11CARo41022623;
        Fri, 12 Feb 2021 04:27:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1613125670;
        bh=SqBeUtT5NjBGreoJPsxd+PxgBYN94+X5BvsJ9ZR/Lrk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=BUKtM0a+ZoGDD2/bzv2vABaebPQr58uoBVPnngwVDxZqS/KRiBd18u1gI8hIppnjw
         gW8mEE6wdgDn2+OJjiLMl5GdTgcH8uOg9auiK0NpkE4oTJFd3J0MvvQnXwsEH8YWTN
         rkPuLR7e14vZtVcOxFTvcMFXqgWYdDgL5WYc/YUA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11CARoCp123925
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 12 Feb 2021 04:27:50 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 12
 Feb 2021 04:27:50 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 12 Feb 2021 04:27:50 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11CARlhr129287;
        Fri, 12 Feb 2021 04:27:47 -0600
Subject: Re: [Linuxarm] Re: [PATCH for next v1 1/2] gpio: omap: Replace
 raw_spin_lock_irqsave with raw_spin_lock in omap_gpio_irq_handler()
To:     Arnd Bergmann <arnd@kernel.org>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
CC:     luojiaxing <luojiaxing@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <e34a4085-268f-1cd0-a5dc-a87a2e655fe2@ti.com>
Date:   Fri, 12 Feb 2021 12:27:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3SHQNjF5ZpqHQweG7BQ52Xi1hQKDiMVKq4aNK_7VDw6w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Arnd,

On 12/02/2021 11:45, Arnd Bergmann wrote:
> On Fri, Feb 12, 2021 at 6:05 AM Song Bao Hua (Barry Song)
> <song.bao.hua@hisilicon.com> wrote:
>>> -----Original Message-----
> 
>>>
>>> Note. there is also generic_handle_irq() call inside.
>>
>> So generic_handle_irq() is not safe to run in thread thus requires
>> an interrupt-disabled environment to run? If so, I'd rather this
>> irqsave moved into generic_handle_irq() rather than asking everyone
>> calling it to do irqsave.
> 
> In a preempt-rt kernel, interrupts are run in task context, so they clearly
> should not be called with interrupts disabled, that would defeat the
> purpose of making them preemptible.
> 
> generic_handle_irq() does need to run with in_irq()==true though,
> but this should be set by the caller of the gpiochip's handler, and
> it is not set by raw_spin_lock_irqsave().

It will produce warning from __handle_irq_event_percpu(), as this is IRQ dispatcher
and generic_handle_irq() will call one of handle_level_irq or handle_edge_irq.

The history behind this is commit 450fa54cfd66 ("gpio: omap: convert to use generic irq handler").

The resent related discussion:
https://lkml.org/lkml/2020/12/5/208



-- 
Best regards,
grygorii
