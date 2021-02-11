Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B517931942D
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 21:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbhBKUSg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 15:18:36 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45450 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbhBKUSV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 15:18:21 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11BKGvU8006233;
        Thu, 11 Feb 2021 14:16:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1613074617;
        bh=kr2SCd91PPpyHaD2qofeEm2a8JukcuL1omeQb1kfYAY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=gItRj/dhG56kIkp+3wnzTMbA3EdhiRuDOmVhfPKCs96JbqFwqbH/I3yis7UEUcjvH
         ZG5WILnk75vuyD0DSLqdauGsShgcv9plTyxCWM2pFi4iMUE22bGJMZHfp95ggOywyh
         Si9jHzYxVwu4IdUQJwLOLxDJgTeZ7mFeRU/387kQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11BKGvwq105162
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 11 Feb 2021 14:16:57 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Feb 2021 14:16:56 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Feb 2021 14:16:56 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11BKGrAU029198;
        Thu, 11 Feb 2021 14:16:54 -0600
Subject: Re: [PATCH for next v1 1/2] gpio: omap: Replace raw_spin_lock_irqsave
 with raw_spin_lock in omap_gpio_irq_handler()
To:     Arnd Bergmann <arnd@kernel.org>
CC:     Luo Jiaxing <luojiaxing@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        <linuxarm@openeuler.org>
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <1612774577-55943-2-git-send-email-luojiaxing@huawei.com>
 <fab1e871-08e4-fc71-9dbf-9bcacf18e2e1@ti.com>
 <CAK8P3a0m4ocfLyJZ5wMxyKESYUJ5um5sb5MyAzC8ckCb6qAH5g@mail.gmail.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <d5465b81-bb53-49ee-a556-40d208deb765@ti.com>
Date:   Thu, 11 Feb 2021 22:16:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0m4ocfLyJZ5wMxyKESYUJ5um5sb5MyAzC8ckCb6qAH5g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 11/02/2021 21:39, Arnd Bergmann wrote:
> On Thu, Feb 11, 2021 at 7:25 PM Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
>> On 08/02/2021 10:56, Luo Jiaxing wrote:
>>> There is no need to use API with _irqsave in omap_gpio_irq_handler(),
>>> because it already be in a irq-disabled context.
>>
>> NACK.
>> Who said that this is always hard IRQ handler?
>> What about RT-kernel or boot with "threadirqs"?
> 
> In those cases, the interrupt handler is just a normal thread, so the
> preempt_disable() that is implied by raw_spin_lock() is sufficient.
> 
> Disabling interrupts inside of an interrupt handler is always incorrect,
> the patch looks like a useful cleanup to me, if only for readability.

Note. there is also generic_handle_irq() call inside.

-- 
Best regards,
grygorii
