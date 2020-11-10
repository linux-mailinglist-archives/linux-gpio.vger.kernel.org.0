Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6392AD943
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:50:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730870AbgKJOuc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:50:32 -0500
Received: from david.siemens.de ([192.35.17.14]:55844 "EHLO david.siemens.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730200AbgKJOuc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 09:50:32 -0500
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0AAEoEXS011180
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Nov 2020 15:50:14 +0100
Received: from [167.87.33.169] ([167.87.33.169])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AAEoCko001593;
        Tue, 10 Nov 2020 15:50:12 +0100
Subject: Re: [PATCH v3 6/7] gpio: exar: switch to using regmap
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Laight <David.Laight@aculab.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20201110123406.3261-1-brgl@bgdev.pl>
 <20201110123406.3261-7-brgl@bgdev.pl>
 <20201110142624.GT4077@smile.fi.intel.com>
 <20201110142750.GU4077@smile.fi.intel.com>
 <CAMpxmJUQ3t02q-Chd-WE+pYRAsOOEnbQ0jB+G_uAGv+sJBK1tg@mail.gmail.com>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a5b0fcd0-eb62-79b3-3f27-6595b9bdb91c@siemens.com>
Date:   Tue, 10 Nov 2020 15:50:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJUQ3t02q-Chd-WE+pYRAsOOEnbQ0jB+G_uAGv+sJBK1tg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 10.11.20 15:30, Bartosz Golaszewski wrote:
> On Tue, Nov 10, 2020 at 3:26 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>>
>> On Tue, Nov 10, 2020 at 04:26:24PM +0200, Andy Shevchenko wrote:
>>> On Tue, Nov 10, 2020 at 01:34:05PM +0100, Bartosz Golaszewski wrote:
>>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>>
>>>> We can simplify the code in gpio-exar by using regmap. This allows us to
>>>> drop the mutex (regmap provides its own locking) and we can also reuse
>>>> regmap's bit operations instead of implementing our own update function.
>>>
>>> ...
>>>
>>>> +   /*
>>>> +    * We don't need to check the return values of mmio regmap operations (unless
>>>> +    * the regmap has a clock attached which is not the case here).
>>>> +    */
>>>> +   exar_gpio->regs = devm_regmap_init_mmio(dev, p, &exar_regmap_config);
>>>> +   if (IS_ERR(exar_gpio->regs))
>>>> +           return PTR_ERR(exar_gpio->regs);
>>>>
>>>>     index = ida_alloc(&ida_index, GFP_KERNEL);
>>>> -   if (index < 0) {
>>>> -           ret = index;
>>>> -           goto err_mutex_destroy;
>>>> -   }
>>>> +   if (index < 0)
>>>> +           return index;
>>>
>>> And below you effectively use p as regmap!
>>> That's what renaming of variable regs -> regmap or map can easily reveal.
>>>
>>>       exar_gpio->regs = p;
>>
>> Jan, if you remove this line, does it help?
>>
> 
> Ha! I guess you were right saying that keeping the name is asking for
> trouble then. :)
> 
> I think that may be it but address width should still be changed to 16.
> 

Removing the line that Andy found made things work here. And switching
to 16 for reg_bits didn't make things worse again.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux
