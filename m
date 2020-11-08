Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0052AAA5C
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Nov 2020 10:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbgKHJbe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Nov 2020 04:31:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33105 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728191AbgKHJbd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Nov 2020 04:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604827891;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zpmmVtJiLF/7ZB4tkJLHOE9quYGR+xzRArppdDKuwXk=;
        b=g3aadBISx4NCewNd25sF+3ZLutfZd++XjsXu49qKneXk/aNKdkHWVwc6yr7zci41/uNP52
        0gBEr7qbptlVFCMRHbWfWRRLXjgINZ7tx3r+U48oTWZCWgYYlbWYP6mTPiCbwD5uXJMobA
        FyxCo8jnfuvEQAwbpzUXtmV8kI7aF48=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-WKeWRPWFMi-jN6XNtQNlCQ-1; Sun, 08 Nov 2020 04:31:29 -0500
X-MC-Unique: WKeWRPWFMi-jN6XNtQNlCQ-1
Received: by mail-ej1-f70.google.com with SMTP id 2so2511462ejv.4
        for <linux-gpio@vger.kernel.org>; Sun, 08 Nov 2020 01:31:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zpmmVtJiLF/7ZB4tkJLHOE9quYGR+xzRArppdDKuwXk=;
        b=Z1FEnmNwakogRVqA2fER38QzfDqI/vzzWh32KHP1cHwdKPvMp4ln404Jsa0+Jz+8UA
         4RSxDIwYL4sU+Z1tGC4TIGcTzzY9mcyJej9XdI7N3VcWBbtCQ5OmRrWQELdvma2govZU
         B/xtKIhhgbM5b6aI8ykF0WmpfBVS9h8ilV0P+VGzs51xzlowo/4UgukYXkG3YokJIoUP
         6xyNNX1I8gJP5K8gjmOmLMRe+450+/ystQpe8hGgHDMNqu2GvPX3WCqSnPES8B8qpbMt
         VOqDh8IeQ05ThIVTgwgh1ZOb8+9ee7jRLDCTDw1GRbMSXpIuDtPzJtbbYdNWmkJr+SCr
         ApZA==
X-Gm-Message-State: AOAM532HlbJJW8d/H6p1yG4e81pK1Q6S4dV3swA1kkmOoxRPMdI3+LGO
        Xj1Hac1n6cqRw6WoXm+/iNf9MV4FFuzkcWmnd4Fp9BQJqaS60cF/HGidTAHi778gGyg1sPf5WqR
        uEguGp4A0nwYHrheLjhZFnA==
X-Received: by 2002:a50:fb06:: with SMTP id d6mr10261809edq.312.1604827888520;
        Sun, 08 Nov 2020 01:31:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4eR7/EXKDYZUQ1ebi0Vz81Y0LMmcZQ2LTi2ACt9jP082xNHEM6omQp/Qe+mXw05pg+m8Vpg==
X-Received: by 2002:a50:fb06:: with SMTP id d6mr10261797edq.312.1604827888298;
        Sun, 08 Nov 2020 01:31:28 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id u23sm5607111ejy.87.2020.11.08.01.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2020 01:31:27 -0800 (PST)
Subject: Re: [PATCH v4 3/9] gpiolib: acpi: Take into account debounce settings
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Coiby Xu <coiby.xu@gmail.com>
References: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
 <20201106192304.49179-4-andriy.shevchenko@linux.intel.com>
 <0756cd6c-c0a7-17e8-2e32-de3e6db6a69b@redhat.com>
 <CAHp75Vf8MkaNGmH1-FWxR66mB6pAWoV=Xw3sAi2Riw1uLe5YNA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <64f39c50-a984-07ca-6eb7-8a57acc7dab6@redhat.com>
Date:   Sun, 8 Nov 2020 10:31:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Vf8MkaNGmH1-FWxR66mB6pAWoV=Xw3sAi2Riw1uLe5YNA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/7/20 4:26 PM, Andy Shevchenko wrote:
> On Sat, Nov 7, 2020 at 4:49 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 11/6/20 8:22 PM, Andy Shevchenko wrote:
> 
> ...
> 
>> I added an older version of this (which only modified acpi_dev_gpio_irq_get())
>> for testing and when booting a kernel with that version applied to it,
>> on a Cherry Trail device I noticed that a whole bunch of devices where no
>> longer seen by the kernel because of acpi_dev_gpio_irq_get() returning
>> errors now (-ENOTSUPP).
>>
>> Quoting from the gpiod_set_debounce docs:
>>
>> /**
>>  * gpiod_set_debounce - sets @debounce time for a GPIO
>>  * @desc: descriptor of the GPIO for which to set debounce time
>>  * @debounce: debounce time in microseconds
>>  *
>>  * Returns:
>>  * 0 on success, %-ENOTSUPP if the controller doesn't support setting the
>>  * debounce time.
>>  */
>>
>> This is expected on GPIO chips where setting the debounce time
>> is not supported. So the error handling should be modified to
>> ignore -ENOTSUPP errors here.
>>
>> This certainly MUST NOT be merged as is because it breaks a lot
>> of things as is.
> 
> Thank you very much for the testing! I remember that I fixed debounce
> for BayTrail, but it seems I have yet to fix Cherry Trail pin control
> as a prerequisite to this patch.
> 
> And like I said this series is definitely not for backporting.

Independent of fixing the CherryTrail pinctrl driver to support this,
I strongly believe that -ENOTSUPP should be ignored (treated as success)
by this patch. Remember ACPI is not only used on x86 but also on ARM
now a days. We simply cannot guarantee that all pinctrls will support
(let alone implement) debounce settings. E.g. I'm pretty sure that
the pinctrl on the popular Allwinner A64 does not support debouncing
and there are builts using a combination of uboot + EDK2 to boot!

The documentation for gpiod_set_debounce even explicitly mentioned that
-ENOTSUPP is an error which one may expect (and thus treat specially).

The same goes for the bias stuff too.

Regards,

Hans



