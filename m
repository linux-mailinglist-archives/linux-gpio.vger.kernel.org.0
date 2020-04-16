Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 216561AC0BF
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 14:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635043AbgDPMIY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 08:08:24 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:32806 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2635001AbgDPMIT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 08:08:19 -0400
X-Greylist: delayed 448 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 Apr 2020 08:08:17 EDT
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 03GC0XTI010334
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Apr 2020 14:00:33 +0200
Received: from [167.87.14.243] ([167.87.14.243])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 03GC0WZT010398;
        Thu, 16 Apr 2020 14:00:33 +0200
Subject: Re: [PATCH v2 08/14] gpio: dwapb: Convert to use IRQ core provided
 macros
To:     Serge Semin <fancer.lancer@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
 <20200415141534.31240-9-andriy.shevchenko@linux.intel.com>
 <20200415175309.6l6skv7qsdjqsryi@mobilestation>
 <20200416103911.GX185537@smile.fi.intel.com>
 <20200416110135.dieh6gctkh3bwyiz@mobilestation>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d4840691-72d6-316c-a66f-a44d422b07cb@siemens.com>
Date:   Thu, 16 Apr 2020 14:00:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416110135.dieh6gctkh3bwyiz@mobilestation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16.04.20 13:01, Serge Semin wrote:
> On Thu, Apr 16, 2020 at 01:39:11PM +0300, Andy Shevchenko wrote:
>> On Wed, Apr 15, 2020 at 08:53:09PM +0300, Serge Semin wrote:
>>> On Wed, Apr 15, 2020 at 05:15:28PM +0300, Andy Shevchenko wrote:
>>>> IRQ core provides macros such as IRQ_RETVAL().
>>>> Convert code to use them.
>>
>>> BTW Forgot to mention. Irrelevantly to this patch just so you know seeing
>>> you are from Intel and this part is being utilized by the Intel Quark SoC.
>>> dwapb_irq_handler_mfd() handler will cause a problem in RT-patched kernel
>>> (I've seen such issue in another GPIO-driver). So if PREEMP_RT_FULL patch
>>> is applied and the FULL-RT scheduler is enabled all interrupt handlers
>>> specified by request_irq()-based methods will be handled by a kernel thread,
>>> while generic_handle_irq() is supposed to be called from the atomic context
>>> only (with interrupts disabled). As a result an ugly stack dump will be printed
>>> to the kernel log by the next code:
>>> https://elixir.bootlin.com/linux/latest/source/kernel/irq/handle.c#L152
>>>
>>> A way to fix this is described in Documentation/driver-api/gpio/driver.rst
>>
>> There is patch from Siemens to fix that [1]. I dunno if they are going to upstream it.
>> Jan?
>>
>> [1]: https://github.com/siemens/meta-iot2000/blob/master/meta-iot2000-bsp/recipes-kernel/linux/patches/rt-0002-gpio-dwapb-Work-around-RT-full-s-enforced-IRQ-thread.patch
> 
> Just to note I wouldn't accept that patch as it is, because it's applied to all
> types of IRQ handlers supported by the driver. The chained cascaded IRQ
> handlers won't be converted to the kernel threads in RT-patched kernels [1], so
> using the wa-lock is redundant in that case. One of the ways to fix it is
> to have a conditional wa_lock acquisition depended on the irq_shared flag
> state. Alternatively we could create a dedicated handlers for each types of
> the IRQs.

Yeah, never had the time to dig into details. Also, that patch was only 
tested on one particular device with one particular kernel series 
(4.4-cip-rt). That's why it's a "workaround", not a fix.

Jan

> 
> [1] Documentation/driver-api/gpio/driver.rst
> 
> Regards,
> -Sergey
> 
>>
>> -- 
>> With Best Regards,
>> Andy Shevchenko
>>
>>
-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux
