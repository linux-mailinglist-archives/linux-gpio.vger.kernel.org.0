Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE66745E1AF
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 21:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242493AbhKYUlF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 15:41:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40888 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242753AbhKYUjE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 25 Nov 2021 15:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637872553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=esMaQxRBZNv/93PP9OB7d2dvRw+VYEUp3YiiawOXQYQ=;
        b=ffm4dkOwuv/wb0MaDe3vOQJ9QvU1fNxFvr5gGLKQdJUgDuid9IZawO+XOFCYwG84eyMxOm
        XAhQTz7rBrlhgauMqXzTs7yNqKLn0w/4YUR40tR2pEZpF7qoByRrSqis9bfyzd6yo4bIC4
        l1Q1w0+NtrjcMol4PoOJ0YihYD3y8wA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-559-GVewx7-BM7SSJEXzjbGHoQ-1; Thu, 25 Nov 2021 15:35:49 -0500
X-MC-Unique: GVewx7-BM7SSJEXzjbGHoQ-1
Received: by mail-ed1-f69.google.com with SMTP id bx28-20020a0564020b5c00b003e7c42443dbso6211191edb.15
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 12:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=esMaQxRBZNv/93PP9OB7d2dvRw+VYEUp3YiiawOXQYQ=;
        b=4qd4YpkEVENaCvhd/VwLd63BSshNbxX+7WiGCmsSqMkvhUMCYcWY3iFBkH714lrwqE
         N+xDMFSN92XkVH9qmAQfoaDVLIosPxRDlk6sjVDWXvJqPMmhW0w3pSKgohwza7AO2aKb
         TNX4j9+LZtE3HxEuKUVI7hst+TJHIytfUgovAhnmnpCp2sG5oCd3TQN6UxXNVgAbLL2I
         5tBKwQ4Y5uNrsfoHP1zz9CboEXsqyLwqHlGolul4Xcl3HcbiAJiwRw84AkuAsmKtvtMH
         gsOA+sIr0EQmiyvwkFJsX0zdqfmPpHlEDt1IK7QzGNM5WMxOtHOvw55KG9bJtM738xhM
         kLCg==
X-Gm-Message-State: AOAM5304gn3qmxlXEb+iktLb2DLfd8/kuXorJBTdUtma2tVfgtpXE9jB
        xQr6nu8hv2l+UgCtqM2/PhFSD4LL1OVkQ7PeFTu7OcldWCoeo8GOhjxyR0nPwKZgRubc6RP4JaU
        QiLIqB7ONoHgFgLI/9GkRpw==
X-Received: by 2002:a17:906:9b84:: with SMTP id dd4mr34516471ejc.280.1637872548414;
        Thu, 25 Nov 2021 12:35:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1Rkc4HxnosZIfxb+ebdU821v+GI5B+8bt5j53JHAAyCYblo8G73EEOpO3ZXOm6ayYO4/7Zw==
X-Received: by 2002:a17:906:9b84:: with SMTP id dd4mr34516453ejc.280.1637872548212;
        Thu, 25 Nov 2021 12:35:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ji14sm2196392ejc.89.2021.11.25.12.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 12:35:47 -0800 (PST)
Message-ID: <eb22eb06-b48f-53b8-dc2b-0004bb348091@redhat.com>
Date:   Thu, 25 Nov 2021 21:35:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] gpiolib: acpi: Do not set the IRQ type if the IRQ is
 already in use
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
References: <20211122220416.11241-1-hdegoede@redhat.com>
 <YZy2CiOrEJc+6TRz@smile.fi.intel.com>
 <5afe8a56-b0aa-d063-d6a0-9ec459d138b6@redhat.com>
 <CAHp75VekAC7dMGFG5unWyX5=BUBtZy+UpQ9VxeJuoHOwD4jqEw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VekAC7dMGFG5unWyX5=BUBtZy+UpQ9VxeJuoHOwD4jqEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/23/21 12:01, Andy Shevchenko wrote:
> On Tue, Nov 23, 2021 at 12:59 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 11/23/21 10:36, Andy Shevchenko wrote:
>>> On Mon, Nov 22, 2021 at 11:04:16PM +0100, Hans de Goede wrote:
>>>> If the IRQ is already in use, then acpi_dev_gpio_irq_get_by() really
>>>> should not change the type underneath the current owner.
>>>>
>>>> I specifically hit an issue with this an a Chuwi Hi8 Super (CWI509) Bay
>>>> Trail tablet, when the Boot OS selection in the BIOS is set to Android.
>>>> In this case _STA for a MAX17047 ACPI I2C device wrongly returns 0xf and
>>>> the _CRS resources for this device include a GpioInt pointing to a GPIO
>>>> already in use by an _AEI handler, with a different type then specified
>>>> in the _CRS for the MAX17047 device. Leading to the acpi_dev_gpio_irq_get()
>>>> call done by the i2c-core-acpi.c code changing the type breaking the
>>>> _AEI handler.
>>>>
>>>> Now this clearly is a bug in the DSDT of this tablet (in Android mode),
>>>> but in general calling irq_set_irq_type() on an IRQ which already is
>>>> in use seems like a bad idea.
>>>
>>> I'm fine with the change, one comment below, though.
>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>  drivers/gpio/gpiolib-acpi.c | 8 ++++++--
>>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
>>>> index 985e8589c58b..24cd86bf2c4c 100644
>>>> --- a/drivers/gpio/gpiolib-acpi.c
>>>> +++ b/drivers/gpio/gpiolib-acpi.c
>>>> @@ -1056,8 +1056,12 @@ int acpi_dev_gpio_irq_get_by(struct acpi_device *adev, const char *name, int ind
>>>>                      irq_flags = acpi_dev_get_irq_type(info.triggering,
>>>>                                                        info.polarity);
>>>>
>>>> -                    /* Set type if specified and different than the current one */
>>>> -                    if (irq_flags != IRQ_TYPE_NONE &&
>>>> +                    /*
>>>> +                     * If the IRQ is not already in use then set type
>>>> +                     * if specified and different than the current one.
>>>> +                     */
>>>> +                    if (can_request_irq(irq, irq_flags) &&
>>>> +                        irq_flags != IRQ_TYPE_NONE &&
>>>>                          irq_flags != irq_get_trigger_type(irq))
>>>>                              irq_set_irq_type(irq, irq_flags);
>>>
>>> What about issuing a debug (?) message
>>>
>>>                       if (can_request_irq(irq, irq_flags) {
>>>                               if (irq_flags != IRQ_TYPE_NONE &&
>>>                                   irq_flags != irq_get_trigger_type(irq))
>>>                                       irq_set_irq_type(irq, irq_flags);
>>>                       } else {
>>>                               dev_dbg(..., FW_BUG "IRQ %d already in use\n", irq);
>>>                       }
>>>
>>> ?
>>
>> That is a good idea, I would even be fine with making it a dev_warn, because it
>> really is a FW_BUG if we get here. If we turn out to hit this too much we
>> can always lower the log level later.
>>
>> Shall I submit a v2 with your suggestion, but then using a dev_warn ?
> 
> Please do, it will be slightly easier for me.

Ok, I've just send out a v2. Note I forgot to add -v2 to format-patch so
the subject does not say it is v2, sorry.

Regards,

Hans


