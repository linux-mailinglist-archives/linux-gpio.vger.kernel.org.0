Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B05AD48CD06
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jan 2022 21:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357421AbiALUUd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jan 2022 15:20:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41980 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1357486AbiALUUa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jan 2022 15:20:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642018829;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AYdoUK1+ZTJmFqyOA1Rmp7H/7B5+lpKuOBsI5qSJDMs=;
        b=KJVcOTdRxjmyYdx7orHC2/lK9tC8efxRjUKdbW+9n+zLSHQqxpK2pm/Fiym3XwG8Zcoqmz
        rBDrBxL6nXt6udxedU0jB9PQwnckBSxRhVSmW6q6nYlByc6SS0NQq0QsbA8UDUowhvBbZy
        J3gXQBCL4awJQ4fwQqu2DQ5BnV+02yQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-bg9r8f2UPiiNPxyG39arhQ-1; Wed, 12 Jan 2022 15:20:28 -0500
X-MC-Unique: bg9r8f2UPiiNPxyG39arhQ-1
Received: by mail-ed1-f71.google.com with SMTP id z10-20020a05640235ca00b003f8efab3342so3297371edc.2
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 12:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=AYdoUK1+ZTJmFqyOA1Rmp7H/7B5+lpKuOBsI5qSJDMs=;
        b=ATEK7QZ4Q1UkC6VhAu6XK81v0IvjEbKxgRdrcTzR6Is1sue0nrA9L7TuILsETlAX0g
         EKa5zceDQYSYLkOf0jIH5Pq0CmN89onU84vwxlzPvijiqlq4+2fIz1rIGVJc/CRD4f0K
         Jz+WPmo+mrMqnub7D3t7N8bemgomec32jcQ4kkIbMEPLWrCPY8ak64JSA6POoi0aSvAh
         71S+DkrWAa5Krq/Uhpkf9tsOe/8MyUnMav1IOnewVeQLuwVwr/wAunuFwYFMsazjQ09s
         hcC+OwBp3mei/w1c0BjV/RgkgvZT1vZmsTUN86QeRRsClKv1tk50tmjp4I7ahnyQvKw9
         G1ew==
X-Gm-Message-State: AOAM530xm4wSw+9Nz4Sic9+ZLaNu1EnADjcG8RMaxpSdti+I1Y82vdmr
        Ch1EaBnI1c2u1zqNdwbYcA19IaxPHfCRLwqPxgSRIp51vyY4tuE8OsX7K0Phyr/V2OEt1LpeXG4
        k62JlmiOzpeCRObbMVS4Gag==
X-Received: by 2002:a05:6402:50c6:: with SMTP id h6mr1205896edb.156.1642018826969;
        Wed, 12 Jan 2022 12:20:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzq75FwHbTUQwYAl+sZSboQVq8WbdqQg8h9gc8LEpg5QTGhgWSb9/RA2ryRFhjSjY7QF5PyOw==
X-Received: by 2002:a05:6402:50c6:: with SMTP id h6mr1205879edb.156.1642018826798;
        Wed, 12 Jan 2022 12:20:26 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id r17sm293609edw.70.2022.01.12.12.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 12:20:26 -0800 (PST)
Message-ID: <7cda97fe-4af3-694d-7e16-a523a205ad9f@redhat.com>
Date:   Wed, 12 Jan 2022 21:20:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] pinctrl: baytrail: Clear direct_irq_en flag on broken
 configs
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <20220107234456.148389-1-hdegoede@redhat.com>
 <CAHp75Vfgpm7sROw_Ay8+tK0bhu-kCbS=O_kwax+i_vaH7H4wXA@mail.gmail.com>
 <ba1e407a-76e4-5a81-1cf2-45766be35b2a@redhat.com>
In-Reply-To: <ba1e407a-76e4-5a81-1cf2-45766be35b2a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/8/22 10:59, Hans de Goede wrote:
> Hi,
> 
> On 1/8/22 01:04, Andy Shevchenko wrote:
>>
>>
>> On Saturday, January 8, 2022, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
>>
>>     Some boards set the direct_irq_en flag in the conf0 register without
>>     setting any of the trigger bits. The direct_irq_en flag just means that
>>     the GPIO will send IRQs directly to the APIC instead of going through
>>     the shared interrupt for the GPIO controller, in order for the pin to
>>     be able to actually generate IRQs the trigger flags must still be set.
>>
>>     So having the direct_irq_en flag set without any trigger flags is
>>     non-sense, log a FW_BUG warning when encountering this and clear the flag
>>     so that a driver can actually use the pin as IRQ through gpiod_to_irq().
>>
>>     Specifically this allows the edt-ft5x06 touchscreen driver to use
>>     INT33FC:02 pin 3 as touchscreen IRQ on the Nextbook Ares 8 tablet,
>>     accompanied by the following new log message:
>>
>>     byt_gpio INT33FC:02: [Firmware Bug]: pin 3: direct_irq_en set without trigger, clearing
>>
>>     The new byt_direct_irq_sanity_check() function also checks that the
>>     pin is actually appointed to one of the 16 direct-IRQs which the GPIO
>>     controller supports and on success prints debug messages like these:
>>
>>     byt_gpio INT33FC:02: Pin 0: uses direct IRQ 0 (APIC 67)
>>     byt_gpio INT33FC:02: Pin 15: uses direct IRQ 2 (APIC 69)
>>
>>
>> Should be these updated?
> 
> Yes the " (APIC 6x)" part is gone now. I will fix this for v4.
> 
>>     This is useful to figure out the GPIO pin belonging to ACPI
>>     resources like this one: "Interrupt () { 0x00000043 }" or
>>     the other way around.
>>
>>     Suggested-by: Andy Shevchenko <andy@kernel.org <mailto:andy@kernel.org>>
>>     Signed-off-by: Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>>
>>     ---
>>     Changes in v3:
>>     - Rework code to check if the pin is assigned one of the 16 direct IRQs
>>       (new code suggested-by Andy)
>>     - Drop dev_dbg of the (likely?) APIC IRQ, only log the direct IRQ index
>>
>>
>> Thinking about direct IRQ mappings I will look into the Datasheet next week.
> 
> Ok, I will wait for you to get back to me then before posting a v4.

Note I've found the direct IRQ to IO-APIC pin mappings now, they are
described in: atom-e3800-family-datasheet.pdf, so I've re-added
the APIC IRQ to the printed log msg for v4.

Regards,

Hans

